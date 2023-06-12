pub use anyhow::anyhow;
use flutter_rust_bridge::*;
use ldk_node::bitcoin::hashes::hex::ToHex;
pub use ldk_node::Node;
use std::net::SocketAddr;
use std::str::FromStr;
use std::string::ToString;

/// The global identifier of a channel.
///
/// Note that this will start out to be a temporary ID until channel funding negotiation is
/// finalized, at which point it will change to be a permanent global ID tied to the on-chain
/// funding transaction.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ChannelId {
    pub internal: [u8; 32],
}

impl From<ldk_node::ChannelId> for ChannelId {
    fn from(value: ldk_node::ChannelId) -> Self {
        ChannelId { internal: value.0 }
    }
}
impl From<ChannelId> for ldk_node::ChannelId {
    fn from(value: ChannelId) -> Self {
        ldk_node::ChannelId(value.internal)
    }
}
///A local, potentially user-provided, identifier of a channel.
///
/// By default, this will be randomly generated for the user to ensure local uniqueness.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct UserChannelId {
    pub internal: u64,
}
/// An event emitted by [Node], which should be handled by the user.
///
impl From<ldk_node::UserChannelId> for UserChannelId {
    fn from(value: ldk_node::UserChannelId) -> Self {
        UserChannelId {
            internal: value.0 as u64,
        }
    }
}
#[derive(Debug, Clone, PartialEq, Eq)]
/// An event emitted by [Node], which should be handled by the user.
///
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
        channel_id: ChannelId,
        /// The user_channel_id of the channel.
        user_channel_id: UserChannelId,
    },
    /// A channel has been closed.
    ChannelClosed {
        /// The channel_id of the channel.
        channel_id: ChannelId,
        /// The user_channel_id of the channel.
        user_channel_id: UserChannelId,
    },
    /// A channel has been created and is pending confirmation on-chain.
    ChannelPending {
        /// The channel_id of the channel.
        channel_id: ChannelId,
        /// The user_channel_id of the channel.
        user_channel_id: UserChannelId,
        /// The temporary_channel_id this channel used to be known by during channel establishment.
        former_temporary_channel_id: ChannelId,
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
                payment_hash: PaymentHash {
                    internal: payment_hash.0,
                },
            },
            ldk_node::Event::PaymentFailed { payment_hash } => Event::PaymentFailed {
                payment_hash: PaymentHash {
                    internal: payment_hash.0,
                },
            },
            ldk_node::Event::PaymentReceived {
                payment_hash,
                amount_msat,
            } => Event::PaymentReceived {
                payment_hash: PaymentHash {
                    internal: payment_hash.0,
                },
                amount_msat,
            },
            ldk_node::Event::ChannelReady {
                channel_id,
                user_channel_id,
            } => Event::ChannelReady {
                channel_id: channel_id.into(),
                user_channel_id: user_channel_id.into(),
            },
            ldk_node::Event::ChannelClosed {
                channel_id,
                user_channel_id,
            } => Event::ChannelClosed {
                channel_id: channel_id.into(),
                user_channel_id: user_channel_id.into(),
            },
            ldk_node::Event::ChannelPending {
                channel_id,
                user_channel_id,
                former_temporary_channel_id,
                counterparty_node_id,
                funding_txo,
            } => Event::ChannelPending {
                channel_id: channel_id.into(),
                user_channel_id: user_channel_id.into(),
                former_temporary_channel_id: former_temporary_channel_id.into(),
                counterparty_node_id: PublicKey {
                    internal: counterparty_node_id.to_hex(),
                },
                funding_txo: funding_txo.into(),
            },
        }
    }
}

///A bitcoin transaction hash/transaction ID.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Txid {
    pub internal: String,
}

///A reference to a transaction output.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct OutPoint {
    pub txid: Txid,
    pub vout: u32,
}

impl From<ldk_node::bitcoin::OutPoint> for OutPoint {
    fn from(value: ldk_node::bitcoin::OutPoint) -> Self {
        OutPoint {
            txid: Txid {
                internal: value.txid.to_string(),
            },
            vout: value.vout,
        }
    }
}

/// Represents the current status of a payment.
///
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum PaymentStatus {
    /// The payment is still pending.
    Pending,
    /// The payment suceeded.
    Succeeded,
    /// The payment failed.
    Failed,
    /// The sending of the payment failed and is safe to be retried.
    SendingFailed,
}

impl From<ldk_node::PaymentStatus> for PaymentStatus {
    fn from(value: ldk_node::PaymentStatus) -> Self {
        match value {
            ldk_node::PaymentStatus::Pending => PaymentStatus::Pending,
            ldk_node::PaymentStatus::Succeeded => PaymentStatus::Succeeded,
            ldk_node::PaymentStatus::Failed => PaymentStatus::Failed,
            ldk_node::PaymentStatus::SendingFailed => PaymentStatus::SendingFailed,
        }
    }
}

/// Represents the direction of a payment.
///
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
pub struct PaymentHash {
    pub internal: [u8; 32],
}

/// paymentPreimage type, use to route payment between hop
///
#[derive(Hash, Copy, Clone, PartialEq, Eq, Debug)]
pub struct PaymentPreimage {
    pub internal: [u8; 32],
}

/// payment_secret type, use to authenticate sender to the receiver and tie MPP HTLCs together
///
#[derive(Hash, Copy, Clone, PartialEq, Eq, Debug)]
pub struct PaymentSecret {
    pub internal: [u8; 32],
}

// Structs wrapping the particular information which should easily be
// understandable, parseable, and transformable, i.e., we'll try to avoid
// exposing too many technical detail here.
/// Represents a payment.
///
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
            hash: PaymentHash {
                internal: value.hash.0,
            },
            preimage: value.preimage.map(|x| PaymentPreimage { internal: x.0 }),
            secret: value.secret.map(|x| PaymentSecret { internal: x.0 }),
            status: value.status.into(),
            amount_msat: value.amount_msat,
            direction: PaymentDirection::Inbound,
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
///Represents a syntactically and semantically correct lightning BOLT11 invoice.
///
pub struct Invoice {
    pub internal: String,
}

impl From<Invoice> for ldk_node::lightning_invoice::Invoice {
    fn from(value: Invoice) -> Self {
        ldk_node::lightning_invoice::Invoice::from_str(value.internal.as_str())
            .expect("Invalid Invoice")
    }
}
///A Secp256k1 public key, used for verification of signatures.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PublicKey {
    pub internal: String,
}

impl From<PublicKey> for ldk_node::bitcoin::secp256k1::PublicKey {
    fn from(value: PublicKey) -> Self {
        ldk_node::bitcoin::secp256k1::PublicKey::from_str(value.internal.as_str())
            .expect("Invalid Public Key")
    }
}
impl From<ldk_node::bitcoin::secp256k1::PublicKey> for PublicKey {
    fn from(value: ldk_node::bitcoin::secp256k1::PublicKey) -> Self {
        PublicKey {
            internal: value.to_hex(),
        }
    }
}
/// A Bitcoin address.
///
pub struct Address {
    pub internal: String,
}

impl From<Address> for ldk_node::bitcoin::Address {
    fn from(value: Address) -> Self {
        ldk_node::bitcoin::Address::from_str(value.internal.as_str()).expect("Invalid Address")
    }
}

///Balance differentiated in various categories
///
#[derive(Debug, PartialEq, Eq, Clone, Default)]
pub struct Balance {
    /// All coinbase outputs not yet matured
    ///
    pub immature: u64,
    /// Unconfirmed UTXOs generated by a wallet tx
    ///
    pub trusted_pending: u64,
    /// Unconfirmed UTXOs received from an external wallet
    ///
    pub untrusted_pending: u64,
    /// Confirmed and immediately spendable balance
    ///
    pub confirmed: u64,
}
/// Details of a channel, as returned by node.listChannels()
///
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ChannelDetails {
    /// The channel's ID (prior to funding transaction generation, this is a random 32 bytes,
    /// thereafter this is the txid of the funding transaction xor the funding transaction output).
    /// Note that this means this value is *not* persistent - it can change once during the
    /// lifetime of the channel.
    ///
    pub channel_id: ChannelId,
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
    ///
    pub user_channel_id: UserChannelId,
    /// The currently negotiated fee rate denominated in satoshi per 1000 weight units,
    /// which is applied to commitment and HTLC transactions.
    ///
    /// This value will be null for objects serialized with LDK versions prior to 0.0.115.
    ///
    pub feerate_sat_per_1000_weight: u32,
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
    ///
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
    ///
    pub inbound_capacity_msat: u64,
    /// The number of required confirmations on the funding transaction before the funding will be
    /// considered "locked". This number is selected by the channel fundee, and can be selected for inbound channels with
    /// This value will be null for outbound channels until the counterparty accepts the channel.
    ///
    pub confirmations_required: Option<u32>,
    /// The current number of confirmations on the funding transaction.
    ///
    /// This value will be `None` for objects serialized with LDK versions prior to 0.0.113.
    ///
    pub confirmations: Option<u32>,
    /// The number of blocks (after our commitment transaction confirms) that we will need to wait
    /// until we can claim our funds after we force-close the channel. During this time our
    /// counterparty is allowed to punish us if we broadcasted a stale state. If our counterparty
    /// force-closes the channel and broadcasts a commitment transaction we do not have to wait any
    /// time to claim our non-HTLC-encumbered funds.
    ///
    /// This value will be null for outbound channels until the counterparty accepts the channel.
    ///
    pub force_close_spend_delay: Option<u16>,
    /// True if the channel was initiated (and thus funded) by us.
    ///
    pub is_outbound: bool,
    /// True if the channel is confirmed, channelReady messages have been exchanged, and the
    /// channel is not currently being shut down. `channelReady` message exchange implies the
    /// required confirmation count has been reached (and we were connected to the peer at some
    /// point after the funding transaction received enough confirmations). The required
    ///
    pub is_channel_ready: bool,
    /// True if the channel is (a) confirmed and channelReady messages have been exchanged, (b)
    /// the peer is connected, and (c) the channel is not currently negotiating a shutdown.
    ///
    /// This is a strict superset of `isChannelReady`.
    ///
    pub is_usable: bool,
    /// True if this channel is (or will be) publicly-announced.
    ///
    pub is_public: bool,
    /// The smallest value HTLC (in msat) we will accept, for this channel. This field
    /// is only `None` for `ChannelDetails` objects serialized prior to LDK 0.0.107
    ///
    pub inbound_htlc_minimum_msat: Option<u64>,
    /// The largest value HTLC (in msat) we currently will accept, for this channel.
    ///
    pub inbound_htlc_maximum_msat: Option<u64>,
}
impl From<&ldk_node::ChannelDetails> for ChannelDetails {
    fn from(value: &ldk_node::ChannelDetails) -> Self {
        ChannelDetails {
            channel_id: value.clone().channel_id.into(),
            funding_txo: value.clone().funding_txo.map(|x| x.txid.to_string()),
            short_channel_id: None,
            outbound_scid_alias: None,
            inbound_scid_alias: None,
            force_close_spend_delay: None,
            inbound_htlc_minimum_msat: None,
            inbound_htlc_maximum_msat: None,
            channel_value_satoshis: value.clone().channel_value_satoshis,
            unspendable_punishment_reserve: value.clone().unspendable_punishment_reserve,
            user_channel_id: value.clone().user_channel_id.into(),
            feerate_sat_per_1000_weight: value.clone().feerate_sat_per_1000_weight,
            balance_msat: value.clone().balance_msat,
            outbound_capacity_msat: value.clone().outbound_capacity_msat,
            next_outbound_htlc_limit_msat: 0,
            inbound_capacity_msat: value.clone().inbound_capacity_msat,
            confirmations_required: value.clone().confirmations_required,
            confirmations: value.clone().confirmations,
            is_outbound: value.clone().is_outbound,
            is_channel_ready: value.clone().is_channel_ready,
            is_usable: value.clone().is_usable,
            is_public: value.clone().is_public,
        }
    }
}

/// Bitcoin network enum
///
#[derive(Debug, Clone)]
pub enum Network {
    ///Classic Bitcoin
    ///
    Bitcoin,
    ///Bitcoin’s testnet
    ///
    Testnet,
    ///Bitcoin’s signet
    ///
    Signet,
    ///Bitcoin’s regtest
    ///
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

/// Details of a known Lightning peer as returned by `node.listPeers`.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PeerDetails {
    /// Our peer's node ID.
    ///
    pub node_id: PublicKey,
    /// The IP address and TCP port of the peer.
    ///
    pub address: NetAddress,
    /// Indicates whether or not the user is currently has an active connection with the peer.
    ///
    pub is_connected: bool,
}

impl From<ldk_node::PeerDetails> for PeerDetails {
    fn from(value: ldk_node::PeerDetails) -> Self {
        PeerDetails {
            node_id: value.node_id.into(),
            address: value.address.into(),
            is_connected: value.is_connected,
        }
    }
}
///An address which can be used to connect to a remote peer.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum NetAddress {
    IPv4 { addr: String, port: u16 },
    IPv6 { addr: String, port: u16 },
}

impl From<NetAddress> for ldk_node::NetAddress {
    fn from(value: NetAddress) -> Self {
        match value {
            NetAddress::IPv4 { addr, port } => {
                ldk_node::NetAddress::from_str(&*format!("{addr}:{port}"))
                    .expect("Invalid IPv4 address")
            }
            NetAddress::IPv6 { addr, port } => {
                ldk_node::NetAddress::from_str(&*format!("{addr}:{port}"))
                    .expect("Invalid IPv6 address")
            }
        }
    }
}
impl From<ldk_node::NetAddress> for NetAddress {
    fn from(value: ldk_node::NetAddress) -> Self {
        let addr: SocketAddr = value.to_string().parse().unwrap();
        let host = addr.ip().to_string();
        let port = addr.port();
        NetAddress::IPv4 { addr: host, port }
    }
}

/// An enum representing the available verbosity levels of the logger.
///
#[derive(Copy, Clone, PartialEq, Eq, Debug, Hash)]
pub enum LogLevel {
    /// Designates extremely verbose information, including gossip-induced messages
    ///
    Gossip,
    /// Designates very low priority, often extremely verbose, information
    ///
    Trace,
    /// Designates lower priority information
    ///
    Debug,
    /// Designates useful information
    ///
    Info,
    /// Designates hazardous situations
    ///
    Warn,
    /// Designates very serious errors
    ///
    Error,
}

impl From<LogLevel> for ldk_node::LogLevel {
    fn from(value: LogLevel) -> Self {
        match value {
            LogLevel::Gossip => ldk_node::LogLevel::Gossip,
            LogLevel::Trace => ldk_node::LogLevel::Trace,
            LogLevel::Debug => ldk_node::LogLevel::Debug,
            LogLevel::Info => ldk_node::LogLevel::Info,
            LogLevel::Warn => ldk_node::LogLevel::Warn,
            LogLevel::Error => ldk_node::LogLevel::Error,
        }
    }
}

impl From<Config> for ldk_node::Config {
    fn from(value: Config) -> Self {
        ldk_node::Config {
            storage_dir_path: value.storage_dir_path,
            network: value.network.into(),
            listening_address: value.listening_address.map(|x| x.into()),
            default_cltv_expiry_delta: value.default_cltv_expiry_delta,
            onchain_wallet_sync_interval_secs: value.onchain_wallet_sync_interval_secs,
            wallet_sync_interval_secs: value.wallet_sync_interval_secs,
            fee_rate_cache_update_interval_secs: value.fee_rate_cache_update_interval_secs,
            log_level: value.log_level.into(),
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
    /// The used Bitcoin network.
    ///
    #[frb(non_final)]
    pub network: Network,
    ///The time in-between background sync attempts of the onchain wallet, in seconds.
    /// Note: A minimum of 10 seconds is always enforced.

    #[frb(non_final)]
    pub onchain_wallet_sync_interval_secs: u64,

    /// The time in-between background sync attempts of the LDK wallet, in seconds.
    /// Note: A minimum of 10 seconds is always enforced.
    ///
    #[frb(non_final)]
    pub wallet_sync_interval_secs: u64,

    ///The time in-between background update attempts to our fee rate cache, in seconds.
    /// Note: A minimum of 10 seconds is always enforced.
    ///
    #[frb(non_final)]
    pub fee_rate_cache_update_interval_secs: u64,

    ///The level at which we log messages.
    /// Any messages below this level will be excluded from the logs.
    ///
    #[frb(non_final)]
    pub log_level: LogLevel,

    /// The IP address and TCP port the node will listen on.
    ///
    #[frb(non_final)]
    pub listening_address: Option<NetAddress>,
    /// The default CLTV expiry delta to be used for payments.
    ///
    #[frb(non_final)]
    pub default_cltv_expiry_delta: u32,
}

impl Default for Config {
    fn default() -> Self {
        Self {
            storage_dir_path: DEFAULT_STORAGE_DIR_PATH.to_string(),
            network: DEFAULT_NETWORK,
            listening_address: Some(NetAddress::IPv4 {
                addr: String::from("0.0.0.0"),
                port: 9735,
            }),
            default_cltv_expiry_delta: DEFAULT_CLTV_EXPIRY_DELTA,
            onchain_wallet_sync_interval_secs: DEFAULT_BDK_WALLET_SYNC_INTERVAL_SECS,
            wallet_sync_interval_secs: DEFAULT_LDK_WALLET_SYNC_INTERVAL_SECS,
            fee_rate_cache_update_interval_secs: DEFAULT_FEE_RATE_CACHE_UPDATE_INTERVAL_SECS,
            log_level: DEFAULT_LOG_LEVEL,
        }
    }
}

///The from string implementation will try to determine the language of the mnemonic from all the supported languages. (Languages have to be explicitly enabled using the Cargo features.)
/// Supported number of words are 12, 15, 18, 21, and 24.
///
#[derive(Debug, Clone)]
pub struct Mnemonic {
    pub internal: String,
}

impl From<Mnemonic> for ldk_node::bip39::Mnemonic {
    fn from(value: Mnemonic) -> Self {
        ldk_node::bip39::Mnemonic::from_str(&*value.internal).expect("Invalid mnemonic key")
    }
}
#[derive(Debug, Clone)]
pub enum ChainDataSourceConfig {
    Esplora(String),
}

#[derive(Debug, Clone)]
pub enum EntropySourceConfig {
    SeedFile(String),
    SeedBytes([u8; 64]),
    Bip39Mnemonic {
        mnemonic: Mnemonic,
        passphrase: Option<String>,
    },
}

#[derive(Debug, Clone)]
pub enum GossipSourceConfig {
    P2PNetwork,
    RapidGossipSync(String),
}

// Config defaults
const DEFAULT_STORAGE_DIR_PATH: &str = "/tmp/ldk_node/";
const DEFAULT_NETWORK: Network = Network::Testnet;
const DEFAULT_CLTV_EXPIRY_DELTA: u32 = 144;
const DEFAULT_BDK_WALLET_SYNC_INTERVAL_SECS: u64 = 60;
const DEFAULT_LDK_WALLET_SYNC_INTERVAL_SECS: u64 = 20;
const DEFAULT_FEE_RATE_CACHE_UPDATE_INTERVAL_SECS: u64 = 60;
const DEFAULT_LOG_LEVEL: LogLevel = LogLevel::Debug;
