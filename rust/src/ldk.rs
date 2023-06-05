pub use anyhow::anyhow;
use flutter_rust_bridge::*;
use ldk_node::bitcoin::hashes::hex::ToHex;
use ldk_node::Builder;
pub use ldk_node::Node;
use std::net::IpAddr;
use std::str::FromStr;
use std::sync::Mutex;

/// An event emitted by [Node], which should be handled by the user.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Event {
    /// A sent payment was successful.
    PaymentSuccessful {
        /// The hash of the payment.
        payment_hash: PaymentHash,
    },
    /// A sent payment has failed.
    PaymentFailed {
        /// The hash of the payment.
        payment_hash: PaymentHash,
    },
    /// A payment has been received.
    PaymentReceived {
        /// The hash of the payment.
        payment_hash: PaymentHash,
        /// The value, in thousandths of a satoshi, that has been received.
        amount_msat: u64,
    },
    /// A channel is ready to be used.
    ChannelReady {
        /// The channel_id of the channel.
        channel_id: [u8; 32],
        /// The user_channel_id of the channel.
        user_channel_id: usize,
    },
    /// A channel has been closed.
    ChannelClosed {
        /// The channel_id of the channel.
        channel_id: [u8; 32],
        /// The user_channel_id of the channel.
        user_channel_id: usize,
    },
    /// A channel has been created and is pending confirmation on-chain.
    ChannelPending {
        /// The channel_id of the channel.
        channel_id: [u8; 32],
        /// The user_channel_id of the channel.
        user_channel_id: usize,
        /// The temporary_channel_id this channel used to be known by during channel establishment.
        former_temporary_channel_id: [u8; 32],
        /// The node_id of the channel counterparty.
        counterparty_node_id: PublicKey,
        /// The outpoint of the channel's funding transaction.
        funding_txo: OutPoint,
    },
}

impl From<ldk_node::Event> for Event {
    fn from(value: ldk_node::Event) -> Self {
        match value {
            ldk_node::Event::PaymentSuccessful { payment_hash } => Event::PaymentSuccessful {
                payment_hash: PaymentHash { 0: payment_hash.0 },
            },
            ldk_node::Event::PaymentFailed { payment_hash } => Event::PaymentFailed {
                payment_hash: PaymentHash { 0: payment_hash.0 },
            },
            ldk_node::Event::PaymentReceived {
                payment_hash,
                amount_msat,
            } => Event::PaymentReceived {
                payment_hash: PaymentHash { 0: payment_hash.0 },
                amount_msat,
            },
            ldk_node::Event::ChannelReady {
                channel_id,
                user_channel_id,
            } => Event::ChannelReady {
                channel_id,
                user_channel_id: user_channel_id as usize,
            },
            ldk_node::Event::ChannelClosed {
                channel_id,
                user_channel_id,
            } => Event::ChannelClosed {
                channel_id,
                user_channel_id: user_channel_id as usize,
            },
            ldk_node::Event::ChannelPending {
                channel_id,
                user_channel_id,
                former_temporary_channel_id,
                counterparty_node_id,
                funding_txo,
            } => Event::ChannelPending {
                channel_id,
                user_channel_id: user_channel_id as usize,
                former_temporary_channel_id,
                counterparty_node_id: PublicKey {
                    key_hex: counterparty_node_id.to_hex(),
                },
                funding_txo: funding_txo.into(),
            },
        }
    }
}

///A bitcoin transaction hash/transaction ID.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Txid(pub String);

///A reference to a transaction output.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct OutPoint {
    pub txid: Txid,
    pub vout: u32,
}

impl From<ldk_node::bitcoin::OutPoint> for OutPoint {
    fn from(value: ldk_node::bitcoin::OutPoint) -> Self {
        OutPoint {
            txid: Txid(value.txid.to_string()),
            vout: value.vout,
        }
    }
}

/// Represents the current status of a payment.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum PaymentStatus {
    /// The payment is still pending.
    Pending,
    /// The payment suceeded.
    Succeeded,
    /// The payment failed.
    Failed,
}

impl From<ldk_node::PaymentStatus> for PaymentStatus {
    fn from(value: ldk_node::PaymentStatus) -> Self {
        match value {
            ldk_node::PaymentStatus::Pending => PaymentStatus::Pending,
            ldk_node::PaymentStatus::Succeeded => PaymentStatus::Succeeded,
            ldk_node::PaymentStatus::Failed => PaymentStatus::Failed,
        }
    }
}

/// Represents the direction of a payment.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum PaymentDirection {
    /// The payment is inbound.
    Inbound,
    /// The payment is outbound.
    Outbound,
}

impl From<ldk_node::PaymentDirection> for PaymentDirection {
    fn from(value: ldk_node::PaymentDirection) -> Self {
        match value {
            ldk_node::PaymentDirection::Inbound => PaymentDirection::Inbound,
            ldk_node::PaymentDirection::Outbound => PaymentDirection::Outbound,
        }
    }
}

impl From<PaymentDirection> for ldk_node::PaymentDirection {
    fn from(value: PaymentDirection) -> Self {
        match value {
            PaymentDirection::Inbound => ldk_node::PaymentDirection::Inbound,
            PaymentDirection::Outbound => ldk_node::PaymentDirection::Outbound,
        }
    }
}

/// paymentHash type, use to cross-lock hop
///
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub struct PaymentHash(pub [u8; 32]);

/// paymentPreimage type, use to route payment between hop
///
#[derive(Hash, Copy, Clone, PartialEq, Eq, Debug)]
pub struct PaymentPreimage(pub [u8; 32]);

/// payment_secret type, use to authenticate sender to the receiver and tie MPP HTLCs together
///
#[derive(Hash, Copy, Clone, PartialEq, Eq, Debug)]
pub struct PaymentSecret(pub [u8; 32]);

// Structs wrapping the particular information which should easily be
// understandable, parseable, and transformable, i.e., we'll try to avoid
// exposing too many technical detail here.
/// Represents a payment.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct PaymentDetails {
    /// The payment hash, i.e., the hash of the `preimage`.
    pub hash: PaymentHash,
    /// The pre-image used by the payment.
    pub preimage: Option<PaymentPreimage>,
    /// The secret used by the payment.
    pub secret: Option<PaymentSecret>,
    /// The amount transferred.
    pub amount_msat: Option<u64>,
    /// The direction of the payment.
    pub direction: PaymentDirection,
    /// The status of the payment.
    pub status: PaymentStatus,
}

impl From<ldk_node::PaymentDetails> for PaymentDetails {
    fn from(value: ldk_node::PaymentDetails) -> Self {
        PaymentDetails {
            hash: PaymentHash(value.hash.0),
            preimage: value.preimage.map(|x| PaymentPreimage(x.0)),
            secret: value.secret.map(|x| PaymentSecret(x.0)),
            status: value.status.into(),
            amount_msat: value.amount_msat,
            direction: PaymentDirection::Inbound,
        }
    }
}

///Represents a syntactically and semantically correct lightning BOLT11 invoice.
pub struct Invoice {
    pub hex: String,
}

impl From<Invoice> for ldk_node::lightning_invoice::Invoice {
    fn from(value: Invoice) -> Self {
        ldk_node::lightning_invoice::Invoice::from_str(value.hex.as_str()).expect("Invalid Invoice")
    }
}

/// Details of a channel, as returned by node.listChannels()
#[derive(Clone, Debug, PartialEq)]
pub struct ChannelDetails {
    /// The channel's ID (prior to funding transaction generation, this is a random 32 bytes,
    /// thereafter this is the txid of the funding transaction xor the funding transaction output).
    /// Note that this means this value is *not* persistent - it can change once during the
    /// lifetime of the channel.
    pub channel_id: [u8; 32],
    /// The Channel's funding transaction output, if we've negotiated the funding transaction with
    /// our counterparty already.
    ///
    pub funding_txo: Option<String>,
    /// The position of the funding transaction in the chain. None if the funding transaction has
    /// not yet been confirmed and the channel fully opened.
    ///
    /// For channels with `confirmationsrequired` set to `Some(0)`, `outboundScidAlias` may
    /// be used in place of this in outbound routes.
    ///
    pub short_channel_id: Option<u64>,
    /// An optional `shortChannelId` alias for this channel, randomly generated by us and
    /// usable in place of `shortChannelId` to reference the channel in outbound routes when
    /// the channel has not yet been confirmed (as long as `confirmationsRequired` is
    /// `Some(0)`).
    ///
    /// This will be `None` as long as the channel is not available for routing outbound payments.
    ///
    pub outbound_scid_alias: Option<u64>,
    /// An optional `shortChannelId` alias for this channel, randomly generated by our
    /// counterparty and usable in place of `shortChannelId` in invoice route hints. Our
    /// counterparty will recognize the alias provided here in place of the `shortChannelId`
    /// when they see a payment to be routed to us.
    ///
    /// Our counterparty may choose to rotate this value at any time, though will always recognize
    /// previous values for inbound payment forwarding.
    ///
    pub inbound_scid_alias: Option<u64>,
    /// The value, in satoshis, of this channel as appears in the funding output
    pub channel_value_satoshis: u64,
    /// The value, in satoshis, that must always be held in the channel for us. This value ensures
    /// that if we broadcast a revoked state, our counterparty can punish us by claiming at least
    /// this value on chain.
    ///
    /// This value is not included in `outbound_capacity_msat` as it can never be spent.
    ///
    /// This value will be null for outbound channels until the counterparty accepts the channel.
    ///
    pub unspendable_punishment_reserve: Option<u64>,
    /// The userChannelId passed in to create_channel, or a random value if the channel was
    /// inbound. This may be zero for inbound channels serialized with LDK versions prior to
    /// 0.0.113.
    pub user_channel_id: usize,
    /// The currently negotiated fee rate denominated in satoshi per 1000 weight units,
    /// which is applied to commitment and HTLC transactions.
    ///
    /// This value will be null for objects serialized with LDK versions prior to 0.0.115.
    pub feerate_sat_per_1000_weight: Option<u32>,
    /// Our total balance.  This is the amount we would get if we close the channel.
    /// This value is not exact. Due to various in-flight changes and feerate changes, exactly this
    /// amount is not likely to be recoverable on close.
    ///
    /// This does not include any pending HTLCs which are not yet fully resolved (and, thus, whose
    /// balance is not available for inclusion in new outbound HTLCs). This further does not include
    /// any pending outgoing HTLCs which are awaiting some other resolution to be sent.
    /// This does not consider any on-chain fees.
    ///
    pub balance_msat: u64,
    /// The available outbound capacity for sending HTLCs to the remote peer. This does not include
    /// any pending HTLCs which are not yet fully resolved (and, thus, whose balance is not
    /// available for inclusion in new outbound HTLCs). This further does not include any pending
    /// outgoing HTLCs which are awaiting some other resolution to be sent.
    ///
    /// This value is not exact. Due to various in-flight changes, feerate changes, and our
    /// conflict-avoidance policy, exactly this amount is not likely to be spendable. However, we
    /// should be able to spend nearly this amount.
    pub outbound_capacity_msat: u64,
    /// The available outbound capacity for sending a single HTLC to the remote peer.This is intended for use when routing, allowing us
    /// to use a limit as close as possible to the HTLC limit we can currently send.
    ///
    pub next_outbound_htlc_limit_msat: u64,
    /// The available inbound capacity for the remote peer to send HTLCs to us. This does not
    /// include any pending HTLCs which are not yet fully resolved (and, thus, whose balance is not
    /// available for inclusion in new inbound HTLCs).
    /// Note that there are some corner cases not fully handled here, so the actual available
    /// inbound capacity may be slightly higher than this.
    ///
    /// This value is not exact. Due to various in-flight changes, feerate changes, and our
    /// counterparty's conflict-avoidance policy, exactly this amount is not likely to be spendable.
    /// However, our counterparty should be able to spend nearly this amount.
    pub inbound_capacity_msat: u64,
    /// The number of required confirmations on the funding transaction before the funding will be
    /// considered "locked". This number is selected by the channel fundee, and can be selected for inbound channels with
    /// This value will be null for outbound channels until the counterparty accepts the channel.
    ///
    pub confirmations_required: Option<u32>,
    /// The current number of confirmations on the funding transaction.
    ///
    /// This value will be `None` for objects serialized with LDK versions prior to 0.0.113.
    pub confirmations: Option<u32>,
    /// The number of blocks (after our commitment transaction confirms) that we will need to wait
    /// until we can claim our funds after we force-close the channel. During this time our
    /// counterparty is allowed to punish us if we broadcasted a stale state. If our counterparty
    /// force-closes the channel and broadcasts a commitment transaction we do not have to wait any
    /// time to claim our non-HTLC-encumbered funds.
    ///
    /// This value will be null for outbound channels until the counterparty accepts the channel.
    pub force_close_spend_delay: Option<u16>,
    /// True if the channel was initiated (and thus funded) by us.
    pub is_outbound: bool,
    /// True if the channel is confirmed, channelReady messages have been exchanged, and the
    /// channel is not currently being shut down. `channelReady` message exchange implies the
    /// required confirmation count has been reached (and we were connected to the peer at some
    /// point after the funding transaction received enough confirmations). The required
    pub is_channel_ready: bool,
    /// True if the channel is (a) confirmed and channelReady messages have been exchanged, (b)
    /// the peer is connected, and (c) the channel is not currently negotiating a shutdown.
    ///
    /// This is a strict superset of `isChannelReady`.
    pub is_usable: bool,
    /// True if this channel is (or will be) publicly-announced.
    pub is_public: bool,
    /// The smallest value HTLC (in msat) we will accept, for this channel. This field
    /// is only `None` for `ChannelDetails` objects serialized prior to LDK 0.0.107
    pub inbound_htlc_minimum_msat: Option<u64>,
    /// The largest value HTLC (in msat) we currently will accept, for this channel.
    pub inbound_htlc_maximum_msat: Option<u64>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PublicKey {
    pub key_hex: String,
}

impl From<PublicKey> for ldk_node::bitcoin::secp256k1::PublicKey {
    fn from(value: PublicKey) -> Self {
        ldk_node::bitcoin::secp256k1::PublicKey::from_str(value.key_hex.as_str())
            .expect("Invalid Public Key")
    }
}
/// A Bitcoin address.
pub struct Address {
    pub address_hex: String,
}

impl From<Address> for ldk_node::bitcoin::Address {
    fn from(value: Address) -> Self {
        ldk_node::bitcoin::Address::from_str(value.address_hex.as_str()).expect("Invalid Address")
    }
}

///Balance differentiated in various categories
#[derive(Debug, PartialEq, Eq, Clone, Default)]
pub struct Balance {
    /// All coinbase outputs not yet matured
    pub immature: u64,
    /// Unconfirmed UTXOs generated by a wallet tx
    pub trusted_pending: u64,
    /// Unconfirmed UTXOs received from an external wallet
    pub untrusted_pending: u64,
    /// Confirmed and immediately spendable balance
    pub confirmed: u64,
}

impl From<&ldk_node::lightning::ln::channelmanager::ChannelDetails> for ChannelDetails {
    fn from(value: &ldk_node::lightning::ln::channelmanager::ChannelDetails) -> Self {
        ChannelDetails {
            channel_id: value.channel_id,
            funding_txo: value.funding_txo.map(|x| x.txid.to_string()),
            short_channel_id: value.short_channel_id,
            outbound_scid_alias: value.outbound_scid_alias,
            inbound_scid_alias: value.inbound_scid_alias,
            channel_value_satoshis: value.channel_value_satoshis,
            unspendable_punishment_reserve: value.unspendable_punishment_reserve,
            user_channel_id: value.user_channel_id as usize,
            feerate_sat_per_1000_weight: value.feerate_sat_per_1000_weight,
            balance_msat: value.balance_msat,
            outbound_capacity_msat: value.outbound_capacity_msat,
            next_outbound_htlc_limit_msat: value.next_outbound_htlc_limit_msat,
            inbound_capacity_msat: value.inbound_capacity_msat,
            confirmations_required: value.confirmations_required,
            confirmations: value.confirmations,
            force_close_spend_delay: value.force_close_spend_delay,
            is_outbound: value.is_outbound,
            is_channel_ready: value.is_channel_ready,
            is_usable: value.is_usable,
            is_public: value.is_public,
            inbound_htlc_minimum_msat: value.inbound_htlc_minimum_msat,
            inbound_htlc_maximum_msat: value.inbound_htlc_maximum_msat,
        }
    }
}

/// Bitcoin network enum
#[derive(Debug, Clone)]
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

impl From<Network> for ldk_node::bitcoin::Network {
    fn from(value: Network) -> Self {
        match value {
            Network::Bitcoin => ldk_node::bitcoin::Network::Bitcoin,
            Network::Testnet => ldk_node::bitcoin::Network::Testnet,
            Network::Signet => ldk_node::bitcoin::Network::Signet,
            Network::Regtest => ldk_node::bitcoin::Network::Regtest,
        }
    }
}

// Internet socket addresses consist of an IP address, a 16-bit port number, as well as possibly some version-dependent additional information.
// The size of a SocketAddr instance may vary depending on the target operating system.
#[derive(Debug, Clone)]
pub struct SocketAddr {
    ///Ipv4 address
    pub ip: String,
    pub port: u16,
}

impl From<SocketAddr> for std::net::SocketAddr {
    fn from(value: SocketAddr) -> Self {
        let ip = IpAddr::from_str(value.ip.as_str()).expect("Invalid IP address");
        std::net::SocketAddr::new(ip, value.port)
    }
}

impl From<std::net::SocketAddr> for SocketAddr {
    fn from(value: std::net::SocketAddr) -> Self {
        SocketAddr {
            ip: value.ip().to_string(),
            port: value.port(),
        }
    }
}

impl From<Config> for ldk_node::Config {
    fn from(value: Config) -> Self {
        ldk_node::Config {
            storage_dir_path: value.storage_dir_path,
            esplora_server_url: value.esplora_server_url,
            network: value.network.into(),
            listening_address: value.listening_address.map(|x| x.into()),
            default_cltv_expiry_delta: value.default_cltv_expiry_delta,
        }
    }
}

/// Represents the configuration of an [Node] instance.
///
#[frb]
#[derive(Debug, Clone)]
pub struct Config {
    #[frb(non_final)]
    pub storage_dir_path: String,
    /// The URL of the utilized Esplora server.
    #[frb(non_final)]
    pub esplora_server_url: String,
    /// The used Bitcoin network.
    #[frb(non_final)]
    pub network: Network,
    /// The IP address and TCP port the node will listen on.
    #[frb(non_final)]
    pub listening_address: Option<SocketAddr>,
    /// The default CLTV expiry delta to be used for payments.
    #[frb(non_final)]
    pub default_cltv_expiry_delta: u32,
}

impl Default for Config {
    fn default() -> Self {
        Self {
            storage_dir_path: "/tmp/ldk_node/".to_string(),
            esplora_server_url: "http://localhost:3002".to_string(),
            network: Network::Regtest,
            listening_address: None,
            default_cltv_expiry_delta: 144,
        }
    }
}

#[derive(Debug, Clone)]
pub enum WalletEntropySource {
    SeedFile(String),
    SeedBytes([u8; 64]),
    Bip39Mnemonic {
        mnemonic: String,
        passphrase: Option<String>,
    },
}

pub fn build_node(config: Config, entropy_source: Option<WalletEntropySource>) -> NodeBase {
    let mut builder = Builder::from_config(config.into());
    if let Some(source) = entropy_source {
        match source {
            WalletEntropySource::SeedFile(e) => builder.set_entropy_seed_path(e),
            WalletEntropySource::SeedBytes(e) => builder.set_entropy_seed_bytes(e),
            WalletEntropySource::Bip39Mnemonic {
                mnemonic,
                passphrase,
            } => builder.set_entropy_bip39_mnemonic(
                ldk_node::bip39::Mnemonic::from_str(mnemonic.as_str()).expect("Invalid Mnemonic"),
                passphrase,
            ),
        };
    }
    let node = builder.build();

    NodeBase {
        node_pointer: RustOpaque::new(NodePointer(Mutex::new(node))),
    }
}

///The main interface object of LDK Node, wrapping the necessary LDK and BDK functionalities.
///
///Needs to be initialized and instantiated through builder.build().
pub struct NodeBase {
    pub node_pointer: RustOpaque<NodePointer>,
}

pub struct NodePointer(Mutex<Node>);

impl NodeBase {
    /// Starts the necessary background tasks, such as handling events coming from user input,
    /// LDK/BDK, and the peer-to-peer network.
    ///
    /// After this returns, the [Node] instance can be controlled via the provided API methods in
    /// a thread-safe manner.
    pub fn start(&self) -> anyhow::Result<()> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        node_lock.start().map_err(|e| anyhow!(e.to_string()))
    }

    /// Disconnects all peers, stops all running background tasks, and shuts down [Node].
    ///
    /// After this returns most API methods will throw NotRunning Exception.
    pub fn stop(&self) -> anyhow::Result<()> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        node_lock.stop().map_err(|e| anyhow!(e.to_string()))
    }

    /// Blocks until the next event is available.
    ///
    /// **Note:** this will always return the same event until handling is confirmed via node.event_handled().
    pub fn event_handled(&self) -> anyhow::Result<()> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        Ok(node_lock.event_handled())
    }

    /// Confirm the last retrieved event handled.
    ///
    /// **Note:** This **MUST** be called after each event has been handled.
    pub fn next_event(&self) -> anyhow::Result<Event> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        Ok(node_lock.next_event().into())
    }

    /// Returns our own node id
    pub fn node_id(&self) -> anyhow::Result<PublicKey> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        Ok(PublicKey {
            key_hex: node_lock.node_id().to_string(),
        })
    }

    /// Returns our own listening address.
    pub fn listening_address(&self) -> Option<SocketAddr> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        node_lock.listening_address().map(|x| x.to_owned().into())
    }

    /// Retrieve a new on-chain/funding address.
    pub fn new_funding_address(&self) -> anyhow::Result<Address> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.new_funding_address() {
            Ok(e) => Ok(Address {
                address_hex: e.to_string(),
            }),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Retrieve the current on-chain balance.
    pub fn on_chain_balance(&self) -> anyhow::Result<Balance> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.onchain_balance() {
            Ok(e) => Ok(Balance {
                immature: e.immature,
                trusted_pending: e.trusted_pending,
                untrusted_pending: e.untrusted_pending,
                confirmed: e.confirmed,
            }),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Send an on-chain payment to the given address.
    pub fn send_to_on_chain_address(
        &self,
        address: Address,
        amount_sats: u64,
    ) -> anyhow::Result<Txid> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.send_to_onchain_address(&address.into(), amount_sats) {
            Ok(e) => Ok(Txid(e.to_string())),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Send an on-chain payment to the given address, draining all the available funds.
    pub fn send_all_to_on_chain_address(&self, address: Address) -> anyhow::Result<Txid> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.send_all_to_onchain_address(&address.into()) {
            Ok(e) => Ok(Txid(e.to_string())),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Connect to a node on the peer-to-peer network.
    ///
    /// If `permanently` is set to `true`, we'll remember the peer and reconnect to it on restart.
    pub fn connect(
        &self,
        node_id: PublicKey,
        address: SocketAddr,
        permanently: bool,
    ) -> anyhow::Result<()> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.connect(node_id.into(), address.into(), permanently) {
            Ok(_) => Ok(()),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Disconnects the peer with the given node id.
    ///
    /// Will also remove the peer from the peer store, i.e., after this has been called we won't
    /// try to reconnect on restart.
    pub fn disconnect(&self, counterparty_node_id: PublicKey) -> anyhow::Result<()> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.disconnect(&counterparty_node_id.into()) {
            Ok(_) => Ok(()),
            Err(e) => Err(anyhow!(e.to_string())),
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
        address: SocketAddr,
        node_id: PublicKey,
        channel_amount_sats: u64,
        push_to_counterparty_msat: Option<u64>,
        announce_channel: bool,
    ) -> anyhow::Result<()> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.connect_open_channel(
            node_id.into(),
            address.into(),
            channel_amount_sats,
            push_to_counterparty_msat,
            announce_channel,
        ) {
            Ok(_) => Ok(()),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    ///Retrieve a list of known channels.
    pub fn list_channels(&self) -> Vec<ChannelDetails> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        node_lock.list_channels().iter().map(|x| x.into()).collect()
    }

    ///Sync the LDK and BDK wallets with the current chain state.
    // Note that the wallets will be also synced regularly in the background
    pub fn sync_wallets(&self) -> anyhow::Result<()> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.sync_wallets() {
            Ok(_) => Ok(()),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Close a previously opened channel.
    pub fn close_channel(
        &self,
        channel_id: [u8; 32],
        counterparty_node_id: PublicKey,
    ) -> anyhow::Result<()> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.close_channel(&channel_id, &(counterparty_node_id.into())) {
            Ok(_) => Ok(()),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Send a payement given an invoice.
    pub fn send_payment(&self, invoice: Invoice) -> anyhow::Result<PaymentHash> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.send_payment(&invoice.into()) {
            Ok(e) => Ok(PaymentHash(e.0)),
            Err(e) => Err(anyhow!(e.to_string())),
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
        invoice: Invoice,
        amount_msat: u64,
    ) -> anyhow::Result<PaymentHash> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.send_payment_using_amount(&invoice.into(), amount_msat) {
            Ok(e) => Ok(PaymentHash(e.0)),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Send a spontaneous, aka. "keysend", payment
    pub fn send_spontaneous_payment(
        &self,
        amount_msat: u64,
        node_id: PublicKey,
    ) -> anyhow::Result<PaymentHash> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.send_spontaneous_payment(amount_msat, &node_id.into()) {
            Ok(e) => Ok(PaymentHash(e.0)),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Returns a payable invoice that can be used to request and receive a payment of the amount
    /// given.
    pub fn receive_payment(
        &self,
        amount_msat: u64,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Invoice> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.receive_payment(amount_msat, description.as_str(), expiry_secs) {
            Ok(e) => Ok(Invoice { hex: e.to_string() }),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Returns a payable invoice that can be used to request and receive a payment for which the
    /// amount is to be determined by the user, also known as a "zero-amount" invoice.
    pub fn receive_variable_amount_payment(
        &self,
        description: String,
        expiry_secs: u32,
    ) -> anyhow::Result<Invoice> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.receive_variable_amount_payment(description.as_str(), expiry_secs) {
            Ok(e) => Ok(Invoice { hex: e.to_string() }),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Retrieve the details of a specific payment with the given hash.
    ///
    /// Returns `PaymentDetails` if the payment was known and `null` otherwise.
    pub fn payment(&self, payment_hash: PaymentHash) -> Option<PaymentDetails> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.payment(&ldk_node::lightning::ln::PaymentHash(payment_hash.0)) {
            None => None,
            Some(e) => Some(e.into()),
        }
    }

    /// Remove the payment with the given hash from the store.
    ///
    /// Returns `true` if the payment was present and `false` otherwise.
    pub fn remove_payment(&self, payment_hash: PaymentHash) -> anyhow::Result<bool> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        match node_lock.remove_payment(&ldk_node::lightning::ln::PaymentHash(payment_hash.0)) {
            Ok(e) => Ok(e),
            Err(e) => Err(anyhow!(e.to_string())),
        }
    }

    /// Retrieves all payments that match the given predicate.
    ///
    pub fn list_payments_with_filter(
        &self,
        payment_direction: PaymentDirection,
    ) -> Vec<PaymentDetails> {
        let node_lock = self.node_pointer.0.lock().unwrap();
        let payment_details =
            node_lock.list_payments_with_filter(|p| p.direction == payment_direction.into());
        payment_details
            .iter()
            .map(|x| x.to_owned().into())
            .collect()
    }
}
