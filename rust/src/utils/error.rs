use ldk_node::{ BuildError, NodeError };



#[derive(Debug, PartialEq)]
pub enum LdkNodeError {
    InvalidTxid,
    /// Returned when trying to start [Node] while it is already running.
    AlreadyRunning,
    /// Returned when trying to stop [Node] while it is not running.
    NotRunning,
    /// An on-chain transaction could not be created.
    OnchainTxCreationFailed,
    /// A network connection has been closed.
    ConnectionFailed,
    /// Invoice creation failed.
    InvoiceCreationFailed,
    /// Sending a payment has failed.
    PaymentSendingFailed,
    /// Sending a payment probe has failed.
    ProbeSendingFailed,
    /// A channel could not be opened.
    ChannelCreationFailed,
    /// A channel could not be closed.
    ChannelClosingFailed,
    /// A channel config could not be updated.
    ChannelConfigUpdateFailed,
    /// Persistence failed.
    PersistenceFailed,
    /// A wallet operation failed.
    WalletOperationFailed,
    /// A signing operation for transaction failed.
    OnchainTxSigningFailed,
    /// A signing operation for message failed.
    MessageSigningFailed,
    /// A transaction sync operation failed.
    TxSyncFailed,
    /// A gossip updating operation failed.
    GossipUpdateFailed,
    /// The given address is invalid.
    InvalidAddress,
    /// The given network address is invalid.
    InvalidSocketAddress,
    /// The given public key is invalid.
    InvalidPublicKey,
    /// The given secret key is invalid.
    InvalidSecretKey,
    /// The given payment hash is invalid.
    InvalidPaymentHash,
    /// The given payment preimage is invalid.
    InvalidPaymentPreimage,
    /// The given payment secret is invalid.
    InvalidPaymentSecret,
    /// The given amount is invalid.
    InvalidAmount,
    /// The given invoice is invalid.
    InvalidInvoice,
    /// The given channel ID is invalid.
    InvalidChannelId,
    /// The given network is invalid.
    InvalidNetwork,
    /// A payment with the given hash has already been initiated.
    DuplicatePayment,
    /// There are insufficient funds to complete the given operation.
    InsufficientFunds,
    ///A fee rate estimation update failed.
    FeerateEstimationUpdateFailed,
    ///A liquidity request operation failed.
    LiquidityRequestFailed,
    ///The given operation failed due to the required liquidity source being unavailable.
    LiquiditySourceUnavailable,
    ///The given operation failed due to the LSP's required opening fee being too high.
    LiquidityFeeTooHigh,
    ///The given payment id is invalid.
    InvalidPaymentId,
    ///An error in decoding a message or struct.
    Decode(DecodeError),
    ///An error in decoding the Bolt12 offer.
    Bolt12Parse(Bolt12ParseError),
    InvoiceRequestCreationFailed,
    OfferCreationFailed,
    RefundCreationFailed ,
    FeerateEstimationUpdateTimeout ,
    WalletOperationTimeout ,
    TxSyncTimeout ,
    GossipUpdateTimeout,
    InvalidOfferId,
    InvalidNodeId,
    InvalidOffer,
    InvalidRefund,
    UnsupportedCurrency
}
#[allow(dead_code)]
#[derive(Debug)]
pub enum LdkBuilderError {
    SocketAddressParseError,
    /// The given seed bytes are invalid, e.g., have invalid length.
    InvalidSeedBytes,
    /// The given seed file is invalid, e.g., has invalid length, or could not be read.
    InvalidSeedFile,
    /// The current system time is invalid, clocks might have gone backwards.
    InvalidSystemTime,
    /// The a read channel monitor is invalid.
    InvalidChannelMonitor,
    /// The given listening addresses are invalid, e.g. too many were passed.
    InvalidListeningAddress,
    /// We failed to read data from the [`KVStore`].
    ReadFailed,
    /// We failed to write data to the [`KVStore`].
    WriteFailed,
    /// We failed to access the given `storage_dir_path`.
    StoragePathAccessFailed,
    /// We failed to setup our [`KVStore`].
    KVStoreSetupFailed,
    /// We failed to setup the onchain wallet.
    WalletSetupFailed,
    /// We failed to setup the logger.
    LoggerSetupFailed,

    InvalidPublicKey,
}

impl From<NodeError> for LdkNodeError {
    fn from(value: NodeError) -> Self {
        match value {
            NodeError::AlreadyRunning => LdkNodeError::AlreadyRunning,
            NodeError::NotRunning => LdkNodeError::NotRunning,
            NodeError::OnchainTxCreationFailed => LdkNodeError::OnchainTxCreationFailed,
            NodeError::ConnectionFailed => LdkNodeError::ConnectionFailed,
            NodeError::InvoiceCreationFailed => LdkNodeError::InvoiceCreationFailed,
            NodeError::PaymentSendingFailed => LdkNodeError::PaymentSendingFailed,
            NodeError::ProbeSendingFailed => LdkNodeError::ProbeSendingFailed,
            NodeError::ChannelCreationFailed => LdkNodeError::ChannelCreationFailed,
            NodeError::ChannelClosingFailed => LdkNodeError::ChannelClosingFailed,
            NodeError::ChannelConfigUpdateFailed => LdkNodeError::ChannelConfigUpdateFailed,
            NodeError::PersistenceFailed => LdkNodeError::PersistenceFailed,
            NodeError::WalletOperationFailed => LdkNodeError::WalletOperationFailed,
            NodeError::OnchainTxSigningFailed => LdkNodeError::OnchainTxSigningFailed,
            NodeError::MessageSigningFailed => LdkNodeError::MessageSigningFailed,
            NodeError::TxSyncFailed => LdkNodeError::TxSyncFailed,
            NodeError::GossipUpdateFailed => LdkNodeError::GossipUpdateFailed,
            NodeError::InvalidAddress => LdkNodeError::InvalidAddress,
            NodeError::InvalidSocketAddress => LdkNodeError::InvalidSocketAddress,
            NodeError::InvalidPublicKey => LdkNodeError::InvalidPublicKey,
            NodeError::InvalidSecretKey => LdkNodeError::InvalidSecretKey,
            NodeError::InvalidPaymentHash => LdkNodeError::InvalidPaymentHash,
            NodeError::InvalidPaymentPreimage => LdkNodeError::InvalidPaymentPreimage,
            NodeError::InvalidPaymentSecret => LdkNodeError::InvalidPaymentSecret,
            NodeError::InvalidAmount => LdkNodeError::InvalidAmount,
            NodeError::InvalidInvoice => LdkNodeError::InvalidInvoice,
            NodeError::InvalidChannelId => LdkNodeError::InvalidChannelId,
            NodeError::InvalidNetwork => LdkNodeError::InvalidNetwork,
            NodeError::DuplicatePayment => LdkNodeError::DuplicatePayment,
            NodeError::InsufficientFunds => LdkNodeError::InsufficientFunds,
            NodeError::FeerateEstimationUpdateFailed => LdkNodeError::FeerateEstimationUpdateFailed,
            NodeError::LiquidityRequestFailed => LdkNodeError::LiquidityRequestFailed,
            NodeError::LiquiditySourceUnavailable => LdkNodeError::LiquiditySourceUnavailable,
            NodeError::LiquidityFeeTooHigh => LdkNodeError::LiquidityFeeTooHigh,
            NodeError::InvalidPaymentId => LdkNodeError::InvalidPaymentId,
            NodeError::InvoiceRequestCreationFailed =>LdkNodeError::InvoiceRequestCreationFailed,
            NodeError::OfferCreationFailed => LdkNodeError::OfferCreationFailed,
            NodeError::RefundCreationFailed => LdkNodeError::RefundCreationFailed,
            NodeError::FeerateEstimationUpdateTimeout => LdkNodeError::FeerateEstimationUpdateTimeout,
            NodeError::WalletOperationTimeout =>LdkNodeError::WalletOperationTimeout,
            NodeError::TxSyncTimeout =>LdkNodeError::TxSyncTimeout,
            NodeError::GossipUpdateTimeout => LdkNodeError::GossipUpdateTimeout,
            NodeError::InvalidOfferId => LdkNodeError::InvalidOfferId,
            NodeError::InvalidNodeId =>LdkNodeError::InvalidNodeId,
            NodeError::InvalidOffer => LdkNodeError::InvalidOffer,
            NodeError::InvalidRefund => LdkNodeError::InvalidRefund,
            NodeError::UnsupportedCurrency => LdkNodeError::UnsupportedCurrency,
        }
    }
}
impl From<BuildError> for LdkBuilderError {
    fn from(value: BuildError) -> Self {
        match value {
            BuildError::InvalidSeedBytes => LdkBuilderError::InvalidSeedBytes,
            BuildError::InvalidSeedFile => LdkBuilderError::InvalidSeedFile,
            BuildError::InvalidSystemTime => LdkBuilderError::InvalidSystemTime,
            BuildError::ReadFailed => LdkBuilderError::ReadFailed,
            BuildError::WriteFailed => LdkBuilderError::WriteFailed,
            BuildError::StoragePathAccessFailed => LdkBuilderError::StoragePathAccessFailed,
            BuildError::WalletSetupFailed => LdkBuilderError::WalletSetupFailed,
            BuildError::LoggerSetupFailed => LdkBuilderError::LoggerSetupFailed,
            BuildError::InvalidChannelMonitor => LdkBuilderError::InvalidChannelMonitor,
            BuildError::KVStoreSetupFailed => LdkBuilderError::KVStoreSetupFailed,
            BuildError::InvalidListeningAddresses => LdkBuilderError::InvalidListeningAddress,
        }
    }
}

impl From<ldk_node::bip39::Error> for LdkBuilderError {
    fn from(value: ldk_node::bip39::Error) -> Self {
        match value {
            ldk_node::bip39::Error::BadWordCount(_) => LdkBuilderError::InvalidSeedBytes,
            ldk_node::bip39::Error::UnknownWord(_) => LdkBuilderError::InvalidSeedBytes,
            ldk_node::bip39::Error::BadEntropyBitCount(_) => LdkBuilderError::InvalidSeedBytes,
            ldk_node::bip39::Error::InvalidChecksum => LdkBuilderError::InvalidSeedBytes,
            ldk_node::bip39::Error::AmbiguousLanguages(_) => LdkBuilderError::InvalidSeedBytes,
        }
    }
}
impl From<ldk_node::lightning::ln::msgs::DecodeError> for LdkNodeError {
    fn from(value: ldk_node::lightning::ln::msgs::DecodeError) -> Self {
        LdkNodeError::Decode(value.into())
    }
}
impl From<ldk_node::lightning::ln::msgs::DecodeError> for DecodeError {
    fn from(e: ldk_node::lightning::ln::msgs::DecodeError) -> Self {
        match e {
            ldk_node::lightning::ln::msgs::DecodeError::UnknownVersion => DecodeError::UnknownVersion,
            ldk_node::lightning::ln::msgs::DecodeError::UnknownRequiredFeature => DecodeError::UnknownRequiredFeature,
            ldk_node::lightning::ln::msgs::DecodeError::InvalidValue => DecodeError::InvalidValue,
            ldk_node::lightning::ln::msgs:: DecodeError::ShortRead => DecodeError::ShortRead,
            ldk_node::lightning::ln::msgs::DecodeError::BadLengthDescriptor => DecodeError::BadLengthDescriptor,
            ldk_node::lightning::ln::msgs::DecodeError::Io(e) => DecodeError::Io(e.to_string()),
            ldk_node::lightning::ln::msgs::DecodeError::UnsupportedCompression => DecodeError::UnsupportedCompression,
            ldk_node::lightning::ln::msgs::DecodeError::DangerousValue => DecodeError::DangerousValue,
        }
    }
}
#[derive(Debug, PartialEq)]
pub enum DecodeError {
    UnknownVersion,
    UnknownRequiredFeature,
    InvalidValue,
    ShortRead,
    BadLengthDescriptor,
    Io(String),
    UnsupportedCompression,
    DangerousValue,
}

#[derive(Debug, PartialEq)]
pub enum Bolt12ParseError {
    InvalidContinuation,
    InvalidBech32Hrp,
    Bech32(String),
    Decode(DecodeError),
    InvalidSemantics(String),
    InvalidSignature(String),
}
impl From<ldk_node::lightning::offers::parse::Bolt12ParseError> for LdkNodeError {
    fn from(value: ldk_node::lightning::offers::parse::Bolt12ParseError) -> Self {
        match value{
            ldk_node::lightning::offers::parse::Bolt12ParseError::InvalidContinuation => LdkNodeError::Bolt12Parse(Bolt12ParseError::InvalidContinuation),
            ldk_node::lightning::offers::parse::Bolt12ParseError::InvalidBech32Hrp => LdkNodeError::Bolt12Parse(Bolt12ParseError::InvalidBech32Hrp),
            ldk_node::lightning::offers::parse::Bolt12ParseError::Bech32(e) =>LdkNodeError::Bolt12Parse(Bolt12ParseError::Bech32(e.to_string())),
            ldk_node::lightning::offers::parse::Bolt12ParseError::Decode(e) => LdkNodeError::Bolt12Parse(Bolt12ParseError::Decode(e.into())),
            ldk_node::lightning::offers::parse::Bolt12ParseError::InvalidSemantics(e) => LdkNodeError::Bolt12Parse(
                Bolt12ParseError::InvalidSemantics(format!("{:?}", e))),
            ldk_node::lightning::offers::parse::Bolt12ParseError::InvalidSignature(e) => LdkNodeError::Bolt12Parse(Bolt12ParseError::InvalidSignature(e.to_string())),
        }
    }
}
