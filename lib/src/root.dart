import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:ldk_node/src/generated/bridge_definitions.dart' as bridge;
import 'package:ldk_node/src/utils/exceptions.dart';
import 'package:ldk_node/src/utils/loader.dart';
import 'package:path_provider/path_provider.dart';

class Mnemonic extends bridge.Mnemonic {
  Mnemonic(String seedPhrase)
      : super(bridge: loaderApi, seedPhrase: seedPhrase);
  static Future<bridge.Mnemonic> generate() async {
    final res = await bridge.Mnemonic.generate(bridge: loaderApi);
    return res;
  }
}

///The main interface object of LDK Node, wrapping the necessary LDK and BDK functionalities.
///
///Needs to be initialized and instantiated through builder.build().
///
class Node {
  final bridge.NodePointer _pointer;
  Node._(this._pointer);

  /// Starts the necessary background tasks, such as handling events coming from user input,
  /// LDK/BDK, and the peer-to-peer network.
  ///
  /// After this returns, the [Node] instance can be controlled via the provided API methods in
  /// a thread-safe manner.
  Future<void> start() async {
    try {
      await loaderApi.startMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Disconnects all peers, stops all running background tasks, and shuts down [Node].
  ///
  /// After this returns most API methods will throw NotRunning Exception.
  ///
  Future<void> stop() async {
    try {
      await loaderApi.stopMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Blocks until the next event is available.
  ///
  /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
  Future<void> eventHandled() async {
    try {
      await loaderApi.eventHandledMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  // Confirm the last retrieved event handled.
  ///
  /// **Note:** This **MUST** be called after each event has been handled.
  Future<bridge.Event?> nextEvent() async {
    try {
      return await loaderApi.nextEventMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Returns the next event in the event queue.
  ///
  /// Will block the current thread until the next event is available.
  ///
  /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
  ///
  Future<bridge.Event?> waitNextHandled() async {
    try {
      return await loaderApi.waitNextEventMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Returns our own node id
  Future<bridge.PublicKey> nodeId() async {
    try {
      return await loaderApi.nodeIdMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Returns our listening address
  Future<List<bridge.SocketAddress>?> listeningAddresses() async {
    try {
      return await loaderApi.listeningAddressesMethodNodePointer(
          that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Retrieve a new on-chain/funding address.
  Future<bridge.Address> newOnchainAddress() async {
    try {
      return await loaderApi.newOnchainAddressMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Retrieve the currently spendable on-chain balance in satoshis.
  Future<int> spendableOnchainBalanceSats() async {
    try {
      return await loaderApi.spendableOnchainBalanceSatsMethodNodePointer(
          that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Retrieve the current total on-chain balance in satoshis.
  Future<int> totalOnchainBalanceSats() async {
    try {
      return await loaderApi.totalOnchainBalanceSatsMethodNodePointer(
          that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Send an on-chain payment to the given address.
  Future<bridge.Txid> sendToOnchainAddress(
      {required bridge.Address address, required int amountSats}) async {
    try {
      return await loaderApi.sendToOnchainAddressMethodNodePointer(
          that: _pointer, address: address, amountSats: amountSats);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Send an on-chain payment to the given address, draining all the available funds.
  Future<bridge.Txid> sendAllToOnchainAddress(
      {required bridge.Address address}) async {
    try {
      return await loaderApi.sendAllToOnchainAddressMethodNodePointer(
          that: _pointer, address: address);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  ///Retrieve a list of known channels.
  Future<List<bridge.ChannelDetails>> listChannels() async {
    try {
      return await loaderApi.listChannelsMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Connect to a node on the peer-to-peer network.
  ///
  /// If `permanently` is set to `true`, we'll remember the peer and reconnect to it on restart.
  Future<void> connect(
      {required bridge.SocketAddress netaddress,
      required bridge.PublicKey nodeId,
      required bool persist}) async {
    try {
      await loaderApi.connectMethodNodePointer(
          that: _pointer,
          address: netaddress,
          nodeId: nodeId,
          persist: persist);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Disconnects the peer with the given node id.
  ///
  /// Will also remove the peer from the peer store, i.e., after this has been called we won't
  /// try to reconnect on restart.
  Future<void> disconnect({
    required bridge.PublicKey counterpartyNodeId,
  }) async {
    try {
      await loaderApi.disconnectMethodNodePointer(
        that: _pointer,
        counterpartyNodeId: counterpartyNodeId,
      );
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
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
  Future<void> connectOpenChannel(
      {required bridge.SocketAddress netaddress,
      required bridge.PublicKey nodeId,
      required int channelAmountSats,
      required bool announceChannel,
      bridge.ChannelConfig? channelConfig,
      int? pushToCounterpartyMsat}) async {
    try {
      await loaderApi.connectOpenChannelMethodNodePointer(
          that: _pointer,
          address: netaddress,
          nodeId: nodeId,
          pushToCounterpartyMsat: pushToCounterpartyMsat,
          channelAmountSats: channelAmountSats,
          channelConfig: channelConfig,
          announceChannel: announceChannel);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  ///Sync the LDK and BDK wallets with the current chain state.
  /// Note that the wallets will be also synced regularly in the background
  Future<void> syncWallets() async {
    try {
      await loaderApi.syncWalletsMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Close a previously opened channel.
  Future<void> closeChannel({
    required bridge.PublicKey counterpartyNodeId,
    required bridge.ChannelId channelId,
  }) async {
    try {
      await loaderApi.closeChannelMethodNodePointer(
        that: _pointer,
        channelId: channelId,
        counterpartyNodeId: counterpartyNodeId,
      );
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  ///Update the config for a previously opened channel.
  ///
  Future<void> updateChannelConfig({
    required bridge.PublicKey counterpartyNodeId,
    required bridge.ChannelId channelId,
    required bridge.ChannelConfig channelConfig,
  }) async {
    try {
      await loaderApi.updateChannelConfigMethodNodePointer(
        that: _pointer,
        channelId: channelId,
        counterpartyNodeId: counterpartyNodeId,
        channelConfig: channelConfig,
      );
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Send a payement given an invoice.
  Future<bridge.PaymentHash> sendPayment({
    required bridge.Bolt11Invoice invoice,
  }) async {
    try {
      return await loaderApi.sendPaymentMethodNodePointer(
          that: _pointer, invoice: invoice);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Send a payment given an invoice and an amount in millisatoshi.
  ///
  /// This will fail if the amount given is less than the value required by the given invoice.
  ///
  /// This can be used to pay a so-called "zero-amount" invoice, i.e., an invoice that leaves the
  /// amount paid to be determined by the user.
  Future<bridge.PaymentHash> sendPaymentUsingAmount(
      {required bridge.Bolt11Invoice invoice, required int amountMsat}) async {
    try {
      return await loaderApi.sendPaymentUsingAmountMethodNodePointer(
          that: _pointer, invoice: invoice, amountMsat: amountMsat);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Send a spontaneous, aka. "keysend", payment
  Future<bridge.PaymentHash> sendSpontaneousPayment(
      {required bridge.PublicKey nodeId, required int amountMsat}) async {
    try {
      return await loaderApi.sendSpontaneousPaymentMethodNodePointer(
          that: _pointer, amountMsat: amountMsat, nodeId: nodeId);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Sends payment probes over all paths of a route that would be used to pay the given
  /// amount to the given "nodeId".
  ///
  /// This may be used to send "pre-flight" probes, i.e., to train our scorer before conducting
  /// the actual payment. Note this is only useful if there likely is sufficient time for the
  /// probe to settle before sending out the actual payment, e.g., when waiting for user
  /// confirmation in a wallet UI.
  ///
  /// Otherwise, there is a chance the probe could take up some liquidity needed to complete the
  /// actual payment. Users should therefore be cautious and might avoid sending probes if
  /// liquidity is scarce and/or they don't expect the probe to return before they send the
  /// payment. To mitigate this issue, channels with available liquidity less than the required
  /// amount times "config.probingLiquidityLimitMultiplier" won't be used to send
  /// pre-flight probes.
  ///
  ///
  Future<void> sendSpontaneousPaymentProbe(
      {required bridge.PublicKey nodeId, required int amountMsat}) async {
    try {
      return await loaderApi.sendSpontaneousPaymentProbesMethodNodePointer(
          that: _pointer, amountMsat: amountMsat, nodeId: nodeId);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  // Sends payment probes over all paths of a route that would be used to pay the given invoice.
  ///
  /// This may be used to send "pre-flight" probes, i.e., to train our scorer before conducting
  /// the actual payment. Note this is only useful if there likely is sufficient time for the
  /// probe to settle before sending out the actual payment, e.g., when waiting for user
  /// confirmation in a wallet UI.
  ///
  /// Otherwise, there is a chance the probe could take up some liquidity needed to complete the
  /// actual payment. Users should therefore be cautious and might avoid sending probes if
  /// liquidity is scarce and/or they don't expect the probe to return before they send the
  /// payment. To mitigate this issue, channels with available liquidity less than the required
  /// amount times "config.probingLiquidityLimitMultiplier"  won't be used to send
  /// pre-flight probes.
  ///
  Future<void> sendPaymentProbe({required bridge.Bolt11Invoice invoice}) async {
    try {
      return await loaderApi.sendPaymentProbesMethodNodePointer(
          that: _pointer, invoice: invoice);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Returns a payable invoice that can be used to request and receive a payment of the amount
  /// given.
  Future<bridge.Bolt11Invoice> receivePayment(
      {required int amountMsat,
      required int expirySecs,
      required String description}) async {
    try {
      return await loaderApi.receivePaymentMethodNodePointer(
          that: _pointer,
          amountMsat: amountMsat,
          description: description,
          expirySecs: expirySecs);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Returns a payable invoice that can be used to request and receive a payment for which the
  /// amount is to be determined by the user, also known as a "zero-amount" invoice.
  Future<bridge.Bolt11Invoice> receiveVariableAmountPayment(
      {required bridge.PublicKey nodeId,
      required int expirySecs,
      required String description}) async {
    try {
      return await loaderApi.receiveVariableAmountPaymentMethodNodePointer(
          that: _pointer, description: description, expirySecs: expirySecs);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Retrieve the details of a specific payment with the given hash.
  ///
  /// Returns `PaymentDetails` if the payment was known and `null` otherwise.
  Future<bridge.PaymentDetails?> payment({
    required bridge.PaymentHash paymentHash,
  }) async {
    try {
      return await loaderApi.paymentMethodNodePointer(
          that: _pointer, paymentHash: paymentHash);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  ///Remove the payment with the given hash from the store.
  Future<void> removePayment({
    required bridge.PaymentHash paymentHash,
  }) async {
    try {
      return await loaderApi.removePaymentMethodNodePointer(
          that: _pointer, paymentHash: paymentHash);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  ///Retrieves all payments that match the given predicate.
  Future<List<bridge.PaymentDetails>> listPaymentsWithFilter({
    required bridge.PaymentDirection paymentDirection,
  }) async {
    try {
      return await loaderApi.listPaymentsWithFilterMethodNodePointer(
          that: _pointer, paymentDirection: paymentDirection);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  ///Retrieves all payments.
  Future<List<bridge.PaymentDetails>> listPayments() async {
    try {
      return await loaderApi.listPaymentsMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  ///Retrieves a list of known peers.
  Future<List<bridge.PeerDetails>> listPeers() async {
    try {
      return await loaderApi.listPeersMethodNodePointer(that: _pointer);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Creates a digital ECDSA signature of a message with the node's secret key.
  ///
  /// A receiver knowing the corresponding [bridge.PublicKey] (e.g. the node’s id) and the message
  /// can be sure that the signature was generated by the caller.
  /// Signatures are EC recoverable, meaning that given the message and the
  /// signature the PublicKey of the signer can be extracted.
  Future<String> signMessage({required Uint8List message}) async {
    try {
      return await loaderApi.signMessageMethodNodePointer(
          that: _pointer, msg: message);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
    }
  }

  /// Verifies that the given ECDSA signature was created for the given message with the
  /// secret key corresponding to the given public key.
  Future<bool> verifySignature(
      {required Uint8List message,
      required String signature,
      required bridge.PublicKey publicKey}) async {
    try {
      return await loaderApi.verifySignatureMethodNodePointer(
          that: _pointer, msg: message, sig: signature, pkey: publicKey);
    } on bridge.NodeException catch (e) {
      throw handleNodeException(e);
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
  bridge.Config? _config;
  bridge.EntropySourceConfig? _entropySource;
  bridge.ChainDataSourceConfig? _chainDataSourceConfig;
  bridge.GossipSourceConfig? _gossipSourceConfig;

  /// Creates a new builder instance from an [Config].
  ///
  factory Builder.fromConfig({required bridge.Config config}) {
    return Builder._(config);
  }
  Builder._(this._config);

  /// Creates a new builder instance with the default configuration.
  ///
  factory Builder() {
    return Builder._(bridge.Config(
        storageDirPath: '',
        network: bridge.Network.Bitcoin,
        listeningAddresses: [
          bridge.SocketAddress.hostname(addr: "0.0.0.0", port: 9735)
        ],
        onchainWalletSyncIntervalSecs: 60,
        walletSyncIntervalSecs: 20,
        feeRateCacheUpdateIntervalSecs: 600,
        logLevel: bridge.LogLevel.Debug,
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
    _entropySource = bridge.EntropySourceConfig.seedFile(seedPath);
    return this;
  }

  /// Configures the [Node] instance to source its wallet entropy from the given 64 seed bytes.
  ///
  /// **Note:** Panics if the length of the given `seedBytes` differs from 64.
  ///
  Builder setEntropySeedBytes(bridge.U8Array64 seedBytes) {
    _entropySource = bridge.EntropySourceConfig.seedBytes(seedBytes);
    return this;
  }

  /// Configures the [Node] instance to source its chain data from the given Esplora server.
  ///
  Builder setEntropyBip39Mnemonic(
      {required bridge.Mnemonic mnemonic, String? passphrase}) {
    _entropySource = bridge.EntropySourceConfig.bip39Mnemonic(
        mnemonic: mnemonic, passphrase: passphrase);
    return this;
  }

  ///Configures the [Node] instance to source its chain data from the given Esplora server.
  ///
  Builder setEsploraServer(String esploraServerUrl) {
    _chainDataSourceConfig =
        bridge.ChainDataSourceConfig.esplora(esploraServerUrl);
    return this;
  }

  /// Configures the [Node] instance to source its gossip data from the Lightning peer-to-peer
  /// network.
  ///
  Builder setGossipSourceP2p() {
    _gossipSourceConfig = bridge.GossipSourceConfig.p2PNetwork();
    return this;
  }

  /// Configures the [Node] instance to source its gossip data from the given RapidGossipSync
  /// server.
  ///
  Builder setGossipSourceRgs(String rgsServerUrl) {
    _gossipSourceConfig =
        bridge.GossipSourceConfig.rapidGossipSync(rgsServerUrl);
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
  Builder setNetwork(bridge.Network network) {
    _config!.network = network;
    return this;
  }

  /// Sets the IP address and TCP port on which [Node] will listen for incoming network connections.
  ///
  ///
  Builder setListeningAddresses(List<bridge.SocketAddress> listeningAddresses) {
    _config!.listeningAddresses = listeningAddresses;
    return this;
  }

  /// Builds a [Node] instance with a SqliteStore backend and according to the options
  /// previously configured.
  ///
  ///
  Future<Node> build() async {
    try {
      if (_config!.storageDirPath == '') {
        final directory = await getApplicationDocumentsDirectory();
        final nodePath = "${directory.path}/ldk_cache/";
        _config!.storageDirPath = nodePath;
      }
      final res = await loaderApi.finalizeBuilder(
        config: _config!,
        entropySourceConfig: _entropySource,
        chainDataSourceConfig: _chainDataSourceConfig,
        gossipSourceConfig: _gossipSourceConfig,
      );
      return Node._(res);
    } on bridge.BuilderException catch (e) {
      throw handleBuilderException(e);
    }
  }
}
