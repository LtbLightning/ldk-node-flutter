use std::str::FromStr;
use std::sync::Mutex;
use bitcoin::hashes::hex::ToHex;
use bitcoin::secp256k1::PublicKey;
// use external_lib::Invoice;
use flutter_rust_bridge::{RustOpaque, StreamSink};
use log::{info};
use crate::event::Event;
use crate::ffi::{Builder, Config};
use crate::simple_log;
pub use crate::types:: LdkLiteInstance;
// pub use crate::types:: LdkInvoice;
use crate::types::{Balance, LogEntry, Network};
use crate::utils::config_network;

pub struct LdkConfig {
    /// The path where the underlying LDK and BDK persist their data.
    pub storage_dir_path: String,
    /// The URL of the utilized Esplora server. default 'https://blockstream.info/api'
    pub esplora_server_url: String,
    /// The used Bitcoin network.
    pub network:Network,
    /// The IP address and TCP port the node will listen on.
    pub listening_address: Option<String>,
    /// The default CLTV expiry delta to be used for payments.
    pub default_cltv_expiry_delta: u32,
}
impl LdkConfig {
    fn to_ldk_config(self)-> Config{
        let btc_network = config_network(self.network);
        info!("Setting listening address: {:?}", self.listening_address);
        Config{
            storage_dir_path: self.storage_dir_path,
            esplora_server_url:self.esplora_server_url,
            network: btc_network,
            listening_address: self.listening_address,
            default_cltv_expiry_delta: self.default_cltv_expiry_delta
        }
    }
}
//=============Builder=========
pub fn init_builder(config: LdkConfig) -> RustOpaque<LdkLiteInstance>{
    let lite_config = config.to_ldk_config();
    info!("{:?}", "Initializing builder");
    let  node = Builder::from_config(lite_config).build();
    RustOpaque::new(LdkLiteInstance{ldk_lite_mutex: Mutex::new(node)})
}

pub fn start(ldk_lite_instance: RustOpaque<LdkLiteInstance>) -> String {
    info!("{:?}", "Starting node");
    let mut node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    match node.start(){
        Ok(_) => {
            info!("Node started successfully: {:?}", node.node_id().unwrap().to_string());
            node.node_id().unwrap().to_string()
        }
        Err(e) => {
            panic!("ldk_init_error:{:?}", e)
        }
    }
}

pub fn get_balance(ldk_lite_instance: RustOpaque<LdkLiteInstance>) ->   Balance {
    let mut node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    let balance = node.on_chain_balance().unwrap();
    Balance{
        total: balance.get_total().clone(),
        immature: balance.immature.clone(),
        trusted_pending: balance.trusted_pending.clone(),
        untrusted_pending: balance.untrusted_pending.clone(),
        confirmed: balance.confirmed.clone()
    }
}

pub fn new_funding_address(ldk_lite_instance: RustOpaque<LdkLiteInstance>) -> String {
    let mut node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();

    match node.new_funding_address(){
        Ok(e) => {
            e.to_string()
        }
        Err(e) => {
            panic!("new_funding_address_error:{:?}", e)
        }
    }
}

pub fn sync(ldk_lite_instance: RustOpaque<LdkLiteInstance>)  {
    info!(" {:?}","Syncing wallet");
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    match node.sync_wallets(){
        Ok(_) => {
            info!(" {:?}","Syncing completed");
        }
        Err(e) => {
            panic!("sync_wallets_error:{:?}", e)
        }
    }
}
pub fn get_node_addr(ldk_lite_instance: RustOpaque<LdkLiteInstance>)-> String{
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    let node_id = node.node_id().unwrap().to_string();
    match node.listening_address(){
        None => {
            panic!(" get_node_addr_error")
        }
        Some(e) => {
            format!("{}@{}",node_id,e)
        }
    }

}
pub fn next_event(ldk_lite_instance: RustOpaque<LdkLiteInstance>){
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    let event = node.next_event();
    info!("{:?}",event);
}

pub fn handle_event(ldk_lite_instance: RustOpaque<LdkLiteInstance>){
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    node.event_handled();
    info!("{:?}","Event handled");
}

pub fn receive_payment(ldk_lite_instance: RustOpaque<LdkLiteInstance>, amount_msat: Option<u64>, description: String, expiry_secs: u32 ) ->String{
    let node = ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    match node.receive_payment(amount_msat, &*description, expiry_secs) {
        Ok(e) => {
            info!("{:?}","Successfully created an invoice");
            return  e.to_string();
            // return RustOpaque::new(LdkInvoice{mutex:Mutex::new(e)})
        }
        Err(e) => {
            panic!("receive_payment_error :{:?}", e);
        }
    }
}
pub fn send_payment(ldk_lite_instance: RustOpaque<LdkLiteInstance>, invoice:String) -> String {
    let node = ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    let inv = lightning_invoice::Invoice::from_str(&*invoice).unwrap();
    match node.send_payment(inv){
        Ok(e) => {
            info!("{:?}","Successfully send payment");
            return  e.0.to_hex().to_string();
        }
        Err(e) => {
            panic!("send_payment_error :{:?}", e);
        }
    };
}
pub fn get_channel_id(ldk_lite_instance: RustOpaque<LdkLiteInstance>) -> [u8; 32] {
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    let channel_id = match node.next_event() {
        ref e @ Event::ChannelReady { ref channel_id, .. } => {
            info!("{} got event {:?}", std::stringify!(node), e);
            node.event_handled();
            channel_id.clone()
        }
        ref e => {
            panic!("{} got unexpected event!: {:?}", stringify!(node), e);
        }
    };
    channel_id
}

pub fn connect_open_channel(ldk_lite: RustOpaque<LdkLiteInstance>, node_pubkey_and_address: String, channel_amount_sats: u64, announce_channel: bool) {
    let node = ldk_lite.ldk_lite_mutex.lock().unwrap();
    match node.connect_open_channel(&node_pubkey_and_address, channel_amount_sats, announce_channel) {
        Ok(_) => {
            info!("Channel initiated successfully with {:?}",node_pubkey_and_address);
        },
        Err(e) => {
            panic!("connect_open_channel_error: {:?}", e.to_string());
        }
    }
}

pub fn close_channel(ldk_lite: RustOpaque<LdkLiteInstance>, channel_id: [u8; 32], counterparty_node_id: String,
)  {
    let node = ldk_lite.ldk_lite_mutex.lock().unwrap();
    let pub_key = PublicKey::from_str(&*counterparty_node_id).unwrap();
    match  node.close_channel(&channel_id, &pub_key){
        Ok(_) => {
            info!("{:?}","Successfully closed the channel");
        }
        Err(e) => {
            panic!("close_channel_error :{:?}", e);
        }
    };

}

pub fn create_log_stream<E>(s: StreamSink<LogEntry>) -> Result<(), E> {
    simple_log::SendToDartLogger::set_stream_sink(s);
    Ok(())
}

pub fn rust_set_up() {
    simple_log::init_logger();
}



