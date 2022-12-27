//=============Builder=========

use std::sync::Mutex;
use bitcoin::hashes::hex::ToHex;
use external_lib::{Builder, Config as LdkLiteConfig, Event, };
use flutter_rust_bridge::Opaque;
use crate::types::{Config, NodeInfo};
pub use crate::types:: LdkLiteInstance;
use crate::utils::config_network;


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
pub fn init_builder(config: Config) -> Opaque<LdkLiteInstance>{
    let lite_config = config.to_ldk_config();
    let  node = Builder::from_config(lite_config).build();
    Opaque::new(LdkLiteInstance{ldk_lite_mutex: Mutex::new(node)})
}
pub fn start_ldk_node(ldk_lite_instance: Opaque<LdkLiteInstance>) -> String {
    let mut node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    match node.start(){
        Ok(_) => {
            node.node_id().unwrap().to_string()
        }
        Err(e) => {
            panic!("ldk_init_error:{:?}", e)
        }
    }
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
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    match node.sync_wallets(){
        Ok(_) => {
        }
        Err(e) => {
            panic!("sync_wallets_error:{:?}", e)
        }
    }
}

pub fn get_node_info(ldk_lite_instance: Opaque<LdkLiteInstance>)  -> NodeInfo{
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    NodeInfo{
        node_pub_key: node.node_id().unwrap().to_string(),
        num_channels: 0,
        num_usable_channels: 0,
        local_balance_msat: 0,
        num_peers: 0
    }
}
pub fn  connect_open_channel(ldk_lite_instance: Opaque<LdkLiteInstance>, node_pubkey_and_address: String, channel_amount_sats: u64, announce_channel: bool)-> String{
    let node =   ldk_lite_instance.ldk_lite_mutex.lock().unwrap();
    let node_id = node.node_id().unwrap().to_string();
   match  node.connect_open_channel(&node_pubkey_and_address, channel_amount_sats, announce_channel){
       Ok(_) => {
           let channel_id = match *node.next_event() {
               ref e @ Event::ChannelReady { channel_id, .. } => {
                   println!("{} got event {:?}", node_id, e);
                   channel_id
               }
               ref e => {
                 return   format!("{} got unexpected event!: {:?}", node_id, e);
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