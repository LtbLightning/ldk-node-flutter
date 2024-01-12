import '../generated/bridge_definitions.dart' as bridge;

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

BuilderException handleBuilderException(bridge.BuilderException e) {
  switch (e) {
    case bridge.BuilderException.InvalidSeedBytes:
      return BuilderException(message: "Given seed bytes are invalid.");
    case bridge.BuilderException.InvalidSeedFile:
      return BuilderException(
          message: "Given seed file is invalid or could not be read.");
    case bridge.BuilderException.InvalidSystemTime:
      return BuilderException(
          message:
              "System time is invalid. Clocks might have gone back in time.");
    case bridge.BuilderException.ReadFailed:
      return BuilderException(message: "Failed to read from store.");
    case bridge.BuilderException.WriteFailed:
      return BuilderException(message: "Failed to write to store.");
    case bridge.BuilderException.StoragePathAccessFailed:
      return BuilderException(
          message: "Failed to access the given storage path.");
    case bridge.BuilderException.WalletSetupFailed:
      return BuilderException(message: "Failed to setup onchain wallet.");
    case bridge.BuilderException.LoggerSetupFailed:
      return BuilderException(message: "Failed to setup the logger.");

    case bridge.BuilderException.InvalidChannelMonitor:
      return BuilderException(
          message: "Failed to watch a deserialized ChannelMonitor.");
    case bridge.BuilderException.InvalidListeningAddresses:
      return BuilderException(
          message: "Given listening addresses are invalid.");
    case bridge.BuilderException.KVStoreSetupFailed:
      return BuilderException(message: "Failed to setup KVStore.");
  }
}

NodeException handleNodeException(bridge.NodeException e) {
  switch (e) {
    case bridge.NodeException.AlreadyRunning:
      return NodeException(message: "Node is already running.");
    case bridge.NodeException.NotRunning:
      return NodeException(message: "Node is not running.");
    case bridge.NodeException.OnchainTxCreationFailed:
      return NodeException(
          message: "On-chain transaction could not be created.");
    case bridge.NodeException.ConnectionFailed:
      return NodeException(message: "Network connection closed.");
    case bridge.NodeException.PaymentSendingFailed:
      return NodeException(message: "Failed to send the given payment.");
    case bridge.NodeException.ProbeSendingFailed:
      return NodeException(message: "Failed to send the given payment probe.");
    case bridge.NodeException.ChannelCreationFailed:
      return NodeException(message: "Failed to create channel.");
    case bridge.NodeException.ChannelClosingFailed:
      return NodeException(message: "Failed to close channel.");
    case bridge.NodeException.ChannelConfigUpdateFailed:
      return NodeException(message: "Failed to update channel config.");
    case bridge.NodeException.PersistenceFailed:
      return NodeException(message: "Failed to persist data.");
    case bridge.NodeException.WalletOperationFailed:
      return NodeException(message: "Failed to conduct wallet operation.");
    case bridge.NodeException.OnchainTxSigningFailed:
      return NodeException(message: "Failed to sign given transaction.");
    case bridge.NodeException.MessageSigningFailed:
      return NodeException(message: "Failed to sign given message.");
    case bridge.NodeException.TxSyncFailed:
      return NodeException(message: "Failed to sync transactions.");
    case bridge.NodeException.GossipUpdateFailed:
      return NodeException(message: "Failed to update gossip data.");
    case bridge.NodeException.InvalidAddress:
      return NodeException(message: "The given address is invalid.");
    case bridge.NodeException.InvalidSocketAddress:
      return NodeException(message: "The given network address is invalid.");
    case bridge.NodeException.InvalidPublicKey:
      return NodeException(message: "The given public key is invalid.");
    case bridge.NodeException.InvalidSecretKey:
      return NodeException(message: "The given secret key is invalid.");
    case bridge.NodeException.InvalidPaymentHash:
      return NodeException(message: "The given payment hash is invalid.");
    case bridge.NodeException.InvalidPaymentPreimage:
      return NodeException(message: "The given payment preimage is invalid.");
    case bridge.NodeException.InvalidPaymentSecret:
      return NodeException(message: "The given payment secret is invalid.");
    case bridge.NodeException.InvalidAmount:
      return NodeException(message: "The given amount is invalid.");
    case bridge.NodeException.InvalidInvoice:
      return NodeException(message: "The given invoice is invalid.");
    case bridge.NodeException.InvalidChannelId:
      return NodeException(message: "The given channel ID is invalid.");
    case bridge.NodeException.InvoiceCreationFailed:
      return NodeException(message: "Failed to create invoice.");
    case bridge.NodeException.InvalidNetwork:
      return NodeException(message: "The given network is invalid.");
    case bridge.NodeException.DuplicatePayment:
      return NodeException(
          message: "A payment with the given hash has already been initiated.");
    case bridge.NodeException.InsufficientFunds:
      return NodeException(
          message:
              "There are insufficient funds to complete the given operation.");
  }
}
