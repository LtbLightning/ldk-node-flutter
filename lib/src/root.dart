import 'dart:async';

import 'generated/bindings.dart';
import 'utils/event_handler.dart';
import 'utils/loader.dart';

class NodeBuilder {
  Config? config;

  /// Creates a new builder instance with the default configuration.
  NodeBuilder() {
    config = Config(
        storageDirPath: '',
        network: Network.Testnet,
        esploraServerUrl: 'https://blockstream.info/testnet/api',
        listeningAddress: "0.0.0.0:9735",
        defaultCltvExpiryDelta: 144);

    /// Sets the node StorageDirPath.
  }

  /// Sets the IP address and TCP port on which [`LdkNode`] will listen for incoming network connections.
  ///
  /// Format: `ADDR:PORT`
  /// Default: `0.0.0.0:9735`

  NodeBuilder.setListeningAddress(String listeningAddress) {
    config!.listeningAddress = listeningAddress;
  }

  /// Sets the Bitcoin network used.
  ///
  /// Default: `Network.Testnet`
  NodeBuilder.setNetwork(Network network) {
    config!.network = network;
  }

  /// Sets the Esplora server URL.
  ///
  /// Default: `https://blockstream.info/testnet/api`
  NodeBuilder.setEsploraServerUrl(String esploraServerUrl) {
    config!.esploraServerUrl = esploraServerUrl;
  }

  /// Sets the used storage directory path.

  NodeBuilder.setStorageDirPath(String storageDirPath) {
    config!.storageDirPath = storageDirPath;
  }

  /// Creates a new builder instance from an [`Config`].
  NodeBuilder.fromConfig(this.config);

  Future<LdkNode> build() async {
    await loaderApi.rustSetUp();
    final ldkConfig = config!._toLdkConfig();
    final res = await loaderApi.initBuilder(config: ldkConfig);
    return LdkNode._setLdkLiteInstance(res);
  }
}

/// Represents the configuration of an [`Config`] instance.
class Config {
  LdkConfig _toLdkConfig() {
    if (storageDirPath == '')
      throw Exception("Unable to create builder with default storageDirPath");
    return LdkConfig(
        storageDirPath: storageDirPath,
        esploraServerUrl: esploraServerUrl,
        listeningAddress: listeningAddress,
        network: network,
        defaultCltvExpiryDelta: defaultCltvExpiryDelta ?? 144);
  }

  Config(
      {required this.storageDirPath,
      required this.esploraServerUrl,
      required this.network,
      this.listeningAddress,
      this.defaultCltvExpiryDelta});

  /// The path where the underlying LDK and BDK persist their data.
  String storageDirPath;

  /// The URL of the utilized Esplora server. default 'https://blockstream.info/testnet/api'
  String esploraServerUrl;

  /// The used Bitcoin network.
  Network network = Network.Regtest;

  /// The IP address and TCP port the node will listen on.
  String? listeningAddress = '0.0.0.0:9735';

  /// The default CLTV expiry delta to be used for payments.
  int? defaultCltvExpiryDelta;
}

/// A builder for a [`LdkNode`] instance, allowing to set some configuration and module choices from
/// the get go.
class LdkNode {
  LdkNodeInstance? _ldkNode;
  LdkNode._setLdkLiteInstance(LdkNodeInstance liteInstance) {
    _ldkNode = liteInstance;
  }

  /// Starts the necessary background tasks, such as handling events coming from user input,
  /// LDK/BDK, and the peer-to-peer network. After this returns, the [`LdkNode`] instance can be
  /// controlled via the provided API methods in a thread-safe manner.
  ///
  Future<LdkNode> start() async {
    StreamHandler(callback: loaderApi.createLogStream()).init();
    await loaderApi.start(ldkNode: _ldkNode!);
    return this;
  }

  /// Disconnects all peers, stops all running background tasks, and shuts down [`LdkNode`].
  ///
  Future<void> stop() async {
    await loaderApi.stop(ldkNode: _ldkNode!);
  }
//TODO Update Event Handler
  /// Blocks until the next event is available.
  ///
  /// Note: this will always return the same event until handling is confirmed

  Future<Event?> nextEvent() async {
    final res = await loaderApi.nextEvent(ldkNode: _ldkNode!);
    return handleLdkEvent(res);
  }

  /// Confirm the last retrieved event handled.
  Future<void> eventHandled() async {
    await loaderApi.handleEvent(ldkNode: _ldkNode!);
  }

  /// Returns our own node id
  Future<PublicKey> nodeId() async {
    final res = await loaderApi.nodeId(ldkNode: _ldkNode!);
    return res;
  }

  /// Returns our own listening address and port.
  Future<String> listeningAddress() async {
    final res = await loaderApi.getNodeAddr(ldkNode: _ldkNode!);
    return res;
  }

  /// Retrieve a new on-chain/funding address.
  Future<Address> newFundingAddress() async {
    final res = await loaderApi.newFundingAddress(ldkNode: _ldkNode!);
    return res;
  }

  /// Connect to a node and open a new channel. Disconnects and re-connects are handled automatically
  ///
  /// Returns a temporary channel id
  Future<void> connectOpenChannel({
    required String nodePubKeyAndAddress,
    required int channelAmountSats,
    required bool announceChannel,
  }) async {
    await loaderApi.connectOpenChannel(
        ldkLite: _ldkNode!,
        nodePubkeyAndAddress: nodePubKeyAndAddress,
        channelAmountSats: channelAmountSats,
        announceChannel: announceChannel);
  }

  /// Returns a payable invoice that can be used to request and receive a payment.
  Future<Invoice> receivePayment(
      String description, int expirySecs, int? amount) async {
    final res = await loaderApi.receivePayment(
        ldkNode: _ldkNode!,
        description: description,
        expirySecs: expirySecs,
        amountMsat: amount);
    return res;
  }

  /// Send a payment given an invoice.
  Future<PaymentHash> sendPayment(Invoice invoice) async {
    final res =
        await loaderApi.sendPayment(ldkNode: _ldkNode!, invoice: invoice);
    return res;
  }

  /// Send a spontaneous, aka. "keysend", payment
  Future<PaymentHash> sendSpontaneousPayment(
      String nodeId, int amountMsat) async {
    final res = await loaderApi.sendSpontaneousPayment(
        ldkNode: _ldkNode!, amountMsat: amountMsat, nodeId: nodeId);
    return res;
  }

  /// Close a previously opened channel.
  Future<void> closeChannel(
      String channelId, PublicKey counterpartyNodeId) async {
    await loaderApi.closeChannel(
        ldkLite: _ldkNode!,
        channelId: channelId,
        counterpartyNodeId: counterpartyNodeId);
  }

  /// Retrieve the current on-chain balance.
  Future<Balance> onChainBalance() async {
    final balance = await loaderApi.getBalance(ldkNode: _ldkNode!);
    return balance;
  }

  /// Sync the node wallet with the blockchain
  Future<void> syncWallet() async {
    await loaderApi.sync(ldkNode: _ldkNode!);
  }

  Future<PaymentInfo?> paymentInfo(PaymentHash paymentHash) async {
    final res = await loaderApi.paymentInfo(
        ldkNode: _ldkNode!, paymentHash: paymentHash.asUArray);
    return res;
  }

  ///	Query for information about the status of a specific payment.
  Future<NodeInfo> getNodeInfo() async {
    final info = await loaderApi.nodeInfo(ldkNode: _ldkNode!);
    return info;
  }

  Future<List<String>> getChannelIds() async {
    final List<String> channelIds = [];
    final nodeInfo = await getNodeInfo();
    for (var e in nodeInfo.channels) {
      channelIds.add(e.channelId);
    }
    return channelIds;
  }
}
