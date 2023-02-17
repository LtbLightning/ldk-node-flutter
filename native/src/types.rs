use crate::ffi::{ Node};
use lightning::ln::channelmanager::ChannelManager as LdkChannelManager;
use crate::logger::FilesystemLogger;
use crate::wallet::{Wallet, WalletKeysManager};
use lightning::chain::keysinterface::InMemorySigner;
use lightning::chain::{chainmonitor, Access};
use chainmonitor::ChainMonitor as LdkChainMonitor;
pub use gossip::NetworkGraph as LdkNetworkGraph;
use lightning::ln::peer_handler::PeerManager as LdkPeerManager;
use lightning::onion_message::OnionMessenger as LdkOnionMessenger;
use lightning::ln::peer_handler::IgnoringMessageHandler;
use lightning::routing::gossip;
use lightning::routing::gossip::P2PGossipSync;
use lightning::routing::router::DefaultRouter;
use lightning::routing::scoring::ProbabilisticScorer;
use lightning_invoice::payment;
use lightning_net_tokio::SocketDescriptor;
use lightning_persister::FilesystemPersister;
use lightning_transaction_sync::EsploraSyncClient;

use std::collections::HashMap;
use std::sync::{Arc, Mutex};


pub(crate) type ChainMonitor = LdkChainMonitor<
    InMemorySigner,
    Arc<EsploraSyncClient<Arc<FilesystemLogger>>>,
    Arc<Wallet<bdk::sled::Tree>>,
    Arc<Wallet<bdk::sled::Tree>>,
    Arc<FilesystemLogger>,
    Arc<FilesystemPersister>,
>;

pub(crate) type PeerManager = LdkPeerManager<
    SocketDescriptor,
    Arc<ChannelManager>,
    Arc<GossipSync>,
    Arc<OnionMessenger>,
    Arc<FilesystemLogger>,
    IgnoringMessageHandler,
>;

pub(crate) type ChannelManager = LdkChannelManager<
    Arc<ChainMonitor>,
    Arc<Wallet<bdk::sled::Tree>>,
    Arc<WalletKeysManager<bdk::sled::Tree>>,
    Arc<WalletKeysManager<bdk::sled::Tree>>,
    Arc<WalletKeysManager<bdk::sled::Tree>>,
    Arc<Wallet<bdk::sled::Tree>>,
    Arc<Router>,
    Arc<FilesystemLogger>,
>;

pub(crate) type KeysManager = WalletKeysManager<bdk::sled::Tree>;

pub(crate) type InvoicePayer<F> =
payment::InvoicePayer<Arc<ChannelManager>, Arc<Router>, Arc<FilesystemLogger>, F>;

pub(crate) type Router =
DefaultRouter<Arc<NetworkGraph>, Arc<FilesystemLogger>, Arc<Mutex<Scorer>>>;
pub(crate) type Scorer = ProbabilisticScorer<Arc<NetworkGraph>, Arc<FilesystemLogger>>;

pub(crate) type GossipSync =
P2PGossipSync<Arc<NetworkGraph>, Arc<dyn Access + Send + Sync>, Arc<FilesystemLogger>>;

pub(crate) type NetworkGraph = LdkNetworkGraph<Arc<FilesystemLogger>>;

pub(crate) type PaymentInfoStorage = Mutex<HashMap<lightning::ln::PaymentHash, LdkPaymentInfo>>;

pub(crate) type OnionMessenger = LdkOnionMessenger<
    Arc<WalletKeysManager<bdk::sled::Tree>>,
    Arc<WalletKeysManager<bdk::sled::Tree>>,
    Arc<FilesystemLogger>,
    IgnoringMessageHandler,
>;

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
    pub level: i32,
    pub tag: String,
    pub msg: String,
}

pub struct LdkInvoice {
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
    pub as_string:String
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

//
// Structs wrapping the particular information which should easily be
// understandable, parseable, and transformable, i.e., we'll try to avoid
// exposing too many technical detail here.
/// Represents a payment.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct LdkPaymentInfo {
    /// The pre-image used by the payment.
    pub preimage: Option<lightning::ln::PaymentPreimage>,
    /// The secret used by the payment.
    pub secret: Option<lightning::ln::PaymentSecret>,
    /// The status of the payment.
    pub status: PaymentStatus,
    /// The amount transferred.
    pub amount_msat: Option<u64>,
}
