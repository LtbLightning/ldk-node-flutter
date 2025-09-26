import '../generated/utils/error.dart' as error;

abstract class LdkFfiException implements Exception {
  String? errorMessage;
  String code;
  LdkFfiException({this.errorMessage, required this.code});
  @override
  String toString() => (errorMessage != null)
      ? '$runtimeType( code:$code, error:$errorMessage )'
      : '$runtimeType( code:$code )';
}

/// Returned when trying to start [flutter_rust_bridge].
class BridgeException extends LdkFfiException {
  BridgeException({super.errorMessage, required super.code});
}

/// Exception thrown for node operation failures
class NodeException extends LdkFfiException {
  NodeException({super.errorMessage, required super.code});
}

/// Exception thrown for builder configuration failures
class BuilderException extends LdkFfiException {
  BuilderException({super.errorMessage, required super.code});
}

/// Exception thrown for payment operation failures
class PaymentException extends LdkFfiException {
  PaymentException({super.errorMessage, required super.code});
}

/// Exception thrown for channel operation failures
class ChannelException extends LdkFfiException {
  ChannelException({super.errorMessage, required super.code});
}

/// Exception thrown for wallet operation failures
class WalletException extends LdkFfiException {
  WalletException({super.errorMessage, required super.code});
}

/// Exception thrown for validation failures (invalid inputs)
class ValidationException extends LdkFfiException {
  ValidationException({super.errorMessage, required super.code});
}

/// Exception thrown for network/connection failures
class NetworkException extends LdkFfiException {
  NetworkException({super.errorMessage, required super.code});
}

/// Exception thrown for timeout operations
class TimeoutException extends LdkFfiException {
  TimeoutException({super.errorMessage, required super.code});
}

/// Exception thrown for liquidity service failures
class LiquidityException extends LdkFfiException {
  LiquidityException({super.errorMessage, required super.code});
}

/// Exception thrown for decoding/parsing failures
class DecodeException extends LdkFfiException {
  DecodeException({super.errorMessage, required super.code});
}

BuilderException mapFfiBuilderError(error.FfiBuilderError e) {
  switch (e) {
    case error.FfiBuilderError.invalidSeedBytes:
      return BuilderException(code: "InvalidSeedBytes", errorMessage: "Given seed bytes are invalid.");
    case error.FfiBuilderError.invalidSeedFile:
      return BuilderException(code: "InvalidSeedFile",
          errorMessage: "Given seed file is invalid or could not be read.");
    case error.FfiBuilderError.invalidSystemTime:
      return BuilderException(code: "InvalidSystemTime",
          errorMessage:
              "System time is invalid. Clocks might have gone back in time.");
    case error.FfiBuilderError.readFailed:
      return BuilderException(code: "ReadFailed", errorMessage: "Failed to read from store.");
    case error.FfiBuilderError.writeFailed:
      return BuilderException(code: "WriteFailed", errorMessage: "Failed to write to store.");
    case error.FfiBuilderError.storagePathAccessFailed:
      return BuilderException(code: "StoragePathAccessFailed",
          errorMessage: "Failed to access the given storage path.");
    case error.FfiBuilderError.walletSetupFailed:
      return BuilderException(code: "WalletSetupFailed", errorMessage: "Failed to setup onchain wallet.");
    case error.FfiBuilderError.loggerSetupFailed:
      return BuilderException(code: "LoggerSetupFailed", errorMessage: "Failed to setup the logger.");

    case error.FfiBuilderError.invalidChannelMonitor:
      return BuilderException(code: "InvalidChannelMonitor",
          errorMessage: "Failed to watch a deserialized ChannelMonitor.");
    case error.FfiBuilderError.invalidListeningAddress:
      return BuilderException(code: "InvalidListeningAddress",
          errorMessage: "Given listening addresses are invalid.");
    case error.FfiBuilderError.kvStoreSetupFailed:
      return BuilderException(code: "KvStoreSetupFailed", errorMessage: "Failed to setup KVStore.");
    case error.FfiBuilderError.socketAddressParseError:
      return BuilderException(code: "SocketAddressParseError", errorMessage: "Invalid SocketAddress.");
    case error.FfiBuilderError.invalidNodeAlias:
      return BuilderException(code: "InvalidNodeAlias", errorMessage: "Invalid NodeAlias.");
    case error.FfiBuilderError.invalidPublicKey:
      return BuilderException(code: "InvalidPublicKey", errorMessage: "Invalid PublicKey.");
    case error.FfiBuilderError.invalidAnnouncementAddresses:
      return BuilderException(code: "InvalidAnnouncementAddresses",
          errorMessage: "Invalid AnnouncementAddresses. e.g. too many were passed.");
    case error.FfiBuilderError.networkMismatch:
      return BuilderException(code: "NetworkMismatch",
          errorMessage:
              "The given network does not match the node's previously configured network.");
    case error.FfiBuilderError.opaqueNotFound:
      return BuilderException(code: "OpaqueNotFound",
          errorMessage:
              "The given opaque data could not be found. This might be due to a previous operation failing.");
  }
}

LdkFfiException mapFfiNodeError(error.FfiNodeError e) {
  return e.map(
      alreadyRunning: (_) => NodeException(code: "AlreadyRunning", errorMessage: "Node is already running."),
      notRunning: (_) => NodeException(code: "NotRunning", errorMessage: "Node is not running."),
      onchainTxCreationFailed: (_) =>
          WalletException(code: "OnchainTxCreationFailed", errorMessage: "On-chain transaction could not be created."),
      connectionFailed: (_) =>
          NetworkException(code: "ConnectionFailed", errorMessage: "Network connection closed."),
      paymentSendingFailed: (_) =>
          PaymentException(code: "PaymentSendingFailed", errorMessage: "Failed to send the given payment."),
      probeSendingFailed: (_) =>
          PaymentException(code: "ProbeSendingFailed", errorMessage: "Failed to send the given payment probe."),
      channelCreationFailed: (_) =>
          ChannelException(code: "ChannelCreationFailed", errorMessage: "Failed to create channel."),
      channelClosingFailed: (_) =>
          ChannelException(code: "ChannelClosingFailed", errorMessage: "Failed to close channel."),
      channelConfigUpdateFailed: (_) =>
          ChannelException(code: "ChannelConfigUpdateFailed", errorMessage: "Failed to update channel config."),
      persistenceFailed: (_) =>
          NodeException(code: "PersistenceFailed", errorMessage: "Failed to persist data."),
      walletOperationFailed: (_) =>
          WalletException(code: "WalletOperationFailed", errorMessage: "Failed to conduct wallet operation."),
      onchainTxSigningFailed: (_) =>
          WalletException(code: "OnchainTxSigningFailed", errorMessage: "Failed to sign given transaction."),
      messageSigningFailed: (_) =>
          NodeException(code: "MessageSigningFailed", errorMessage: "Failed to sign given message."),
      txSyncFailed: (_) =>
          WalletException(code: "TxSyncFailed", errorMessage: "Failed to sync transactions."),
      gossipUpdateFailed: (_) =>
          NetworkException(code: "GossipUpdateFailed", errorMessage: "Failed to update gossip data."),
      invalidAddress: (_) =>
          ValidationException(code: "InvalidAddress", errorMessage: "The given address is invalid."),
      invalidSocketAddress: (_) =>
          ValidationException(code: "InvalidSocketAddress", errorMessage: "The given network address is invalid."),
      invalidPublicKey: (_) =>
          ValidationException(code: "InvalidPublicKey", errorMessage: "The given public key is invalid."),
      invalidSecretKey: (_) =>
          ValidationException(code: "InvalidSecretKey", errorMessage: "The given secret key is invalid."),
      invalidPaymentHash: (_) =>
          ValidationException(code: "InvalidPaymentHash", errorMessage: "The given payment hash is invalid."),
      invalidPaymentPreimage: (_) =>
          ValidationException(code: "InvalidPaymentPreimage", errorMessage: "The given payment preimage is invalid."),
      invalidPaymentSecret: (_) =>
          ValidationException(code: "InvalidPaymentSecret", errorMessage: "The given payment secret is invalid."),
      invalidAmount: (_) =>
          ValidationException(code: "InvalidAmount", errorMessage: "The given amount is invalid."),
      invalidInvoice: (_) =>
          ValidationException(code: "InvalidInvoice", errorMessage: "The given invoice is invalid."),
      invalidChannelId: (_) =>
          ValidationException(code: "InvalidChannelId", errorMessage: "The given channel ID is invalid."),
      invoiceCreationFailed: (_) =>
          PaymentException(code: "InvoiceCreationFailed", errorMessage: "Failed to create invoice."),
      invalidNetwork: (_) =>
          ValidationException(code: "InvalidNetwork", errorMessage: "The given network is invalid."),
      duplicatePayment: (_) => PaymentException(code: "DuplicatePayment",
          errorMessage: "A payment with the given hash has already been initiated."),
      insufficientFunds: (_) => WalletException(code: "InsufficientFunds",
          errorMessage:
              "There are insufficient funds to complete the given operation."),
      feerateEstimationUpdateFailed: (_) =>
          NetworkException(code: "FeerateEstimationUpdateFailed", errorMessage: "Failed to update fee rate estimation."),
      liquidityRequestFailed: (_) =>
          LiquidityException(code: "LiquidityRequestFailed", errorMessage: "Liquidity request operation failed."),
      liquiditySourceUnavailable: (_) => LiquidityException(code: "LiquiditySourceUnavailable",
          errorMessage:
              "Liquidity operation failed due to the required liquidity source being unavailable."),
      liquidityFeeTooHigh: (_) => LiquidityException(code: "LiquidityFeeTooHigh",
          errorMessage:
              "Liquidity operation failed due to the LSP's required opening fee being too high."),
      invalidTxid: (_) =>
          ValidationException(code: "InvalidTxid", errorMessage: "The given transaction id is Invalid."),
      invalidPaymentId: (_) => ValidationException(code: "InvalidPaymentId", errorMessage: "The given paymentId is invalid."),
      decode: (e) => mapLdkDecodeError(e.field0),
      bolt12Parse: (e) => DecodeException(code: "Bolt12Parse", errorMessage: e.toString()),
      walletOperationTimeout: (e) => TimeoutException(code: "WalletOperationTimeout", errorMessage: "A wallet operation timed out."),
      invoiceRequestCreationFailed: (e) => PaymentException(code: "InvoiceRequestCreationFailed", errorMessage: "Invoice request creation failed."),
      offerCreationFailed: (e) => PaymentException(code: "OfferCreationFailed", errorMessage: "Offer creation failed."),
      refundCreationFailed: (e) => PaymentException(code: "RefundCreationFailed", errorMessage: "Refund creation failed."),
      feerateEstimationUpdateTimeout: (e) => TimeoutException(code: "FeerateEstimationUpdateTimeout", errorMessage: "A fee rate estimation update timed out."),
      txSyncTimeout: (e) => TimeoutException(code: "TxSyncTimeout", errorMessage: "A transaction sync operation timed out."),
      gossipUpdateTimeout: (e) => TimeoutException(code: "GossipUpdateTimeout", errorMessage: "A gossip updating operation timed out."),
      invalidOfferId: (e) => ValidationException(code: "InvalidOfferId", errorMessage: "The given offer id is invalid."),
      invalidNodeId: (e) => ValidationException(code: "InvalidNodeId", errorMessage: "The given node id is invalid."),
      invalidOffer: (e) => ValidationException(code: "InvalidOffer", errorMessage: "The given offer is invalid."),
      invalidRefund: (e) => ValidationException(code: "InvalidRefund", errorMessage: "The given refund is invalid."),
      unsupportedCurrency: (e) => ValidationException(code: "UnsupportedCurrency", errorMessage: "The provided offer was denominated in an unsupported currency."),
      uriParameterParsingFailed: (e) => DecodeException(code: "UriParameterParsingFailed", errorMessage: "Parsing a URI parameter has failed."),
      invalidUri: (e) => ValidationException(code: "InvalidUri", errorMessage: "The given URI is invalid."),
      invalidQuantity: (e) => ValidationException(code: "InvalidQuantity", errorMessage: "The given quantity is invalid."),
      invalidNodeAlias: (e) => ValidationException(code: "InvalidNodeAlias", errorMessage: "The given node alias is invalid."),
      invalidCustomTlvs: (e) {
        return PaymentException(code: "InvalidCustomTlvs",
            errorMessage: "Sending of spontaneous payment with custom TLVs failed.");
      },
      invalidDateTime: (e) {
        return ValidationException(code: "InvalidDateTime", errorMessage: "The given date time is invalid.");
      },
      invalidFeeRate: (e) {
        return ValidationException(code: "InvalidFeeRate", errorMessage: "The given fee rate is invalid.");
      },
      creationError: (e) {
        return mapFfiCreationError(e.field0);
      });
}

PaymentException mapFfiCreationError(error.FfiCreationError e) {
  switch (e) {
    case error.FfiCreationError.descriptionTooLong:
      return PaymentException(code: "DescriptionTooLong",
          errorMessage: "Description is too long. It must be less than 640 bytes.");
    case error.FfiCreationError.routeTooLong:
      return PaymentException(code: "RouteTooLong", errorMessage: "Route is too long.");
    case error.FfiCreationError.timestampOutOfBounds:
      return PaymentException(code: "TimestampOutOfBounds", errorMessage: "Timestamp is out of bounds.");
    case error.FfiCreationError.invalidAmount:
      return PaymentException(code: "InvalidAmount", errorMessage: "Amount is invalid.");
    case error.FfiCreationError.missingRouteHints:
      return PaymentException(code: "MissingRouteHints", errorMessage: "Route hints are missing.");
    case error.FfiCreationError.minFinalCltvExpiryDeltaTooShort:
      return PaymentException(code: "MinFinalCltvExpiryDeltaTooShort",
          errorMessage: "Minimum final CLTV expiry delta is too short.");
  }
}

DecodeException mapLdkDecodeError(error.DecodeError e) {
  return e.map(
      unknownVersion: (e) => DecodeException(code: "UnknownVersion",
          errorMessage:
              "A version byte specified something we don’t know how to handle. Includes unknown realm byte in an onion hop data packet."),
      unknownRequiredFeature: (e) => DecodeException(code: "UnknownRequiredFeature",
          errorMessage:
              "Unknown feature mandating we fail to parse message (e.g., TLV with an even, unknown type)."),
      invalidValue: (e) => DecodeException(code: "InvalidValue",
          errorMessage:
              "Invalid value, a byte which was supposed to be a bool was something other than a 0 or 1, a public key/private key/signature was invalid, text wasn’t UTF-8, TLV was syntactically incorrect, etc."),
      shortRead: (e) =>
          DecodeException(code: "ShortRead", errorMessage: "The buffer to be read was too short."),
      badLengthDescriptor: (e) => DecodeException(code: "BadLengthDescriptor",
          errorMessage:
              "A length descriptor in the packet didn’t describe the later data correctly. "),
      io: (e) => DecodeException(code: "IoError", errorMessage: "Io: ${e.toString()}"),
      unsupportedCompression: (e) => DecodeException(code: "UnsupportedCompression",
          errorMessage:
              "The message included zlib-compressed values, which we don’t support. "),
      dangerousValue: (e) => DecodeException(code: "DangerousValue",
          errorMessage: "Value is validly encoded but is dangerous to use. "));
}
