use flutter_rust_bridge::*;
use ldk_node::lightning::util::ser::{ Readable, Writeable };
use std::str::FromStr;
use std::string::ToString;
use std::default::Default;
use crate::api::builder::LdkMnemonic;
use crate::utils::error::{LdkBuilderError, LdkNodeError};

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
            } =>
                SocketAddress::OnionV3 {
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
impl TryFrom<SocketAddress> for ldk_node::lightning::ln::msgs::SocketAddress {
    type Error = LdkBuilderError;

    fn try_from(value: SocketAddress) -> Result<Self, Self::Error> {
        match value {
            SocketAddress::TcpIpV4 { addr, port } => {
                Ok(ldk_node::lightning::ln::msgs::SocketAddress::TcpIpV4 { addr, port })
            }
            SocketAddress::TcpIpV6 { addr, port } => {
                Ok(ldk_node::lightning::ln::msgs::SocketAddress::TcpIpV6 { addr, port })
            }
            SocketAddress::OnionV2(e) => {
                Ok(ldk_node::lightning::ln::msgs::SocketAddress::OnionV2(e))
            }
            SocketAddress::OnionV3 { ed25519_pubkey, checksum, version, port } =>
                Ok(ldk_node::lightning::ln::msgs::SocketAddress::OnionV3 {
                    ed25519_pubkey,
                    checksum,
                    version,
                    port,
                }),
            SocketAddress::Hostname { addr, port } => {
                Ok(ldk_node::lightning::ln::msgs::SocketAddress::Hostname {
                    hostname: ldk_node::lightning::util::ser::Hostname
                        ::try_from(addr)
                        .map_err(|_| LdkBuilderError::SocketAddressParseError)?,
                    port,
                })
            }
        }
    }
}
#[derive(Clone, Debug)]
///Options which apply on a per-channel basis and may change at runtime or based on negotiation with our counterparty.
pub struct ChannelConfig {
    ///Amount (in millionths of a satoshi) charged per satoshi for payments forwarded outbound over the channel. This may be allowed to change at runtime in a later update, however doing so must result in update messages sent to notify all nodes of our updated relay fee.
    ///
    ///Default value: 0.
    pub forwarding_fee_proportional_millionths: u32,
    /// Amount (in milli-satoshi) charged for payments forwarded outbound over the channel, in excess of forwardingFeeProportionalMillionths. This may be allowed to change at runtime in a later update, however doing so must result in update messages sent to notify all nodes of our updated relay fee.
    ///
    /// The default value of a single satoshi roughly matches the market rate on many routing nodes as of July 2021. Adjusting it upwards or downwards may change whether nodes route through this node.
    ///
    ///Default value: 1000.
    pub forwarding_fee_base_msat: u32,
    ///The difference in the CLTV value between incoming HTLCs and an outbound HTLC forwarded over the channel this config applies to.
    ///
    /// Thus, for HTLC-encumbered balances to be enforced on-chain when a channel is force-closed, we (or one of our watchtowers) MUST be online to check for broadcast of the current commitment transaction at least once per this many blocks (minus some margin to allow us enough time to broadcast and confirm a transaction, possibly with time in between to RBF the spending transaction).
    ///
    /// Default value: 72 (12 hours at an average of 6 blocks/hour). Minimum value: MIN_CLTV_EXPIRY_DELTA, any values less than this will be treated as MIN_CLTV_EXPIRY_DELTA instead.
    pub cltv_expiry_delta: u16,
    /// Options for how to set the max dust HTLC exposure allowed on a channel.
    pub max_dust_htlc_exposure: Option<MaxDustHTLCExposure>,
    ///The additional fee we’re willing to pay to avoid waiting for the counterparty’s toSelfDelay to reclaim funds.
    ///
    /// When we close a channel cooperatively with our counterparty, we negotiate a fee for the closing transaction which both sides find acceptable, ultimately paid by the channel funder/initiator.
    ///
    /// When we are the funder, because we have to pay the channel closing fee, we bound the acceptable fee by our Background and Normal fees, with the upper bound increased by this value. Because the on-chain fee we’d pay to force-close the channel is kept near our Normal feerate during normal operation, this value represents the additional fee we’re willing to pay in order to avoid waiting for our counterparty’s toSelfDelay to reclaim our funds.
    ///
    /// When we are not the funder, we require the closing transaction fee pay at least our Background fee estimate, but allow our counterparty to pay as much fee as they like. Thus, this value is ignored when we are not the funder.
    ///
    /// Default value: 1000 satoshis.
    pub force_close_avoidance_max_fee_satoshis: u64,
    ///If set, allows this channel's counterparty to skim an additional fee off this node's inbound HTLCs. Useful for liquidity providers to offload on-chain channel costs to end users.
    // Usage:
    // The payee will set this option and set its invoice route hints to use intercept scids generated by this channel's counterparty.
    // The counterparty will get an HTLCIntercepted event upon payment forward, and call forward_intercepted_htlc with less than the amount provided in HTLCIntercepted::expected_outbound_amount_msat. The difference between the expected and actual forward amounts is their fee.
    pub accept_underpaying_htlcs: bool,
}

impl From<ldk_node::ChannelConfig> for ChannelConfig {
    fn from(value: ldk_node::ChannelConfig) -> Self {
        ChannelConfig {
            forwarding_fee_proportional_millionths: value.forwarding_fee_proportional_millionths(),
            forwarding_fee_base_msat: value.forwarding_fee_base_msat(),
            cltv_expiry_delta: value.cltv_expiry_delta(),
            max_dust_htlc_exposure: None,
            force_close_avoidance_max_fee_satoshis: value.force_close_avoidance_max_fee_satoshis(),
            accept_underpaying_htlcs: value.accept_underpaying_htlcs(),
        }
    }
}
#[derive(Debug, Clone)]
pub enum MaxDustHTLCExposure {
    ///This sets a fixed limit on the total dust exposure in millisatoshis. Setting this too low may prevent the sending or receipt of low-value HTLCs on high-traffic nodes, however this limit is very important to prevent stealing of large amounts of dust HTLCs by miners through fee griefing attacks.
    //
    // Note that if the feerate increases significantly, without a manual increase to this maximum the channel may be unable to send/receive HTLCs between the maximum dust exposure and the new minimum value for HTLCs to be economically viable to claim.
    FixedLimitMsat(u64),
    ///This sets a multiplier on the estimated high priority feerate (sats/KW, as obtained from FeeEstimator) to determine the maximum allowed dust exposure. If this variant is used then the maximum dust exposure in millisatoshis is calculated as: high_priority_feerate_per_kw * value. For example, with our default value FeeRateMultiplier(5000):
    //
    // For the minimum fee rate of 1 sat/vByte (250 sat/KW, although the minimum defaults to 253 sats/KW for rounding, see FeeEstimator), the max dust exposure would be 253 * 5000 = 1,265,000 msats.
    // For a fee rate of 30 sat/vByte (7500 sat/KW), the max dust exposure would be 7500 * 5000 = 37,500,000 msats.
    // This allows the maximum dust exposure to automatically scale with fee rate changes.
    //
    // Note, if you’re using a third-party fee estimator, this may leave you more exposed to a fee griefing attack, where your fee estimator may purposely overestimate the fee rate, causing you to accept more dust HTLCs than you would otherwise.
    //
    // This variant is primarily meant to serve pre-anchor channels, as HTLC fees being included on HTLC outputs means your channel may be subject to more dust exposure in the event of increases in fee rate.
    FeeRateMultiplier(u64),
}
impl From<ChannelConfig> for ldk_node::ChannelConfig {
    fn from(e: ChannelConfig) -> Self {
        let config = ldk_node::ChannelConfig::new();
        if e.accept_underpaying_htlcs {
            config.accept_underpaying_htlcs();
        }
        config.set_accept_underpaying_htlcs(e.accept_underpaying_htlcs);
        config.set_cltv_expiry_delta(e.cltv_expiry_delta);
        config.set_forwarding_fee_base_msat(e.forwarding_fee_base_msat);
        config.set_force_close_avoidance_max_fee_satoshis(e.force_close_avoidance_max_fee_satoshis);
        config.set_forwarding_fee_proportional_millionths(e.forwarding_fee_proportional_millionths);
        if let Some(max_dust_htlc_exposure) = e.max_dust_htlc_exposure {
            match max_dust_htlc_exposure {
                MaxDustHTLCExposure::FixedLimitMsat(e) => {
                    config.set_max_dust_htlc_exposure_from_fixed_limit(e);
                }
                MaxDustHTLCExposure::FeeRateMultiplier(e) => {
                    config.set_max_dust_htlc_exposure_from_fee_rate_multiplier(e);
                }
            }
        }
        config
    }
}
/// The global identifier of a channel.
///
/// Note that this will start out to be a temporary ID until channel funding negotiation is
/// finalized, at which point it will change to be a permanent global ID tied to the on-chain
/// funding transaction.
///
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct ChannelId {
    pub data: [u8; 32],
}

impl From<ldk_node::lightning::ln::ChannelId> for ChannelId {
    fn from(value: ldk_node::lightning::ln::ChannelId) -> Self {
        ChannelId { data: value.0 }
    }
}
impl From<ChannelId> for ldk_node::lightning::ln::ChannelId {
    fn from(value: ChannelId) -> Self {
        ldk_node::lightning::ln::ChannelId(value.data)
    }
}
///A local, potentially user-provided, identifier of a channel.
///
/// By default, this will be randomly generated for the user to ensure local uniqueness.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct UserChannelId {
    pub data: Vec<u8>,
}
/// An event emitted by [Node], which should be handled by the user.
///
impl From<ldk_node::UserChannelId> for UserChannelId {
    fn from(value: ldk_node::UserChannelId) -> Self {
        UserChannelId {
            data: value.encode(),
        }
    }
}
impl TryFrom<UserChannelId> for ldk_node::UserChannelId {
    type Error = LdkNodeError;

    fn try_from(value: UserChannelId) -> Result<Self, Self::Error> {
        let mut encoded = value.data.as_slice();
        ldk_node::UserChannelId::read(&mut encoded).map_err(|e| e.into())
    }
}
impl From<ldk_node::lightning::events::ClosureReason> for ClosureReason {
    fn from(value: ldk_node::lightning::events::ClosureReason) -> Self {
        match value {
            ldk_node::lightning::events::ClosureReason::CounterpartyForceClosed { peer_msg } => {
                ClosureReason::CounterpartyForceClosed {
                    peer_msg: peer_msg.0,
                }
            }
            ldk_node::lightning::events::ClosureReason::HolderForceClosed => {
                ClosureReason::HolderForceClosed
            }

            ldk_node::lightning::events::ClosureReason::CommitmentTxConfirmed => {
                ClosureReason::CommitmentTxConfirmed
            }
            ldk_node::lightning::events::ClosureReason::FundingTimedOut => {
                ClosureReason::FundingTimedOut
            }
            ldk_node::lightning::events::ClosureReason::ProcessingError { err } => {
                ClosureReason::ProcessingError { err }
            }
            ldk_node::lightning::events::ClosureReason::DisconnectedPeer => {
                ClosureReason::DisconnectedPeer
            }
            ldk_node::lightning::events::ClosureReason::OutdatedChannelManager => {
                ClosureReason::OutdatedChannelManager
            }
            ldk_node::lightning::events::ClosureReason::CounterpartyCoopClosedUnfundedChannel => {
                ClosureReason::CounterpartyCoopClosedUnfundedChannel
            }
            ldk_node::lightning::events::ClosureReason::FundingBatchClosure => {
                ClosureReason::FundingBatchClosure
            }
            ldk_node::lightning::events::ClosureReason::LegacyCooperativeClosure =>
                ClosureReason::LegacyCooperativeClosure,
            ldk_node::lightning::events::ClosureReason::CounterpartyInitiatedCooperativeClosure =>
                ClosureReason::CounterpartyInitiatedCooperativeClosure,
            ldk_node::lightning::events::ClosureReason::LocallyInitiatedCooperativeClosure =>
                ClosureReason::LocallyInitiatedCooperativeClosure,
            ldk_node::lightning::events::ClosureReason::HTLCsTimedOut =>
                ClosureReason::HTLCsTimedOut,
        }
    }
}
/// The reason the payment failed. Used in `Event.PaymentFailed`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum PaymentFailureReason {
    /// The intended recipient rejected our payment.
    RecipientRejected,
    /// The user chose to abandon this payment by calling `channelManager.abandon_payment`.
    ///
    UserAbandoned,
    /// We exhausted all of our retry attempts while trying to send the payment, or we
    /// exhausted the `Retry.Timeout` if the user set one. If at any point a retry
    /// attempt failed while being forwarded along the path, an `Event::PaymentPathFailed` will
    /// have come before this.
    ///
    RetriesExhausted,
    /// The payment expired while retrying, based on the provided
    PaymentExpired,
    /// We failed to find a route while retrying the payment.
    RouteNotFound,
    /// This error should generally never happen. This likely means that there is a problem with
    /// your router.
    UnexpectedError,
}
impl From<ldk_node::lightning::events::PaymentFailureReason> for PaymentFailureReason {
    fn from(value: ldk_node::lightning::events::PaymentFailureReason) -> Self {
        match value {
            ldk_node::lightning::events::PaymentFailureReason::RecipientRejected => {
                PaymentFailureReason::RecipientRejected
            }
            ldk_node::lightning::events::PaymentFailureReason::UserAbandoned => {
                PaymentFailureReason::UserAbandoned
            }
            ldk_node::lightning::events::PaymentFailureReason::RetriesExhausted => {
                PaymentFailureReason::RetriesExhausted
            }
            ldk_node::lightning::events::PaymentFailureReason::PaymentExpired => {
                PaymentFailureReason::PaymentExpired
            }
            ldk_node::lightning::events::PaymentFailureReason::RouteNotFound => {
                PaymentFailureReason::RouteNotFound
            }
            ldk_node::lightning::events::PaymentFailureReason::UnexpectedError => {
                PaymentFailureReason::UnexpectedError
            }
        }
    }
}
#[derive(Clone, Debug, PartialEq, Eq)]
/// The reason the channel was closed. See individual variants for more details.
pub enum ClosureReason {
    /// Closure generated from receiving a peer error message.
    ///
    /// Our counterparty may have broadcasted their latest commitment state, and we have
    /// as well.
    CounterpartyForceClosed {
        /// The error which the peer sent us.
        ///
        /// Be careful about printing the peer_msg, a well-crafted message could exploit
        /// a security vulnerability in the terminal emulator or the logging subsystem.
        /// To be safe, use `Display` on `UntrustedString`
        ///
        /// [`UntrustedString`]: crate::util::string::UntrustedString
        peer_msg: String,
    },
    /// Closure generated from [`ChannelManager::force_close_channel`], called by the user.
    ///
    /// [`ChannelManager::force_close_channel`]: crate::ln::channelmanager::ChannelManager::force_close_channel.
    HolderForceClosed,
    /// The channel was closed after negotiating a cooperative close and we've now broadcasted
    /// the cooperative close transaction. Note the shutdown may have been initiated by us.
    ///
    /// This was only set in versions of LDK prior to 0.0.122.
    // Can be removed once we disallow downgrading to 0.0.121
    LegacyCooperativeClosure,
    /// The channel was closed after negotiating a cooperative close and we've now broadcasted
    /// the cooperative close transaction. This indicates that the shutdown was initiated by our
    /// counterparty.
    ///
    /// In rare cases where we initiated closure immediately prior to shutting down without
    /// persisting, this value may be provided for channels we initiated closure for.
    CounterpartyInitiatedCooperativeClosure,
    /// The channel was closed after negotiating a cooperative close and we've now broadcasted
    /// the cooperative close transaction. This indicates that the shutdown was initiated by us.
    LocallyInitiatedCooperativeClosure,
    /// A commitment transaction was confirmed on chain, closing the channel. Most likely this
    /// commitment transaction came from our counterparty, but it may also have come from
    /// a copy of our own `ChannelMonitor`.
    CommitmentTxConfirmed,
    /// The funding transaction failed to confirm in a timely manner on an inbound channel.
    FundingTimedOut,
    /// Closure generated from processing an event, likely a HTLC forward/relay/reception.
    ProcessingError {
        /// A developer-readable error message which we generated.
        err: String,
    },
    /// The peer disconnected prior to funding completing. In this case the spec mandates that we
    /// forget the channel entirely - we can attempt again if the peer reconnects.
    ///
    /// This includes cases where we restarted prior to funding completion, including prior to the
    /// initial [`ChannelMonitor`] persistence completing.
    ///
    /// In LDK versions prior to 0.0.107 this could also occur if we were unable to connect to the
    /// peer because of mutual incompatibility between us and our channel counterparty.
    ///
    /// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
    DisconnectedPeer,
    /// Closure generated from `ChannelManager::read` if the [`ChannelMonitor`] is newer than
    /// the [`ChannelManager`] deserialized.
    ///
    /// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
    /// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
    OutdatedChannelManager,
    /// The counterparty requested a cooperative close of a channel that had not been funded yet.
    /// The channel has been immediately closed.
    CounterpartyCoopClosedUnfundedChannel,
    /// Another channel in the same funding batch closed before the funding transaction
    /// was ready to be broadcast.
    FundingBatchClosure,
    /// One of our HTLCs timed out in a channel, causing us to force close the channel.
    HTLCsTimedOut,
}
///A user-provided identifier in channelManager.sendPayment used to uniquely identify a payment and ensure idempotency in LDK.
#[derive(Eq, PartialEq, Debug, Clone)]
pub struct PaymentId(pub [u8; 32]);

impl From<ldk_node::lightning::ln::channelmanager::PaymentId> for PaymentId {
    fn from(value: ldk_node::lightning::ln::channelmanager::PaymentId) -> Self {
        PaymentId(value.0)
    }
}
impl From<PaymentId> for ldk_node::lightning::ln::channelmanager::PaymentId {
    fn from(value: PaymentId) -> Self {
        ldk_node::lightning::ln::channelmanager::PaymentId(value.0)
    }
}
/// An event emitted by [`Node`], which should be handled by the user.
///

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Event {
    /// A payment for a previously-registered payment hash has been received.
    ///
    /// This needs to be manually claimed by supplying the correct preimage to `claimForHash`.
    ///
    /// If the the provided parameters don't match the expectations or the preimage can't be
    /// retrieved in time, should be failed-back via [`failForHash`].
    PaymentClaimable {
        /// A local identifier used to track the payment.
        payment_id: PaymentId,
        /// The hash of the payment.
        payment_hash: PaymentHash,
        /// The value, in thousandths of a satoshi, that is claimable.
        claimable_amount_msat: u64,
        /// The block height at which this payment will be failed back and will no longer be
        /// eligible for claiming.
        claim_deadline: Option<u32>,
    },
    /// A sent payment was successful.
    PaymentSuccessful {
        /// A local identifier used to track the payment.
        ///
        /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
        payment_id: Option<PaymentId>,
        /// The hash of the payment.
        payment_hash: PaymentHash,
        /// The total fee which was spent at intermediate hops in this payment.
        fee_paid_msat: Option<u64>,
    },
    /// A sent payment has failed.
    PaymentFailed {
        /// A local identifier used to track the payment.
        ///
        /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
        payment_id: Option<PaymentId>,
        /// The hash of the payment.
        payment_hash: PaymentHash,
        /// The reason why the payment failed.
        ///
        /// This will be `None` for events serialized by LDK Node v0.2.1 and prior.
        reason: Option<PaymentFailureReason>,
    },
    /// A payment has been received.
    PaymentReceived {
        /// A local identifier used to track the payment.
        ///
        /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
        payment_id: Option<PaymentId>,
        /// The hash of the payment.
        payment_hash: PaymentHash,
        /// The value, in thousandths of a satoshi, that has been received.
        amount_msat: u64,
    },
    /// A channel has been created and is pending confirmation on-chain.
    ChannelPending {
        /// The `channelId` of the channel.
        channel_id: ChannelId,
        /// The `userChannelId` of the channel.
        user_channel_id: UserChannelId,
        /// The `temporaryChannelId` this channel used to be known by during channel establishment.
        former_temporary_channel_id: ChannelId,
        /// The `nodeId` of the channel counterparty.
        counterparty_node_id: PublicKey,
        /// The outpoint of the channel's funding transaction.
        funding_txo: OutPoint,
    },
    /// A channel is ready to be used.
    ChannelReady {
        /// The `channelId` of the channel.
        channel_id: ChannelId,
        /// The `userChannelId` of the channel.
        user_channel_id: UserChannelId,
        /// The `nodeId` of the channel counterparty.
        ///
        /// This will be `None` for events serialized by LDK Node v0.1.0 and prior.
        counterparty_node_id: Option<PublicKey>,
    },
    /// A channel has been closed.
    ChannelClosed {
        /// The `channelId` of the channel.
        channel_id: ChannelId,
        /// The `userChannelId` of the channel.
        user_channel_id: UserChannelId,
        /// The `nodeId` of the channel counterparty.
        ///
        /// This will be `None` for events serialized by LDK Node v0.1.0 and prior.
        counterparty_node_id: Option<PublicKey>,
        /// This will be `None` for events serialized by LDK Node v0.2.1 and prior.
        reason: Option<ClosureReason>,
    },
}

impl From<ldk_node::Event> for Event {
    fn from(value: ldk_node::Event) -> Self {
        match value {
            ldk_node::Event::PaymentSuccessful { payment_id, payment_hash, fee_paid_msat } =>
                Event::PaymentSuccessful {
                    payment_id: payment_id.map(|e| e.into()),
                    payment_hash: PaymentHash {
                        data: payment_hash.0,
                    },
                    fee_paid_msat,
                },
            ldk_node::Event::PaymentFailed { payment_id, payment_hash, reason } =>
                Event::PaymentFailed {
                    payment_id: payment_id.map(|e| e.into()),
                    payment_hash: PaymentHash {
                        data: payment_hash.0,
                    },
                    reason: reason.map(|e| e.into()),
                },
            ldk_node::Event::PaymentReceived { payment_id, payment_hash, amount_msat } =>
                Event::PaymentReceived {
                    payment_id: payment_id.map(|e| e.into()),
                    payment_hash: PaymentHash {
                        data: payment_hash.0,
                    },
                    amount_msat,
                },
            ldk_node::Event::ChannelReady { channel_id, user_channel_id, counterparty_node_id } =>
                Event::ChannelReady {
                    channel_id: channel_id.into(),
                    user_channel_id: user_channel_id.into(),
                    counterparty_node_id: counterparty_node_id.map(|x| x.into()),
                },
            ldk_node::Event::ChannelClosed {
                channel_id,
                user_channel_id,
                counterparty_node_id,
                reason,
            } =>
                Event::ChannelClosed {
                    channel_id: channel_id.into(),
                    user_channel_id: user_channel_id.into(),
                    counterparty_node_id: counterparty_node_id.map(|x| x.into()),
                    reason: reason.map(|e| e.into()),
                },
            ldk_node::Event::ChannelPending {
                channel_id,
                user_channel_id,
                former_temporary_channel_id,
                counterparty_node_id,
                funding_txo,
            } =>
                Event::ChannelPending {
                    channel_id: channel_id.into(),
                    user_channel_id: user_channel_id.into(),
                    former_temporary_channel_id: former_temporary_channel_id.into(),
                    counterparty_node_id: PublicKey {
                        hex: counterparty_node_id.to_string(),
                    },
                    funding_txo: funding_txo.into(),
                },
            ldk_node::Event::PaymentClaimable {
                payment_id,
                payment_hash,
                claimable_amount_msat,
                claim_deadline,
            } =>
                Event::PaymentClaimable {
                    payment_id: payment_id.into(),
                    payment_hash: payment_hash.into(),
                    claimable_amount_msat: claimable_amount_msat,
                    claim_deadline: claim_deadline,
                },
        }
    }
}


///A bitcoin transaction hash/transaction ID.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Txid {
    pub hash: String,
}

impl TryFrom<Txid> for ldk_node::bitcoin::Txid {
    type Error = LdkNodeError;

    fn try_from(value: Txid) -> Result<Self, Self::Error> {
        ldk_node::bitcoin::Txid
            ::from_str(value.hash.as_str())
            .map_err(|_| LdkNodeError::InvalidTxid)
    }
}

impl From<ldk_node::bitcoin::Txid> for Txid {
    fn from(value: ldk_node::bitcoin::Txid) -> Self {
        Txid {
            hash: value.to_string(),
        }
    }
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
                hash: value.txid.to_raw_hash().to_string(),
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
}

impl From<ldk_node::payment::PaymentStatus> for PaymentStatus {
    fn from(value: ldk_node::payment::PaymentStatus) -> Self {
        match value {
            ldk_node::payment::PaymentStatus::Pending => PaymentStatus::Pending,
            ldk_node::payment::PaymentStatus::Succeeded => PaymentStatus::Succeeded,
            ldk_node::payment::PaymentStatus::Failed => PaymentStatus::Failed,
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

impl From<ldk_node::payment::PaymentDirection> for PaymentDirection {
    fn from(value: ldk_node::payment::PaymentDirection) -> Self {
        match value {
            ldk_node::payment::PaymentDirection::Inbound => PaymentDirection::Inbound,
            ldk_node::payment::PaymentDirection::Outbound => PaymentDirection::Outbound,
        }
    }
}

impl From<PaymentDirection> for ldk_node::payment::PaymentDirection {
    fn from(value: PaymentDirection) -> Self {
        match value {
            PaymentDirection::Inbound => ldk_node::payment::PaymentDirection::Inbound,
            PaymentDirection::Outbound => ldk_node::payment::PaymentDirection::Outbound,
        }
    }
}

/// paymentHash type, use to cross-lock hop
///
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub struct PaymentHash {
    pub data: [u8; 32],
}

impl From<PaymentHash> for ldk_node::lightning::ln::PaymentHash {
    fn from(value: PaymentHash) -> Self {
        ldk_node::lightning::ln::PaymentHash(value.data)
    }
}

impl From<ldk_node::lightning::ln::PaymentHash> for PaymentHash {
    fn from(value: ldk_node::lightning::ln::PaymentHash) -> Self {
        PaymentHash { data: value.0 }
    }
}

/// paymentPreimage type, use to route payment between hop
///
#[derive(Hash, Copy, Clone, PartialEq, Eq, Debug)]
pub struct PaymentPreimage {
    pub data: [u8; 32],
}

impl From<ldk_node::lightning::ln::PaymentPreimage> for PaymentPreimage {
    fn from(value: ldk_node::lightning::ln::PaymentPreimage) -> Self {
        Self { data: value.0 }
    }
}
/// payment_secret type, use to authenticate sender to the receiver and tie MPP HTLCs together
///
#[derive(Hash, Copy, Clone, PartialEq, Eq, Debug)]
pub struct PaymentSecret {
    pub data: [u8; 32],
}

impl From<ldk_node::lightning_invoice::PaymentSecret> for PaymentSecret {
    fn from(value: ldk_node::lightning_invoice::PaymentSecret) -> Self {
        PaymentSecret { data: value.0 }
    }
}
/// Represents a payment.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct PaymentDetails {
    /// The identifier of this payment.
    pub id: PaymentId,
    /// The kind of the payment.
    pub kind: PaymentKind,
    /// The amount transferred.
    pub amount_msat: Option<u64>,
    /// The direction of the payment.
    pub direction: PaymentDirection,
    /// The status of the payment.
    pub status: PaymentStatus,
}

impl From<ldk_node::payment::PaymentDetails> for PaymentDetails {
    fn from(value: ldk_node::payment::PaymentDetails) -> Self {
        PaymentDetails {
            id: value.id.into(),
            status: value.status.into(),
            amount_msat: value.amount_msat,
            direction: value.direction.into(),
            kind: value.kind.into(),
        }
    }
}
/// Limits applying to how much fee we allow an LSP to deduct from the payment amount.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub struct LSPFeeLimits {
    /// The maximal total amount we allow any configured LSP withhold from us when forwarding the
    /// payment.
    pub max_total_opening_fee_msat: Option<u64>,
    /// The maximal proportional fee, in parts-per-million millisatoshi, we allow any configured
    /// LSP withhold from us when forwarding the payment.
    pub max_proportional_opening_fee_ppm_msat: Option<u64>,
}
impl From<ldk_node::payment::LSPFeeLimits> for LSPFeeLimits {
    fn from(value: ldk_node::payment::LSPFeeLimits) -> Self {
        LSPFeeLimits {
            max_total_opening_fee_msat: value.max_total_opening_fee_msat,
            max_proportional_opening_fee_ppm_msat: value.max_proportional_opening_fee_ppm_msat,
        }
    }
}

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub struct OfferId(pub [u8; 32]);

impl From<ldk_node::lightning::offers::offer::OfferId> for OfferId {
    fn from(value: ldk_node::lightning::offers::offer::OfferId) -> Self {
        Self(value.0)
    }
}
impl From<OfferId> for ldk_node::lightning::offers::offer::OfferId {
    fn from(value: OfferId) -> Self {
        Self(value.0)
    }
}
/// Represents the kind of a payment.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum PaymentKind {
    /// An on-chain payment.
    Onchain,
    /// A [BOLT 11] payment.
    ///
    /// [BOLT 11]: https://github.com/lightning/bolts/blob/master/11-payment-encoding.md
    // TODO: Bolt11 { invoice: Option<Bolt11Invoice> },
    Bolt11 {
        /// The payment hash, i.e., the hash of the `preimage`.
        hash: PaymentHash,
        /// The pre-image used by the payment.
        preimage: Option<PaymentPreimage>,
        /// The secret used by the payment.
        secret: Option<PaymentSecret>,
    },
    /// A [BOLT 11] payment intended to open an [LSPS 2] just-in-time channel.
    ///
    /// [BOLT 11]: https://github.com/lightning/bolts/blob/master/11-payment-encoding.md
    /// [LSPS 2]: https://github.com/BitcoinAndLightningLayerSpecs/lsp/blob/main/LSPS2/README.md
    Bolt11Jit {
        /// The payment hash, i.e., the hash of the `preimage`.
        hash: PaymentHash,
        /// The pre-image used by the payment.
        preimage: Option<PaymentPreimage>,
        /// The secret used by the payment.
        secret: Option<PaymentSecret>,
        /// Limits applying to how much fee we allow an LSP to deduct from the payment amount.
        ///
        /// Allowing them to deduct this fee from the first inbound payment will pay for the LSP's
        /// channel opening fees.
        ///
        lsp_fee_limits: LSPFeeLimits,
    },
    /// A spontaneous ("keysend") payment.
    Spontaneous {
        /// The payment hash, i.e., the hash of the `preimage`.
        hash: PaymentHash,
        /// The pre-image used by the payment.
        preimage: Option<PaymentPreimage>,
    },

    /// A [BOLT 12] offer payment, i.e., a payment for an `Offer`.
    ///
    /// [BOLT 12]: https://github.com/lightning/bolts/blob/master/12-offer-encoding.md
    Bolt12Offer {
        /// The payment hash, i.e., the hash of the `preimage`.
        hash: Option<PaymentHash>,
        /// The pre-image used by the payment.
        preimage: Option<PaymentPreimage>,
        /// The secret used by the payment.
        secret: Option<PaymentSecret>,
        /// The ID of the offer this payment is for.
        offer_id: OfferId,
    },
    /// A [BOLT 12] 'refund' payment, i.e., a payment for a `Refund`.
    ///
    /// [BOLT 12]: https://github.com/lightning/bolts/blob/master/12-offer-encoding.md
    Bolt12Refund {
        /// The payment hash, i.e., the hash of the `preimage`.
        hash: Option<PaymentHash>,
        /// The pre-image used by the payment.
        preimage: Option<PaymentPreimage>,
        /// The secret used by the payment.
        secret: Option<PaymentSecret>,
    },
}
impl From<ldk_node::payment::PaymentKind> for PaymentKind {
    fn from(value: ldk_node::payment::PaymentKind) -> Self {
        match value {
            ldk_node::payment::PaymentKind::Onchain => PaymentKind::Onchain,
            ldk_node::payment::PaymentKind::Bolt11 { hash, preimage, secret } =>
                PaymentKind::Bolt11 {
                    hash: hash.into(),
                    preimage: preimage.map(|e| e.into()),
                    secret: secret.map(|e| e.into()),
                },
            ldk_node::payment::PaymentKind::Bolt11Jit { hash, preimage, secret, lsp_fee_limits } =>
                PaymentKind::Bolt11Jit {
                    hash: hash.into(),
                    preimage: preimage.map(|e| e.into()),
                    secret: secret.map(|e| e.into()),
                    lsp_fee_limits: lsp_fee_limits.into(),
                },
            ldk_node::payment::PaymentKind::Spontaneous { hash, preimage } =>
                PaymentKind::Spontaneous {
                    hash: hash.into(),
                    preimage: preimage.map(|e| e.into()),
                },
            ldk_node::payment::PaymentKind::Bolt12Offer { hash, preimage, secret, offer_id } =>
                PaymentKind::Bolt12Offer {
                    hash: hash.map(|e| e.into()),
                    preimage: preimage.map(|e| e.into()),
                    secret: secret.map(|e| e.into()),
                    offer_id: offer_id.into(),
                },
            ldk_node::payment::PaymentKind::Bolt12Refund { hash, preimage, secret } =>
                PaymentKind::Bolt12Refund {
                    hash: hash.map(|e| e.into()),
                    preimage: preimage.map(|e| e.into()),
                    secret: secret.map(|e| e.into()),
                },
        }
    }
}
#[derive(Debug, Clone, PartialEq, Eq)]
///Represents a syntactically and semantically correct lightning BOLT11 invoice.
///
pub struct Bolt11Invoice {
    pub signed_raw_invoice: String,
}

impl TryFrom<Bolt11Invoice> for ldk_node::lightning_invoice::Bolt11Invoice {
    type Error = LdkNodeError;

    fn try_from(value: Bolt11Invoice) -> Result<Self, Self::Error> {
        ldk_node::lightning_invoice::Bolt11Invoice
            ::from_str(value.signed_raw_invoice.as_str())
            .map_err(|_| LdkNodeError::InvalidInvoice)
    }
}
impl From<ldk_node::lightning_invoice::Bolt11Invoice> for Bolt11Invoice {
    fn from(value: ldk_node::lightning_invoice::Bolt11Invoice) -> Self {
        Bolt11Invoice {
            signed_raw_invoice: value.to_string(),
        }
    }
}
///A Secp256k1 public key, used for verification of signatures.
///
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PublicKey {
    pub hex: String,
}

impl TryFrom<PublicKey> for ldk_node::bitcoin::secp256k1::PublicKey {
    type Error = LdkNodeError;

    fn try_from(value: PublicKey) -> Result<Self, Self::Error> {
        ldk_node::bitcoin::secp256k1::PublicKey
            ::from_str(value.hex.as_str())
            .map_err(|_| LdkNodeError::InvalidPublicKey)
    }
}
impl From<ldk_node::bitcoin::secp256k1::PublicKey> for PublicKey {
    fn from(value: ldk_node::bitcoin::secp256k1::PublicKey) -> Self {
        PublicKey {
            hex: value.to_string(),
        }
    }
}
/// A Bitcoin address.
///
pub struct Address {
    pub s: String,
}

impl TryFrom<Address> for ldk_node::bitcoin::Address {
    type Error = LdkNodeError;

    fn try_from(value: Address) -> Result<Self, Self::Error> {
        ldk_node::bitcoin::Address
            ::from_str(value.s.as_str())
            .map(|e| e.assume_checked())
            .map_err(|_| LdkNodeError::InvalidAddress)
    }
}
impl From<ldk_node::bitcoin::Address> for Address {
    fn from(value: ldk_node::bitcoin::Address) -> Self {
        Address {
            s: value.to_string(),
        }
    }
}

#[derive(Debug, Clone)]
pub struct ChannelDetails {
    /// The channel ID (prior to funding transaction generation, this is a random 32-byte
    /// identifier, afterwards this is the transaction ID of the funding transaction XOR the
    /// funding transaction output).
    ///
    /// Note that this means this value is *not* persistent - it can change once during the
    /// lifetime of the channel.
    pub channel_id: ChannelId,
    /// The node ID of our the channel's counterparty.
    pub counterparty_node_id: PublicKey,
    /// The channel's funding transaction output, if we've negotiated the funding transaction with
    /// our counterparty already.
    pub funding_txo: Option<OutPoint>,
    /// The value, in satoshis, of this channel as it appears in the funding output.
    pub channel_value_sats: u64,
    /// The value, in satoshis, that must always be held as a reserve in the channel for us. This
    /// value ensures that if we broadcast a revoked state, our counterparty can punish us by
    /// claiming at least this value on chain.
    ///
    /// This value is not included in `outboundCapacityMsat` as it can never be spent.
    ///
    /// This value will be `None` for outbound channels until the counterparty accepts the channel.
    ///
    pub unspendable_punishment_reserve: Option<u64>,
    /// The local `user_channel_id` of this channel.
    pub user_channel_id: UserChannelId,
    /// The currently negotiated fee rate denominated in satoshi per 1000 weight units,
    /// which is applied to commitment and HTLC transactions.
    pub feerate_sat_per_1000_weight: u32,
    /// The available outbound capacity for sending HTLCs to the remote peer.
    ///
    /// The amount does not include any pending HTLCs which are not yet resolved (and, thus, whose
    /// balance is not available for inclusion in new outbound HTLCs). This further does not include
    /// any pending outgoing HTLCs which are awaiting some other resolution to be sent.
    pub outbound_capacity_msat: u64,
    /// The available outbound capacity for sending HTLCs to the remote peer.
    ///
    /// The amount does not include any pending HTLCs which are not yet resolved
    /// (and, thus, whose balance is not available for inclusion in new inbound HTLCs). This further
    /// does not include any pending outgoing HTLCs which are awaiting some other resolution to be
    /// sent.
    pub inbound_capacity_msat: u64,
    /// The number of required confirmations on the funding transactions before the funding is
    /// considered "locked". The amount is selected by the channel fundee.
    ///
    /// The value will be `None` for outbound channels until the counterparty accepts the channel.
    pub confirmations_required: Option<u32>,
    /// The current number of confirmations on the funding transaction.
    pub confirmations: Option<u32>,
    /// Returns `true` if the channel was initiated (and therefore funded) by us.
    pub is_outbound: bool,
    /// Returns `true` if both parties have exchanged `channel_ready` messages, and the channel is
    /// not currently being shut down. Both parties exchange `channel_ready` messages upon
    /// independently verifying that the required confirmations count provided by
    /// `confirmations_required` has been reached.
    pub is_channel_ready: bool,
    /// Returns `true` if the channel (a) `channel_ready` messages have been exchanged, (b) the
    /// peer is connected, and (c) the channel is not currently negotiating shutdown.
    ///
    /// This is a strict superset of `is_channel_ready`.
    pub is_usable: bool,
    /// Returns `true` if this channel is (or will be) publicly-announced
    pub is_public: bool,
    /// The difference in the CLTV value between incoming HTLCs and an outbound HTLC forwarded over
    /// the channel.
    pub cltv_expiry_delta: Option<u16>,
    /// The value, in satoshis, that must always be held in the channel for our counterparty. This
    /// value ensures that if our counterparty broadcasts a revoked state, we can punish them by
    /// claiming at least this value on chain.
    ///
    /// This value is not included in [`inbound_capacity_msat`] as it can never be spent.
    ///
    /// [`inbound_capacity_msat`]: ChannelDetails::inbound_capacity_msat
    pub counterparty_unspendable_punishment_reserve: u64,
    /// The smallest value HTLC (in msat) the remote peer will accept, for this channel.
    ///
    /// This field is only `None` before we have received either the `OpenChannel` or
    /// `AcceptChannel` message from the remote peer.
    pub counterparty_outbound_htlc_minimum_msat: Option<u64>,
    /// The largest value HTLC (in msat) the remote peer currently will accept, for this channel.
    pub counterparty_outbound_htlc_maximum_msat: Option<u64>,
    /// Base routing fee in millisatoshis.
    pub counterparty_forwarding_info_fee_base_msat: Option<u32>,
    /// Proportional fee, in millionths of a satoshi the channel will charge per transferred satoshi.
    pub counterparty_forwarding_info_fee_proportional_millionths: Option<u32>,
    /// The minimum difference in CLTV expiry between an ingoing HTLC and its outgoing counterpart,
    /// such that the outgoing HTLC is forwardable to this counterparty.
    pub counterparty_forwarding_info_cltv_expiry_delta: Option<u16>,
    /// The available outbound capacity for sending a single HTLC to the remote peer. This is
    /// similar to `channelDetails.outboundCapacityMsat` but it may be further restricted by
    /// the current state and per-HTLC limit(s). This is intended for use when routing, allowing us
    /// to use a limit as close as possible to the HTLC limit we can currently send.
    pub next_outbound_htlc_limit_msat: u64,
    /// The minimum value for sending a single HTLC to the remote peer. This is the equivalent of
    /// `channelDetails.nextOutboundHtlcLimitMsat`  but represents a lower-bound, rather than
    /// an upper-bound. This is intended for use when routing, allowing us to ensure we pick a
    /// route which is valid.
    pub next_outbound_htlc_minimum_msat: u64,
    /// The number of blocks (after our commitment transaction confirms) that we will need to wait
    /// until we can claim our funds after we force-close the channel. During this time our
    /// counterparty is allowed to punish us if we broadcasted a stale state. If our counterparty
    /// force-closes the channel and broadcasts a commitment transaction we do not have to wait any
    /// time to claim our non-HTLC-encumbered funds.
    ///
    /// This value will be `None` for outbound channels until the counterparty accepts the channel.
    pub force_close_spend_delay: Option<u16>,
    /// The smallest value HTLC (in msat) we will accept, for this channel.
    pub inbound_htlc_minimum_msat: u64,
    /// The largest value HTLC (in msat) we currently will accept, for this channel.
    pub inbound_htlc_maximum_msat: Option<u64>,
    /// Set of configurable parameters that affect channel operation.
    pub config: ChannelConfig,
}
impl From<&ldk_node::ChannelDetails> for ChannelDetails {
    fn from(value: &ldk_node::ChannelDetails) -> Self {
        ChannelDetails {
            channel_id: value.clone().channel_id.into(),
            counterparty_node_id: value.clone().counterparty_node_id.into(),
            funding_txo: value.clone().funding_txo.map(|x| x.into()),
            channel_value_sats: value.clone().channel_value_sats,
            unspendable_punishment_reserve: value.clone().unspendable_punishment_reserve,
            user_channel_id: value.clone().user_channel_id.into(),
            feerate_sat_per_1000_weight: value.clone().feerate_sat_per_1000_weight,
            outbound_capacity_msat: value.clone().outbound_capacity_msat,
            inbound_capacity_msat: value.clone().inbound_capacity_msat,
            confirmations_required: value.clone().confirmations_required,
            confirmations: value.clone().confirmations,
            is_outbound: value.clone().is_outbound,
            is_channel_ready: value.clone().is_channel_ready,
            is_usable: value.clone().is_usable,
            is_public: value.clone().is_public,
            cltv_expiry_delta: value.clone().cltv_expiry_delta,
            counterparty_unspendable_punishment_reserve: value.clone().counterparty_unspendable_punishment_reserve,
            counterparty_outbound_htlc_minimum_msat: value.clone().counterparty_outbound_htlc_minimum_msat,
            counterparty_outbound_htlc_maximum_msat: value.clone().counterparty_outbound_htlc_maximum_msat,
            counterparty_forwarding_info_fee_base_msat: value.clone().counterparty_forwarding_info_fee_base_msat,
            counterparty_forwarding_info_fee_proportional_millionths: value.counterparty_forwarding_info_fee_proportional_millionths,
            counterparty_forwarding_info_cltv_expiry_delta: value.counterparty_forwarding_info_cltv_expiry_delta,
            next_outbound_htlc_limit_msat: value.next_outbound_htlc_limit_msat,
            next_outbound_htlc_minimum_msat: value.next_outbound_htlc_minimum_msat,
            force_close_spend_delay: value.force_close_spend_delay,
            inbound_htlc_minimum_msat: value.inbound_htlc_minimum_msat,
            inbound_htlc_maximum_msat: value.inbound_htlc_maximum_msat,
            config: (*value.config).clone().into(),
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
impl From<ldk_node::bitcoin::Network> for Network {
    fn from(value: ldk_node::bitcoin::Network) -> Self {
        match value {
            ldk_node::bitcoin::Network::Bitcoin => Network::Bitcoin,
            ldk_node::bitcoin::Network::Testnet => Network::Testnet,
            ldk_node::bitcoin::Network::Signet => Network::Signet,
            ldk_node::bitcoin::Network::Regtest => Network::Regtest,
            _ => Network::Bitcoin,
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
    pub address: SocketAddress,
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

impl From<ldk_node::LogLevel> for LogLevel {
    fn from(value: ldk_node::LogLevel) -> Self {
        match value {
            ldk_node::LogLevel::Gossip => LogLevel::Gossip,
            ldk_node::LogLevel::Trace => LogLevel::Trace,
            ldk_node::LogLevel::Debug => LogLevel::Debug,
            ldk_node::LogLevel::Info => LogLevel::Info,
            ldk_node::LogLevel::Warn => LogLevel::Warn,
            ldk_node::LogLevel::Error => LogLevel::Error,
        }
    }
}

/// Configuration options pertaining to 'Anchor' channels, i.e., channels for which the
/// `optionAnchorsZeroFeeHtlcTx` channel type is negotiated.
///
/// Prior to the introduction of Anchor channels, the on-chain fees paying for the transactions
/// issued on channel closure were pre-determined and locked-in at the time of the channel
/// opening. This required to estimate what fee rate would be sufficient to still have the
/// closing transactions be spendable on-chain (i.e., not be considered dust). This legacy
/// design of pre-anchor channels proved inadequate in the unpredictable, often turbulent, fee
/// markets we experience today.
///
/// In contrast, Anchor channels allow to determine an adequate fee rate *at the time of channel
/// closure*, making them much more robust in the face of fee spikes. In turn, they require to
/// maintain a reserve of on-chain funds to have the channel closure transactions confirmed
/// on-chain, at least if the channel counterparty can't be trusted to do this for us.
///
/// See [BOLT 3] for more technical details on Anchor channels.
///
///
/// ### Defaults
///
/// | Parameter                  | Value  |
/// |----------------------------|--------|
/// | `trustedPeersNoReserve` | []     |
/// | `perChannelReserveSats` | 25000  |
///
///
/// [BOLT 3]: https://github.com/lightning/bolts/blob/master/03-transactions.md#htlc-timeout-and-htlc-success-transactions
#[derive(Debug, Clone)]
pub struct AnchorChannelsConfig {
    /// A list of peers that we trust to get the required channel closing transactions confirmed
    /// on-chain.
    ///
    /// Channels with these peers won't count towards the retained on-chain reserve and we won't
    /// take any action to get the required transactions confirmed ourselves.
    ///
    /// **Note:** Trusting the channel counterparty to take the necessary actions to get the
    /// required Anchor spending and HTLC transactions confirmed on-chain is potentially insecure
    /// as the channel may not be closed if they refuse to do so, potentially leaving the user
    /// funds stuck *or* even allow the counterparty to steal any in-flight funds after the
    /// corresponding HTLCs time out.
    pub trusted_peers_no_reserve: Vec<PublicKey>,
    /// The amount of satoshis per anchors-negotiated channel with an untrusted peer that we keep
    /// as an emergency reserve in our on-chain wallet.
    ///
    /// This allows for having the required Anchor output spending and HTLC transactions confirmed
    /// when the channel is closed.
    ///
    /// If the channel peer is not marked as trusted via trustedPeersNoReserve,
    /// we will always try to spend the Anchor
    /// outputs with *any* on-chain funds available, i.e., the total reserve value as well as any
    /// spendable funds available in the on-chain wallet. Therefore, this per-channel multiplier is
    /// really an emergency reserve that we maintain at all time to reduce reduce the risk of
    /// insufficient funds at time of a channel closure. To this end, we will refuse to open
    /// outbound or accept inbound channels if we don't have sufficient on-chain funds available to
    /// cover the additional reserve requirement.
    ///
    /// **Note:** Depending on the fee market at the time of closure, this reserve amount might or
    /// might not suffice to successfully spend the Anchor output and have the HTLC transactions
    /// confirmed on-chain, i.e., you may want to adjust this value accordingly.
    pub per_channel_reserve_sats: u64,
}

impl TryFrom<AnchorChannelsConfig> for ldk_node::AnchorChannelsConfig{
    type Error = LdkBuilderError;

    fn try_from(value: AnchorChannelsConfig) -> Result<Self, Self::Error> {
        let trusted_peers_no_reserve:  Result<
            Vec<ldk_node::bitcoin::secp256k1::PublicKey>,
            LdkBuilderError
        > = value.trusted_peers_no_reserve
            .into_iter()
            .map(|x| { x.try_into().map_err(|_| LdkBuilderError::InvalidPublicKey) })
            .collect();
        Ok(Self { trusted_peers_no_reserve: trusted_peers_no_reserve?, per_channel_reserve_sats: value.per_channel_reserve_sats })
    }
}

impl From<ldk_node::AnchorChannelsConfig> for AnchorChannelsConfig {
    fn from(value: ldk_node::AnchorChannelsConfig) -> Self {
        Self{ trusted_peers_no_reserve: value.trusted_peers_no_reserve
            .into_iter()
            .map(|e| e.into())
            .collect()
            , per_channel_reserve_sats:  value.per_channel_reserve_sats }
    }
}

impl TryFrom<Config> for ldk_node::Config {
    type Error = LdkBuilderError;

    fn try_from(value: Config) -> Result<Self, Self::Error> {
        let addresses = if let Some(addresses) = value.listening_addresses {
            let addr_vec: Result<
                Vec<ldk_node::lightning::ln::msgs::SocketAddress>,
                LdkBuilderError
            > = addresses
                .into_iter()
                .map(|socket_addr| socket_addr.try_into())
                .collect();
            Some(addr_vec?)
        } else {
            None
        };
        let anchor_channels_config = if let Some(anchor_channels_config) = value.anchor_channels_config{
            let anchr_channels_config: Result<
                ldk_node::AnchorChannelsConfig,
                LdkBuilderError> = anchor_channels_config.try_into();
            Some(anchr_channels_config?)
        }else {
            None
        };
        let trusted_peers_0conf: Result<
            Vec<ldk_node::bitcoin::secp256k1::PublicKey>,
            LdkBuilderError
        > = value.trusted_peers_0conf
            .into_iter()
            .map(|x| { x.try_into().map_err(|_| LdkBuilderError::InvalidPublicKey) })
            .collect();

        Ok(ldk_node::Config {
            storage_dir_path: value.storage_dir_path,
            log_dir_path: value.log_dir_path,
            network: value.network.into(),
            listening_addresses: addresses,
            default_cltv_expiry_delta: value.default_cltv_expiry_delta,
            onchain_wallet_sync_interval_secs: value.onchain_wallet_sync_interval_secs,
            wallet_sync_interval_secs: value.wallet_sync_interval_secs,
            fee_rate_cache_update_interval_secs: value.fee_rate_cache_update_interval_secs,
            trusted_peers_0conf: trusted_peers_0conf?,
            log_level: value.log_level.into(),
            probing_liquidity_limit_multiplier: value.probing_liquidity_limit_multiplier,
            anchor_channels_config,
        })
    }
}
impl From<ldk_node::Config> for Config {
    fn from(value: ldk_node::Config) -> Self {
        Config {
            storage_dir_path: value.storage_dir_path,
            log_dir_path: value.log_dir_path,
            network: value.network.into(),
            listening_addresses: value.listening_addresses.map(|vec_socket_addr| {
                vec_socket_addr
                    .into_iter()
                    .map(|socket_addr| socket_addr.into())
                    .collect()
            }),
            default_cltv_expiry_delta: value.default_cltv_expiry_delta,
            onchain_wallet_sync_interval_secs: value.onchain_wallet_sync_interval_secs,
            wallet_sync_interval_secs: value.wallet_sync_interval_secs,
            fee_rate_cache_update_interval_secs: value.fee_rate_cache_update_interval_secs,
            trusted_peers_0conf: value.trusted_peers_0conf
                .into_iter()
                .map(|x| x.into())
                .collect(),
            log_level: value.log_level.into(),
            probing_liquidity_limit_multiplier: value.probing_liquidity_limit_multiplier,
            anchor_channels_config: value.anchor_channels_config.map(|e| e.into()),
        }
    }
}
/// Represents the configuration of an [Node] instance.
///
#[frb(serialize)]
#[derive(Debug, Clone)]
pub struct Config {
    #[frb(non_final)]
    pub storage_dir_path: String,
    #[frb(non_final)]
    pub log_dir_path: Option<String>,
    /// The used Bitcoin network.
    ///
    #[frb(non_final)]
    pub network: Network,
    /// The IP address and TCP port the node will listen on.
    ///
    #[frb(non_final)]
    pub listening_addresses: Option<Vec<SocketAddress>>,
    /// The default CLTV expiry delta to be used for payments.
    ///
    #[frb(non_final)]
    pub default_cltv_expiry_delta: u32,
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
    ///A list of peers that we allow to establish zero confirmation channels to us.
    ///
    ///Note: Allowing payments via zero-confirmation channels is potentially insecure if the funding transaction ends up never being confirmed on-chain. Zero-confirmation channels should therefore only be accepted from trusted peers.
    pub trusted_peers_0conf: Vec<PublicKey>,

    pub probing_liquidity_limit_multiplier: u64,
    ///The level at which we log messages.
    /// Any messages below this level will be excluded from the logs.
    ///
    #[frb(non_final)]
    pub log_level: LogLevel,
    #[frb(non_final)]
    pub anchor_channels_config: Option<AnchorChannelsConfig>,
}
impl Default for AnchorChannelsConfig {
    fn default() -> Self {
        AnchorChannelsConfig {
            trusted_peers_no_reserve: vec![],
            per_channel_reserve_sats: 25000,
        }
    }
}

impl Default for Config {
    fn default() -> Self {
        Self {
            storage_dir_path: DEFAULT_STORAGE_DIR_PATH.to_string(),
            log_dir_path: None,
            network: DEFAULT_NETWORK,
            listening_addresses: None,
            default_cltv_expiry_delta: DEFAULT_CLTV_EXPIRY_DELTA,
            onchain_wallet_sync_interval_secs: DEFAULT_BDK_WALLET_SYNC_INTERVAL_SECS,
            wallet_sync_interval_secs: DEFAULT_LDK_WALLET_SYNC_INTERVAL_SECS,
            fee_rate_cache_update_interval_secs: DEFAULT_FEE_RATE_CACHE_UPDATE_INTERVAL_SECS,
            trusted_peers_0conf: vec![],
            probing_liquidity_limit_multiplier: 3,
            log_level: DEFAULT_LOG_LEVEL,
            anchor_channels_config:Some(Default::default()),
        }
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
        mnemonic: LdkMnemonic,
        passphrase: Option<String>,
    },
}

#[derive(Debug, Clone)]
pub enum GossipSourceConfig {
    P2PNetwork,
    RapidGossipSync(String),
}

#[derive(Debug, Clone)]
pub struct LiquiditySourceConfig {
    // LSPS2 service's (address, node_id, token)
    pub lsps2_service: (SocketAddress, PublicKey, Option<String>),
}
impl From<ldk_node::BalanceDetails> for BalanceDetails {
    fn from(value: ldk_node::BalanceDetails) -> Self {
        Self {
            total_onchain_balance_sats: value.total_onchain_balance_sats,
            spendable_onchain_balance_sats: value.spendable_onchain_balance_sats,
            total_lightning_balance_sats: value.total_lightning_balance_sats,
            lightning_balances: value.lightning_balances
                .iter()
                .map(|e| e.clone().into())
                .collect(),
            pending_balances_from_channel_closures: value.pending_balances_from_channel_closures
                .iter()
                .map(|e| e.clone().into())
                .collect(),
        }
    }
}
/// Details of the known available balances returned by `node.listBalances`.
///
#[derive(Debug, Clone)]
pub struct BalanceDetails {
    /// The total balance of our on-chain wallet.
    pub total_onchain_balance_sats: u64,
    /// The currently spendable balance of our on-chain wallet.
    pub spendable_onchain_balance_sats: u64,
    /// The total balance that we would be able to claim across all our Lightning channels.
    ///
    /// Note this excludes balances that we are unsure if we are able to claim (e.g., as we are
    pub total_lightning_balance_sats: u64,
    /// A detailed list of all known Lightning balances that would be claimable on channel closure.
    ///
    /// Note that less than the listed amounts are spendable over lightning as further reserve
    /// restrictions apply.
    pub lightning_balances: Vec<LightningBalance>,
    /// A detailed list of balances currently being swept from the Lightning to the on-chain
    /// wallet.
    ///
    /// These are balances resulting from channel closures that may have been encumbered by a
    /// delay, but are now being claimed and useable once sufficiently confirmed on-chain.
    ///
    /// Note that, depending on the sync status of the wallets, swept balances listed here might or
    /// might not already be accounted for in `totalOnchainBalanceSats`.
    pub pending_balances_from_channel_closures: Vec<PendingSweepBalance>,
}

/// Details about the status of a known Lightning balance.
#[derive(Debug, Clone)]
pub enum LightningBalance {
    /// The channel is not yet closed (or the commitment or closing transaction has not yet
    /// appeared in a block). The given balance is claimable (less on-chain fees) if the channel is
    /// force-closed now.
    ClaimableOnChannelClose {
        /// The identifier of the channel this balance belongs to.
        channel_id: ChannelId,
        /// The identifier of our channel counterparty.
        counterparty_node_id: PublicKey,
        /// The amount available to claim, in satoshis, excluding the on-chain fees which will be
        /// required to do so.
        amount_satoshis: u64,
    },
    /// The channel has been closed, and the given balance is ours but awaiting confirmations until
    /// we consider it spendable.
    ClaimableAwaitingConfirmations {
        /// The identifier of the channel this balance belongs to.
        channel_id: ChannelId,
        /// The identifier of our channel counterparty.
        counterparty_node_id: PublicKey,
        /// The amount available to claim, in satoshis, possibly excluding the on-chain fees which
        /// were spent in broadcasting the transaction.
        amount_satoshis: u64,
        /// The height at which an [`Event::SpendableOutputs`] event will be generated for this
        /// amount.
        ///
        /// [`Event::SpendableOutputs`]: lightning::events::Event::SpendableOutputs
        confirmation_height: u32,
    },
    /// The channel has been closed, and the given balance should be ours but awaiting spending
    /// transaction confirmation. If the spending transaction does not confirm in time, it is
    /// possible our counterparty can take the funds by broadcasting an HTLC timeout on-chain.
    ///
    /// Once the spending transaction confirms, before it has reached enough confirmations to be
    /// considered safe from chain reorganizations, the balance will instead be provided via
    /// `lightningBalance.claimableAwaitingConfirmations`.
    ContentiousClaimable {
        /// The identifier of the channel this balance belongs to.
        channel_id: ChannelId,
        /// The identifier of our channel counterparty.
        counterparty_node_id: PublicKey,
        /// The amount available to claim, in satoshis, excluding the on-chain fees which will be
        /// required to do so.
        amount_satoshis: u64,
        /// The height at which the counterparty may be able to claim the balance if we have not
        /// done so.
        timeout_height: u32,
        /// The payment hash that locks this HTLC.
        payment_hash: PaymentHash,
        /// The preimage that can be used to claim this HTLC.
        payment_preimage: PaymentPreimage,
    },
    /// HTLCs which we sent to our counterparty which are claimable after a timeout (less on-chain
    /// fees) if the counterparty does not know the preimage for the HTLCs. These are somewhat
    /// likely to be claimed by our counterparty before we do.
    MaybeTimeoutClaimableHTLC {
        /// The identifier of the channel this balance belongs to.
        channel_id: ChannelId,
        /// The identifier of our channel counterparty.
        counterparty_node_id: PublicKey,
        /// The amount potentially available to claim, in satoshis, excluding the on-chain fees
        /// which will be required to do so.
        amount_satoshis: u64,
        /// The height at which we will be able to claim the balance if our counterparty has not
        /// done so.
        claimable_height: u32,
        /// The payment hash whose preimage our counterparty needs to claim this HTLC.
        payment_hash: PaymentHash,
    },
    /// HTLCs which we received from our counterparty which are claimable with a preimage which we
    /// do not currently have. This will only be claimable if we receive the preimage from the node
    /// to which we forwarded this HTLC before the timeout.
    MaybePreimageClaimableHTLC {
        /// The identifier of the channel this balance belongs to.
        channel_id: ChannelId,
        /// The identifier of our channel counterparty.
        counterparty_node_id: PublicKey,
        /// The amount potentially available to claim, in satoshis, excluding the on-chain fees
        /// which will be required to do so.
        amount_satoshis: u64,
        /// The height at which our counterparty will be able to claim the balance if we have not
        /// yet received the preimage and claimed it ourselves.
        expiry_height: u32,
        /// The payment hash whose preimage we need to claim this HTLC.
        payment_hash: PaymentHash,
    },
    /// The channel has been closed, and our counterparty broadcasted a revoked commitment
    /// transaction.
    ///
    /// Thus, we're able to claim all outputs in the commitment transaction, one of which has the
    /// following amount.
    CounterpartyRevokedOutputClaimable {
        /// The identifier of the channel this balance belongs to.
        channel_id: ChannelId,
        /// The identifier of our channel counterparty.
        counterparty_node_id: PublicKey,
        /// The amount, in satoshis, of the output which we can claim.
        amount_satoshis: u64,
    },
}
impl From<ldk_node::LightningBalance> for LightningBalance {
    fn from(value: ldk_node::LightningBalance) -> Self {
        match value {
            ldk_node::LightningBalance::ClaimableOnChannelClose {
                channel_id,
                counterparty_node_id,
                amount_satoshis,
            } =>
                LightningBalance::ClaimableOnChannelClose {
                    channel_id: channel_id.into(),
                    counterparty_node_id: counterparty_node_id.into(),
                    amount_satoshis,
                },
            ldk_node::LightningBalance::ClaimableAwaitingConfirmations {
                channel_id,
                counterparty_node_id,
                amount_satoshis,
                confirmation_height,
            } =>
                LightningBalance::ClaimableAwaitingConfirmations {
                    channel_id: channel_id.into(),
                    counterparty_node_id: counterparty_node_id.into(),
                    amount_satoshis,
                    confirmation_height,
                },
            ldk_node::LightningBalance::ContentiousClaimable {
                channel_id,
                counterparty_node_id,
                amount_satoshis,
                timeout_height,
                payment_hash,
                payment_preimage,
            } =>
                LightningBalance::ContentiousClaimable {
                    channel_id: channel_id.into(),
                    counterparty_node_id: counterparty_node_id.into(),
                    amount_satoshis,
                    timeout_height,
                    payment_hash: payment_hash.into(),
                    payment_preimage: payment_preimage.into(),
                },
            ldk_node::LightningBalance::MaybeTimeoutClaimableHTLC {
                channel_id,
                counterparty_node_id,
                amount_satoshis,
                claimable_height,
                payment_hash,
            } =>
                LightningBalance::MaybeTimeoutClaimableHTLC {
                    channel_id: channel_id.into(),
                    counterparty_node_id: counterparty_node_id.into(),
                    amount_satoshis,
                    claimable_height,
                    payment_hash: payment_hash.into(),
                },
            ldk_node::LightningBalance::MaybePreimageClaimableHTLC {
                channel_id,
                counterparty_node_id,
                amount_satoshis,
                expiry_height,
                payment_hash,
            } =>
                LightningBalance::MaybePreimageClaimableHTLC {
                    channel_id: channel_id.into(),
                    counterparty_node_id: counterparty_node_id.into(),
                    amount_satoshis,
                    expiry_height,
                    payment_hash: payment_hash.into(),
                },
            ldk_node::LightningBalance::CounterpartyRevokedOutputClaimable {
                channel_id,
                counterparty_node_id,
                amount_satoshis,
            } =>
                LightningBalance::CounterpartyRevokedOutputClaimable {
                    channel_id: channel_id.into(),
                    counterparty_node_id: counterparty_node_id.into(),
                    amount_satoshis,
                },
        }
    }
}

/// Details about the status of a known balance currently being swept to our on-chain wallet.
#[derive(Debug, Clone)]
pub enum PendingSweepBalance {
    /// The spendable output is about to be swept, but a spending transaction has yet to be generated and
    /// broadcast.
    PendingBroadcast {
        /// The identifier of the channel this balance belongs to.
        channel_id: Option<ChannelId>,
        /// The amount, in satoshis, of the output being swept.
        amount_satoshis: u64,
    },
    /// A spending transaction has been generated and broadcast and is awaiting confirmation
    /// on-chain.
    BroadcastAwaitingConfirmation {
        /// The identifier of the channel this balance belongs to.
        channel_id: Option<ChannelId>,
        /// The best height when we last broadcast a transaction spending the output being swept.
        latest_broadcast_height: u32,
        /// The identifier of the transaction spending the swept output we last broadcast.
        latest_spending_txid: Txid,
        /// The amount, in satoshis, of the output being swept.
        amount_satoshis: u64,
    },
    /// A spending transaction has been confirmed on-chain and is awaiting threshold confirmations.
    ///
    /// It will be considered irrevocably confirmed after reaching [`ANTI_REORG_DELAY`].
    ///
    /// [`ANTI_REORG_DELAY`]: lightning::chain::channelmonitor::ANTI_REORG_DELAY
    AwaitingThresholdConfirmations {
        /// The identifier of the channel this balance belongs to.
        channel_id: Option<ChannelId>,
        /// The identifier of the confirmed transaction spending the swept output.
        latest_spending_txid: Txid,
        /// The hash of the block in which the spending transaction was confirmed.
        confirmation_hash: String,
        /// The height at which the spending transaction was confirmed.
        confirmation_height: u32,
        /// The amount, in satoshis, of the output being swept.
        amount_satoshis: u64,
    },
}

impl From<ldk_node::PendingSweepBalance> for PendingSweepBalance {
    fn from(value: ldk_node::PendingSweepBalance) -> Self {
        match value {
            ldk_node::PendingSweepBalance::PendingBroadcast { channel_id, amount_satoshis } =>
                PendingSweepBalance::PendingBroadcast {
                    channel_id: channel_id.map(|e| e.into()),
                    amount_satoshis,
                },
            ldk_node::PendingSweepBalance::BroadcastAwaitingConfirmation {
                channel_id,
                latest_broadcast_height,
                latest_spending_txid,
                amount_satoshis,
            } =>
                PendingSweepBalance::BroadcastAwaitingConfirmation {
                    channel_id: channel_id.map(|e| e.into()),
                    latest_broadcast_height,
                    latest_spending_txid: latest_spending_txid.into(),
                    amount_satoshis,
                },
            ldk_node::PendingSweepBalance::AwaitingThresholdConfirmations {
                channel_id,
                latest_spending_txid,
                confirmation_hash,
                confirmation_height,
                amount_satoshis,
            } =>
                PendingSweepBalance::AwaitingThresholdConfirmations {
                    channel_id: channel_id.map(|e| e.into()),
                    latest_spending_txid: latest_spending_txid.into(),
                    confirmation_hash: confirmation_hash.to_string(),
                    confirmation_height,
                    amount_satoshis,
                },
        }
    }
}
/// The best known block as identified by its hash and height.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct BestBlock {
    /// The block's hash
    pub block_hash: String,
    /// The height at which the block was confirmed.
    pub height: u32,
}

impl From<ldk_node::lightning::chain::BestBlock> for BestBlock {
    fn from(value: ldk_node::lightning::chain::BestBlock) -> Self {
        BestBlock {
            block_hash: value.block_hash.to_string(),
            height: value.height,
        }
    }
}
/// Represents the status of the [Node].
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NodeStatus {
    /// Indicates whether the [Node] is running.
    pub is_running: bool,
    /// Indicates whether the [Node] is listening for incoming connections on the addresses
    /// configured via `config.listeningAddresses`.
    pub is_listening: bool,
    /// The best block to which our Lightning wallet is currently synced.
    pub current_best_block: BestBlock,
    /// The timestamp, in seconds since start of the UNIX epoch, when we last successfully synced
    /// our Lightning wallet to the chain tip.
    ///
    /// Will be `None` if the wallet hasn't been synced since the [Node] was initialized.
    pub latest_wallet_sync_timestamp: Option<u64>,
    /// The timestamp, in seconds since start of the UNIX epoch, when we last successfully synced
    /// our on-chain wallet to the chain tip.
    ///
    /// Will be `None` if the wallet hasn't been synced since the [Node] was initialized.
    pub latest_onchain_wallet_sync_timestamp: Option<u64>,
    /// The timestamp, in seconds since start of the UNIX epoch, when we last successfully update
    /// our fee rate cache.
    ///
    /// Will be `None` if the cache hasn't been updated since the [Node] was initialized.
    pub latest_fee_rate_cache_update_timestamp: Option<u64>,
    /// The timestamp, in seconds since start of the UNIX epoch, when the last rapid gossip sync
    /// (RGS) snapshot we successfully applied was generated.
    ///
    /// Will be `None` if RGS isn't configured or the snapshot hasn't been updated since the [Node] was initialized.
    pub latest_rgs_snapshot_timestamp: Option<u64>,
    /// The timestamp, in seconds since start of the UNIX epoch, when we last broadcasted a node
    /// announcement.
    ///
    /// Will be `None` if we have no public channels or we haven't broadcasted since the [Node] was initialized.
    pub latest_node_announcement_broadcast_timestamp: Option<u64>,
}
impl From<ldk_node::NodeStatus> for NodeStatus {
    fn from(value: ldk_node::NodeStatus) -> Self {
        Self {
            is_running: value.is_running,
            is_listening: value.is_listening,
            current_best_block: value.current_best_block.into(),
            latest_wallet_sync_timestamp: value.latest_wallet_sync_timestamp,
            latest_onchain_wallet_sync_timestamp: value.latest_onchain_wallet_sync_timestamp,
            latest_fee_rate_cache_update_timestamp: value.latest_fee_rate_cache_update_timestamp,
            latest_rgs_snapshot_timestamp: value.latest_rgs_snapshot_timestamp,
            latest_node_announcement_broadcast_timestamp: value.latest_node_announcement_broadcast_timestamp,
        }
    }
}
// Config defaults
const DEFAULT_STORAGE_DIR_PATH: &str = "/tmp/ldk_node/";
const DEFAULT_NETWORK: Network = Network::Testnet;
const DEFAULT_CLTV_EXPIRY_DELTA: u32 = 144;
const DEFAULT_BDK_WALLET_SYNC_INTERVAL_SECS: u64 = 60;
const DEFAULT_LDK_WALLET_SYNC_INTERVAL_SECS: u64 = 20;
const DEFAULT_FEE_RATE_CACHE_UPDATE_INTERVAL_SECS: u64 = 60;
const DEFAULT_LOG_LEVEL: LogLevel = LogLevel::Debug;
