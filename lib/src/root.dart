// import 'dart:async';
// import 'dart:typed_data';

// import 'generated/lib.dart';
// import 'generated/third_party/ldk_adapter/builder.dart' as builder;
// import 'generated/third_party/ldk_adapter/node.dart';
// import 'generated/third_party/ldk_adapter/graph.dart' as graph;
// import 'generated/third_party/ldk_adapter/bolt11.dart' as bolt11;
// import 'generated/third_party/ldk_adapter/bolt12.dart' as bolt12;
// import 'generated/third_party/ldk_adapter/on_chain.dart' as on_chain;
// import 'generated/third_party/ldk_adapter/spontaneous.dart' as spontaneous;
// import 'generated/third_party/ldk_adapter/unified_qr.dart' as unified_qr;

// import 'generated/third_party/ldk_adapter/types.dart' as types;
// import 'generated/third_party/shared.dart';

// import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
// import 'package:path_provider/path_provider.dart';

// // ============================================================================
// // MIGRATION STATUS: 
// // ============================================================================
// // This file has been partially migrated to the new Flutter Rust Bridge v2 API.
// // 
// // COMPLETED:
// // - Updated imports to new generated structure
// // - Removed Frb.verifyInit() calls 
// // - Migrated Node → LdkNode with composition pattern
// // - Migrated Mnemonic → LdkMnemonic
// // - Updated type references (PublicKey, SocketAddress, PaymentId from shared.dart)
// // - Removed try-catch error handling blocks
// // 
// // PENDING (needs Rust-side implementation):
// // - SocketAddress constructors (hostname, tcpIpV4, etc.)
// // - EntropySourceConfig constructors (seedFile, seedBytes, bip39Mnemonic)
// // - ChainDataSourceConfig constructors (esplora, bitcoindRpc)
// // - GossipSourceConfig constructors (p2PNetwork, rapidGossipSync)
// // - Config field mutability (currently all fields are final)
// // - LdkBuilder async handling (createBuilder returns Future<LdkBuilder>)
// // ============================================================================

// // Default service constants
// class DefaultServicesTestnet {
//   static const String esploraServerUrl = "https://blockstream.info/testnet/api";
//   static const String rgsServerUrl = "https://rapidsync.lightningdevkit.org/testnet/snapshot";
// }

// class DefaultServicesMutinynet {
//   static const String esploraServerUrl = "https://mutinynet.ltbl.io/api";
//   static const String rgsServerUrl = "https://rapidsync.lightningdevkit.org/mutinynet/snapshot";
//   static const String lsps2SourceAddress = "45.79.52.207";
//   static const int lsps2SourcePort = 39735;
//   static const String lsps2SourcePublicKey = "0371d6fd7d75de2d0372d03ea00e8bacdacb50c27d0eaea0a76a0622eff1f5ef2b";
//   static const String? lsps2SourceToken = null;
//   static const esploraServerConfig = null; // This would need proper configuration
// }

// typedef SpontaneousPayment = spontaneous.SpontaneousPayment;
// typedef OnChainPayment = on_chain.OnChainPayment;
// typedef NetworkGraph = graph.NetworkGraph;
// typedef Bolt11Payment = bolt11.Bolt11Payment;
// typedef Bolt12Payment = bolt12.Bolt12Payment;
// typedef UnifiedQrPayment = unified_qr.UnifiedQrPayment;

// ///The from string implementation will try to determine the language of the mnemonic from all the supported languages. (Languages have to be explicitly enabled using the Cargo features.)
// /// Supported number of words are 12, 15, 18, 21, and 24.

// class LdkMnemonic extends Mnemonic {
//   LdkMnemonic({required super.words});
  
//   static Future<LdkMnemonic> generate() async {
//     final res = await Mnemonic.generate();
//     return LdkMnemonic(words: res.words);
//   }
// }

// ///The main interface object of LDK Node, wrapping the necessary LDK and BDK functionalities.
// ///
// ///Needs to be initialized and instantiated through builder.build().
// ///
// class LdkNode {
//   final Node _node;

//   LdkNode._(this._node);

//   /// Starts the necessary background tasks, such as handling events coming from user input,
//   /// LDK/BDK, and the peer-to-peer network.
//   ///
//   /// After this returns, the [Node] instance can be controlled via the provided API methods in
//   /// a thread-safe manner.
//   Future<void> start({hint}) async {
//     return await _node.start();
//   }

//   /// Disconnects all peers, stops all running background tasks, and shuts down [Node].
//   ///
//   /// After this returns most API methods will throw NotRunning Exception.
//   ///
//   Future<void> stop({hint}) async {
//     await _node.stop();
//   }

//   ///Returns the status of the Node.
//   Future<types.NodeStatus> status({hint}) async {
//     return await _node.status();
//   }

//   /// Blocks until the next event is available.
//   ///
//   /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
//   Future<void> eventHandled({hint}) async {
//     await _node.eventHandled();
//   }

//   // Confirm the last retrieved event handled.
//   ///
//   /// **Note:** This **MUST** be called after each event has been handled.
//   Future<types.Event?> nextEvent({hint}) async {
//     return await _node.nextEvent();
//   }

//   /// Returns the next event in the event queue.
//   ///
//   /// Will block the current thread until the next event is available.
//   ///
//   /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
//   ///
//   Future<types.Event?> waitNextHandled({hint}) async {
//     return await _node.waitNextEvent();
//   }

//   ///Returns the next event in the event queue.
//   /// Will asynchronously poll the event queue until the next event is ready.
//   /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
//   Future<types.Event> nextEventAsync({hint}) async {
//     return await _node.nextEventAsync();
//   }

//   /// Returns our own node id
//   Future<PublicKey> nodeId({hint}) async {
//     return await _node.nodeId();
//   }

//   /// Returns our listening address
//   Future<List<SocketAddress>?> listeningAddresses({hint}) async {
//     return await _node.listeningAddresses();
//   }

//   /// Retrieve the currently spendable on-chain balance in satoshis.
//   Future<types.BalanceDetails> listBalances({hint}) async {
//     return await _node.listBalances();
//   }

//   ///Returns the config with which the Node was initialized.
//   Future<types.Config> config({hint}) async {
//     return await _node.config();
//   }

//   ///Retrieve a list of known channels.
//   Future<List<types.ChannelDetails>> listChannels({hint}) async {
//     return await _node.listChannels();
//   }

//   /// Connect to a node on the peer-to-peer network.
//   ///
//   /// If `permanently` is set to `true`, we'll remember the peer and reconnect to it on restart.
//   Future<void> connect(
//       {required SocketAddress address,
//       required PublicKey nodeId,
//       required bool persist,
//       hint}) async {
//     return await _node
//         .connect(address: address, nodeId: nodeId, persist: persist);
//   }

//   /// Disconnects the peer with the given node id.
//   ///
//   /// Will also remove the peer from the peer store, i.e., after this has been called we won't
//   /// try to reconnect on restart.
//   Future<void> disconnect(
//       {required PublicKey counterpartyNodeId, hint}) async {
//     await _node.disconnect(
//       counterpartyNodeId: counterpartyNodeId,
//     );
//   }

//   /// Connect to a node and open a new channel. Disconnects and re-connects are handled automatically
//   ///
//   /// Disconnects and reconnects are handled automatically.
//   ///
//   /// If `pushToCounterpartyMsat` is set, the given value will be pushed (read: sent) to the
//   /// channel counterparty on channel open. This can be useful to start out with the balance not
//   /// entirely shifted to one side, therefore allowing to receive payments from the getgo.
//   ///
//   /// Returns a temporary channel id.
//   Future<types.UserChannelId> openChannel(
//       {required SocketAddress socketAddress,
//       required PublicKey nodeId,
//       required BigInt channelAmountSats,
//       types.ChannelConfig? channelConfig,
//       BigInt? pushToCounterpartyMsat,
//       hint}) async {
//     return await _node.openChannel(
//       socketAddress: socketAddress,
//       nodeId: nodeId,
//       pushToCounterpartyMsat: pushToCounterpartyMsat,
//       channelAmountSats: channelAmountSats,
//       channelConfig: channelConfig,
//     );
//   }

//   /// Connect to a node and open a new announced channel.
//   ///
//   /// This will return an error if the node has not been sufficiently configured to operate as a
//   /// forwarding node that can properly announce its existence to the publip network graph, i.e.,
//   /// `config.listeningAddresses` and `config.nodeAlias` are unset.
//   ///
//   ///
//   /// If `pushToCounterpartyMsat` is set, the given value will be pushed (read: sent) to the
//   /// channel counterparty on channel open. This can be useful to start out with the balance not
//   /// entirely shifted to one side, therefore allowing to receive payments from the getgo.
//   ///
//   /// If Anchor channels are enabled, this will ensure the configured
//   /// `anchorChannelsConfig.perChannelReserveSats` is available and will be retained before
//   /// opening the channel.
//   ///
//   /// Returns a temporary channelId allowing to locally keep track of the channel.
//   Future<types.UserChannelId> openAnnouncedChannel(
//       {required SocketAddress socketAddress,
//       required PublicKey nodeId,
//       required BigInt channelAmountSats,
//       types.ChannelConfig? channelConfig,
//       BigInt? pushToCounterpartyMsat,
//       hint}) async {
//     return await _node.openAnnouncedChannel(
//       socketAddress: socketAddress,
//       nodeId: nodeId,
//       pushToCounterpartyMsat: pushToCounterpartyMsat,
//       channelAmountSats: channelAmountSats,
//       channelConfig: channelConfig,
//     );
//   }

//   ///Sync the LDK and BDK wallets with the current chain state.
//   /// Note that the wallets will be also synced regularly in the background
//   Future<void> syncWallets({hint}) async {
//     await _node.syncWallets();
//   }

//   ///Returns a handler allowing to query the network graph.
//   Future<NetworkGraph> networkGraph() async {
//     final res = await Node.networkGraph(ptr: _node);
//     return res;
//   }

//   /// Close a previously opened channel.
//   Future<void> closeChannel(
//       {required PublicKey counterpartyNodeId,
//       required types.UserChannelId userChannelId,
//       hint}) async {
//     await _node.closeChannel(
//       userChannelId: userChannelId,
//       counterpartyNodeId: counterpartyNodeId,
//     );
//   }

//   ///Force-close a previously opened channel.
//   /// Will force-close the channel, potentially broadcasting our latest state. Note that in contrast to cooperative closure, force-closing will have the channel funds time-locked, i. e., they will only be available after the counterparty had time to contest our claim.
//   /// Force-closing channels also more costly in terms of on-chain fees. So cooperative closure should always be preferred (and tried first).
//   /// Broadcasting the closing transactions will be omitted for Anchor channels if we trust the counterparty to broadcast for us.
//   Future<void> forceCloseChannel(
//       {required PublicKey counterpartyNodeId,
//       required types.UserChannelId userChannelId,
//       hint}) async {
//     await _node.forceCloseChannel(
//       userChannelId: userChannelId,
//       counterpartyNodeId: counterpartyNodeId,
//     );
//   }

//   ///Update the config for a previously opened channel.
//   ///
//   Future<void> updateChannelConfig(
//       {required PublicKey counterpartyNodeId,
//       required types.UserChannelId userChannelId,
//       required types.ChannelConfig channelConfig,
//       hint}) async {
//     await _node.updateChannelConfig(
//       userChannelId: userChannelId,
//       counterpartyNodeId: counterpartyNodeId,
//       channelConfig: channelConfig,
//     );
//   }

//   /// Retrieve the details of a specific payment with the given hash.
//   ///
//   /// Returns `PaymentDetails` if the payment was known and `null` otherwise.
//   Future<types.PaymentDetails?> payment(
//       {required PaymentId paymentId, hint}) async {
//     return await _node.payment(paymentId: paymentId);
//   }

//   ///Remove the payment with the given hash from the store.
//   Future<void> removePayment({required PaymentId paymentId, hint}) async {
//     return await _node.removePayment(paymentId: paymentId);
//   }

//   ///Retrieves all payments that match the given predicate.
//   Future<List<types.PaymentDetails>> listPaymentsWithFilter(
//       {required types.PaymentDirection paymentDirection, hint}) async {
//     return await _node
//         .listPaymentsWithFilter(paymentDirection: paymentDirection);
//   }

//   ///Retrieves all payments.
//   Future<List<types.PaymentDetails>> listPayments({hint}) async {
//     return await _node.listPayments();
//   }

//   ///Retrieves a list of known peers.
//   Future<List<types.PeerDetails>> listPeers({hint}) async {
//     return await _node.listPeers();
//   }

//   /// Creates a digital ECDSA signature of a message with the node's secret key.
//   ///
//   /// A receiver knowing the corresponding [PublicKey] (e.g. the node's id) and the message
//   /// can be sure that the signature was generated by the caller.
//   /// Signatures are EC recoverable, meaning that given the message and the
//   /// signature the PublicKey of the signer can be extracted.
//   Future<String> signMessage({required List<int> msg, hint}) async {
//     return await _node.signMessage(msg: msg);
//   }

//   /// Verifies that the given ECDSA signature was created for the given message with the
//   /// secret key corresponding to the given public key.
//   Future<bool> verifySignature(
//       {required List<int> msg,
//       required String sig,
//       required PublicKey publicKey,
//       hint}) async {
//     return await _node
//         .verifySignature(msg: msg, sig: sig, publicKey: publicKey);
//   }

//   ///Returns a payment handler allowing to create and pay BOLT 11 invoices.
//   Future<Bolt11Payment> bolt11Payment() async {
//     final res = await Node.bolt11Payment(ptr: _node);
//     return res;
//   }

//   ///Returns a payment handler allowing to create and pay BOLT 12 invoices.
//   Future<Bolt12Payment> bolt12Payment() async {
//     final res = await Node.bolt12Payment(ptr: _node);
//     return res;
//   }

//   ///Returns a payment handler allowing to send and receive on-chain payments.
//   Future<OnChainPayment> onChainPayment() async {
//     final res = await Node.onChainPayment(ptr: _node);
//     return res;
//   }

//   ///Returns a payment handler allowing to send spontaneous ("keysend") payments.
//   Future<SpontaneousPayment> spontaneousPayment() async {
//     final res = await Node.spontaneousPayment(ptr: _node);
//     return res;
//   }

//   ///Returns a payment handler allowing to create BIP 21 URIs with an on-chain, BOLT 11, and BOLT 12 payment options.
//   Future<UnifiedQrPayment> unifiedQrPayment() async {
//     final res = await Node.unifiedQrPayment(ptr: _node);
//     return res;
//   }
// }

// /// A builder for an [LdkNode] instance, allowing to set some configuration and module choices from
// /// the get-go.
// ///
// /// ### Defaults
// /// - Wallet entropy is sourced from a `keysSeed` file located under `config.storageDirPath`
// /// - Chain data is sourced from the Esplora endpoint `https://blockstream.info/api`
// /// - Gossip data is sourced via the peer-to-peer network
// ///
// class Builder {
//   types.Config? _config;
//   types.EntropySourceConfig? _entropySource;
//   types.ChainDataSourceConfig? _chainDataSourceConfig;
//   types.GossipSourceConfig? _gossipSourceConfig;
//   types.LiquiditySourceConfig? _liquiditySourceConfig;
//   builder.LdkBuilder? _configuredBuilder;

//   /// Creates a new builder instance from an [Config].
//   ///
//   factory Builder.fromConfig({required types.Config config}) {
//     return Builder._(config);
//   }
//   Builder._(this._config);

//   /// Creates a new builder instance with the default configuration.
//   ///
//   factory Builder() {
//     return Builder._(types.Config(
//       storageDirPath: '',
//       network: Network.bitcoin,
//       listeningAddresses: [
//         // We'll need to create this properly
//       ],
//       // logLevel: types.LogLevel.debug,
//       trustedPeers0Conf: [],
//       probingLiquidityLimitMultiplier: BigInt.from(3),
//     ));
//   }

//   /// Creates a new builder instance with default services configured for testnet.
//   ///
//   factory Builder.testnet({types.Config? config}) {
//     final Builder builder =
//         config != null ? Builder.fromConfig(config: config) : Builder();

//     return builder
//         .setNetwork(Network.testnet)
//         .setChainSourceEsplora(
//             esploraServerUrl: DefaultServicesTestnet.esploraServerUrl)
//         .setGossipSourceRgs(DefaultServicesTestnet.rgsServerUrl);
//   }

//   /// Creates a new builder instance with default services configured for mutinynet.
//   ///
//   factory Builder.mutinynet({types.Config? config}) {
//     final Builder builder =
//         config != null ? Builder.fromConfig(config: config) : Builder();

//     return builder
//         .setNetwork(types.Network.signet)
//         .setChainSourceEsplora(
//             esploraServerUrl: DefaultServicesMutinynet.esploraServerUrl,
//             syncConfig: DefaultServicesMutinynet.esploraServerConfig)
//         .setGossipSourceRgs(DefaultServicesMutinynet.rgsServerUrl)
//         .setLiquiditySourceLsps2(
//           address: SocketAddress.hostname(
//             addr: DefaultServicesMutinynet.lsps2SourceAddress,
//             port: DefaultServicesMutinynet.lsps2SourcePort,
//           ),
//           publicKey: PublicKey(
//             hex: DefaultServicesMutinynet.lsps2SourcePublicKey,
//           ),
//           token: DefaultServicesMutinynet.lsps2SourceToken,
//         );
//   }

//   /// Configures the [LdkNode] instance to source its wallet entropy from a seed file on disk.
//   ///
//   /// If the given file does not exist a new random seed file will be generated and
//   /// stored at the given location.
//   ///
//   Builder setEntropySeedPath(String seedPath) {
//     // Note: EntropySourceConfig.seedFile constructor missing from generated code
//     throw UnimplementedError('EntropySourceConfig.seedFile constructor not available in generated code');
//   }

//   /// Configures the [LdkNode] instance to source its wallet entropy from the given 64 seed bytes.
//   ///
//   /// **Note:** Panics if the length of the given `seedBytes` differs from 64.
//   ///
//   Builder setEntropySeedBytes(U8Array64 seedBytes) {
//     // Note: EntropySourceConfig.seedBytes constructor missing from generated code
//     throw UnimplementedError('EntropySourceConfig.seedBytes constructor not available in generated code');
//   }

//   /// Configures the [LdkNode] instance to source its chain data from the given Esplora server.
//   ///
//   Builder setEntropyBip39Mnemonic(
//       {required LdkMnemonic mnemonic, String? passphrase}) {
//     // Note: EntropySourceConfig.bip39Mnemonic constructor missing from generated code
//     throw UnimplementedError('EntropySourceConfig.bip39Mnemonic constructor not available in generated code');
//   }

//   ///Configures the [LdkNode] instance to source its chain data from the given Esplora server.
//   ///
//   Builder setChainSourceEsplora(
//       {required String esploraServerUrl, dynamic syncConfig}) {
//     // Note: EsploraSyncConfig constructor missing from generated code
//     // _chainDataSourceConfig = types.ChainDataSourceConfig.esplora(
//     //     serverUrl: esploraServerUrl, syncConfig: syncConfig);
//     // For now, this method won't work until the constructor is added to Rust side
//     throw UnimplementedError('ChainDataSourceConfig.esplora constructor not available in generated code');
//   }

//   Builder setChainSourceBitcoinRpc(
//       {required String rpcHost,
//       required int rpcPort,
//       required String rpcUser,
//       required String rpcPassword}) {
//     // Note: ChainDataSourceConfig.bitcoindRpc constructor missing from generated code
//     throw UnimplementedError('ChainDataSourceConfig.bitcoindRpc constructor not available in generated code');
//   }

//   /// Configures the [LdkNode] instance to source its gossip data from the Lightning peer-to-peer
//   /// network.
//   ///
//   Builder setGossipSourceP2p() {
//     // Note: GossipSourceConfig.p2PNetwork constructor missing from generated code
//     throw UnimplementedError('GossipSourceConfig.p2PNetwork constructor not available in generated code');
//   }

//   /// Configures the [LdkNode] instance to source its gossip data from the given RapidGossipSync
//   /// server.
//   ///
//   Builder setGossipSourceRgs(String rgsServerUrl) {
//     // Note: GossipSourceConfig.rapidGossipSync constructor missing from generated code
//     throw UnimplementedError('GossipSourceConfig.rapidGossipSync constructor not available in generated code');
//   }

//   /// Sets the used storage directory path.
//   ///
//   ///
//   Builder setStorageDirPath(String storageDirPath) {
//     _config!.storageDirPath = storageDirPath;
//     return this;
//   }

//   /// Sets the Bitcoin network used.
//   ///
//   Builder setNetwork(Network network) {
//     // Config fields are final, so this method needs to be implemented differently
//     // For now, this method won't work until the Config structure is mutable
//     throw UnimplementedError('Config fields are final - this needs to be reimplemented');
//   }

//   /// Sets the IP address and TCP port on which [LdkNode] will listen for incoming network connections.
//   ///
//   ///
//   Builder setListeningAddresses(List<SocketAddress> listeningAddresses) {
//     if (listeningAddresses.length > 100) {
//       throw Exception("Given listening addresses are invalid.");
//     }
//     _config!.listeningAddresses = listeningAddresses;
//     return this;
//   }

//   /// Sets the node alias that will be used when broadcasting announcements to the gossip
//   /// network.
//   ///
//   /// The provided alias must be a valid UTF-8 string and no longer than 32 bytes in total.
//   Builder setNodeAlias(String nodeAlias) {
//     // Alias must be 32 bytes or less.
//     if (nodeAlias.codeUnits.length > 32) {
//       throw Exception("Invalid NodeAlias.");
//     }
//     final bytes = Uint8List(32)
//       ..setRange(0, nodeAlias.codeUnits.length, nodeAlias.codeUnits);
//     _config!.nodeAlias = types.NodeAlias(field0: U8Array32(bytes));
//     return this;
//   }

//   /// Configures the LdkNode instance to write logs to the filesystem.
//   ///
//   /// The `logFilePath` defaults to 'ldk_node.log' in the configured storage directory if set to `null`.
//   /// If set, the `maxLogLevel` sets the maximum log level. Otherwise, defaults to Debug level.
//   ///
//   /// Example:
//   /// ```dart
//   /// builder.setFilesystemLogger(
//   ///   logFilePath: '/path/to/logs/ldk.log',
//   ///   maxLogLevel: types.LogLevel.info,
//   /// );
//   /// ```
//   Builder setFilesystemLogger({
//     String? logFilePath,
//     types.LogLevel? maxLogLevel,
//   }) {
//     // Create or get the builder instance
//     _configuredBuilder ??= builder.LdkBuilder.createBuilder(
//       config: _config ?? Builder()._config!,
//       chainDataSourceConfig: _chainDataSourceConfig,
//       entropySourceConfig: _entropySource,
//       liquiditySourceConfig: _liquiditySourceConfig,
//       gossipSourceConfig: _gossipSourceConfig,
//     );

//     // Configure filesystem logging
//     _configuredBuilder = _configuredBuilder!.setFilesystemLogger(
//       logFilePath: logFilePath,
//       maxLogLevel: maxLogLevel,
//     );

//     return this;
//   }

//   /// Configures the LdkNode instance to write logs to the Rust log facade.
//   ///
//   /// This forwards logs to the Rust `log` crate, allowing integration with existing
//   /// Rust logging frameworks and making logs available to Dart through standard
//   /// Rust logging mechanisms.
//   ///
//   /// Example:
//   /// ```dart
//   /// builder.setLogFacadeLogger();
//   /// ```
//   Builder setLogFacadeLogger() {
//     // Create or get the builder instance
//     _configuredBuilder ??= builder.LdkBuilder.createBuilder(
//       config: _config ?? Builder()._config!,
//       chainDataSourceConfig: _chainDataSourceConfig,
//       entropySourceConfig: _entropySource,
//       liquiditySourceConfig: _liquiditySourceConfig,
//       gossipSourceConfig: _gossipSourceConfig,
//     );

//     // Configure log facade
//     _configuredBuilder = _configuredBuilder!.setLogFacadeLogger();

//     return this;
//   }

//   /// Configures the [LdkNode] instance to source its inbound liquidity from the given
//   /// [LSPS2](https://github.com/BitcoinAndLightningLayerSpecs/lsp/blob/main/LSPS2/README.md)
//   /// service.
//   ///
//   /// Will mark the LSP as trusted for 0-confirmation channels, see `config.trustedPeers0conf`.
//   ///
//   /// The given `token` will be used by the LSP to authenticate the user.
//   Builder setLiquiditySourceLsps2(
//       {required SocketAddress address,
//       required PublicKey publicKey,
//       String? token}) {
//     _liquiditySourceConfig =
//         types.LiquiditySourceConfig(lsps2Service: (address, publicKey, token));
//     return this;
//   }

//   /// Builds a [LdkNode] instance with a SqliteStore backend and according to the options
//   /// previously configured.
//   ///
//   Future<LdkNode> build() async {
//     if (_config!.storageDirPath == '') {
//       final directory = await getApplicationDocumentsDirectory();
//       final nodePath = "${directory.path}/ldk_cache/";
//       _config!.storageDirPath = nodePath;
//     }

//     // Use configured builder if available, otherwise create new one
//     final builderInstance = _configuredBuilder ??
//         builder.LdkBuilder.createBuilder(
//           config: _config ?? Builder()._config!,
//           chainDataSourceConfig: _chainDataSourceConfig,
//           entropySourceConfig: _entropySource,
//           liquiditySourceConfig: _liquiditySourceConfig,
//           gossipSourceConfig: _gossipSourceConfig,
//         );

//     final res = await builderInstance.build();
//     return LdkNode._(res);
//   }

//   ///Builds a LdkNode instance with a FilesystemStore backend and according to the options previously configured.
//   Future<LdkNode> buildWithFsStore() async {
//     if (_config!.storageDirPath == '') {
//       final directory = await getApplicationDocumentsDirectory();
//       final nodePath = "${directory.path}/ldk_cache/";
//       _config!.storageDirPath = nodePath;
//     }

//     // Use configured builder if available, otherwise create new one
//     final builderInstance = _configuredBuilder ??
//         builder.LdkBuilder.createBuilder(
//           config: _config ?? Builder()._config!,
//           chainDataSourceConfig: _chainDataSourceConfig,
//           entropySourceConfig: _entropySource,
//           liquiditySourceConfig: _liquiditySourceConfig,
//           gossipSourceConfig: _gossipSourceConfig,
//         );

//     final res = await builderInstance.buildWithFsStore();
//     return LdkNode._(res);
//   }

//   Future<LdkNode> buildWithVssStore(
//       {required String vssUrl,
//       required String storeId,
//       required String lnurlAuthServerUrl,
//       required Map<String, String> fixedHeaders}) async {
//     if (_config!.storageDirPath == '') {
//       final directory = await getApplicationDocumentsDirectory();
//       final nodePath = "${directory.path}/ldk_cache/";
//       _config!.storageDirPath = nodePath;
//     }
//     final res = await builder.LdkBuilder.createBuilder(
//             config: _config ?? Builder()._config!,
//             chainDataSourceConfig: _chainDataSourceConfig,
//             entropySourceConfig: _entropySource,
//             liquiditySourceConfig: _liquiditySourceConfig,
//             gossipSourceConfig: _gossipSourceConfig)
//         .buildWithVssStore(
//             vssUrl: vssUrl,
//             storeId: storeId,
//             lnurlAuthServerUrl: lnurlAuthServerUrl,
//             fixedHeaders: fixedHeaders);
//     return LdkNode._(res);
//   }

//   Future<LdkNode> buildWithVssStoreAndFixedHeaders(
//       {required String vssUrl,
//       required String storeId,
//       required Map<String, String> fixedHeaders}) async {
//     if (_config!.storageDirPath == '') {
//       final directory = await getApplicationDocumentsDirectory();
//       final nodePath = "${directory.path}/ldk_cache/";
//       _config!.storageDirPath = nodePath;
//     }
//     final res = await builder.LdkBuilder.createBuilder(
//             config: _config ?? Builder()._config!,
//             chainDataSourceConfig: _chainDataSourceConfig,
//             entropySourceConfig: _entropySource,
//             liquiditySourceConfig: _liquiditySourceConfig,
//             gossipSourceConfig: _gossipSourceConfig)
//         .buildWithVssStoreAndFixedHeaders(
//             vssUrl: vssUrl, storeId: storeId, fixedHeaders: fixedHeaders);
//     return LdkNode._(res);
//   }
// }

// /// Represents the fee rate for Bitcoin transactions.
// /// 
// /// Fee rates are measured in satoshis per 1000 weight units (sat/kwu).
// /// This class provides utilities for converting between different fee rate units
// /// and includes common fee rate constants.
// class FeeRate {
//   /// The fee rate in satoshis per 1000 weight units
//   final BigInt _satPerKwu;

//   /// Private constructor
//   const FeeRate._(this._satPerKwu);

//   /// 0 sat/kwu.
//   /// 
//   /// Equivalent to [min], may better express intent in some contexts.
//   static final FeeRate zero = FeeRate._(BigInt.zero);

//   /// Minimum possible value (0 sat/kwu).
//   /// 
//   /// Equivalent to [zero], may better express intent in some contexts.
//   static final FeeRate min = FeeRate._(BigInt.zero);

//   /// Maximum possible value.
//   static final FeeRate max = FeeRate._(BigInt.parse('18446744073709551615')); // u64::MAX

//   /// Minimum fee rate required to broadcast a transaction.
//   /// 
//   /// The value matches the default Bitcoin Core policy at the time of library release.
//   static final FeeRate broadcastMin = FeeRate.fromSatPerVbUnchecked(1);

//   /// Fee rate used to compute dust amount.
//   static final FeeRate dust = FeeRate.fromSatPerVbUnchecked(3);

//   /// Constructs [FeeRate] from satoshis per 1000 weight units.
//   static FeeRate fromSatPerKwu(BigInt satKwu) {
//     return FeeRate._(satKwu);
//   }

//   /// Constructs [FeeRate] from satoshis per virtual bytes.
//   /// 
//   /// Returns null on arithmetic overflow.
//   static FeeRate? fromSatPerVb(BigInt satVb) {
//     // 1 vb == 4 wu
//     // 1 sat/vb == 1/4 sat/wu
//     // sat_vb sat/vb * 1000 / 4 == sat/kwu
//     try {
//       final result = satVb * BigInt.from(1000 ~/ 4);
//       return FeeRate._(result);
//     } catch (e) {
//       return null; // Overflow occurred
//     }
//   }

//   /// Constructs [FeeRate] from satoshis per virtual bytes without overflow check.
//   static FeeRate fromSatPerVbUnchecked(int satVb) {
//     return FeeRate._(BigInt.from(satVb * (1000 ~/ 4)));
//   }

//   /// Returns raw fee rate.
//   /// 
//   /// Can be used instead of getter to avoid inference issues.
//   BigInt toSatPerKwu() {
//     return _satPerKwu;
//   }

//   /// Gets the raw fee rate in satoshis per 1000 weight units.
//   BigInt get satPerKwu => _satPerKwu;

//   /// Converts to sat/vB rounding down.
//   BigInt toSatPerVbFloor() {
//     return _satPerKwu ~/ BigInt.from(1000 ~/ 4);
//   }

//   /// Converts to sat/vB rounding up.
//   BigInt toSatPerVbCeil() {
//     final divisor = BigInt.from(1000 ~/ 4);
//     return (_satPerKwu + divisor - BigInt.one) ~/ divisor;
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     return other is FeeRate && other._satPerKwu == _satPerKwu;
//   }

//   @override
//   int get hashCode => _satPerKwu.hashCode;

//   @override
//   String toString() => 'FeeRate(${_satPerKwu} sat/kwu)';
// }
