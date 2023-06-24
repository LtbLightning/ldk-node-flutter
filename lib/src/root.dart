import 'package:ldk_node/src/generated/bridge_definitions.dart';
import 'package:ldk_node/src/utils/loader.dart';
import 'package:path_provider/path_provider.dart';

///The main interface object of LDK Node, wrapping the necessary LDK and BDK functionalities.
///
///Needs to be initialized and instantiated through builder.build().
///
class Node extends NodePointer {
  Node._({required super.bridge, required super.field0});
  factory Node.create({required NodePointer pointer}) {
    return Node._(bridge: pointer.bridge, field0: pointer.field0);
  }
}

/// A builder for an [Node] instance, allowing to set some configuration and module choices from
/// the getgo.
///
/// ### Defaults
/// - Wallet entropy is sourced from a `keysSeed` file located under `config.storageDirPath`
/// - Chain data is sourced from the Esplora endpoint `https://blockstream.info/api`
/// - Gossip data is sourced via the peer-to-peer network
///
class Builder {
  Config? _config;
  EntropySourceConfig? _entropySource;
  ChainDataSourceConfig? _chainDataSourceConfig;
  GossipSourceConfig? _gossipSourceConfig;

  /// Creates a new builder instance from an [Config].
  ///
  factory Builder.fromConfig({required Config config}) {
    return Builder._(config);
  }
  Builder._(this._config);

  /// Creates a new builder instance with the default configuration.
  ///
  factory Builder() {
    return Builder._(Config(
        storageDirPath: '',
        network: Network.bitcoin,
        listeningAddress: NetAddress.iPv4(addr: "0.0.0.0", port: 9735),
        onchainWalletSyncIntervalSecs: 60,
        walletSyncIntervalSecs: 20,
        feeRateCacheUpdateIntervalSecs: 600,
        logLevel: LogLevel.debug,
        defaultCltvExpiryDelta: 144,
        trustedPeers0Conf: []));
  }

  /// Configures the [Node] instance to source its wallet entropy from a seed file on disk.
  ///
  /// If the given file does not exist a new random seed file will be generated and
  /// stored at the given location.
  ///
  Builder setEntropySeedPath(String seedPath) {
    _entropySource = EntropySourceConfig.seedFile(seedPath);
    return this;
  }

  /// Configures the [Node] instance to source its chain data from the given Esplora server.
  ///
  Builder setEntropyBip39Mnemonic(
      {required Mnemonic mnemonic, String? passphrase}) {
    _entropySource = EntropySourceConfig.bip39Mnemonic(
        mnemonic: mnemonic, passphrase: passphrase);
    return this;
  }

  /// Configures the [Node] instance to source its wallet entropy from the given 64 seed bytes.
  ///
  /// **Note:** Panics if the length of the given `seedBytes` differs from 64.
  ///
  Builder setEntropySeedBytes({required U8Array64 seedBytes}) {
    _entropySource = EntropySourceConfig.seedBytes(seedBytes);
    return this;
  }

  ///Configures the [Node] instance to source its chain data from the given Esplora server.
  ///
  Builder setEsploraServer({required String esploraServerUrl}) {
    _chainDataSourceConfig = ChainDataSourceConfig.esplora(esploraServerUrl);
    return this;
  }

  /// Configures the [Node] instance to source its gossip data from the Lightning peer-to-peer
  /// network.
  ///
  Builder setGossipSourceP2p() {
    _gossipSourceConfig = GossipSourceConfig.p2PNetwork();
    return this;
  }

  /// Configures the [Node] instance to source its gossip data from the given RapidGossipSync
  /// server.
  ///
  Builder setGossipSourceRgs({required String rgsServerUrl}) {
    _gossipSourceConfig = GossipSourceConfig.rapidGossipSync(rgsServerUrl);
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

  /// Sets the IP address and TCP port on which [Node] will listen for incoming network connections.
  ///
  ///
  Builder setListeningAddress(NetAddress listeningAddress) {
    _config!.listeningAddress = listeningAddress;
    return this;
  }

  /// Sets the level at which [Node] will log messages.
  ///
  Builder setLogLevel({required LogLevel level}) {
    _config!.logLevel = level;
    return this;
  }

  /// Builds a [Node] instance with a SqliteStore backend and according to the options
  /// previously configured.
  ///
  ///
  Future<Node> build() async {
    if (_config!.storageDirPath == '') {
      final directory = await getApplicationDocumentsDirectory();
      final nodePath = "${directory.path}/ldk_cache/";
      _config!.storageDirPath = nodePath;
    }
    final res = await loaderApi.buildNode(
        config: _config!,
        entropySourceConfig: _entropySource,
        chainDataSourceConfig: _chainDataSourceConfig,
        gossipSourceConfig: _gossipSourceConfig);
    return Node.create(pointer: res);
  }
}
