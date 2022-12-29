import 'generated/bindings.dart';
import 'utils/event_handler.dart';
import 'utils/loader.dart';

/// Represents the configuration of an [`LiteConfig`] instance.
class Config {
  LdkConfig? _config;
  Config(
      {required this.storageDirPath,
      this.esploraServerUrl,
      required this.network,
      this.listeningAddress,
      this.defaultCltvExpiryDelta}) {
    _config = LdkConfig(
        storageDirPath: storageDirPath,
        esploraServerUrl:
            esploraServerUrl ?? 'https://blockstream.info/testnet/api',
        listeningAddress: listeningAddress,
        network: network,
        defaultCltvExpiryDelta: defaultCltvExpiryDelta ?? 144);
  }

  /// The path where the underlying LDK and BDK persist their data.
  final String storageDirPath;

  /// The URL of the utilized Esplora server. default 'https://blockstream.info/testnet/api'
  String? esploraServerUrl;

  /// The used Bitcoin network.
  Network network = Network.Regtest;

  /// The IP address and TCP port the node will listen on.
  String? listeningAddress = '0.0.0.0:9735';

  /// The default CLTV expiry delta to be used for payments.
  int? defaultCltvExpiryDelta;
}

/// A builder for a [`Node`] instance, allowing to set some configuration and module choices from
/// the get go.
class NodeBuilder {
  Config? _liteConfig;
  NodeBuilder.fromConfig({required Config config}) {
    _liteConfig = config;
  }

  Future<LdkNode> toLdkNode() async {
    await loaderApi.rustSetUp();
    final res = await loaderApi.initBuilder(config: _liteConfig!._config!);
    return LdkNode._setLdkLiteInstance(res);
  }
}

class LdkNode {
  LdkLiteInstance? _ldkLiteInstance;
  String? nodeId;
  LdkNode._setLdkLiteInstance(LdkLiteInstance liteInstance) {
    _ldkLiteInstance = liteInstance;
  }
  Future<LdkNode> start() async {
    LdkEventHandler(callback: loaderApi.createLogStream()).init();
    nodeId = await loaderApi.start(ldkLiteInstance: _ldkLiteInstance!);
    return this;
  }

  Future<LdkNode> sync() async {
    await loaderApi.sync(ldkLiteInstance: _ldkLiteInstance!);
    return this;
  }

  Future<String> getNewAddress() async {
    final id =
        await loaderApi.newFundingAddress(ldkLiteInstance: _ldkLiteInstance!);
    return id;
  }
  Future<NodeInfo> getNodeInfo() async {
    final info = await loaderApi.nodeInfo(ldkLiteInstance: _ldkLiteInstance!);
    return info;
  }
  Future<Balance> getBalance() async {
    final balance =
        await loaderApi.getBalance(ldkLiteInstance: _ldkLiteInstance!);
    return balance;
  }

  Future<String> getPeerListeningAddress() async {
    final res = await loaderApi.getNodeAddr(ldkLiteInstance: _ldkLiteInstance!);
    return res;
  }

  Future<void> nextEvent() async {
    await loaderApi.nextEvent(ldkLiteInstance: _ldkLiteInstance!);
  }

  Future<U8Array32> getChannelId() async {
    final res =
        await loaderApi.getChannelId(ldkLiteInstance: _ldkLiteInstance!);
    return res;
  }

  Future<void> openChannel({
    required String nodePubKeyAndAddress,
    required int channelAmountSats,
    required bool announceChannel,
  }) async {
    await loaderApi.connectOpenChannel(
        ldkLite: _ldkLiteInstance!,
        nodePubkeyAndAddress: nodePubKeyAndAddress,
        channelAmountSats: channelAmountSats,
        announceChannel: announceChannel);
  }

  Future<String> receivePayments(
      String description, int expirySecs, int? amount) async {
    final res = await loaderApi.receivePayment(
        ldkLiteInstance: _ldkLiteInstance!,
        description: description,
        expirySecs: expirySecs,
        amountMsat: amount);
    return res;
  }

  Future<void> sendPayments(String invoice) async {
    await loaderApi.sendPayment(
        ldkLiteInstance: _ldkLiteInstance!, invoice: invoice);
  }

  Future<void> closeChannel(U8Array32 channelId, String counterpartyNodeId) async {
    await loaderApi.closeChannel(ldkLite: _ldkLiteInstance!, channelId: channelId, counterpartyNodeId: counterpartyNodeId);
  }
}
