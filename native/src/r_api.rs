use crate::ffi::{Builder, Config};
pub use crate::types::LdkNodeInstance;
use crate::types::{
    Address, Balance, Error, LdkInvoice, LogEntry, Network, NodeInfo, PaymentHash, PaymentInfo,
    PaymentSecret, PublicKey,
};
use crate::{hex_utils, simple_log};
use flutter_rust_bridge::{RustOpaque, StreamSink};
use log::info;
use std::sync::Mutex;


pub struct LdkConfig {
    /// The path where the underlying LDK and BDK persist their data.
    pub storage_dir_path: String,
    /// The URL of the utilized Esplora server. default 'https://blockstream.info/api'
    pub esplora_server_url: String,
    /// The used Bitcoin network.
    pub network: Network,
    /// The IP address and TCP port the node will listen on.
    pub listening_address: Option<String>,
    /// The default CLTV expiry delta to be used for payments.
    pub default_cltv_expiry_delta: u32,
}

impl LdkConfig {
    fn to_ldk_config(self) -> Config {
        let btc_network = self.network.into();
        Config {
            storage_dir_path: self.storage_dir_path,
            esplora_server_url: self.esplora_server_url,
            network: btc_network,
            listening_address: self.listening_address,
            default_cltv_expiry_delta: self.default_cltv_expiry_delta,
        }
    }
}
//=============Builder=========
pub fn init_builder(config: LdkConfig) -> RustOpaque<LdkNodeInstance> {
    info!("Initializing builder");
    let lite_config = config.to_ldk_config();
    let node = Builder::from_config(lite_config).build();
    RustOpaque::new(LdkNodeInstance {
        ldk_lite_mutex: Mutex::new(node),
    })
}

pub fn start(ldk_node: RustOpaque<LdkNodeInstance>) {
    info!("{:?}", "Starting node");
    let mut node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.start() {
        Ok(_) => {
            info!(
                "Node started successfully: {:?}",
                node.node_id().unwrap().to_string()
            );
        }
        Err(e) => {
            panic!("{:?}:{:?}", Error::LdkInitError, e);
        }
    }
}
pub fn node_id(ldk_node: RustOpaque<LdkNodeInstance>) -> PublicKey {
    let node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.node_id() {
        Ok(e) => e.into(),
        Err(e) => {
            panic!("{:?}:{:?}", Error::NodeIdError, e);
        }
    }
}
pub fn get_balance(ldk_node: RustOpaque<LdkNodeInstance>) -> Balance {
    let mut node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.on_chain_balance() {
        Ok(balance) => Balance {
            total: balance.get_total().clone(),
            immature: balance.immature.clone(),
            trusted_pending: balance.trusted_pending.clone(),
            untrusted_pending: balance.untrusted_pending.clone(),
            confirmed: balance.confirmed.clone(),
        },
        Err(e) => {
            panic!("{:?}:{:?}", Error::GetBalanceError, e);
        }
    }
}

pub fn new_funding_address(ldk_node: RustOpaque<LdkNodeInstance>) -> Address {
    let mut node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.new_funding_address() {
        Ok(e) => e.into(),
        Err(e) => {
            panic!("{:?}:{:?}", Error::NewFundingAddressError, e);
        }
    }
}

pub fn sync(ldk_node: RustOpaque<LdkNodeInstance>) {
    info!(" {:?}", "Syncing wallet");
    let node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.sync_wallets() {
        Ok(_) => {
            info!("{:?}", "Sync completed");
        }
        Err(e) => {
            panic!("{:?}:{:?}", Error::SyncWalletError, e);
        }
    }
}
pub fn get_node_addr(ldk_node: RustOpaque<LdkNodeInstance>) -> String {
    let node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.listening_address() {
        None => {
            panic!("{:?}", Error::GetBalanceError);
        }
        Some(e) => e,
    }
}
pub fn next_event(ldk_node: RustOpaque<LdkNodeInstance>) -> String {
    let node = ldk_node.ldk_lite_mutex.lock().unwrap();
    let event = node.next_event();
    serde_json::to_string_pretty(&event).unwrap()
}
pub fn stop(ldk_node: RustOpaque<LdkNodeInstance>) {
    let mut node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.stop() {
        Ok(_) => {
            info!("{:?}", "node_stop_success");
        }
        Err(e) => {
            panic!("{:?}:{:?}", Error::NodeStopError, e);
        }
    }
}
pub fn handle_event(ldk_node: RustOpaque<LdkNodeInstance>) {
    let node = ldk_node.ldk_lite_mutex.lock().unwrap();
    node.event_handled();
    info!("{:?}", "Event handled");
}
pub fn node_info(ldk_node: RustOpaque<LdkNodeInstance>) -> NodeInfo {
    let node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.node_info() {
        Ok(e) => e,
        Err(e) => {
            panic!("{:?}:{:?}", Error::GetNodeInfoError, e);
        }
    }
}
pub fn receive_payment(
    ldk_node: RustOpaque<LdkNodeInstance>,
    amount_msat: Option<u64>,
    description: String,
    expiry_secs: u32,
) -> LdkInvoice {
    let node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.receive_payment(amount_msat, &*description, expiry_secs) {
        Ok(e) => {
            info!("{:?}", "receive_payment_successfully");
            return e.into();
        }
        Err(e) => {
            panic!("{:?}:{:?}", Error::ReceivePaymentError, e);
        }
    }
}

pub fn send_payment(ldk_node: RustOpaque<LdkNodeInstance>, invoice: LdkInvoice) -> PaymentHash {
    let node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.send_payment(invoice.into()) {
        Ok(e) => {
            info!("{:?}", "send_payment_success");
            return e.into();
        }
        Err(e) => {
            panic!("{:?}:{:?}", Error::SendPaymentError, e);
        }
    };
}
pub fn send_spontaneous_payment(
    ldk_node: RustOpaque<LdkNodeInstance>,
    amount_msat: u64,
    node_id: String,
) -> PaymentHash {
    let node = ldk_node.ldk_lite_mutex.lock().unwrap();
    match node.send_spontaneous_payment(amount_msat, node_id.as_str()) {
        Ok(e) => {
            info!("{:?}", "send_spontaneous_payment success");
            return e.into();
        }
        Err(e) => {
            panic!("{:?}:{:?}", Error::SendPaymentError, e);
        }
    };
}
///	Query for information about the status of a specific payment.
pub fn payment_info(
    ldk_node: RustOpaque<LdkNodeInstance>,
    payment_hash: String,
) -> Option<PaymentInfo> {
    let node = ldk_node.ldk_lite_mutex.lock().unwrap();
    let hash_vec = hex_utils::to_vec(payment_hash.as_str());
    let mut hash_u8 = [0; 32];
    hash_u8.copy_from_slice(&hash_vec.unwrap());
    return Some(node.payment_info(&hash_u8).unwrap().into());
}
pub fn connect_open_channel(
    ldk_lite: RustOpaque<LdkNodeInstance>,
    node_pubkey_and_address: String,
    channel_amount_sats: u64,
    announce_channel: bool,
) {
    let node = ldk_lite.ldk_lite_mutex.lock().unwrap();
    match node.connect_open_channel(
        &node_pubkey_and_address,
        channel_amount_sats,
        announce_channel,
    ) {
        Ok(_) => {
            info!(
                "Channel initiated successfully with {:?}",
                node_pubkey_and_address
            );
        }
        Err(e) => {
            panic!("{:?}:{:?}", Error::ConnectOpenChannelError, e);
        }
    }
}

pub fn close_channel(
    ldk_lite: RustOpaque<LdkNodeInstance>,
    channel_id: String,
    counterparty_node_id: PublicKey,
) {
    let channel_id_vec = hex_utils::to_vec(channel_id.as_str());
    let mut channel_id_u8 = [0; 32];
    channel_id_u8.copy_from_slice(&channel_id_vec.unwrap());
    let node = ldk_lite.ldk_lite_mutex.lock().unwrap();
    let pub_key = counterparty_node_id.into();
    match node.close_channel(&channel_id_u8, &pub_key) {
        Ok(_) => {
            info!("{:?}", "Successfully closed the channel");
        }
        Err(e) => {
            panic!("{:?}:{:?}", Error::CloseChannelError, e);
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

impl LdkInvoice {
    pub fn create(invoice: String) -> LdkInvoice {
        LdkInvoice{
            as_string:invoice
        }
    }
    ///Returns the amount if specified in the invoice as millisatoshis.
    pub fn amount_milli_satoshis(invoice: LdkInvoice) -> Option<u64> {
        let inv: lightning_invoice::Invoice = invoice.into();
        inv.amount_milli_satoshis()
    }
    pub fn is_expired(invoice: LdkInvoice) -> bool {
        let inv: lightning_invoice::Invoice = invoice.into();
        inv.is_expired()
    }
    pub fn expiry_time(invoice: LdkInvoice) -> u64 {
        let inv: lightning_invoice::Invoice = invoice.into();
        inv.expiry_time().as_secs()
    }
    pub fn payment_hash(invoice: LdkInvoice) -> String {
        let inv: lightning_invoice::Invoice = invoice.into();
        inv.payment_hash().to_string()
    }
    pub fn payee_pub_key(invoice: LdkInvoice) -> Option<String> {
        let inv: lightning_invoice::Invoice = invoice.into();
        inv.payee_pub_key().map(|x| x.to_string())
    }
    pub fn payment_secret(invoice: LdkInvoice) -> PaymentSecret {
        let inv: lightning_invoice::Invoice = invoice.into();
        inv.payment_secret().into()
    }
}
