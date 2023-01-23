use crate::ffi::Node;
use std::sync::Mutex;

pub struct LdkNodeInstance {
    pub ldk_lite_mutex: Mutex<Node>,
}
#[derive(Debug)]
#[allow(dead_code)]
/// An error that possibly needs to be handled by the user.
pub enum Error {
    LdkInitError,
    NodeIdError,
    GetBalanceError,
    NewFundingAddressError,
    SyncWalletError,
    GetNodeAddrError,
    NodeStopError,
    SendPaymentError,
    GetNodeInfoError,
    ReceivePaymentError,
    ConnectOpenChannelError,
    CloseChannelError
}

pub struct Balance {
    pub total: u64,
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
    pub node_pub_key: String,
    pub channels:Vec<ChannelInfo>,
    pub peers:Vec<String>
}

#[derive(Clone)]
pub struct ChannelInfo {
    pub channel_id: String,
    pub funding_txid: Option<String>,
    pub peer_pubkey: Option<String>,
    pub peer_alias: Option<String>,
    pub short_channel_id:Option<u64>,
    pub is_channel_ready: bool,
    pub channel_value_satoshis: u64,
    pub local_balance_msat: u64,
    pub available_balance_for_send_msat: u64,
    pub available_balance_for_recv_msat: u64,
    pub channel_can_send_payments: bool,
    pub public: bool,
}
pub struct LogEntry {
    pub time_millis: i64,
    pub level: i32,
    pub tag: String,
    pub msg: String,
}

pub struct Invoice{
    pub as_string:String
}
#[derive(Clone,  PartialEq, Eq)]
pub struct PaymentSecret{
    pub as_u_array: [u8; 32]
}
pub struct PublicKey{
    pub as_string:String
}
pub struct Address{
    pub as_string:String
}
pub struct PaymentHash{
    pub as_u_array: [u8; 32]
}
// Structs wrapping the particular information which should easily be
// understandable, parseable, and transformable, i.e., we'll try to avoid
// exposing too many technical detail here.
/// Represents a payment.
#[derive(Clone,  PartialEq, Eq)]
pub struct PaymentInfo {
    /// The pre-image used by the payment.
    pub preimage: Option<PaymentPreimage>,
    /// The secret used by the payment.
    pub secret: Option<PaymentSecret>,
    /// The status of the payment.
    pub status: PaymentStatus,
    /// The amount transferred.
    pub amount_msat: Option<u64>,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum PaymentStatus {
    /// The payment is still pending.
    Pending,
    /// The payment suceeded.
    Succeeded,
    /// The payment failed.
    Failed,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct PaymentPreimage{
    pub as_u_array: [u8; 32]
}
