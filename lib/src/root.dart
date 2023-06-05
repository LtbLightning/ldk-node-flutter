import 'dart:async';

import 'generated/bridge_definitions.dart';
import 'utils/loader.dart';

class Node extends NodeBase {
  Node._({required super.bridge, required super.nodePointer});
  factory Node.create({required NodePointer pointer}) {
    return Node._(bridge: loaderApi, nodePointer: pointer);
  }
}

class Builder {
  @override
  String toString() {
    return 'entropySource: ${_entropySource.toString()}, config: ${_config.toString()}';
  }

  Config? _config;
  WalletEntropySource? _entropySource;

  /// Creates a new builder instance from an [Config].
  factory Builder.fromConfig({required Config config}) {
    return Builder._(config);
  }
  Builder._(this._config);

  /// Creates a new builder instance with the default configuration.
  Builder() {
    Builder._(Config(
        storageDirPath: '',
        network: Network.Testnet,
        esploraServerUrl: 'https://blockstream.info/testnet/api',
        listeningAddress: SocketAddr(ip: "0.0.0.0", port: 9735),
        defaultCltvExpiryDelta: 144));
  }

  /// Configures the [Node] instance to source its wallet entropy from a seed file on disk.
  ///
  /// If the given file does not exist a new random seed file will be generated and
  /// stored at the given location.
  Builder setEntropySeedPath(String seedPath) {
    _entropySource = WalletEntropySource.seedFile(seedPath);
    return this;
  }

  /// Configures the [Node] instance to source its chain data from the given Esplora server.
  Builder setEntropyBip39Mnemonic(
      {required String mnemonic, String? passphrase}) {
    _entropySource = WalletEntropySource.bip39Mnemonic(
        mnemonic: mnemonic, passphrase: passphrase);
    return this;
  }

  /// Configures the [Node] instance to source its wallet entropy from the given 64 seed bytes.
  ///
  /// **Note:** Panics if the length of the given `seedBytes` differs from 64.
  Builder setEntropySeedBytes({required U8Array64 seedBytes}) {
    _entropySource = WalletEntropySource.seedBytes(seedBytes);
    return this;
  }

  /// Configures the [Node] instance to source its chain data from the given Esplora server.
  Builder setEsploraServerUrl(String esploraServerUrl) {
    Builder()._config!.esploraServerUrl = esploraServerUrl;
    return this;
  }

  /// Sets the used storage directory path.
  ///
  Builder setStorageDirPath(String storageDirPath) {
    Builder()._config!.storageDirPath = storageDirPath;
    return this;
  }

  /// Sets the Bitcoin network used.
  Builder setNetwork(Network network) {
    Builder()._config!.network = network;
    return this;
  }

  /// Sets the IP address and TCP port on which [Node] will listen for incoming network connections.
  ///
  Builder setListeningAddress(SocketAddr listeningAddress) {
    Builder()._config!.listeningAddress = listeningAddress;
    return this;
  }

  Future<Node> build() async {
    final res = await loaderApi.buildNode(
        config: _config!, entropySource: _entropySource);
    return Node.create(pointer: res.nodePointer);
  }
}
