use crate::tests::test_utils::expect_event;
use crate::{Builder, Config, Event};

use electrsd::{bitcoind, bitcoind::BitcoinD, ElectrsD};
use lazy_static::lazy_static;
use once_cell::sync::OnceCell;
use rand::distributions::Alphanumeric;
use rand::{thread_rng, Rng};
use std::env;
use std::sync::Mutex;
use {
	bitcoin::{Address, Amount},
	electrsd::{
		bitcoind::bitcoincore_rpc::bitcoincore_rpc_json::AddressType,
		bitcoind::bitcoincore_rpc::RpcApi,
	},
	electrum_client::ElectrumApi,
	std::time::Duration,
};

lazy_static! {
	static ref BITCOIND: BitcoinD = {
		let bitcoind_exe =
			env::var("BITCOIND_EXE").ok().or_else(|| bitcoind::downloaded_exe_path().ok()).expect(
				"you need to provide an env var BITCOIND_EXE or specify a bitcoind version feature",
			);
		let mut conf = bitcoind::Conf::default();
		conf.network = "regtest";
		BitcoinD::with_conf(bitcoind_exe, &conf).unwrap()
	};
	static ref ELECTRSD: ElectrsD = {
		let electrs_exe =
			env::var("ELECTRS_EXE").ok().or_else(electrsd::downloaded_exe_path).expect(
				"you need to provide env var ELECTRS_EXE or specify an electrsd version feature",
			);
		let mut conf = electrsd::Conf::default();
		conf.http_enabled = true;
		conf.network = "regtest";
		ElectrsD::with_conf(electrs_exe, &BITCOIND, &conf).unwrap()
	};
	static ref MINER: Mutex<()> = Mutex::new(());
}

static PREMINE: OnceCell<()> = OnceCell::new();

fn generate_blocks_and_wait(num: usize) {
	let cur_height = BITCOIND.client.get_block_count().unwrap();
	generate_blocks(num);
	wait_for_block(cur_height as usize + num);
}

fn generate_blocks(num: usize) {
	let address = BITCOIND.client.get_new_address(Some("test"), Some(AddressType::Legacy)).unwrap();
	let _block_hashes = BITCOIND.client.generate_to_address(num as u64, &address).unwrap();
}

fn wait_for_block(min_height: usize) {
	let mut header = ELECTRSD.client.block_headers_subscribe().unwrap();
	loop {
		if header.height >= min_height {
			break;
		}
		header = exponential_backoff_poll(|| {
			ELECTRSD.trigger().unwrap();
			ELECTRSD.client.ping().unwrap();
			ELECTRSD.client.block_headers_pop().unwrap()
		});
	}
}

fn exponential_backoff_poll<T, F>(mut poll: F) -> T
where
	F: FnMut() -> Option<T>,
{
	let mut delay = Duration::from_millis(64);
	loop {
		match poll() {
			Some(data) => break data,
			None if delay.as_millis() < 512 => delay = delay.mul_f32(2.0),
			None => {}
		}

		std::thread::sleep(delay);
	}
}

fn premine_and_distribute_funds(addrs: Vec<Address>, amount: Amount) {
	PREMINE.get_or_init(|| {
		let _miner = MINER.lock().unwrap();
		generate_blocks_and_wait(101);
		for addr in addrs {
			BITCOIND
				.client
				.send_to_address(&addr, amount, None, None, None, None, None, None)
				.unwrap();
		}
		generate_blocks_and_wait(1);
	});
}

fn rand_config() -> Config {
	let mut config = Config::default();

	let esplora_url = ELECTRSD.esplora_url.as_ref().unwrap();

	println!("Setting esplora server URL: {}", esplora_url);
	config.esplora_server_url = format!("http://{}", esplora_url);

	let mut rng = thread_rng();
	let rand_dir: String = (0..7).map(|_| rng.sample(Alphanumeric) as char).collect();
	let rand_path = format!("/tmp/{}", rand_dir);
	println!("Setting random LDK storage dir: {}", rand_dir);
	config.storage_dir_path = rand_path;

	let rand_port: u16 = rng.gen_range(5000..8000);
	println!("Setting random LDK listening port: {}", rand_port);
	let listening_address = format!("127.0.0.1:{}", rand_port);
	config.listening_address = Some(listening_address);

	config
}

#[test]
fn channel_full_cycle() {
	println!("== Node A ==");
	let config_a = rand_config();
	let mut node_a = Builder::from_config(config_a).build();
	node_a.start().unwrap();
	let addr_a = node_a.new_funding_address().unwrap();

	println!("\n== Node B ==");
	let config_b = rand_config();
	let mut node_b = Builder::from_config(config_b).build();
	node_b.start().unwrap();
	let addr_b = node_b.new_funding_address().unwrap();

	premine_and_distribute_funds(vec![addr_a, addr_b], Amount::from_sat(100000));
	node_a.sync_wallets().unwrap();
	node_b.sync_wallets().unwrap();

	println!("\nA -- connect_open_channel -> B");
	let node_b_addr =
		format!("{}@{}", node_b.node_id().unwrap(), node_b.listening_address().unwrap());
	node_a.connect_open_channel(&node_b_addr, 50000, true).unwrap();
	// TODO: why are those needed?
	node_a.sync_wallets().unwrap();
	node_b.sync_wallets().unwrap();

	println!("\n .. generating blocks, syncing wallets .. ");
	generate_blocks_and_wait(6);
	node_a.sync_wallets().unwrap();
	node_b.sync_wallets().unwrap();

	expect_event!(node_a, ChannelReady);

	let channel_id = match *node_b.next_event() {
		ref e @ Event::ChannelReady { channel_id, .. } => {
			println!("{} got event {:?}", std::stringify!(node_b), e);
			node_b.event_handled();
			channel_id
		}
		ref e => {
			panic!("{} got unexpected event!: {:?}", std::stringify!(node_b), e);
		}
	};

	println!("\nB receive_payment");
	let invoice = node_b.receive_payment(Some(1000), &"asdf", 9217).unwrap();

	println!("\nA send_payment");
	node_a.send_payment(invoice).unwrap();

	expect_event!(node_a, PaymentSuccessful);
	expect_event!(node_b, PaymentReceived);

	node_b.close_channel(&channel_id, &node_a.node_id().unwrap()).unwrap();
	generate_blocks_and_wait(1);

	expect_event!(node_a, ChannelClosed);
	expect_event!(node_b, ChannelClosed);

	node_a.stop().unwrap();
	println!("\nA stopped");
	node_b.stop().unwrap();
	println!("\nB stopped");
}
