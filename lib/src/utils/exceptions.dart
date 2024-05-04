import '../generated/api/error.dart' as bridge;

abstract class LdkException implements Exception {
  String? message;
  LdkException({this.message});
  @override
  String toString() =>
      (message != null) ? '$runtimeType( $message )' : runtimeType.toString();
}

/// Returned when trying to start [Node] while it is already running.
class NodeException extends LdkException {
  NodeException({super.message});
}

class BuilderException extends LdkException {
  BuilderException({super.message});
}

BuilderException mapBuilderException(bridge.BuilderException e) {
  switch (e) {
    case bridge.BuilderException.invalidSeedBytes:
      return BuilderException(message: "Given seed bytes are invalid.");
    case bridge.BuilderException.invalidSeedFile:
      return BuilderException(
          message: "Given seed file is invalid or could not be read.");
    case bridge.BuilderException.invalidSystemTime:
      return BuilderException(
          message:
              "System time is invalid. Clocks might have gone back in time.");
    case bridge.BuilderException.readFailed:
      return BuilderException(message: "Failed to read from store.");
    case bridge.BuilderException.writeFailed:
      return BuilderException(message: "Failed to write to store.");
    case bridge.BuilderException.storagePathAccessFailed:
      return BuilderException(
          message: "Failed to access the given storage path.");
    case bridge.BuilderException.walletSetupFailed:
      return BuilderException(message: "Failed to setup onchain wallet.");
    case bridge.BuilderException.loggerSetupFailed:
      return BuilderException(message: "Failed to setup the logger.");

    case bridge.BuilderException.invalidChannelMonitor:
      return BuilderException(
          message: "Failed to watch a deserialized ChannelMonitor.");
    case bridge.BuilderException.invalidListeningAddresses:
      return BuilderException(
          message: "Given listening addresses are invalid.");
    case bridge.BuilderException.kvStoreSetupFailed:
      return BuilderException(message: "Failed to setup KVStore.");
    case bridge.BuilderException.socketAddressParseError:
      return BuilderException(message: "Invalid SocketAddress.");
  }
}

NodeException mapNodeException(bridge.NodeException e) {
  switch (e) {
    case bridge.NodeException.alreadyRunning:
      return NodeException(message: "Node is already running.");
    case bridge.NodeException.notRunning:
      return NodeException(message: "Node is not running.");
    case bridge.NodeException.onchainTxCreationFailed:
      return NodeException(
          message: "On-chain transaction could not be created.");
    case bridge.NodeException.connectionFailed:
      return NodeException(message: "Network connection closed.");
    case bridge.NodeException.paymentSendingFailed:
      return NodeException(message: "Failed to send the given payment.");
    case bridge.NodeException.probeSendingFailed:
      return NodeException(message: "Failed to send the given payment probe.");
    case bridge.NodeException.channelCreationFailed:
      return NodeException(message: "Failed to create channel.");
    case bridge.NodeException.channelClosingFailed:
      return NodeException(message: "Failed to close channel.");
    case bridge.NodeException.channelConfigUpdateFailed:
      return NodeException(message: "Failed to update channel config.");
    case bridge.NodeException.persistenceFailed:
      return NodeException(message: "Failed to persist data.");
    case bridge.NodeException.walletOperationFailed:
      return NodeException(message: "Failed to conduct wallet operation.");
    case bridge.NodeException.onchainTxSigningFailed:
      return NodeException(message: "Failed to sign given transaction.");
    case bridge.NodeException.messageSigningFailed:
      return NodeException(message: "Failed to sign given message.");
    case bridge.NodeException.txSyncFailed:
      return NodeException(message: "Failed to sync transactions.");
    case bridge.NodeException.gossipUpdateFailed:
      return NodeException(message: "Failed to update gossip data.");
    case bridge.NodeException.invalidAddress:
      return NodeException(message: "The given address is invalid.");
    case bridge.NodeException.invalidSocketAddress:
      return NodeException(message: "The given network address is invalid.");
    case bridge.NodeException.invalidPublicKey:
      return NodeException(message: "The given public key is invalid.");
    case bridge.NodeException.invalidSecretKey:
      return NodeException(message: "The given secret key is invalid.");
    case bridge.NodeException.invalidPaymentHash:
      return NodeException(message: "The given payment hash is invalid.");
    case bridge.NodeException.invalidPaymentPreimage:
      return NodeException(message: "The given payment preimage is invalid.");
    case bridge.NodeException.invalidPaymentSecret:
      return NodeException(message: "The given payment secret is invalid.");
    case bridge.NodeException.invalidAmount:
      return NodeException(message: "The given amount is invalid.");
    case bridge.NodeException.invalidInvoice:
      return NodeException(message: "The given invoice is invalid.");
    case bridge.NodeException.invalidChannelId:
      return NodeException(message: "The given channel ID is invalid.");
    case bridge.NodeException.invoiceCreationFailed:
      return NodeException(message: "Failed to create invoice.");
    case bridge.NodeException.invalidNetwork:
      return NodeException(message: "The given network is invalid.");
    case bridge.NodeException.duplicatePayment:
      return NodeException(
          message: "A payment with the given hash has already been initiated.");

    case bridge.NodeException.insufficientFunds:
      return NodeException(
          message:
              "There are insufficient funds to complete the given operation.");
    case bridge.NodeException.feerateEstimationUpdateFailed:
      return NodeException(message: "Failed to update fee rate estimation. ");
  }
}
