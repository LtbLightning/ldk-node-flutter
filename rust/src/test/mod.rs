use crate::types::{ChainDataSourceConfig, ChannelId, Config, EntropySourceConfig, Event, Network, OutPoint, PublicKey};
use std::thread;
use std::time::Duration;
use crate::ldk::{finalize_builder,  NodePointer};
use crate::ldk::SocketAddress;
use std::default::Default;
use crate::ldk::Mnemonic;
use crate::errors::{BuilderException, NodeException};





fn expect_channel_ready(node: &NodePointer, _counterparty_node_id: &PublicKey )-> ChannelId{
	match node.wait_next_event() {

		Event::ChannelReady { channel_id, counterparty_node_id, .. } => {
			assert_eq!(counterparty_node_id.clone(), Some((*_counterparty_node_id).clone()));
			node.event_handled();
			channel_id.clone()
		}
		ref e => {
			panic!(" got unexpected event!: {:?}",  e.clone());
		}
	}
}

fn build_node(storage_dir: &str,  listening_addr: &str, port :u16,mnemonic: &str ) -> anyhow::Result<NodePointer, BuilderException> {
	println!("\nstarting building");
	finalize_builder(Config{
		storage_dir_path: storage_dir.to_string(),
		log_dir_path: None,
		network: Network::Regtest,
		listening_addresses: Some(vec![SocketAddress::Hostname { addr:  listening_addr.to_string(), port}]),
		..Default::default()
	},
	Some(ChainDataSourceConfig::Esplora("http://127.0.0.1:30000".to_string())),
	Some(EntropySourceConfig::Bip39Mnemonic { mnemonic: Mnemonic { seed_phrase:  mnemonic.to_string() }, passphrase: None }), None)
}
fn expect_channel_pending(node: &NodePointer, _counterparty_node_id: &PublicKey ) -> OutPoint
{
	match node.wait_next_event() {

		Event::ChannelPending { funding_txo, counterparty_node_id, .. } => {
			assert_eq!(counterparty_node_id.clone(), (*_counterparty_node_id).clone());
			node.event_handled();
			funding_txo.clone()
		}
		ref e => {
			panic!(" got unexpected event!: {:?}",  e.clone());
		}
	}

}
#[test]
fn channel_full_cycle2() {
	let alice_node = build_node(
		"./wallets/alice", "0.0.0.0", 6778, "cart super leaf clinic pistol plug replace close super tooth wealth usage" ).unwrap();
	println!("\nstarting alice");
	alice_node.start().unwrap();

	let bob_node = build_node(
		"./wallets/bob", "0.0.0.0", 9006, "puppy interest whip tonight dad never sudden response push zone pig patch" ).unwrap();
	println!("\nstarting bob");
	bob_node.start().unwrap();
	println!("\nsyncing");
	bob_node.sync_wallets().unwrap();
	alice_node.sync_wallets().unwrap();

	assert_eq!(alice_node.next_event(), None);
	assert_eq!(bob_node.next_event(), None);
	println!("\nA -- connect_open_channel -> B");
	let funding_amount_sat = 80_000;
	let push_msat = (funding_amount_sat / 2) * 1000;
	alice_node
		.connect_open_channel(
			bob_node.listening_addresses().unwrap().first().unwrap().clone(),
			bob_node.node_id(),
			funding_amount_sat,
			Some(push_msat),
			true,
			None,
		)
		.unwrap();

	assert_eq!(alice_node.list_peers().first().unwrap().node_id, bob_node.node_id());

	let funding_txo_a = expect_channel_pending(&alice_node, &bob_node.node_id());
	let funding_txo_b = expect_channel_pending(&bob_node, &alice_node.node_id());
	assert_eq!(funding_txo_a.clone(), funding_txo_b.clone());
	println!("\n Start waiting");
	thread::sleep(Duration::from_secs(15));
	println!("\n Done waiting");

	alice_node.sync_wallets().unwrap();
	bob_node.sync_wallets().unwrap();
	expect_channel_ready(&alice_node, &bob_node.node_id());
	println!("\n Channel opened");

	let _channel_id = expect_channel_ready(&bob_node, &alice_node.node_id());
	println!("\nB receive_payment");
	let invoice_amount_1_msat = 2500_000;
	let invoice = bob_node.receive_payment(invoice_amount_1_msat, "asdf".to_string(), 9217).unwrap();

	println!("\nA send_payment");
	let payment_hash = alice_node.send_payment(invoice.clone()).unwrap();

	println!("\n {:?}", payment_hash.data);
	assert_eq!(alice_node.send_payment(invoice), Err(NodeException::DuplicatePayment));

	assert_eq!(alice_node.list_payments().last().unwrap().hash, payment_hash);
}


