use ldk_node::{BuildError, NodeError};

#[derive(Debug, PartialEq)]
pub enum FfiNodeError {
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
    ///Invoice request creation failed.
    InvoiceRequestCreationFailed,
    ///Offer creation failed.
    OfferCreationFailed,
    ///Refund creation failed.
    RefundCreationFailed,
    ///A fee rate estimation update timed out.
    FeerateEstimationUpdateTimeout,
    ///A wallet operation timed out.
    WalletOperationTimeout,
    ///A transaction sync operation timed out.
    TxSyncTimeout,
    ///A gossip updating operation timed out.
    GossipUpdateTimeout,
    ///The given offer id is invalid.
    InvalidOfferId,
    ///The given node id is invalid.
    InvalidNodeId,
    ///The given offer is invalid.
    InvalidOffer,
    ///The given refund is invalid.
    InvalidRefund,
    ///The provided offer was denominated in an unsupported currency.
    UnsupportedCurrency,
    UriParameterParsingFailed,
    InvalidUri,
    InvalidQuantity,
    InvalidNodeAlias,
}
#[allow(dead_code)]
#[derive(Debug)]
pub enum FfiBuilderError {
    InvalidNodeAlias,
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

impl From<NodeError> for FfiNodeError {
    fn from(value: NodeError) -> Self {
        match value {
            NodeError::AlreadyRunning => FfiNodeError::AlreadyRunning,
            NodeError::NotRunning => FfiNodeError::NotRunning,
            NodeError::OnchainTxCreationFailed => FfiNodeError::OnchainTxCreationFailed,
            NodeError::ConnectionFailed => FfiNodeError::ConnectionFailed,
            NodeError::InvoiceCreationFailed => FfiNodeError::InvoiceCreationFailed,
            NodeError::PaymentSendingFailed => FfiNodeError::PaymentSendingFailed,
            NodeError::ProbeSendingFailed => FfiNodeError::ProbeSendingFailed,
            NodeError::ChannelCreationFailed => FfiNodeError::ChannelCreationFailed,
            NodeError::ChannelClosingFailed => FfiNodeError::ChannelClosingFailed,
            NodeError::ChannelConfigUpdateFailed => FfiNodeError::ChannelConfigUpdateFailed,
            NodeError::PersistenceFailed => FfiNodeError::PersistenceFailed,
            NodeError::WalletOperationFailed => FfiNodeError::WalletOperationFailed,
            NodeError::OnchainTxSigningFailed => FfiNodeError::OnchainTxSigningFailed,
            NodeError::TxSyncFailed => FfiNodeError::TxSyncFailed,
            NodeError::GossipUpdateFailed => FfiNodeError::GossipUpdateFailed,
            NodeError::InvalidAddress => FfiNodeError::InvalidAddress,
            NodeError::InvalidSocketAddress => FfiNodeError::InvalidSocketAddress,
            NodeError::InvalidPublicKey => FfiNodeError::InvalidPublicKey,
            NodeError::InvalidSecretKey => FfiNodeError::InvalidSecretKey,
            NodeError::InvalidPaymentHash => FfiNodeError::InvalidPaymentHash,
            NodeError::InvalidPaymentPreimage => FfiNodeError::InvalidPaymentPreimage,
            NodeError::InvalidPaymentSecret => FfiNodeError::InvalidPaymentSecret,
            NodeError::InvalidAmount => FfiNodeError::InvalidAmount,
            NodeError::InvalidInvoice => FfiNodeError::InvalidInvoice,
            NodeError::InvalidChannelId => FfiNodeError::InvalidChannelId,
            NodeError::InvalidNetwork => FfiNodeError::InvalidNetwork,
            NodeError::DuplicatePayment => FfiNodeError::DuplicatePayment,
            NodeError::InsufficientFunds => FfiNodeError::InsufficientFunds,
            NodeError::FeerateEstimationUpdateFailed => FfiNodeError::FeerateEstimationUpdateFailed,
            NodeError::LiquidityRequestFailed => FfiNodeError::LiquidityRequestFailed,
            NodeError::LiquiditySourceUnavailable => FfiNodeError::LiquiditySourceUnavailable,
            NodeError::LiquidityFeeTooHigh => FfiNodeError::LiquidityFeeTooHigh,
            NodeError::InvalidPaymentId => FfiNodeError::InvalidPaymentId,
            NodeError::InvoiceRequestCreationFailed => FfiNodeError::InvoiceRequestCreationFailed,
            NodeError::OfferCreationFailed => FfiNodeError::OfferCreationFailed,
            NodeError::RefundCreationFailed => FfiNodeError::RefundCreationFailed,
            NodeError::FeerateEstimationUpdateTimeout => {
                FfiNodeError::FeerateEstimationUpdateTimeout
            }
            NodeError::WalletOperationTimeout => FfiNodeError::WalletOperationTimeout,
            NodeError::TxSyncTimeout => FfiNodeError::TxSyncTimeout,
            NodeError::GossipUpdateTimeout => FfiNodeError::GossipUpdateTimeout,
            NodeError::InvalidOfferId => FfiNodeError::InvalidOfferId,
            NodeError::InvalidNodeId => FfiNodeError::InvalidNodeId,
            NodeError::InvalidOffer => FfiNodeError::InvalidOffer,
            NodeError::InvalidRefund => FfiNodeError::InvalidRefund,
            NodeError::UnsupportedCurrency => FfiNodeError::UnsupportedCurrency,
            NodeError::UriParameterParsingFailed => FfiNodeError::UriParameterParsingFailed,
            NodeError::InvalidUri => FfiNodeError::InvalidUri,
            NodeError::InvalidQuantity => FfiNodeError::InvalidQuantity,
            NodeError::InvalidNodeAlias => FfiNodeError::InvalidNodeAlias,
        }
    }
}
impl From<BuildError> for FfiBuilderError {
    fn from(value: BuildError) -> Self {
        match value {
            BuildError::InvalidSeedBytes => FfiBuilderError::InvalidSeedBytes,
            BuildError::InvalidSeedFile => FfiBuilderError::InvalidSeedFile,
            BuildError::InvalidSystemTime => FfiBuilderError::InvalidSystemTime,
            BuildError::ReadFailed => FfiBuilderError::ReadFailed,
            BuildError::WriteFailed => FfiBuilderError::WriteFailed,
            BuildError::StoragePathAccessFailed => FfiBuilderError::StoragePathAccessFailed,
            BuildError::WalletSetupFailed => FfiBuilderError::WalletSetupFailed,
            BuildError::LoggerSetupFailed => FfiBuilderError::LoggerSetupFailed,
            BuildError::InvalidChannelMonitor => FfiBuilderError::InvalidChannelMonitor,
            BuildError::KVStoreSetupFailed => FfiBuilderError::KVStoreSetupFailed,
            BuildError::InvalidListeningAddresses => FfiBuilderError::InvalidListeningAddress,
            BuildError::InvalidNodeAlias => FfiBuilderError::InvalidNodeAlias,
        }
    }
}

impl From<ldk_node::bip39::Error> for FfiBuilderError {
    fn from(value: ldk_node::bip39::Error) -> Self {
        match value {
            ldk_node::bip39::Error::BadWordCount(_) => FfiBuilderError::InvalidSeedBytes,
            ldk_node::bip39::Error::UnknownWord(_) => FfiBuilderError::InvalidSeedBytes,
            ldk_node::bip39::Error::BadEntropyBitCount(_) => FfiBuilderError::InvalidSeedBytes,
            ldk_node::bip39::Error::InvalidChecksum => FfiBuilderError::InvalidSeedBytes,
            ldk_node::bip39::Error::AmbiguousLanguages(_) => FfiBuilderError::InvalidSeedBytes,
        }
    }
}
impl From<ldk_node::lightning::ln::msgs::DecodeError> for FfiNodeError {
    fn from(value: ldk_node::lightning::ln::msgs::DecodeError) -> Self {
        FfiNodeError::Decode(value.into())
    }
}
impl From<ldk_node::lightning::ln::msgs::DecodeError> for DecodeError {
    fn from(e: ldk_node::lightning::ln::msgs::DecodeError) -> Self {
        match e {
            ldk_node::lightning::ln::msgs::DecodeError::UnknownVersion => {
                DecodeError::UnknownVersion
            }
            ldk_node::lightning::ln::msgs::DecodeError::UnknownRequiredFeature => {
                DecodeError::UnknownRequiredFeature
            }
            ldk_node::lightning::ln::msgs::DecodeError::InvalidValue => DecodeError::InvalidValue,
            ldk_node::lightning::ln::msgs::DecodeError::ShortRead => DecodeError::ShortRead,
            ldk_node::lightning::ln::msgs::DecodeError::BadLengthDescriptor => {
                DecodeError::BadLengthDescriptor
            }
            ldk_node::lightning::ln::msgs::DecodeError::Io(e) =>
                DecodeError::Io(match e {
                    ldk_node::bitcoin::io::ErrorKind::NotFound =>
                        "An entity was not found.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::PermissionDenied =>
                        "operation lacked the necessary privileges to complete.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::ConnectionRefused =>
                        " connection was refused by the remote server..".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::ConnectionReset =>
                        "connection was reset by the remote server.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::ConnectionAborted =>
                        " connection was aborted (terminated) by the remote server.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::NotConnected =>
                        "network operation failed because it was not connected yet.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::AddrInUse =>
                        "socket address could not be bound because the address is already in use elsewhere.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::AddrNotAvailable =>
                        "nonexistent interface was requested or the requested address was not local.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::BrokenPipe =>
                        "operation failed because a pipe was closed.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::AlreadyExists =>
                        "entity already exists.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::WouldBlock =>
                        "operation needs to block to complete, but the blocking operation was requested to not occur.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::InvalidInput =>
                        "parameter was incorrect.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::InvalidData =>
                        "data not valid for the operation were encountered.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::TimedOut =>
                        " I/O operation’s timeout expired, causing it to be canceled.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::WriteZero =>
                        "error returned when an operation could not be completed because a call to write".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::Interrupted =>
                        " operation was interrupted.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::UnexpectedEof =>
                        "error returned when an operation could not be completed because an “end of file” was reached prematurely.".to_string(),
                    ldk_node::bitcoin::io::ErrorKind::Other =>
                        "custom error that does not fall under any other I/O error kind".to_string(),
                }),
            ldk_node::lightning::ln::msgs::DecodeError::UnsupportedCompression => {
                DecodeError::UnsupportedCompression
            }
            ldk_node::lightning::ln::msgs::DecodeError::DangerousValue => {
                DecodeError::DangerousValue
            }
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
impl From<ldk_node::lightning::offers::parse::Bolt12ParseError> for FfiNodeError {
    fn from(value: ldk_node::lightning::offers::parse::Bolt12ParseError) -> Self {
        match value {
            ldk_node::lightning::offers::parse::Bolt12ParseError::InvalidContinuation => {
                FfiNodeError::Bolt12Parse(Bolt12ParseError::InvalidContinuation)
            }
            ldk_node::lightning::offers::parse::Bolt12ParseError::InvalidBech32Hrp => {
                FfiNodeError::Bolt12Parse(Bolt12ParseError::InvalidBech32Hrp)
            }
            ldk_node::lightning::offers::parse::Bolt12ParseError::Bech32(e) => {
                FfiNodeError::Bolt12Parse(Bolt12ParseError::Bech32(e.to_string()))
            }
            ldk_node::lightning::offers::parse::Bolt12ParseError::Decode(e) => {
                FfiNodeError::Bolt12Parse(Bolt12ParseError::Decode(e.into()))
            }
            ldk_node::lightning::offers::parse::Bolt12ParseError::InvalidSemantics(e) => {
                FfiNodeError::Bolt12Parse(Bolt12ParseError::InvalidSemantics(format!("{:?}", e)))
            }
            ldk_node::lightning::offers::parse::Bolt12ParseError::InvalidSignature(e) => {
                FfiNodeError::Bolt12Parse(Bolt12ParseError::InvalidSignature(e.to_string()))
            }
        }
    }
}
