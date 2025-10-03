import 'dart:async';
import 'dart:typed_data';

import 'generated/lib.dart';
import 'generated/api/builder.dart' as builder;
import 'package:ldk_node/src/generated/api/node.dart';
import 'package:ldk_node/src/generated/api/graph.dart' as graph;
import 'package:ldk_node/src/generated/api/bolt11.dart' as bolt11;
import 'package:ldk_node/src/generated/api/bolt12.dart' as bolt12;
import 'generated/api/on_chain.dart' as on_chain;
import 'generated/api/spontaneous.dart' as spontaneous;
import 'generated/api/unified_qr.dart' as unified_qr;

import 'package:ldk_node/src/generated/api/types.dart' as types;
import 'package:ldk_node/src/generated/utils/error.dart' as error;
import 'package:ldk_node/src/utils/frb.dart';
import 'package:ldk_node/src/utils/default_services.dart';
import 'package:ldk_node/src/utils/exceptions.dart';

import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:path_provider/path_provider.dart';

typedef SpontaneousPayment = spontaneous.FfiSpontaneousPayment;
typedef OnChainPayment = on_chain.FfiOnChainPayment;
typedef NetworkGraph = graph.FfiNetworkGraph;
typedef Bolt11Payment = bolt11.FfiBolt11Payment;
typedef Bolt12Payment = bolt12.FfiBolt12Payment;
typedef UnifiedQrPayment = unified_qr.FfiUnifiedQrPayment;


///The from string implementation will try to determine the language of the mnemonic from all the supported languages. (Languages have to be explicitly enabled using the Cargo features.)
/// Supported number of words are 12, 15, 18, 21, and 24.

class Mnemonic extends builder.FfiMnemonic {
  Mnemonic({required super.seedPhrase});
  static Future<Mnemonic> generate() async { // this is static, so it might not be a good idea to turn this into a extension
    try {
      await Frb.verifyInit();
      final res = await builder.FfiMnemonic.generate();
      return Mnemonic(seedPhrase: res.seedPhrase);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

///The main interface object of LDK Node, wrapping the necessary LDK and BDK functionalities.
///
///Needs to be initialized and instantiated through builder.build().
///
class Node extends FfiNode {
  Node._({required super.opaque});

  /// Starts the necessary background tasks, such as handling events coming from user input,
  /// LDK/BDK, and the peer-to-peer network.
  ///
  /// After this returns, the [Node] instance can be controlled via the provided API methods in
  /// a thread-safe manner.
  @override
  Future<void> start({hint}) async {
    try {
      return await super.start();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns the status of the Node.
  @override
  Future<types.NodeStatus> status({hint}) async {
    try {
      return await super.status();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Blocks until the next event is available.
  ///
  /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
  @override
  Future<void> eventHandled({hint}) async {
    try {
      await super.eventHandled();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  // Confirm the last retrieved event handled.
  ///
  /// **Note:** This **MUST** be called after each event has been handled.
  @override
  Future<types.Event?> nextEvent({hint}) async {
    try {
      return await super.nextEvent();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns the next event in the event queue.
  /// Will asynchronously poll the event queue until the next event is ready.
  /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
  @override
  Future<types.Event> nextEventAsync({hint}) async {
    try {
      return await super.nextEventAsync();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns our own node id
  @override
  Future<types.PublicKey> nodeId({hint}) async {
    try {
      return await super.nodeId();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns our listening address
  @override
  Future<List<types.SocketAddress>?> listeningAddresses({hint}) async {
    try {
      return await super.listeningAddresses();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Retrieve the currently spendable on-chain balance in satoshis.
  @override
  Future<types.BalanceDetails> listBalances({hint}) async {
    try {
      return await super.listBalances();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns the config with which the Node was initialized.
  @override
  Future<types.Config> config({hint}) async {
    try {
      return await super.config();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Retrieve a list of known channels.
  @override
  Future<List<types.ChannelDetails>> listChannels({hint}) async {
    try {
      return await super.listChannels();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
  Future<types.UserChannelId> openChannel(
      {required types.SocketAddress socketAddress,
      required types.PublicKey nodeId,
      required BigInt channelAmountSats,
      types.ChannelConfig? channelConfig,
      BigInt? pushToCounterpartyMsat,
      hint}) async {
    try {
      return await super.openChannel(
        socketAddress: socketAddress,
        nodeId: nodeId,
        pushToCounterpartyMsat: pushToCounterpartyMsat,
        channelAmountSats: channelAmountSats,
        channelConfig: channelConfig,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Connect to a node and open a new announced channel.
  ///
  /// This will return an error if the node has not been sufficiently configured to operate as a
  /// forwarding node that can properly announce its existence to the publip network graph, i.e.,
  /// `config.listeningAddresses` and `config.nodeAlias` are unset.
  ///
  ///
  /// If `pushToCounterpartyMsat` is set, the given value will be pushed (read: sent) to the
  /// channel counterparty on channel open. This can be useful to start out with the balance not
  /// entirely shifted to one side, therefore allowing to receive payments from the getgo.
  ///
  /// If Anchor channels are enabled, this will ensure the configured
  /// `anchorChannelsConfig.perChannelReserveSats` is available and will be retained before
  /// opening the channel.
  ///
  /// Returns a temporary channelId allowing to locally keep track of the channel.
  @override
  Future<types.UserChannelId> openAnnouncedChannel(
      {required types.SocketAddress socketAddress,
      required types.PublicKey nodeId,
      required BigInt channelAmountSats,
      types.ChannelConfig? channelConfig,
      BigInt? pushToCounterpartyMsat,
      hint}) async {
    try {
      return await super.openAnnouncedChannel(
        socketAddress: socketAddress,
        nodeId: nodeId,
        pushToCounterpartyMsat: pushToCounterpartyMsat,
        channelAmountSats: channelAmountSats,
        channelConfig: channelConfig,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Sync the LDK and BDK wallets with the current chain state.
  /// Note that the wallets will be also synced regularly in the background
  @override
  Future<void> syncWallets({hint}) async {
    try {
      await super.syncWallets();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a handler allowing to query the network graph.
  Future<NetworkGraph> networkGraph() async {
    try {
      final res = await FfiNode.networkGraph(ptr: this);
      return NetworkGraph(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Force-close a previously opened channel.
  /// Will force-close the channel, potentially broadcasting our latest state. Note that in contrast to cooperative closure, force-closing will have the channel funds time-locked, i. e., they will only be available after the counterparty had time to contest our claim.
  /// Force-closing channels also more costly in terms of on-chain fees. So cooperative closure should always be preferred (and tried first).
  /// Broadcasting the closing transactions will be omitted for Anchor channels if we trust the counterparty to broadcast for us.
  @override
  Future<void> forceCloseChannel(
      {required types.PublicKey counterpartyNodeId,
      required types.UserChannelId userChannelId,
      hint}) async {
    try {
      await super.forceCloseChannel(
        userChannelId: userChannelId,
        counterpartyNodeId: counterpartyNodeId,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Remove the payment with the given hash from the store.
  @override
  Future<void> removePayment({required types.PaymentId paymentId, hint}) async {
    try {
      return await super.removePayment(paymentId: paymentId);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Retrieves all payments that match the given predicate.
  @override
  Future<List<types.PaymentDetails>> listPaymentsWithFilter(
      {required types.PaymentDirection paymentDirection, hint}) async {
    try {
      return await super
          .listPaymentsWithFilter(paymentDirection: paymentDirection);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Retrieves all payments.
  @override
  Future<List<types.PaymentDetails>> listPayments({hint}) async {
    try {
      return await super.listPayments();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Retrieves a list of known peers.
  @override
  Future<List<types.PeerDetails>> listPeers({hint}) async {
    try {
      return await super.listPeers();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payment handler allowing to create and pay BOLT 11 invoices.
  Future<Bolt11Payment> bolt11Payment() async {
    try {
      final res = await FfiNode.bolt11Payment(ptr: this);
      return Bolt11Payment(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payment handler allowing to create and pay BOLT 12 invoices.
  Future<Bolt12Payment> bolt12Payment() async {
    try {
      final res = await FfiNode.bolt12Payment(ptr: this);
      return Bolt12Payment(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payment handler allowing to send and receive on-chain payments.
  Future<OnChainPayment> onChainPayment() async {
    try {
      final res = await FfiNode.onChainPayment(ptr: this);
      return OnChainPayment(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payment handler allowing to send spontaneous ("keysend") payments.
  Future<SpontaneousPayment> spontaneousPayment() async {
    try {
      final res = await FfiNode.spontaneousPayment(ptr: this);
      return SpontaneousPayment(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payment handler allowing to create BIP 21 URIs with an on-chain, BOLT 11, and BOLT 12 payment options.
  Future<UnifiedQrPayment> unifiedQrPayment() async {
    try {
      final res = await FfiNode.unifiedQrPayment(ptr: this);
      return UnifiedQrPayment(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
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
  builder.FfiBuilder? _configuredBuilder;

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
      // logLevel: types.LogLevel.debug,
      trustedPeers0Conf: [],
      probingLiquidityLimitMultiplier: BigInt.from(3),
    ));
  }

  /// Creates a new builder instance with default services configured for testnet.
  ///
  factory Builder.testnet({types.Config? config}) {
    final Builder builder =
        config != null ? Builder.fromConfig(config: config) : Builder();

    return builder
        .setNetwork(types.Network.testnet)
        .setChainSourceEsplora(
            esploraServerUrl: DefaultServicesTestnet.esploraServerUrl)
        .setGossipSourceRgs(DefaultServicesTestnet.rgsServerUrl);
  }

  /// Creates a new builder instance with default services configured for mutinynet.
  ///
  factory Builder.mutinynet({types.Config? config}) {
    final Builder builder =
        config != null ? Builder.fromConfig(config: config) : Builder();

    return builder
        .setNetwork(types.Network.signet)
        .setChainSourceEsplora(
            esploraServerUrl: DefaultServicesMutinynet.esploraServerUrl,
            syncConfig: DefaultServicesMutinynet.esploraServerConfig)
        .setGossipSourceRgs(DefaultServicesMutinynet.rgsServerUrl)
        .setLiquiditySourceLsps2(
          address: types.SocketAddress.hostname(
            addr: DefaultServicesMutinynet.lsps2SourceAddress,
            port: DefaultServicesMutinynet.lsps2SourcePort,
          ),
          publicKey: types.PublicKey(
            hex: DefaultServicesMutinynet.lsps2SourcePublicKey,
          ),
          token: DefaultServicesMutinynet.lsps2SourceToken,
        );
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
  Builder setChainSourceEsplora(
      {required String esploraServerUrl, types.EsploraSyncConfig? syncConfig}) {
    _chainDataSourceConfig = types.ChainDataSourceConfig.esplora(
        serverUrl: esploraServerUrl, syncConfig: syncConfig);
    return this;
  }

  Builder setChainSourceBitcoinRpc(
      {required String rpcHost,
      required int rpcPort,
      required String rpcUser,
      required String rpcPassword}) {
    _chainDataSourceConfig = types.ChainDataSourceConfig.bitcoindRpc(
        rpcHost: rpcHost,
        rpcPort: rpcPort,
        rpcUser: rpcUser,
        rpcPassword: rpcPassword);
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
    if (listeningAddresses.length > 100) {
      throw BuilderException(errorMessage: "Given listening addresses are invalid.", code: "InvalidListeningAddresses");
    }
    _config!.listeningAddresses = listeningAddresses;
    return this;
  }

  /// Sets the node alias that will be used when broadcasting announcements to the gossip
  /// network.
  ///
  /// The provided alias must be a valid UTF-8 string and no longer than 32 bytes in total.
  Builder setNodeAlias(String nodeAlias) {
    // Alias must be 32 bytes or less.
    if (nodeAlias.codeUnits.length > 32) {
      throw BuilderException(errorMessage: "Invalid NodeAlias.", code: "InvalidNodeAlias");
    }
    final bytes = Uint8List(32)
      ..setRange(0, nodeAlias.codeUnits.length, nodeAlias.codeUnits);
    _config!.nodeAlias = types.NodeAlias(field0: U8Array32(bytes));
    return this;
  }

  /// Sets the level at which [`Node`] will log messages.
  ///
  // Builder setLogLevel(types.LogLevel logLevel) {
  //   _config!.logLevel = logLevel;
  //   return this;
  // }

  /// Configures the Node instance to write logs to the filesystem.
  ///
  /// The `logFilePath` defaults to 'ldk_node.log' in the configured storage directory if set to `null`.
  /// If set, the `maxLogLevel` sets the maximum log level. Otherwise, defaults to Debug level.
  ///
  /// Example:
  /// ```dart
  /// builder.setFilesystemLogger(
  ///   logFilePath: '/path/to/logs/ldk.log',
  ///   maxLogLevel: types.LogLevel.info,
  /// );
  /// ```
  Builder setFilesystemLogger({
    String? logFilePath,
    types.LogLevel? maxLogLevel,
  }) {
    try {
      // Create or get the builder instance
      _configuredBuilder ??= builder.FfiBuilder.createBuilder(
        config: _config ?? Builder()._config!,
        chainDataSourceConfig: _chainDataSourceConfig,
        entropySourceConfig: _entropySource,
        liquiditySourceConfig: _liquiditySourceConfig,
        gossipSourceConfig: _gossipSourceConfig,
      );

      // Configure filesystem logging
      _configuredBuilder = _configuredBuilder!.setFilesystemLogger(
        logFilePath: logFilePath,
        maxLogLevel: maxLogLevel,
      );

      return this;
    } on error.FfiBuilderError catch (e) {
      throw mapFfiBuilderError(e);
    }
  }

  /// Configures the Node instance to write logs to the Rust log facade.
  ///
  /// This forwards logs to the Rust `log` crate, allowing integration with existing
  /// Rust logging frameworks and making logs available to Dart through standard
  /// Rust logging mechanisms.
  ///
  /// Example:
  /// ```dart
  /// builder.setLogFacadeLogger();
  /// ```
  Builder setLogFacadeLogger() {
    try {
      // Create or get the builder instance
      _configuredBuilder ??= builder.FfiBuilder.createBuilder(
        config: _config ?? Builder()._config!,
        chainDataSourceConfig: _chainDataSourceConfig,
        entropySourceConfig: _entropySource,
        liquiditySourceConfig: _liquiditySourceConfig,
        gossipSourceConfig: _gossipSourceConfig,
      );

      // Configure log facade
      _configuredBuilder = _configuredBuilder!.setLogFacadeLogger();

      return this;
    } on error.FfiBuilderError catch (e) {
      throw mapFfiBuilderError(e);
    }
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
  Future<Node> build() async {
    try {
      await Frb.verifyInit();
      if (_config!.storageDirPath == '') {
        final directory = await getApplicationDocumentsDirectory();
        final nodePath = "${directory.path}/ldk_cache/";
        _config!.storageDirPath = nodePath;
      }

      // Use configured builder if available, otherwise create new one
      final builderInstance = _configuredBuilder ??
          await builder.FfiBuilder.createBuilder(
            config: _config ?? Builder()._config!,
            chainDataSourceConfig: _chainDataSourceConfig,
            entropySourceConfig: _entropySource,
            liquiditySourceConfig: _liquiditySourceConfig,
            gossipSourceConfig: _gossipSourceConfig,
          );

      final res = await builderInstance.build();
      return Node._(opaque: res.opaque);
    } on error.FfiBuilderError catch (e) {
      throw mapFfiBuilderError(e);
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

      // Use configured builder if available, otherwise create new one
      final builderInstance = _configuredBuilder ??
          await builder.FfiBuilder.createBuilder(
            config: _config ?? Builder()._config!,
            chainDataSourceConfig: _chainDataSourceConfig,
            entropySourceConfig: _entropySource,
            liquiditySourceConfig: _liquiditySourceConfig,
            gossipSourceConfig: _gossipSourceConfig,
          );

      final res = await builderInstance.buildWithFsStore();
      return Node._(opaque: res.opaque);
    } on error.FfiBuilderError catch (e) {
      throw mapFfiBuilderError(e);
    }
  }

  Future<Node> buildWithVssStore(
      {required String vssUrl,
      required String storeId,
      required String lnurlAuthServerUrl,
      required Map<String, String> fixedHeaders}) async {
    try {
      await Frb.verifyInit();
      if (_config!.storageDirPath == '') {
        final directory = await getApplicationDocumentsDirectory();
        final nodePath = "${directory.path}/ldk_cache/";
        _config!.storageDirPath = nodePath;
      }
      final res = await builder.FfiBuilder.createBuilder(
              config: _config ?? Builder()._config!,
              chainDataSourceConfig: _chainDataSourceConfig,
              entropySourceConfig: _entropySource,
              liquiditySourceConfig: _liquiditySourceConfig,
              gossipSourceConfig: _gossipSourceConfig)
          .buildWithVssStore(
              vssUrl: vssUrl,
              storeId: storeId,
              lnurlAuthServerUrl: lnurlAuthServerUrl,
              fixedHeaders: fixedHeaders);
      return Node._(opaque: res.opaque);
    } on error.FfiBuilderError catch (e) {
      throw mapFfiBuilderError(e);
    }
  }

  Future<Node> buildWithVssStoreAndFixedHeaders(
      {required String vssUrl,
      required String storeId,
      required Map<String, String> fixedHeaders}) async {
    try {
      await Frb.verifyInit();
      if (_config!.storageDirPath == '') {
        final directory = await getApplicationDocumentsDirectory();
        final nodePath = "${directory.path}/ldk_cache/";
        _config!.storageDirPath = nodePath;
      }
      final res = await builder.FfiBuilder.createBuilder(
              config: _config ?? Builder()._config!,
              chainDataSourceConfig: _chainDataSourceConfig,
              entropySourceConfig: _entropySource,
              liquiditySourceConfig: _liquiditySourceConfig,
              gossipSourceConfig: _gossipSourceConfig)
          .buildWithVssStoreAndFixedHeaders(
              vssUrl: vssUrl, storeId: storeId, fixedHeaders: fixedHeaders);
      return Node._(opaque: res.opaque);
    } on error.FfiBuilderError catch (e) {
      throw mapFfiBuilderError(e);
    }
  }
}

/// Represents the fee rate for Bitcoin transactions.
/// 
/// Fee rates are measured in satoshis per 1000 weight units (sat/kwu).
/// This class provides utilities for converting between different fee rate units
/// and includes common fee rate constants.
class FeeRate {
  /// The fee rate in satoshis per 1000 weight units
  final BigInt _satPerKwu;

  /// Private constructor
  const FeeRate._(this._satPerKwu);

  /// 0 sat/kwu.
  /// 
  /// Equivalent to [min], may better express intent in some contexts.
  static final FeeRate zero = FeeRate._(BigInt.zero);

  /// Minimum possible value (0 sat/kwu).
  /// 
  /// Equivalent to [zero], may better express intent in some contexts.
  static final FeeRate min = FeeRate._(BigInt.zero);

  /// Maximum possible value.
  static final FeeRate max = FeeRate._(BigInt.parse('18446744073709551615')); // u64::MAX

  /// Minimum fee rate required to broadcast a transaction.
  /// 
  /// The value matches the default Bitcoin Core policy at the time of library release.
  static final FeeRate broadcastMin = FeeRate.fromSatPerVbUnchecked(1);

  /// Fee rate used to compute dust amount.
  static final FeeRate dust = FeeRate.fromSatPerVbUnchecked(3);

  /// Constructs [FeeRate] from satoshis per 1000 weight units.
  static FeeRate fromSatPerKwu(BigInt satKwu) {
    return FeeRate._(satKwu);
  }

  /// Constructs [FeeRate] from satoshis per virtual bytes.
  /// 
  /// Returns null on arithmetic overflow.
  static FeeRate? fromSatPerVb(BigInt satVb) {
    // 1 vb == 4 wu
    // 1 sat/vb == 1/4 sat/wu
    // sat_vb sat/vb * 1000 / 4 == sat/kwu
    try {
      final result = satVb * BigInt.from(1000 ~/ 4);
      return FeeRate._(result);
    } catch (e) {
      return null; // Overflow occurred
    }
  }

  /// Constructs [FeeRate] from satoshis per virtual bytes without overflow check.
  static FeeRate fromSatPerVbUnchecked(int satVb) {
    return FeeRate._(BigInt.from(satVb * (1000 ~/ 4)));
  }

  /// Returns raw fee rate.
  /// 
  /// Can be used instead of getter to avoid inference issues.
  BigInt toSatPerKwu() {
    return _satPerKwu;
  }

  /// Gets the raw fee rate in satoshis per 1000 weight units.
  BigInt get satPerKwu => _satPerKwu;

  /// Converts to sat/vB rounding down.
  BigInt toSatPerVbFloor() {
    return _satPerKwu ~/ BigInt.from(1000 ~/ 4);
  }

  /// Converts to sat/vB rounding up.
  BigInt toSatPerVbCeil() {
    final divisor = BigInt.from(1000 ~/ 4);
    return (_satPerKwu + divisor - BigInt.one) ~/ divisor;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FeeRate && other._satPerKwu == _satPerKwu;
  }

  @override
  int get hashCode => _satPerKwu.hashCode;

  @override
  String toString() => 'FeeRate(${_satPerKwu} sat/kwu)';
}
