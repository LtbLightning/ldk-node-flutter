use std::fmt;

#[derive(Debug)]
#[allow(dead_code)]
/// An error that possibly needs to be handled by the user.
pub enum Error {
    /// Returned when trying to start LdkLite while it is already running.
    AlreadyRunning,
    /// Returned when trying to stop LdkLite while it is not running.
    NotRunning,
    /// The funding transaction could not be created.
    FundingTxCreationFailed,
    /// A network connection has been closed.
    ConnectionFailed,
    /// Payment of the given invoice has already been intiated.
    NonUniquePaymentHash,
    /// The given invoice is invalid.
    InvoiceInvalid,
    /// Invoice creation failed.
    InvoiceCreationFailed,
    /// No route for the given target could be found.
    RoutingFailed,
    /// A given peer info could not be parsed.
    PeerInfoParseFailed,
    /// A channel could not be opened.
    ChannelCreationFailed,
    /// A channel could not be closed.
    ChannelClosingFailed,
    /// Persistence failed.
    PersistenceFailed,
    /// A wallet operation failed.
    WalletOperationFailed {
        /// The hash of the payment.
        error: String,
    },
    /// A siging operation failed.
    WalletSigningFailed,
    /// A transaction sync operation failed.
    TxSyncFailed,
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Self::AlreadyRunning => write!(f, "LDKLite is already running."),
            Self::NotRunning => write!(f, "LDKLite is not running."),
            Self::FundingTxCreationFailed => {
                write!(f, "Funding transaction could not be created.")
            }
            Self::ConnectionFailed => write!(f, "Network connection closed."),
            Self::NonUniquePaymentHash => write!(f, "An invoice must not get payed twice."),
            Self::InvoiceInvalid => write!(f, "The given invoice is invalid."),
            Self::InvoiceCreationFailed => write!(f, "Failed to create invoice."),
            Self::RoutingFailed => write!(f, "Failed to find route."),
            Self::PeerInfoParseFailed => write!(f, "Failed to parse the given peer information."),
            Self::ChannelCreationFailed => write!(f, "Failed to create channel."),
            Self::ChannelClosingFailed => write!(f, "Failed to close channel."),
            Self::PersistenceFailed => write!(f, "Failed to persist data."),
            Self::WalletOperationFailed { error } => {
                write!(f, "Failed to conduct wallet operation:{:?}", error)
            }
            Self::WalletSigningFailed => write!(f, "Failed to sign given transaction."),
            Self::TxSyncFailed => write!(f, "Failed to sync transactions."),
        }
    }
}

impl std::error::Error for Error {}

impl From<bdk::Error> for Error {
    fn from(e: bdk::Error) -> Self {
        match e {
            bdk::Error::Signer(_) => Self::WalletSigningFailed,
            bdk::Error::InvalidU32Bytes(e) => Self::WalletOperationFailed {
                error: format!("InvalidU32Bytes: {:?}", e),
            },
            bdk::Error::Generic(e) => Self::WalletOperationFailed {
                error: format!("Generic error: {:?}", e),
            },
            bdk::Error::ScriptDoesntHaveAddressForm => Self::WalletOperationFailed {
                error: format!("ScriptDoesntHaveAddressForm"),
            },
            bdk::Error::NoRecipients => Self::WalletOperationFailed {
                error: format!("NoRecipients"),
            },
            bdk::Error::NoUtxosSelected => Self::WalletOperationFailed {
                error: format!("NoUtxosSelected"),
            },
            bdk::Error::OutputBelowDustLimit(e) => Self::WalletOperationFailed {
                error: format!("OutputBelowDustLimit: {:?}", e),
            },
            bdk::Error::InsufficientFunds { needed, available } => Self::WalletOperationFailed {
                error: format!(
                    "InsufficientFunds available: {:?}, needed: {:?}",
                    available, needed
                ),
            },
            bdk::Error::BnBTotalTriesExceeded => Self::WalletOperationFailed {
                error: format!("BnBTotalTriesExceeded"),
            },
            bdk::Error::BnBNoExactMatch => Self::WalletOperationFailed {
                error: format!("BnBNoExactMatch"),
            },
            bdk::Error::UnknownUtxo => Self::WalletOperationFailed {
                error: format!("UnknownUtxo"),
            },
            bdk::Error::TransactionNotFound => Self::WalletOperationFailed {
                error: format!("TransactionNotFound"),
            },
            bdk::Error::TransactionConfirmed => Self::WalletOperationFailed {
                error: format!("TransactionConfirmed"),
            },
            bdk::Error::IrreplaceableTransaction => Self::WalletOperationFailed {
                error: format!("IrreplaceableTransaction"),
            },
            bdk::Error::FeeRateTooLow { required } => Self::WalletOperationFailed {
                error: format!("FeeRateTooLow: {:?}", required),
            },
            bdk::Error::FeeTooLow { required } => Self::WalletOperationFailed {
                error: format!("FeeTooLow: {:?}", required),
            },
            bdk::Error::FeeRateUnavailable => Self::WalletOperationFailed {
                error: format!("IrreplaceableTransaction"),
            },
            bdk::Error::MissingKeyOrigin(e) => Self::WalletOperationFailed {
                error: format!("MissingKeyOrigin: {:?}", e),
            },
            bdk::Error::Key(e) => Self::WalletOperationFailed {
                error: format!("Key error: {:?}", e),
            },
            bdk::Error::InvalidProgressValue(e) => Self::WalletOperationFailed {
                error: format!("InvalidProgressValue: {:?}", e),
            },
            bdk::Error::ProgressUpdateError => Self::WalletOperationFailed {
                error: format!("ProgressUpdateError"),
            },
            bdk::Error::InvalidOutpoint(e) => Self::WalletOperationFailed {
                error: format!("InvalidOutpoint: {:?}", e),
            },
            bdk::Error::Descriptor(e) => Self::WalletOperationFailed {
                error: format!("Descriptor error: {:?}", e),
            },
            bdk::Error::Encode(e) => Self::WalletOperationFailed {
                error: format!("Encode error: {:?}", e),
            },
            bdk::Error::Miniscript(e) => Self::WalletOperationFailed {
                error: format!("MiniScript error: {:?}", e),
            },
            bdk::Error::MiniscriptPsbt(e) => Self::WalletOperationFailed {
                error: format!("MiniscriptPsbt: {:?}", e),
            },
            bdk::Error::Bip32(e) => Self::WalletOperationFailed {
                error: format!("Bip32 error: {:?}", e),
            },
            bdk::Error::Secp256k1(e) => Self::WalletOperationFailed {
                error: format!("Secp256k1 error: {:?}", e),
            },
            bdk::Error::Json(e) => Self::WalletOperationFailed {
                error: format!("Json error: {:?}", e),
            },
            bdk::Error::Hex(e) => Self::WalletOperationFailed {
                error: format!("Hex error: {:?}", e),
            },
            bdk::Error::Psbt(e) => Self::WalletOperationFailed {
                error: format!("Psbt error: {:?}", e),
            },
            bdk::Error::PsbtParse(e) => Self::WalletOperationFailed {
                error: format!("PsbtParse error: {:?}", e),
            },
            bdk::Error::MissingCachedScripts(e) => Self::WalletOperationFailed {
                error: format!("MissingCachedScripts: {:?}", e),
            },
            bdk::Error::Esplora(e) => Self::WalletOperationFailed {
                error: format!("Esplora error: {:?}", e),
            },
            bdk::Error::Sled(e) => Self::WalletOperationFailed {
                error: format!("Sled error: {:?}", e),
            },
            _ => Self::WalletOperationFailed {
                error: "Unknown bdk error".to_string(),
            },
        }
    }
}

impl From<lightning_transaction_sync::TxSyncError> for Error {
    fn from(_e: lightning_transaction_sync::TxSyncError) -> Self {
        Self::TxSyncFailed
    }
}
