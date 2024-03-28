import '../generated/api/error.dart' as bridge;

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

BuilderException mapBuilderError(bridge.BuilderError e) {
  switch (e) {
    case bridge.BuilderError.invalidSeedBytes:
      return BuilderException(message: "Given seed bytes are invalid.");
    case bridge.BuilderError.invalidSeedFile:
      return BuilderException(
          message: "Given seed file is invalid or could not be read.");
    case bridge.BuilderError.invalidSystemTime:
      return BuilderException(
          message:
              "System time is invalid. Clocks might have gone back in time.");
    case bridge.BuilderError.readFailed:
      return BuilderException(message: "Failed to read from store.");
    case bridge.BuilderError.writeFailed:
      return BuilderException(message: "Failed to write to store.");
    case bridge.BuilderError.storagePathAccessFailed:
      return BuilderException(
          message: "Failed to access the given storage path.");
    case bridge.BuilderError.walletSetupFailed:
      return BuilderException(message: "Failed to setup onchain wallet.");
    case bridge.BuilderError.loggerSetupFailed:
      return BuilderException(message: "Failed to setup the logger.");

    case bridge.BuilderError.invalidChannelMonitor:
      return BuilderException(
          message: "Failed to watch a deserialized ChannelMonitor.");
    case bridge.BuilderError.invalidListeningAddresses:
      return BuilderException(
          message: "Given listening addresses are invalid.");
    case bridge.BuilderError.kvStoreSetupFailed:
      return BuilderException(message: "Failed to setup KVStore.");
    case bridge.BuilderError.socketAddressParseError:
      return BuilderException(message: "Invalid SocketAddress.");
  }
}

NodeException mapNodeBaseError(bridge.NodeBaseError e) {
  switch (e) {
    case bridge.NodeBaseError.alreadyRunning:
      return NodeException(message: "Node is already running.");
    case bridge.NodeBaseError.notRunning:
      return NodeException(message: "Node is not running.");
    case bridge.NodeBaseError.onchainTxCreationFailed:
      return NodeException(
          message: "On-chain transaction could not be created.");
    case bridge.NodeBaseError.connectionFailed:
      return NodeException(message: "Network connection closed.");
    case bridge.NodeBaseError.paymentSendingFailed:
      return NodeException(message: "Failed to send the given payment.");
    case bridge.NodeBaseError.probeSendingFailed:
      return NodeException(message: "Failed to send the given payment probe.");
    case bridge.NodeBaseError.channelCreationFailed:
      return NodeException(message: "Failed to create channel.");
    case bridge.NodeBaseError.channelClosingFailed:
      return NodeException(message: "Failed to close channel.");
    case bridge.NodeBaseError.channelConfigUpdateFailed:
      return NodeException(message: "Failed to update channel config.");
    case bridge.NodeBaseError.persistenceFailed:
      return NodeException(message: "Failed to persist data.");
    case bridge.NodeBaseError.walletOperationFailed:
      return NodeException(message: "Failed to conduct wallet operation.");
    case bridge.NodeBaseError.onchainTxSigningFailed:
      return NodeException(message: "Failed to sign given transaction.");
    case bridge.NodeBaseError.messageSigningFailed:
      return NodeException(message: "Failed to sign given message.");
    case bridge.NodeBaseError.txSyncFailed:
      return NodeException(message: "Failed to sync transactions.");
    case bridge.NodeBaseError.gossipUpdateFailed:
      return NodeException(message: "Failed to update gossip data.");
    case bridge.NodeBaseError.invalidAddress:
      return NodeException(message: "The given address is invalid.");
    case bridge.NodeBaseError.invalidSocketAddress:
      return NodeException(message: "The given network address is invalid.");
    case bridge.NodeBaseError.invalidPublicKey:
      return NodeException(message: "The given public key is invalid.");
    case bridge.NodeBaseError.invalidSecretKey:
      return NodeException(message: "The given secret key is invalid.");
    case bridge.NodeBaseError.invalidPaymentHash:
      return NodeException(message: "The given payment hash is invalid.");
    case bridge.NodeBaseError.invalidPaymentPreimage:
      return NodeException(message: "The given payment preimage is invalid.");
    case bridge.NodeBaseError.invalidPaymentSecret:
      return NodeException(message: "The given payment secret is invalid.");
    case bridge.NodeBaseError.invalidAmount:
      return NodeException(message: "The given amount is invalid.");
    case bridge.NodeBaseError.invalidInvoice:
      return NodeException(message: "The given invoice is invalid.");
    case bridge.NodeBaseError.invalidChannelId:
      return NodeException(message: "The given channel ID is invalid.");
    case bridge.NodeBaseError.invoiceCreationFailed:
      return NodeException(message: "Failed to create invoice.");
    case bridge.NodeBaseError.invalidNetwork:
      return NodeException(message: "The given network is invalid.");
    case bridge.NodeBaseError.duplicatePayment:
      return NodeException(
          message: "A payment with the given hash has already been initiated.");

    case bridge.NodeBaseError.insufficientFunds:
      return NodeException(
          message:
              "There are insufficient funds to complete the given operation.");
    case bridge.NodeBaseError.feerateEstimationUpdateFailed:
      return NodeException(message: "Failed to update fee rate estimation. ");
    case bridge.NodeBaseError.liquidityRequestFailed:
      return NodeException(message: "Liquidity request operation failed. ");
    case bridge.NodeBaseError.liquiditySourceUnavailable:
      return NodeException(
          message:
              "Liquidity operation failed due to the required liquidity source being unavailable. ");
    case bridge.NodeBaseError.liquidityFeeTooHigh:
      return NodeException(
          message:
              "Liquidity operation failed due to the LSP's required opening fee being too high. ");
  }
}
