import 'package:ldk_node/src/generated/api/error.dart' as error;
import 'package:ldk_node/src/generated/api/types.dart' as types;
import 'package:ldk_node/src/utils/utils.dart';
import 'package:path_provider/path_provider.dart';

import 'generated/api/node.dart';

///The from string implementation will try to determine the language of the mnemonic from all the supported languages. (Languages have to be explicitly enabled using the Cargo features.)
/// Supported number of words are 12, 15, 18, 21, and 24.
///
class Mnemonic extends LdkMnemonic {
  Mnemonic({required super.seedPhrase});
  static Future<Mnemonic> generate() async {
    try {
      await Frb.verifyInit();
      final res = await LdkMnemonic.generate();
      return Mnemonic(seedPhrase: res.seedPhrase);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }
}

///The main interface object of LDK Node, wrapping the necessary LDK and BDK functionalities.
///
///Needs to be initialized and instantiated through builder.build().
///
class Node extends LdkNode {
  Node._({required super.ptr});

  /// Starts the necessary background tasks, such as handling events coming from user input,
  /// LDK/BDK, and the peer-to-peer network.
  ///
  /// After this returns, the [Node] instance can be controlled via the provided API methods in
  /// a thread-safe manner.
  @override
  Future<void> start({hint}) async {
    try {
      return super.start();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Disconnects all peers, stops all running background tasks, and shuts down [Node].
  ///
  /// After this returns most API methods will throw NotRunning Exception.
  ///
  @override
  Future<void> stop({hint}) async {
    try {
      await super.stop();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  ///Returns the status of the Node.
  @override
  Future<types.NodeStatus> status({hint}) async {
    try {
      return await super.status();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Blocks until the next event is available.
  ///
  /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
  @override
  Future<void> eventHandled({hint}) async {
    try {
      await super.eventHandled();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  // Confirm the last retrieved event handled.
  ///
  /// **Note:** This **MUST** be called after each event has been handled.
  @override
  Future<types.Event?> nextEvent({hint}) async {
    try {
      return await super.nextEvent();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Returns the next event in the event queue.
  ///
  /// Will block the current thread until the next event is available.
  ///
  /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
  ///
  Future<types.Event?> waitNextHandled({hint}) async {
    try {
      return await super.waitNextEvent();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  ///Returns the next event in the event queue.
  /// Will asynchronously poll the event queue until the next event is ready.
  /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
  @override
  Future<types.Event> nextEventAsync({hint}) async {
    try {
      return await super.nextEventAsync();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Returns our own node id
  @override
  Future<types.PublicKey> nodeId({hint}) async {
    try {
      return await super.nodeId();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Returns our listening address
  @override
  Future<List<types.SocketAddress>?> listeningAddresses({hint}) async {
    try {
      return await super.listeningAddresses();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Retrieve the currently spendable on-chain balance in satoshis.
  @override
  Future<types.BalanceDetails> listBalances({hint}) {
    try {
      return super.listBalances();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  ///Returns the config with which the Node was initialized.
  @override
  Future<types.Config> config({hint}) {
    try {
      return super.config();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  ///Retrieve a list of known channels.
  @override
  Future<List<types.ChannelDetails>> listChannels({hint}) async {
    try {
      return await super.listChannels();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Connect to a node on the peer-to-peer network.
  ///
  /// If `permanently` is set to `true`, we'll remember the peer and reconnect to it on restart.
  @override
  Future<void> connect(
      {required types.SocketAddress address,
      required types.PublicKey nodeId,
      required bool persist,
      hint}) async {
    try {
      return await super
          .connect(address: address, nodeId: nodeId, persist: persist);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Disconnects the peer with the given node id.
  ///
  /// Will also remove the peer from the peer store, i.e., after this has been called we won't
  /// try to reconnect on restart.
  @override
  Future<void> disconnect(
      {required types.PublicKey counterpartyNodeId, hint}) async {
    try {
      await super.disconnect(
        counterpartyNodeId: counterpartyNodeId,
      );
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Connect to a node and open a new channel. Disconnects and re-connects are handled automatically
  ///
  /// Disconnects and reconnects are handled automatically.
  ///
  /// If `pushToCounterpartyMsat` is set, the given value will be pushed (read: sent) to the
  /// channel counterparty on channel open. This can be useful to start out with the balance not
  /// entirely shifted to one side, therefore allowing to receive payments from the getgo.
  ///
  /// Returns a temporary channel id.
  @override
  Future<types.UserChannelId> connectOpenChannel(
      {required types.SocketAddress socketAddress,
      required types.PublicKey nodeId,
      required int channelAmountSats,
      required bool announceChannel,
      types.ChannelConfig? channelConfig,
      int? pushToCounterpartyMsat,
      hint}) async {
    try {
      return await super.connectOpenChannel(
          socketAddress: socketAddress,
          nodeId: nodeId,
          pushToCounterpartyMsat: pushToCounterpartyMsat,
          channelAmountSats: channelAmountSats,
          channelConfig: channelConfig,
          announceChannel: announceChannel);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  ///Sync the LDK and BDK wallets with the current chain state.
  /// Note that the wallets will be also synced regularly in the background
  @override
  Future<void> syncWallets({hint}) async {
    try {
      await super.syncWallets();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Close a previously opened channel.
  @override
  Future<void> closeChannel(
      {required types.PublicKey counterpartyNodeId,
      required types.UserChannelId userChannelId,
      hint}) async {
    try {
      await super.closeChannel(
        userChannelId: userChannelId,
        counterpartyNodeId: counterpartyNodeId,
      );
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  ///Update the config for a previously opened channel.
  ///
  @override
  Future<void> updateChannelConfig(
      {required types.PublicKey counterpartyNodeId,
      required types.UserChannelId userChannelId,
      required types.ChannelConfig channelConfig,
      hint}) async {
    try {
      await super.updateChannelConfig(
        userChannelId: userChannelId,
        counterpartyNodeId: counterpartyNodeId,
        channelConfig: channelConfig,
      );
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Retrieve the details of a specific payment with the given hash.
  ///
  /// Returns `PaymentDetails` if the payment was known and `null` otherwise.
  @override
  Future<types.PaymentDetails?> payment(
      {required types.PaymentId paymentId, hint}) async {
    try {
      return await super.payment(paymentId: paymentId);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  ///Remove the payment with the given hash from the store.
  @override
  Future<void> removePayment({required types.PaymentId paymentId, hint}) async {
    try {
      return await super.removePayment(paymentId: paymentId);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  ///Retrieves all payments that match the given predicate.
  @override
  Future<List<types.PaymentDetails>> listPaymentsWithFilter(
      {required types.PaymentDirection paymentDirection, hint}) async {
    try {
      return await super
          .listPaymentsWithFilter(paymentDirection: paymentDirection);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  ///Retrieves all payments.
  @override
  Future<List<types.PaymentDetails>> listPayments({hint}) async {
    try {
      return super.listPayments();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  ///Retrieves a list of known peers.
  @override
  Future<List<types.PeerDetails>> listPeers({hint}) async {
    try {
      return await super.listPeers();
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Creates a digital ECDSA signature of a message with the node's secret key.
  ///
  /// A receiver knowing the corresponding [types.PublicKey] (e.g. the node’s id) and the message
  /// can be sure that the signature was generated by the caller.
  /// Signatures are EC recoverable, meaning that given the message and the
  /// signature the PublicKey of the signer can be extracted.
  @override
  Future<String> signMessage({required List<int> msg, hint}) async {
    try {
      return await super.signMessage(msg: msg);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  /// Verifies that the given ECDSA signature was created for the given message with the
  /// secret key corresponding to the given public key.
  @override
  Future<bool> verifySignature(
      {required List<int> msg,
      required String sig,
      required types.PublicKey publicKey,
      hint}) async {
    try {
      return await super
          .verifySignature(msg: msg, sig: sig, publicKey: publicKey);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  Future<Bolt11Payment> bolt11Payment() async {
    try {
      final res = await LdkNode.bolt11Payment(ptr: this);
      return Bolt11Payment._(ptr: res.ptr);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }
}

class Bolt11Payment extends LdkBolt11Payment {
  Bolt11Payment._({required super.ptr});
  @override
  Future<types.Bolt11Invoice> receive(
      {required int amountMsat,
      required String description,
      required int expirySecs,
      hint}) {
    try {
      return super.receive(
          amountMsat: amountMsat,
          description: description,
          expirySecs: expirySecs);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  @override
  Future<types.Bolt11Invoice> receiveVariableAmount(
      {required String description, required int expirySecs, hint}) {
    try {
      return super.receiveVariableAmount(
          description: description, expirySecs: expirySecs);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  @override
  Future<types.Bolt11Invoice> receiveVariableAmountViaJitChannel(
      {required String description,
      required int expirySecs,
      int? maxProportionalLspFeeLimitPpmMsat,
      hint}) {
    try {
      return super.receiveVariableAmountViaJitChannel(
          description: description,
          expirySecs: expirySecs,
          maxProportionalLspFeeLimitPpmMsat: maxProportionalLspFeeLimitPpmMsat);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  @override
  Future<types.Bolt11Invoice> receiveViaJitChannel(
      {required int amountMsat,
      required String description,
      required int expirySecs,
      int? maxTotalLspFeeLimitMsat,
      hint}) {
    try {
      return super.receiveViaJitChannel(
          description: description,
          expirySecs: expirySecs,
          maxTotalLspFeeLimitMsat: maxTotalLspFeeLimitMsat,
          amountMsat: amountMsat);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  @override
  Future<types.PaymentId> send({required types.Bolt11Invoice invoice, hint}) {
    try {
      return super.send(invoice: invoice);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  @override
  Future<void> sendProbes({required types.Bolt11Invoice invoice, hint}) {
    try {
      return super.sendProbes(invoice: invoice);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  @override
  Future<void> sendProbesUsingAmount(
      {required types.Bolt11Invoice invoice, required int amountMsat, hint}) {
    try {
      return super
          .sendProbesUsingAmount(invoice: invoice, amountMsat: amountMsat);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }

  @override
  Future<types.PaymentId> sendUsingAmount(
      {required types.Bolt11Invoice invoice, required int amountMsat, hint}) {
    try {
      return super.sendUsingAmount(invoice: invoice, amountMsat: amountMsat);
    } on error.NodeException catch (e) {
      throw mapNodeException(e);
    }
  }
}

/// A builder for an [Node] instance, allowing to set some configuration and module choices from
/// the get-go.
///
/// ### Defaults
/// - Wallet entropy is sourced from a `keysSeed` file located under `config.storageDirPath`
/// - Chain data is sourced from the Esplora endpoint `https://blockstream.info/api`
/// - Gossip data is sourced via the peer-to-peer network
///
class Builder {
  types.Config? _config;
  types.EntropySourceConfig? _entropySource;
  types.ChainDataSourceConfig? _chainDataSourceConfig;
  types.GossipSourceConfig? _gossipSourceConfig;
  types.LiquiditySourceConfig? _liquiditySourceConfig;

  /// Creates a new builder instance from an [Config].
  ///
  factory Builder.fromConfig({required types.Config config}) {
    return Builder._(config);
  }
  Builder._(this._config);

  /// Creates a new builder instance with the default configuration.
  ///
  factory Builder() {
    return Builder._(types.Config(
        storageDirPath: '',
        network: types.Network.bitcoin,
        listeningAddresses: [
          types.SocketAddress.hostname(addr: "0.0.0.0", port: 9735)
        ],
        onchainWalletSyncIntervalSecs: 60,
        walletSyncIntervalSecs: 20,
        feeRateCacheUpdateIntervalSecs: 600,
        logLevel: types.LogLevel.debug,
        defaultCltvExpiryDelta: 144,
        trustedPeers0Conf: [],
        probingLiquidityLimitMultiplier: 3));
  }

  /// Configures the [Node] instance to source its wallet entropy from a seed file on disk.
  ///
  /// If the given file does not exist a new random seed file will be generated and
  /// stored at the given location.
  ///
  Builder setEntropySeedPath(String seedPath) {
    _entropySource = types.EntropySourceConfig.seedFile(seedPath);
    return this;
  }

  /// Configures the [Node] instance to source its wallet entropy from the given 64 seed bytes.
  ///
  /// **Note:** Panics if the length of the given `seedBytes` differs from 64.
  ///
  Builder setEntropySeedBytes(U8Array64 seedBytes) {
    _entropySource = types.EntropySourceConfig.seedBytes(seedBytes);
    return this;
  }

  /// Configures the [Node] instance to source its chain data from the given Esplora server.
  ///
  Builder setEntropyBip39Mnemonic(
      {required Mnemonic mnemonic, String? passphrase}) {
    _entropySource = types.EntropySourceConfig.bip39Mnemonic(
        mnemonic: mnemonic, passphrase: passphrase);
    return this;
  }

  ///Configures the [Node] instance to source its chain data from the given Esplora server.
  ///
  Builder setEsploraServer(String esploraServerUrl) {
    _chainDataSourceConfig =
        types.ChainDataSourceConfig.esplora(esploraServerUrl);
    return this;
  }

  /// Configures the [Node] instance to source its gossip data from the Lightning peer-to-peer
  /// network.
  ///
  Builder setGossipSourceP2p() {
    _gossipSourceConfig = types.GossipSourceConfig.p2PNetwork();
    return this;
  }

  /// Configures the [Node] instance to source its gossip data from the given RapidGossipSync
  /// server.
  ///
  Builder setGossipSourceRgs(String rgsServerUrl) {
    _gossipSourceConfig =
        types.GossipSourceConfig.rapidGossipSync(rgsServerUrl);
    return this;
  }

  /// Sets the used storage directory path.
  ///
  ///
  Builder setStorageDirPath(String storageDirPath) {
    _config!.storageDirPath = storageDirPath;
    return this;
  }

  /// Sets the Bitcoin network used.
  ///
  Builder setNetwork(types.Network network) {
    _config!.network = network;
    return this;
  }

  /// Sets the IP address and TCP port on which [Node] will listen for incoming network connections.
  ///
  ///
  Builder setListeningAddresses(List<types.SocketAddress> listeningAddresses) {
    _config!.listeningAddresses = listeningAddresses;
    return this;
  }

  /// Configures the [Node] instance to source its inbound liquidity from the given
  /// [LSPS2](https://github.com/BitcoinAndLightningLayerSpecs/lsp/blob/main/LSPS2/README.md)
  /// service.
  ///
  /// Will mark the LSP as trusted for 0-confirmation channels, see `config.trustedPeers0conf`.
  ///
  /// The given `token` will be used by the LSP to authenticate the user.
  Builder setLiquiditySourceLsps2(
      {required types.SocketAddress address,
      required types.PublicKey publicKey,
      String? token}) {
    _liquiditySourceConfig =
        types.LiquiditySourceConfig(lsps2Service: (address, publicKey, token));
    return this;
  }

  /// Builds a [Node] instance with a SqliteStore backend and according to the options
  /// previously configured.
  ///
  ///
  Future<Node> build() async {
    try {
      await Frb.verifyInit();
      if (_config!.storageDirPath == '') {
        final directory = await getApplicationDocumentsDirectory();
        final nodePath = "${directory.path}/ldk_cache/";
        _config!.storageDirPath = nodePath;
      }
      final builder = await NodeBuilder.createBuilder(
          config: _config ?? Builder()._config!,
          chainDataSourceConfig: _chainDataSourceConfig,
          entropySourceConfig: _entropySource,
          liquiditySourceConfig: _liquiditySourceConfig,
          gossipSourceConfig: _gossipSourceConfig);
      final res = await builder.build();
      return Node._(ptr: res.ptr);
    } on error.BuilderException catch (e) {
      throw mapBuilderException(e);
    }
  }

  ///Builds a Node instance with a FilesystemStore backend and according to the options previously configured.
  Future<Node> buildWithFsStore() async {
    try {
      await Frb.verifyInit();
      if (_config!.storageDirPath == '') {
        final directory = await getApplicationDocumentsDirectory();
        final nodePath = "${directory.path}/ldk_cache/";
        _config!.storageDirPath = nodePath;
      }
      final builder = await NodeBuilder.createBuilder(
          config: _config ?? Builder()._config!,
          chainDataSourceConfig: _chainDataSourceConfig,
          entropySourceConfig: _entropySource,
          liquiditySourceConfig: _liquiditySourceConfig,
          gossipSourceConfig: _gossipSourceConfig);
      final res = await builder.buildWithFsStore();
      return Node._(ptr: res.ptr);
    } on error.BuilderException catch (e) {
      throw mapBuilderException(e);
    }
  }
}
