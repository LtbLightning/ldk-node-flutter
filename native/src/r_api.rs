
use std::sync::Mutex;
use bitcoin::hashes::hex::ToHex;
use external_lib::{Builder, Config as LdkLiteConfig, Event, };
use flutter_rust_bridge::{Opaque, StreamSink};
use log::{ warn};
use crate::logger;
pub use crate::types:: LdkLiteInstance;
use crate::types::{LogEntry, Network};
use crate::utils::config_network;

pub struct Config {
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
impl Config {
    fn to_ldk_config(self)-> LdkLiteConfig{
        let btc_network = config_network(self.network);
        LdkLiteConfig{
            storage_dir_path: self.storage_dir_path,
            esplora_server_url:self.esplora_server_url,
            network: btc_network,
            listening_address: None,
            default_cltv_expiry_delta: 0
        }
    }
}
//=============Builder=========
pub fn init_builder(config: Config) -> Opaque<LdkLiteInstance>{
    let lite_config = config.to_ldk_config();
    warn!("{:?}", "Initializing builder");
    let  node = Builder::from_config(lite_config).build();
    Opaque::new(LdkLiteInstance{ldk_lite_mutex: Mutex::new(node)})
}

pub fn start(ldk_lite_instance: Opaque<LdkLiteInstance>) -> String {
    warn!("{:?}", "Starting node");
    let mut node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    match node.start(){
        Ok(_) => {
            warn!("Node started successfully: {:?}", node.node_id().unwrap().to_string());
            node.node_id().unwrap().to_string()
        }
        Err(e) => {
            panic!("ldk_init_error:{:?}", e)
        }
    }
}

//==========Wallet Functions==============
pub fn get_balance(ldk_lite_instance: Opaque<LdkLiteInstance>) -> u64 {
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    let wallet = node.get_wallet().unwrap();
    wallet.balance().unwrap()
}

pub fn new_funding_address(ldk_lite_instance: Opaque<LdkLiteInstance>) -> String {
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

pub fn sync(ldk_lite_instance: Opaque<LdkLiteInstance>)  {
    warn!(" {:?}","Syncing wallet");
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    match node.sync_wallet(){
        Ok(_) => {
            warn!(" {:?}","Syncing completed");
        }
        Err(e) => {
            panic!("sync_wallets_error:{:?}", e)
        }
    }
}
pub fn get_node_addr(ldk_lite_instance: Opaque<LdkLiteInstance>)-> String{
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

pub fn  connect_open_channel(ldk_lite_instance: Opaque<LdkLiteInstance>, node_pubkey_and_address: String, channel_amount_sats: u64, announce_channel: bool)-> String{
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    let node_id = node.node_id().unwrap().to_string();
    warn!("{:?}","Opening channel");
    match  node.connect_open_channel(&node_pubkey_and_address, channel_amount_sats, announce_channel){
        Ok(_) => {
            let channel_id = match *node.next_event() {
                ref e @ Event::ChannelReady { channel_id, .. } => {
                    warn!("{} got event {:?}", node_id, e);
                    channel_id
                }
                ref e => {
                    panic!("{} got unexpected event!: {:?}", node_id, e);
                    // format!("{} got unexpected event!: {:?}", node_id, e);
                }
            };
            return  channel_id.to_hex();
        }
        Err(e) => {
            panic!("connect_open_channel_error: {:?}", e.to_string());
        }
    }
}
pub fn create_log_stream<E>(s: StreamSink<LogEntry>) -> Result<(), E> {
    logger::SendToDartLogger::set_stream_sink(s);
    Ok(())
}

pub fn rust_set_up() {
    logger::init_logger();
}



