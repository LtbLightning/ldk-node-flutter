import '../generated/utils/error.dart' as error;

abstract class ExceptionBase implements Exception {
  String? message;
  ExceptionBase({this.message});
  @override
  String toString() =>
      (message != null) ? '$runtimeType( $message )' : runtimeType.toString();
}

/// Returned when trying to start [Node] while it is already running.
class NodeException extends ExceptionBase {
  NodeException({super.message});
}

class BuilderException extends ExceptionBase {
  BuilderException({super.message});
}

BuilderException mapFfiBuilderError(error.FfiBuilderError e) {
  switch (e) {
    case error.FfiBuilderError.invalidSeedBytes:
      return BuilderException(message: "Given seed bytes are invalid.");
    case error.FfiBuilderError.invalidSeedFile:
      return BuilderException(
          message: "Given seed file is invalid or could not be read.");
    case error.FfiBuilderError.invalidSystemTime:
      return BuilderException(
          message:
              "System time is invalid. Clocks might have gone back in time.");
    case error.FfiBuilderError.readFailed:
      return BuilderException(message: "Failed to read from store.");
    case error.FfiBuilderError.writeFailed:
      return BuilderException(message: "Failed to write to store.");
    case error.FfiBuilderError.storagePathAccessFailed:
      return BuilderException(
          message: "Failed to access the given storage path.");
    case error.FfiBuilderError.walletSetupFailed:
      return BuilderException(message: "Failed to setup onchain wallet.");
    case error.FfiBuilderError.loggerSetupFailed:
      return BuilderException(message: "Failed to setup the logger.");

    case error.FfiBuilderError.invalidChannelMonitor:
      return BuilderException(
          message: "Failed to watch a deserialized ChannelMonitor.");
    case error.FfiBuilderError.invalidListeningAddress:
      return BuilderException(
          message: "Given listening addresses are invalid.");
    case error.FfiBuilderError.kvStoreSetupFailed:
      return BuilderException(message: "Failed to setup KVStore.");
    case error.FfiBuilderError.socketAddressParseError:
      return BuilderException(message: "Invalid SocketAddress.");
    case error.FfiBuilderError.invalidNodeAlias:
      return BuilderException(message: "Invalid NodeAlias.");
    case error.FfiBuilderError.invalidPublicKey:
      return BuilderException(message: "Invalid PublicKey.");
  }
}

NodeException mapFfiNodeError(error.FfiNodeError e) {
  return e.map(
      alreadyRunning: (_) => NodeException(message: "Node is already running."),
      notRunning: (_) => NodeException(message: "Node is not running."),
      onchainTxCreationFailed: (_) =>
          NodeException(message: "On-chain transaction could not be created."),
      connectionFailed: (_) =>
          NodeException(message: "Network connection closed."),
      paymentSendingFailed: (_) =>
          NodeException(message: "Failed to send the given payment."),
      probeSendingFailed: (_) =>
          NodeException(message: "Failed to send the given payment probe."),
      channelCreationFailed: (_) =>
          NodeException(message: "Failed to create channel."),
      channelClosingFailed: (_) =>
          NodeException(message: "Failed to close channel."),
      channelConfigUpdateFailed: (_) =>
          NodeException(message: "Failed to update channel config."),
      persistenceFailed: (_) =>
          NodeException(message: "Failed to persist data."),
      walletOperationFailed: (_) =>
          NodeException(message: "Failed to conduct wallet operation."),
      onchainTxSigningFailed: (_) =>
          NodeException(message: "Failed to sign given transaction."),
      messageSigningFailed: (_) =>
          NodeException(message: "Failed to sign given message."),
      txSyncFailed: (_) =>
          NodeException(message: "Failed to sync transactions."),
      gossipUpdateFailed: (_) =>
          NodeException(message: "Failed to update gossip data."),
      invalidAddress: (_) =>
          NodeException(message: "The given address is invalid."),
      invalidSocketAddress: (_) =>
          NodeException(message: "The given network address is invalid."),
      invalidPublicKey: (_) =>
          NodeException(message: "The given public key is invalid."),
      invalidSecretKey: (_) =>
          NodeException(message: "The given secret key is invalid."),
      invalidPaymentHash: (_) =>
          NodeException(message: "The given payment hash is invalid."),
      invalidPaymentPreimage: (_) =>
          NodeException(message: "The given payment preimage is invalid."),
      invalidPaymentSecret: (_) =>
          NodeException(message: "The given payment secret is invalid."),
      invalidAmount: (_) =>
          NodeException(message: "The given amount is invalid."),
      invalidInvoice: (_) =>
          NodeException(message: "The given invoice is invalid."),
      invalidChannelId: (_) =>
          NodeException(message: "The given channel ID is invalid."),
      invoiceCreationFailed: (_) =>
          NodeException(message: "Failed to create invoice."),
      invalidNetwork: (_) =>
          NodeException(message: "The given network is invalid."),
      duplicatePayment: (_) => NodeException(
          message: "A payment with the given hash has already been initiated."),
      insufficientFunds: (_) => NodeException(
          message:
              "There are insufficient funds to complete the given operation."),
      feerateEstimationUpdateFailed: (_) =>
          NodeException(message: "Failed to update fee rate estimation."),
      liquidityRequestFailed: (_) =>
          NodeException(message: "Liquidity request operation failed."),
      liquiditySourceUnavailable: (_) => NodeException(message: "Liquidity operation failed due to the required liquidity source being unavailable."),
      liquidityFeeTooHigh: (_) => NodeException(message: "Liquidity operation failed due to the LSP's required opening fee being too high."),
      invalidTxid: (_) => NodeException(message: "The given transaction id is Invalid."),
      invalidPaymentId: (_) => NodeException(message: "The given paymentId is invalid."),
      decode: (e) => mapLdkDecodeError(e.field0),
      bolt12Parse: (e) => NodeException(message: e.toString()),
      walletOperationTimeout: (e) => NodeException(message: "A wallet operation timed out."),
      invoiceRequestCreationFailed: (e) => NodeException(message: "Invoice request creation failed."),
      offerCreationFailed: (e) => NodeException(message: "Offer creation failed."),
      refundCreationFailed: (e) => NodeException(message: "Refund creation failed."),
      feerateEstimationUpdateTimeout: (e) => NodeException(message: "A fee rate estimation update timed out."),
      txSyncTimeout: (e) => NodeException(message: "A transaction sync operation timed out."),
      gossipUpdateTimeout: (e) => NodeException(message: "A gossip updating operation timed out."),
      invalidOfferId: (e) => NodeException(message: "The given offer id is invalid."),
      invalidNodeId: (e) => NodeException(message: "The given node id is invalid."),
      invalidOffer: (e) => NodeException(message: "The given offer is invalid."),
      invalidRefund: (e) => NodeException(message: "The given refund is invalid."),
      unsupportedCurrency: (e) => NodeException(message: "The provided offer was denominated in an unsupported currency."),
      uriParameterParsingFailed: (e) => NodeException(message: "Parsing a URI parameter has failed."),
      invalidUri: (e) => NodeException(message: "The given URI is invalid."),
      invalidQuantity: (e) => NodeException(message: "The given quantity is invalid."),
      invalidNodeAlias: (e) => NodeException(message: "The given node alias is invalid."));
}

NodeException mapLdkDecodeError(error.DecodeError e) {
  return e.map(
      unknownVersion: (e) => NodeException(
          message:
              "A version byte specified something we don’t know how to handle. Includes unknown realm byte in an onion hop data packet."),
      unknownRequiredFeature: (e) => NodeException(
          message:
              "Unknown feature mandating we fail to parse message (e.g., TLV with an even, unknown type)."),
      invalidValue: (e) => NodeException(
          message:
              "Invalid value, a byte which was supposed to be a bool was something other than a 0 or 1, a public key/private key/signature was invalid, text wasn’t UTF-8, TLV was syntactically incorrect, etc."),
      shortRead: (e) =>
          NodeException(message: "The buffer to be read was too short."),
      badLengthDescriptor: (e) => NodeException(
          message:
              "A length descriptor in the packet didn’t describe the later data correctly. "),
      io: (e) => NodeException(message: "Io: ${e.toString()}"),
      unsupportedCompression: (e) => NodeException(
          message:
              "The message included zlib-compressed values, which we don’t support. "),
      dangerousValue: (e) => NodeException(
          message: "Value is validly encoded but is dangerous to use. "));
}
