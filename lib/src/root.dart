import 'dart:async';
import 'dart:typed_data';

import 'package:ldk_node/ldk_node.dart';
import 'package:ldk_node/src/generated/api/extensions.dart';

import 'generated/lib.dart';
import 'generated/third_party/ldk_adapter/builder.dart' as builder;
import 'generated/third_party/ldk_adapter/node.dart';
import 'generated/third_party/ldk_adapter/graph.dart' as graph;
import 'generated/third_party/ldk_adapter/bolt11.dart' as bolt11;
import 'generated/third_party/ldk_adapter/bolt12.dart' as bolt12;
import 'generated/third_party/ldk_adapter/on_chain.dart' as on_chain;
import 'generated/third_party/ldk_adapter/spontaneous.dart' as spontaneous;
import 'generated/third_party/ldk_adapter/unified_qr.dart' as unified_qr;

import 'generated/third_party/ldk_adapter/types.dart' as types;
import 'generated/api/extensions.dart' as extensions;
import 'generated/third_party/shared.dart';

import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:path_provider/path_provider.dart';

// Default service constants
class DefaultServicesTestnet {
  static const String esploraServerUrl = "https://blockstream.info/testnet/api";
  static const String rgsServerUrl =
      "https://rapidsync.lightningdevkit.org/testnet/snapshot";
}

class DefaultServicesMutinynet {
  static const String esploraServerUrl = "https://mutinynet.ltbl.io/api";
  static const String rgsServerUrl =
      "https://rapidsync.lightningdevkit.org/mutinynet/snapshot";
  static const String lsps2SourceAddress = "45.79.52.207";
  static const int lsps2SourcePort = 39735;
  static const String lsps2SourcePublicKey =
      "0371d6fd7d75de2d0372d03ea00e8bacdacb50c27d0eaea0a76a0622eff1f5ef2b";
  static const String? lsps2SourceToken = null;
  static const EsploraSyncConfig? esploraServerConfig =
      null; // This would need proper configuration
}

typedef SpontaneousPayment = spontaneous.SpontaneousPayment;
typedef OnChainPayment = on_chain.OnChainPayment;
typedef NetworkGraph = graph.NetworkGraph;
typedef Bolt11Payment = bolt11.Bolt11Payment;
typedef Bolt12Payment = bolt12.Bolt12Payment;
typedef UnifiedQrPayment = unified_qr.UnifiedQrPayment;

class Builder {
  extensions.Config? _config;
  extensions.EntropySourceConfig? _entropySource;
  extensions.ChainDataSourceConfig? _chainDataSourceConfig;
  GossipSourceConfig? _gossipSourceConfig;
  types.LiquiditySourceConfig? _liquiditySourceConfig;
  builder.LdkBuilder? _configuredBuilder;

  /// Creates a new builder instance from an [Config].
  ///
  factory Builder.fromConfig({required extensions.Config config}) {
    return Builder._(config);
  }
  Builder._(this._config);

  /// Creates a new builder instance with the default configuration.
  ///
  factory Builder() {
    return Builder._(extensions.Config(
      storageDirPath: '',
      network: Network.bitcoin,
      listeningAddresses: [
        // We'll need to create this properly
      ],
      // logLevel: types.LogLevel.debug,
      trustedPeers0Conf: [],
      probingLiquidityLimitMultiplier: BigInt.from(3),
    ));
  }

  /// Creates a new builder instance with default services configured for testnet.
  ///
  factory Builder.testnet({extensions.Config? config}) {
    final Builder builder =
        config != null ? Builder.fromConfig(config: config) : Builder();

    return builder
        .setNetwork(Network.testnet)
        .setChainSourceEsplora(
            esploraServerUrl: DefaultServicesTestnet.esploraServerUrl)
        .setGossipSourceRgs(DefaultServicesTestnet.rgsServerUrl);
  }

  /// Creates a new builder instance with default services configured for mutinynet.
  ///
  factory Builder.mutinynet({extensions.Config? config}) {
    final Builder builder =
        config != null ? Builder.fromConfig(config: config) : Builder();

    return builder
        .setNetwork(Network.signet)
        .setChainSourceEsplora(
            esploraServerUrl: DefaultServicesMutinynet.esploraServerUrl,
            syncConfig: DefaultServicesMutinynet.esploraServerConfig)
        .setGossipSourceRgs(DefaultServicesMutinynet.rgsServerUrl)
        .setLiquiditySourceLsps2(
          address: extensions.AddressHostname(
            addr: DefaultServicesMutinynet.lsps2SourceAddress,
            port: DefaultServicesMutinynet.lsps2SourcePort,
          ).asSocket(),
          publicKey: PublicKey(
            hex: DefaultServicesMutinynet.lsps2SourcePublicKey,
          ),
          token: DefaultServicesMutinynet.lsps2SourceToken,
        );
  }

  /// Configures the [LdkNode] instance to source its wallet entropy from a seed file on disk.
  ///
  /// If the given file does not exist a new random seed file will be generated and
  /// stored at the given location.
  ///
  Builder setEntropySeedPath(String seedPath) {
    _entropySource = extensions.EntropySourceConfig.seedFile(seedPath);
    return this;
  }

  /// Configures the [LdkNode] instance to source its wallet entropy from the given 64 seed bytes.
  ///
  /// **Note:** Panics if the length of the given `seedBytes` differs from 64.
  ///
  Builder setEntropySeedBytes(Uint8List seedBytes) {
    _entropySource = extensions.EntropySourceConfig.seedBytes(seedBytes);
    return this;
  }

  /// Configures the [LdkNode] instance to source its chain data from the given Esplora server.
  ///
  Builder setEntropyBip39Mnemonic(
      {required Mnemonic mnemonic, String? passphrase}) {
    _entropySource =
        extensions.EntropySourceConfig.bip39Mnemonic(mnemonic, passphrase);

    return this;
  }

  ///Configures the [LdkNode] instance to source its chain data from the given Esplora server.
  ///
  Builder setChainSourceEsplora(
      {required String esploraServerUrl, EsploraSyncConfig? syncConfig}) {
    _chainDataSourceConfig = extensions.ChainDataSourceConfig.esplora(
        serverUrl: esploraServerUrl, syncConfig: syncConfig);
    return this;
  }

  Builder setChainSourceBitcoinRpc(
      {required String rpcHost,
      required int rpcPort,
      required String rpcUser,
      required String rpcPassword}) {
    _chainDataSourceConfig = extensions.ChainDataSourceConfig.bitcoindRpc(
        rpcHost: rpcHost,
        rpcPort: rpcPort,
        rpcUser: rpcUser,
        rpcPassword: rpcPassword);
    return this;
  }

  /// Configures the [LdkNode] instance to source its gossip data from the Lightning peer-to-peer
  /// network.
  ///
  Builder setGossipSourceP2p() {
    _gossipSourceConfig = extensions.GossipSourceConfig.p2PNetwork();
    return this;
  }

  /// Configures the [LdkNode] instance to source its gossip data from the given RapidGossipSync
  /// server.
  ///
  Builder setGossipSourceRgs(String rgsServerUrl) {
    _gossipSourceConfig =
        extensions.GossipSourceConfig.rapidGossipSync(rgsServerUrl);
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
  Builder setNetwork(Network network) {
    _config!.network = network;
    return this;
  }

  /// Sets the IP address and TCP port on which [LdkNode] will listen for incoming network connections.
  ///
  ///
  Builder setListeningAddresses(List<SocketAddress> listeningAddresses) {
    if (listeningAddresses.length > 100) {
      throw Exception("Given listening addresses are invalid.");
    }
    _config!.listeningAddresses!.addAll(listeningAddresses);
    return this;
  }

  /// Sets the node alias that will be used when broadcasting announcements to the gossip
  /// network.
  ///
  /// The provided alias must be a valid UTF-8 string and no longer than 32 bytes in total.
  Builder setNodeAlias(String nodeAlias) {
    // Alias must be 32 bytes or less.
    if (nodeAlias.codeUnits.length > 32) {
      throw Exception("Invalid NodeAlias.");
    }
    final bytes = Uint8List(32)
      ..setRange(0, nodeAlias.codeUnits.length, nodeAlias.codeUnits);
    _config!.nodeAlias = types.NodeAlias(field0: U8Array32(bytes));
    return this;
  }

  /// Configures the LdkNode instance to write logs to the filesystem.
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
  Future<Builder> setFilesystemLogger({
    String? logFilePath,
    types.LogLevel? maxLogLevel,
  }) async {
    // Create or get the builder instance
    _configuredBuilder ??= await builder.LdkBuilder.createBuilder(
      config: _config ?? Builder()._config!,
      chainDataSourceConfig: _chainDataSourceConfig,
      entropySourceConfig: _entropySource,
      liquiditySourceConfig: _liquiditySourceConfig,
      gossipSourceConfig: _gossipSourceConfig,
    );

    // Configure filesystem logging
    _configuredBuilder = await _configuredBuilder!.setFilesystemLogger(
      logFilePath: logFilePath,
      maxLogLevel: maxLogLevel,
    );

    return this;
  }

  /// Configures the LdkNode instance to write logs to the Rust log facade.
  ///
  /// This forwards logs to the Rust `log` crate, allowing integration with existing
  /// Rust logging frameworks and making logs available to Dart through standard
  /// Rust logging mechanisms.
  ///
  /// Example:
  /// ```dart
  /// builder.setLogFacadeLogger();
  /// ```
  Future<Builder> setLogFacadeLogger() async {
    // Create or get the builder instance
    _configuredBuilder ??= await builder.LdkBuilder.createBuilder(
      config: _config ?? Builder()._config!,
      chainDataSourceConfig: _chainDataSourceConfig,
      entropySourceConfig: _entropySource,
      liquiditySourceConfig: _liquiditySourceConfig,
      gossipSourceConfig: _gossipSourceConfig,
    );

    // Configure log facade
    _configuredBuilder = await _configuredBuilder!.setLogFacadeLogger();

    return this;
  }

  /// Configures the [LdkNode] instance to source its inbound liquidity from the given
  /// [LSPS2](https://github.com/BitcoinAndLightningLayerSpecs/lsp/blob/main/LSPS2/README.md)
  /// service.
  ///
  /// Will mark the LSP as trusted for 0-confirmation channels, see `config.trustedPeers0conf`.
  ///
  /// The given `token` will be used by the LSP to authenticate the user.
  Builder setLiquiditySourceLsps2(
      {required SocketAddress address,
      required PublicKey publicKey,
      String? token}) {
    _liquiditySourceConfig =
        types.LiquiditySourceConfig(lsps2Service: (address, publicKey, token));
    return this;
  }

  /// Builds a [LdkNode] instance with a SqliteStore backend and according to the options
  /// previously configured.
  ///
  Future<Node> build() async {
    if (_config!.storageDirPath == '') {
      final directory = await getApplicationDocumentsDirectory();
      final nodePath = "${directory.path}/ldk_cache/";
      _config!.storageDirPath = nodePath;
    }

    // Use configured builder if available, otherwise create new one
    final builderInstance = _configuredBuilder ??
        await builder.LdkBuilder.createBuilder(
          config: _config ?? Builder()._config!,
          chainDataSourceConfig: _chainDataSourceConfig,
          entropySourceConfig: _entropySource,
          liquiditySourceConfig: _liquiditySourceConfig,
          gossipSourceConfig: _gossipSourceConfig,
        );

    final res = await builderInstance.build();
    return res;
  }

  ///Builds a LdkNode instance with a FilesystemStore backend and according to the options previously configured.
  Future<Node> buildWithFsStore() async {
    if (_config!.storageDirPath == '') {
      final directory = await getApplicationDocumentsDirectory();
      final nodePath = "${directory.path}/ldk_cache/";
      _config!.storageDirPath = nodePath;
    }

    // Use configured builder if available, otherwise create new one
    final builderInstance = _configuredBuilder ??
        await builder.LdkBuilder.createBuilder(
          config: _config ?? Builder()._config!,
          chainDataSourceConfig: _chainDataSourceConfig,
          entropySourceConfig: _entropySource,
          liquiditySourceConfig: _liquiditySourceConfig,
          gossipSourceConfig: _gossipSourceConfig,
        );

    final res = await builderInstance.buildWithFsStore();
    return res;
  }

  Future<Node> buildWithVssStore(
      {required String vssUrl,
      required String storeId,
      required String lnurlAuthServerUrl,
      required Map<String, String> fixedHeaders}) async {
    if (_config!.storageDirPath == '') {
      final directory = await getApplicationDocumentsDirectory();
      final nodePath = "${directory.path}/ldk_cache/";
      _config!.storageDirPath = nodePath;
    }
    final res = await (await builder.LdkBuilder.createBuilder(
            config: _config ?? Builder()._config!,
            chainDataSourceConfig: _chainDataSourceConfig,
            entropySourceConfig: _entropySource,
            liquiditySourceConfig: _liquiditySourceConfig,
            gossipSourceConfig: _gossipSourceConfig))
        .buildWithVssStore(
            vssUrl: vssUrl,
            storeId: storeId,
            lnurlAuthServerUrl: lnurlAuthServerUrl,
            fixedHeaders: fixedHeaders);
    return res;
  }

  Future<Node> buildWithVssStoreAndFixedHeaders(
      {required String vssUrl,
      required String storeId,
      required Map<String, String> fixedHeaders}) async {
    if (_config!.storageDirPath == '') {
      final directory = await getApplicationDocumentsDirectory();
      final nodePath = "${directory.path}/ldk_cache/";
      _config!.storageDirPath = nodePath;
    }
    final res = (await builder.LdkBuilder.createBuilder(
            config: _config ?? Builder()._config!,
            chainDataSourceConfig: _chainDataSourceConfig,
            entropySourceConfig: _entropySource,
            liquiditySourceConfig: _liquiditySourceConfig,
            gossipSourceConfig: _gossipSourceConfig))
        .buildWithVssStoreAndFixedHeaders(
            vssUrl: vssUrl, storeId: storeId, fixedHeaders: fixedHeaders);
    return res;
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
  static final FeeRate max =
      FeeRate._(BigInt.parse('18446744073709551615')); // u64::MAX

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
  String toString() => 'FeeRate($_satPerKwu} sat/kwu)';
}
