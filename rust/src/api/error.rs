use ldk_node::{BuildError, NodeError};

#[derive(Debug, PartialEq)]
pub enum NodeBaseError {
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
    FeerateEstimationUpdateFailed,
    LiquidityRequestFailed,
    LiquiditySourceUnavailable,
    LiquidityFeeTooHigh,
}
#[allow(dead_code)]
#[derive(Debug)]
pub enum BuilderError {
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
    InvalidListeningAddresses,
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
}

impl From<NodeError> for NodeBaseError {
    fn from(value: NodeError) -> Self {
        match value {
            NodeError::AlreadyRunning => NodeBaseError::AlreadyRunning,
            NodeError::NotRunning => NodeBaseError::NotRunning,
            NodeError::OnchainTxCreationFailed => NodeBaseError::OnchainTxCreationFailed,
            NodeError::ConnectionFailed => NodeBaseError::ConnectionFailed,
            NodeError::InvoiceCreationFailed => NodeBaseError::InvoiceCreationFailed,
            NodeError::PaymentSendingFailed => NodeBaseError::PaymentSendingFailed,
            NodeError::ProbeSendingFailed => NodeBaseError::ProbeSendingFailed,
            NodeError::ChannelCreationFailed => NodeBaseError::ChannelCreationFailed,
            NodeError::ChannelClosingFailed => NodeBaseError::ChannelClosingFailed,
            NodeError::ChannelConfigUpdateFailed => NodeBaseError::ChannelConfigUpdateFailed,
            NodeError::PersistenceFailed => NodeBaseError::PersistenceFailed,
            NodeError::WalletOperationFailed => NodeBaseError::WalletOperationFailed,
            NodeError::OnchainTxSigningFailed => NodeBaseError::OnchainTxSigningFailed,
            NodeError::MessageSigningFailed => NodeBaseError::MessageSigningFailed,
            NodeError::TxSyncFailed => NodeBaseError::TxSyncFailed,
            NodeError::GossipUpdateFailed => NodeBaseError::GossipUpdateFailed,
            NodeError::InvalidAddress => NodeBaseError::InvalidAddress,
            NodeError::InvalidSocketAddress => NodeBaseError::InvalidSocketAddress,
            NodeError::InvalidPublicKey => NodeBaseError::InvalidPublicKey,
            NodeError::InvalidSecretKey => NodeBaseError::InvalidSecretKey,
            NodeError::InvalidPaymentHash => NodeBaseError::InvalidPaymentHash,
            NodeError::InvalidPaymentPreimage => NodeBaseError::InvalidPaymentPreimage,
            NodeError::InvalidPaymentSecret => NodeBaseError::InvalidPaymentSecret,
            NodeError::InvalidAmount => NodeBaseError::InvalidAmount,
            NodeError::InvalidInvoice => NodeBaseError::InvalidInvoice,
            NodeError::InvalidChannelId => NodeBaseError::InvalidChannelId,
            NodeError::InvalidNetwork => NodeBaseError::InvalidNetwork,
            NodeError::DuplicatePayment => NodeBaseError::DuplicatePayment,
            NodeError::InsufficientFunds => NodeBaseError::InsufficientFunds,
            NodeError::FeerateEstimationUpdateFailed => {
                NodeBaseError::FeerateEstimationUpdateFailed
            }
            NodeError::LiquidityRequestFailed => NodeBaseError::LiquidityRequestFailed,
            NodeError::LiquiditySourceUnavailable => NodeBaseError::LiquiditySourceUnavailable,
            NodeError::LiquidityFeeTooHigh => NodeBaseError::LiquidityFeeTooHigh,
        }
    }
}
impl From<BuildError> for BuilderError {
    fn from(value: BuildError) -> Self {
        match value {
            BuildError::InvalidSeedBytes => BuilderError::InvalidSeedBytes,
            BuildError::InvalidSeedFile => BuilderError::InvalidSeedFile,
            BuildError::InvalidSystemTime => BuilderError::InvalidSystemTime,
            BuildError::ReadFailed => BuilderError::ReadFailed,
            BuildError::WriteFailed => BuilderError::WriteFailed,
            BuildError::StoragePathAccessFailed => BuilderError::StoragePathAccessFailed,
            BuildError::WalletSetupFailed => BuilderError::WalletSetupFailed,
            BuildError::LoggerSetupFailed => BuilderError::LoggerSetupFailed,
            BuildError::InvalidChannelMonitor => BuilderError::InvalidChannelMonitor,
            BuildError::KVStoreSetupFailed => BuilderError::KVStoreSetupFailed,
            BuildError::InvalidListeningAddresses => BuilderError::InvalidListeningAddresses,
        }
    }
}
