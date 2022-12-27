use std::sync::Mutex;
use external_lib::LdkLite;


// use external_lib::Invoice;
pub struct LdkLiteInstance {
    pub ldk_lite_mutex: Mutex<LdkLite>,
}

pub struct Balance {
    pub total:u64,
    pub immature: u64,
    pub trusted_pending: u64,
    pub untrusted_pending: u64,
    pub confirmed: u64,
}
pub enum Network {
    ///Classic Bitcoin
    Bitcoin,
    ///Bitcoin’s testnet
    Testnet,
    ///Bitcoin’s signet
    Signet,
    ///Bitcoin’s regtest
    Regtest,
}


#[derive(Clone)]
pub struct NodeInfo {
    pub node_pub_key:String,
    pub total_balance: u64,
    pub immature:u64,
    pub num_channels: usize,
    pub num_usable_channels: usize,
    pub num_peers: usize,
}

#[derive(Clone)]
pub struct  ChannelInfo{
    pub  channel_id: String,
    pub  funding_txid: Option<String>,
    pub  peer_pubkey: String,
    pub peer_alias:Option<String>,
    pub  short_channel_id: Option<String>,
    pub  is_channel_ready: bool,
    pub  channel_value_satoshis: u64,
    pub  local_balance_msat: u64,
    pub  available_balance_for_send_msat: u64,
    pub  available_balance_for_recv_msat: u64,
    pub  channel_can_send_payments: bool,
    pub  public: bool,
    pub is_channel_usable: bool,
}
pub struct LogEntry {
    pub time_millis: i64,
    pub level: i32,
    pub tag: String,
    pub msg: String,
}

