use ldk_node::{ BuildError, NodeError };


#[derive(Debug, PartialEq)]
pub enum NodeException {
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
    DecodeError,
}
#[allow(dead_code)]
#[derive(Debug)]
pub enum BuilderException {
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

impl From<NodeError> for NodeException {
    fn from(value: NodeError) -> Self {
        match value {
            NodeError::AlreadyRunning => NodeException::AlreadyRunning,
            NodeError::NotRunning => NodeException::NotRunning,
            NodeError::OnchainTxCreationFailed => NodeException::OnchainTxCreationFailed,
            NodeError::ConnectionFailed => NodeException::ConnectionFailed,
            NodeError::InvoiceCreationFailed => NodeException::InvoiceCreationFailed,
            NodeError::PaymentSendingFailed => NodeException::PaymentSendingFailed,
            NodeError::ProbeSendingFailed => NodeException::ProbeSendingFailed,
            NodeError::ChannelCreationFailed => NodeException::ChannelCreationFailed,
            NodeError::ChannelClosingFailed => NodeException::ChannelClosingFailed,
            NodeError::ChannelConfigUpdateFailed => NodeException::ChannelConfigUpdateFailed,
            NodeError::PersistenceFailed => NodeException::PersistenceFailed,
            NodeError::WalletOperationFailed => NodeException::WalletOperationFailed,
            NodeError::OnchainTxSigningFailed => NodeException::OnchainTxSigningFailed,
            NodeError::MessageSigningFailed => NodeException::MessageSigningFailed,
            NodeError::TxSyncFailed => NodeException::TxSyncFailed,
            NodeError::GossipUpdateFailed => NodeException::GossipUpdateFailed,
            NodeError::InvalidAddress => NodeException::InvalidAddress,
            NodeError::InvalidSocketAddress => NodeException::InvalidSocketAddress,
            NodeError::InvalidPublicKey => NodeException::InvalidPublicKey,
            NodeError::InvalidSecretKey => NodeException::InvalidSecretKey,
            NodeError::InvalidPaymentHash => NodeException::InvalidPaymentHash,
            NodeError::InvalidPaymentPreimage => NodeException::InvalidPaymentPreimage,
            NodeError::InvalidPaymentSecret => NodeException::InvalidPaymentSecret,
            NodeError::InvalidAmount => NodeException::InvalidAmount,
            NodeError::InvalidInvoice => NodeException::InvalidInvoice,
            NodeError::InvalidChannelId => NodeException::InvalidChannelId,
            NodeError::InvalidNetwork => NodeException::InvalidNetwork,
            NodeError::DuplicatePayment => NodeException::DuplicatePayment,
            NodeError::InsufficientFunds => NodeException::InsufficientFunds,
            NodeError::FeerateEstimationUpdateFailed => NodeException::FeerateEstimationUpdateFailed,
            NodeError::LiquidityRequestFailed => NodeException::LiquidityRequestFailed,
            NodeError::LiquiditySourceUnavailable => NodeException::LiquiditySourceUnavailable,
            NodeError::LiquidityFeeTooHigh => NodeException::LiquidityFeeTooHigh,
            NodeError::InvalidPaymentId => NodeException::InvalidPaymentId
        }
    }
}
impl From<BuildError> for BuilderException {
    fn from(value: BuildError) -> Self {
        match value {
            BuildError::InvalidSeedBytes => BuilderException::InvalidSeedBytes,
            BuildError::InvalidSeedFile => BuilderException::InvalidSeedFile,
            BuildError::InvalidSystemTime => BuilderException::InvalidSystemTime,
            BuildError::ReadFailed => BuilderException::ReadFailed,
            BuildError::WriteFailed => BuilderException::WriteFailed,
            BuildError::StoragePathAccessFailed => BuilderException::StoragePathAccessFailed,
            BuildError::WalletSetupFailed => BuilderException::WalletSetupFailed,
            BuildError::LoggerSetupFailed => BuilderException::LoggerSetupFailed,
            BuildError::InvalidChannelMonitor => BuilderException::InvalidChannelMonitor,
            BuildError::KVStoreSetupFailed => BuilderException::KVStoreSetupFailed,
            BuildError::InvalidListeningAddresses => BuilderException::InvalidListeningAddress,
        }
    }
}

impl From<ldk_node::bip39::Error> for BuilderException {
    fn from(value: ldk_node::bip39::Error) -> Self {
        match value {
            ldk_node::bip39::Error::BadWordCount(_) => BuilderException::InvalidSeedBytes,
            ldk_node::bip39::Error::UnknownWord(_) => BuilderException::InvalidSeedBytes,
            ldk_node::bip39::Error::BadEntropyBitCount(_) => BuilderException::InvalidSeedBytes,
            ldk_node::bip39::Error::InvalidChecksum => BuilderException::InvalidSeedBytes,
            ldk_node::bip39::Error::AmbiguousLanguages(_) => BuilderException::InvalidSeedBytes,
        }
    }
}

impl From<ldk_node::lightning::ln::msgs::DecodeError> for NodeException {
    fn from(_: ldk_node::lightning::ln::msgs::DecodeError) -> Self {
        NodeException::DecodeError
    }
}
