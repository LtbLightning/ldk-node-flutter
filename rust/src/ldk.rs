use crate::errors::{BuilderException, NodeException};
use crate::types::*;
use flutter_rust_bridge::*;
pub use ldk_node::io::sqlite_store::SqliteStore;
use ldk_node::lightning::util::ser::Writeable;
use ldk_node::BuildError;
pub use ldk_node::Node;
use std::str::FromStr;
pub use std::sync::{Arc, Mutex};

///The addresses on which the node will listen for incoming connections.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum SocketAddress {
    TcpIpV4 {
        addr: [u8; 4],
        port: u16,
    },
    TcpIpV6 {
        addr: [u8; 16],
        port: u16,
    },
    OnionV2([u8; 12]),
    OnionV3 {
        ed25519_pubkey: [u8; 32],
        checksum: u16,
        version: u8,
        port: u16,
    },
    Hostname {
        addr: String,
        port: u16,
    },
}
impl SocketAddress {
    pub fn from_str(address: String) -> anyhow::Result<SocketAddress, BuilderException> {
        match ldk_node::lightning::ln::msgs::SocketAddress::from_str(address.as_str()) {
            Ok(e) => Ok(e.into()),
            Err(_) => Err(BuilderException::SocketAddressParseError),
        }
    }
    pub fn to_string(&self) -> String {
        format!("{:?}", { self })
    }
}
impl From<ldk_node::lightning::ln::msgs::SocketAddress> for SocketAddress {
    fn from(value: ldk_node::lightning::ln::msgs::SocketAddress) -> Self {
        match value {
            ldk_node::lightning::ln::msgs::SocketAddress::TcpIpV4 { addr, port } => {
                SocketAddress::TcpIpV4 { addr, port }
            }
            ldk_node::lightning::ln::msgs::SocketAddress::TcpIpV6 { addr, port } => {
                SocketAddress::TcpIpV6 { addr, port }
            }
            ldk_node::lightning::ln::msgs::SocketAddress::OnionV2(e) => SocketAddress::OnionV2(e),
            ldk_node::lightning::ln::msgs::SocketAddress::OnionV3 {
                ed25519_pubkey,
                checksum,
                version,
                port,
            } => SocketAddress::OnionV3 {
                ed25519_pubkey,
                checksum,
                version,
                port,
            },
            ldk_node::lightning::ln::msgs::SocketAddress::Hostname { hostname, port } => {
                SocketAddress::Hostname {
                    addr: hostname.to_string(),
                    port,
                }
            }
        }
    }
}

impl From<SocketAddress> for ldk_node::lightning::ln::msgs::SocketAddress {
    fn from(value: SocketAddress) -> Self {
        match value {
            SocketAddress::TcpIpV4 { addr, port } => {
                ldk_node::lightning::ln::msgs::SocketAddress::TcpIpV4 { addr, port }
            }
            SocketAddress::TcpIpV6 { addr, port } => {
                ldk_node::lightning::ln::msgs::SocketAddress::TcpIpV6 { addr, port }
            }
            SocketAddress::OnionV2(e) => ldk_node::lightning::ln::msgs::SocketAddress::OnionV2(e),
            SocketAddress::OnionV3 {
                ed25519_pubkey,
                checksum,
                version,
                port,
            } => ldk_node::lightning::ln::msgs::SocketAddress::OnionV3 {
                ed25519_pubkey,
                checksum,
                version,
                port,
            },
            SocketAddress::Hostname { addr, port } => {
                ldk_node::lightning::ln::msgs::SocketAddress::Hostname {
                    hostname: ldk_node::lightning::util::ser::Hostname::try_from(addr)
                        .expect("Invalid hostname"),
                    port,
                }
            }
        }
    }
}

///The from string implementation will try to determine the language of the mnemonic from all the supported languages. (Languages have to be explicitly enabled using the Cargo features.)
/// Supported number of words are 12, 15, 18, 21, and 24.
///
#[derive(Debug, Clone)]
pub struct Mnemonic {
    pub seed_phrase: String,
}

impl From<Mnemonic> for ldk_node::bip39::Mnemonic {
    fn from(value: Mnemonic) -> Self {
        ldk_node::bip39::Mnemonic::from_str(&value.seed_phrase).expect("Invalid seed phrase")
    }
}
impl From<ldk_node::bip39::Mnemonic> for Mnemonic {
    fn from(value: ldk_node::bip39::Mnemonic) -> Self {
        Mnemonic {
            seed_phrase: value.to_string(),
        }
    }
}
impl Mnemonic {
    pub fn generate() -> Mnemonic {
        ldk_node::generate_entropy_mnemonic().into()
    }
}

pub fn finalize_builder(
    config: Config,
    chain_data_source_config: Option<ChainDataSourceConfig>,
    entropy_source_config: Option<EntropySourceConfig>,
    gossip_source_config: Option<GossipSourceConfig>,
) -> anyhow::Result<NodePointer, BuilderException> {
    let builder = create_builder(
        config,
        chain_data_source_config,
        entropy_source_config,
        gossip_source_config,
    );
    match builder?.build() {
        Ok(e) => Ok(NodePointer(RustOpaque::new(Mutex::from(e)))),
        Err(e) => Err(e.into()),
    }
}

fn create_builder(
    config: Config,
    chain_data_source_config: Option<ChainDataSourceConfig>,
    entropy_source_config: Option<EntropySourceConfig>,
    gossip_source_config: Option<GossipSourceConfig>,
) -> Result<ldk_node::Builder, BuildError> {
    let mut builder = ldk_node::Builder::from_config(config.into());
    if let Some(source) = entropy_source_config {
        match source {
            EntropySourceConfig::SeedFile(e) => builder.set_entropy_seed_path(e),
            EntropySourceConfig::SeedBytes(e) => builder.set_entropy_seed_bytes(e.encode())?,
            EntropySourceConfig::Bip39Mnemonic {
                mnemonic,
                passphrase,
            } => builder.set_entropy_bip39_mnemonic(mnemonic.into(), passphrase),
        };
    }
    if let Some(source) = chain_data_source_config {
        match source {
            ChainDataSourceConfig::Esplora(e) => builder.set_esplora_server(e),
        };
    }

    if let Some(source) = gossip_source_config {
        match source {
            GossipSourceConfig::P2PNetwork => builder.set_gossip_source_p2p(),
            GossipSourceConfig::RapidGossipSync(e) => builder.set_gossip_source_rgs(e),
        };
    }
    Ok(builder)
}

pub struct NodePointer(pub RustOpaque<Mutex<Node<SqliteStore>>>);

impl NodePointer {
    /// Starts the necessary background tasks, such as handling events coming from user input,
    /// LDK/BDK, and the peer-to-peer network.
    ///
    /// After this returns, the [Node] instance can be controlled via the provided API methods in
    /// a thread-safe manner.
    pub fn start(&self) -> anyhow::Result<(), NodeException> {
        match self.0.lock().unwrap().start() {
            Ok(_) => Ok(()),
            Err(e) => Err(e.into()),
        }
    }

    /// Disconnects all peers, stops all running background tasks, and shuts down [Node].
    ///
    /// After this returns most API methods will throw NotRunning Exception.
    pub fn stop(&self) -> anyhow::Result<(), NodeException> {
        self.0.lock().unwrap().stop().map_err(|e| e.into())
    }

    /// Blocks until the next event is available.
    ///
    /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
    pub fn event_handled(&self) {
        let node_lock = self.0.lock().unwrap();
        node_lock.event_handled()
    }

    /// Confirm the last retrieved event handled.
    ///
    /// **Note:** This **MUST** be called after each event has been handled.
    pub fn next_event(&self) -> Option<Event> {
        let node_lock = self.0.lock().unwrap();
        match node_lock.next_event() {
            None => None,
            Some(e) => Some(e.into()),
        }
    }
    /// Returns the next event in the event queue.
    ///
    /// Will block the current thread until the next event is available.
    ///
    /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
    ///
    pub fn wait_next_event(&self) -> Event {
        let node_lock = self.0.lock().unwrap();
        node_lock.wait_next_event().into()
    }
    /// Returns our own node id
    pub fn node_id(&self) -> PublicKey {
        self.0.lock().unwrap().node_id().into()
    }

    /// Returns our own listening address.
    pub fn listening_addresses(&self) -> Option<Vec<SocketAddress>> {
        self.0
            .lock()
            .unwrap()
            .listening_addresses()
            .map(|vec_socket_addr| {
                vec_socket_addr
                    .into_iter()
                    .map(|socket_addr| socket_addr.into())
                    .collect()
            })
    }

    /// Retrieve a new on-chain/funding address.
    pub fn new_onchain_address(&self) -> anyhow::Result<Address, NodeException> {
        match self.0.lock().unwrap().new_onchain_address() {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }
    /// Retrieve the currently spendable on-chain balance in satoshis.
    pub fn spendable_onchain_balance_sats(&self) -> anyhow::Result<u64, NodeException> {
        match self.0.lock().unwrap().spendable_onchain_balance_sats() {
            Ok(e) => Ok(e),
            Err(e) => Err(e.into()),
        }
    }

    /// Retrieve the current total on-chain balance in satoshis.
    pub fn total_onchain_balance_sats(&self) -> anyhow::Result<u64, NodeException> {
        match self.0.lock().unwrap().total_onchain_balance_sats() {
            Ok(e) => Ok(e),
            Err(e) => Err(e.into()),
        }
    }

    /// Send an on-chain payment to the given address.
    pub fn send_to_onchain_address(
        &self,
        address: Address,
        amount_sats: u64,
    ) -> anyhow::Result<Txid, NodeException> {
        match self
            .0
            .lock()
            .unwrap()
            .send_to_onchain_address(&address.into(), amount_sats)
        {
            Ok(e) => Ok(Txid {
                hash: e.to_string(),
            }),
            Err(e) => Err(e.into()),
        }
    }

    /// Send an on-chain payment to the given address, draining all the available funds.
    pub fn send_all_to_onchain_address(
        &self,
        address: Address,
    ) -> anyhow::Result<Txid, NodeException> {
        match self
            .0
            .lock()
            .unwrap()
            .send_all_to_onchain_address(&address.into())
        {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }

    ///Retrieve a list of known channels.
    ///
    pub fn list_channels(&self) -> Vec<ChannelDetails> {
        self.0
            .lock()
            .unwrap()
            .list_channels()
            .iter()
            .map(|x| x.into())
            .collect()
    }
    /// Connect to a node on the peer-to-peer network.
    ///
    /// If `permanently` is set to `true`, we'll remember the peer and reconnect to it on restart.
    pub fn connect(
        &self,
        node_id: PublicKey,
        address: SocketAddress,
        persist: bool,
    ) -> anyhow::Result<(), NodeException> {
        match self
            .0
            .lock()
            .unwrap()
            .connect(node_id.into(), address.into(), persist)
        {
            Ok(_) => Ok(()),
            Err(e) => Err(e.into()),
        }
    }

    /// Disconnects the peer with the given node id.
    ///
    /// Will also remove the peer from the peer store, i.e., after this has been called we won't
    /// try to reconnect on restart.
    pub fn disconnect(&self, counterparty_node_id: PublicKey) -> anyhow::Result<(), NodeException> {
        match self
            .0
            .lock()
            .unwrap()
            .disconnect(counterparty_node_id.into())
        {
            Ok(_) => Ok(()),
            Err(e) => Err(e.into()),
        }
    }

    /// Connect to a node and open a new channel. Disconnects and re-connects are handled automatically
    ///
    /// Disconnects and reconnects are handled automatically.
    ///
    /// If `pushToCounterpartyMsat` is set, the given value will be pushed (read: sent) to the
    /// channel counterparty on channel open. This can be useful to start out with the balance not
    /// entirely shifted to one side, therefore allowing to receive payments from the getgo.
    ///
    /// Returns a temporary channel id.
    pub fn connect_open_channel(
        &self,
        address: SocketAddress,
        node_id: PublicKey,
        channel_amount_sats: u64,
        push_to_counterparty_msat: Option<u64>,
        announce_channel: bool,
        channel_config: Option<ChannelConfig>,
    ) -> anyhow::Result<(), NodeException> {
        match self.0.lock().unwrap().connect_open_channel(
            node_id.into(),
            address.into(),
            channel_amount_sats,
            push_to_counterparty_msat,
            channel_config.map(|x| Arc::new(x.into())),
            announce_channel,
        ) {
            Ok(_) => Ok(()),
            Err(e) => Err(e.into()),
        }
    }

    ///Sync the LDK and BDK wallets with the current chain state.
    // Note that the wallets will be also synced regularly in the background
    pub fn sync_wallets(&self) -> anyhow::Result<(), NodeException> {
        match self.0.lock().unwrap().sync_wallets() {
            Ok(_) => Ok(()),
            Err(e) => Err(e.into()),
        }
    }
    /// Close a previously opened channel.
    pub fn close_channel(
        &self,
        channel_id: ChannelId,
        counterparty_node_id: PublicKey,
    ) -> anyhow::Result<(), NodeException> {
        match self
            .0
            .lock()
            .unwrap()
            .close_channel(&channel_id.into(), counterparty_node_id.into())
        {
            Ok(_) => Ok(()),
            Err(e) => Err(e.into()),
        }
    }
    ///Update the config for a previously opened channel.
    ///
    pub fn update_channel_config(
        &self,
        channel_id: ChannelId,
        counterparty_node_id: PublicKey,
        channel_config: ChannelConfig,
    ) -> anyhow::Result<(), NodeException> {
        match self.0.lock().unwrap().update_channel_config(
            &channel_id.into(),
            counterparty_node_id.into(),
            Arc::new(channel_config.into()),
        ) {
            Ok(_) => Ok(()),
            Err(e) => Err(e.into()),
        }
    }
    /// Send a payment given an invoice.
    pub fn send_payment(
        &self,
        invoice: Bolt11Invoice,
    ) -> anyhow::Result<PaymentHash, NodeException> {
        match self.0.lock().unwrap().send_payment(&invoice.into()) {
            Ok(e) => Ok(PaymentHash { data: e.0 }),
            Err(e) => Err(e.into()),
        }
    }

    /// Send a payment given an invoice and an amount in millisatoshi.
    ///
    /// This will fail if the amount given is less than the value required by the given invoice.
    ///
    /// This can be used to pay a so-called "zero-amount" invoice, i.e., an invoice that leaves the
    /// amount paid to be determined by the user.
    pub fn send_payment_using_amount(
        &self,
        invoice: Bolt11Invoice,
        amount_msat: u64,
    ) -> anyhow::Result<PaymentHash, NodeException> {
        let node_lock = self.0.lock().unwrap();
        match node_lock.send_payment_using_amount(&invoice.into(), amount_msat) {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }

    /// Send a spontaneous, aka. "keysend", payment
    pub fn send_spontaneous_payment(
        &self,
        amount_msat: u64,
        node_id: PublicKey,
    ) -> anyhow::Result<PaymentHash, NodeException> {
        match self
            .0
            .lock()
            .unwrap()
            .send_spontaneous_payment(amount_msat, node_id.into())
        {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }

    ///Sends payment probes over all paths of a route that would be used to pay the given invoice.
    /// This may be used to send "pre-flight" probes, i.e., to train our scorer before conducting the actual payment.
    /// Note this is only useful if there likely is sufficient time for the probe to settle before sending out the actual payment,
    /// e.g., when waiting for user confirmation in a wallet UI.
    /// Otherwise, there is a chance the probe could take up some liquidity needed to complete the actual payment.
    /// Users should therefore be cautious and might avoid sending probes if liquidity is scarce and/or they don't expect the probe to return before they send the payment.
    /// To mitigate this issue, channels with available liquidity less than the required amount times Config::probing_liquidity_limit_multiplier won't be used to send pre-flight probes.
    pub fn send_payment_probes(&self, invoice: Bolt11Invoice) -> anyhow::Result<(), NodeException> {
        match self.0.lock().unwrap().send_payment_probes(&invoice.into()) {
            Ok(_) => Ok(()),
            Err(e) => Err(e.into()),
        }
    }

    ///Sends payment probes over all paths of a route that would be used to pay the given amount to the given node_id.
    pub fn send_spontaneous_payment_probes(
        &self,
        amount_msat: u64,
        node_id: PublicKey,
    ) -> anyhow::Result<(), NodeException> {
        match self
            .0
            .lock()
            .unwrap()
            .send_spontaneous_payment_probes(amount_msat, node_id.into())
        {
            Ok(_) => Ok(()),
            Err(e) => Err(e.into()),
        }
    }
    /// Returns a payable invoice that can be used to request and receive a payment of the amount
    /// given.
    pub fn receive_payment(
        &self,
        amount_msat: u64,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Bolt11Invoice, NodeException> {
        match self
            .0
            .lock()
            .unwrap()
            .receive_payment(amount_msat, description.as_str(), expiry_secs)
        {
            Ok(e) => Ok(e.into()),
            Err(e) => Err(e.into()),
        }
    }
    /// Returns a payable invoice that can be used to request and receive a payment for which the
    /// amount is to be determined by the user, also known as a "zero-amount" invoice.
    pub fn receive_variable_amount_payment(
        &self,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Bolt11Invoice, NodeException> {
        match self
            .0
            .lock()
            .unwrap()
            .receive_variable_amount_payment(description.as_str(), expiry_secs)
        {
            Ok(e) => Ok(Bolt11Invoice {
                signed_raw_invoice: e.to_string(),
            }),
            Err(e) => Err(e.into()),
        }
    }

    /// Retrieve the details of a specific payment with the given hash.
    ///
    /// Returns `PaymentDetails` if the payment was known and `null` otherwise.
    pub fn payment(&self, payment_hash: PaymentHash) -> Option<PaymentDetails> {
        match self.0.lock().unwrap().payment(&(payment_hash.into())) {
            None => None,
            Some(e) => Some(e.into()),
        }
    }

    /// Remove the payment with the given hash from the store.
    ///
    pub fn remove_payment(&self, payment_hash: PaymentHash) -> anyhow::Result<(), NodeException> {
        match self
            .0
            .lock()
            .unwrap()
            .remove_payment(&(payment_hash.into()))
        {
            Ok(_) => Ok(()),
            Err(e) => Err(e.into()),
        }
    }

    /// Retrieves all payments that match the given predicate.
    ///
    pub fn list_payments_with_filter(
        &self,
        payment_direction: PaymentDirection,
    ) -> Vec<PaymentDetails> {
        self.0
            .lock()
            .unwrap()
            .list_payments_with_filter(|p| p.direction == payment_direction.into())
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }
    /// Retrieves all payments.
    pub fn list_payments(&self) -> Vec<PaymentDetails> {
        self.0
            .lock()
            .unwrap()
            .list_payments()
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }
    /// Retrieves a list of known peers.
    pub fn list_peers(&self) -> Vec<PeerDetails> {
        self.0
            .lock()
            .unwrap()
            .list_peers()
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }
    /// Creates a digital ECDSA signature of a message with the node's secret key.
    ///
    /// A receiver knowing the corresponding `PublicKey` (e.g. the node’s id) and the message
    /// can be sure that the signature was generated by the caller.
    /// Signatures are EC recoverable, meaning that given the message and the
    /// signature the PublicKey of the signer can be extracted.
    pub fn sign_message(&self, msg: Vec<u8>) -> anyhow::Result<String, NodeException> {
        match self.0.lock().unwrap().sign_message(msg.as_slice()) {
            Ok(e) => Ok(e),
            Err(e) => Err(e.into()),
        }
    }

    /// Verifies that the given ECDSA signature was created for the given message with the
    /// secret key corresponding to the given public key.
    pub fn verify_signature(
        &self,
        msg: Vec<u8>,
        sig: String,
        pkey: PublicKey,
    ) -> anyhow::Result<bool, NodeException> {
        Ok(self
            .0
            .lock()
            .unwrap()
            .verify_signature(msg.as_slice(), sig.as_str(), &pkey.into()))
    }
}
