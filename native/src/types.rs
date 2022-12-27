use std::sync::Mutex;
use external_lib::LdkLite;

pub struct LdkLiteInstance {
    pub ldk_lite_mutex: Mutex<LdkLite>,
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

#[derive(Clone)]
pub struct NodeInfo {
    pub node_pub_key:String,
    pub num_channels: usize,
    pub num_usable_channels: usize,
    pub local_balance_msat: u64,
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