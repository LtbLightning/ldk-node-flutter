import 'package:ldk_node/src/generated/api/error.dart' as error;
import 'package:ldk_node/src/generated/api/types.dart' as types;
import 'package:ldk_node/src/utils/utils.dart';
import 'package:path_provider/path_provider.dart';

import 'generated/api/node.dart';

///The from string implementation will try to determine the language of the mnemonic from all the supported languages. (Languages have to be explicitly enabled using the Cargo features.)
/// Supported number of words are 12, 15, 18, 21, and 24.
///
class Mnemonic extends MnemonicBase {
  Mnemonic({required super.seedPhrase});
  static Future<Mnemonic> generate() async {
    await Frb.verifyInit();
    final res = await MnemonicBase.generate();
    return Mnemonic(seedPhrase: res.seedPhrase);
  }
}

///The main interface object of LDK Node, wrapping the necessary LDK and BDK functionalities.
///
///Needs to be initialized and instantiated through builder.build().
///
class Node extends NodeBase {
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
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
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
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Blocks until the next event is available.
  ///
  /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.
  @override
  Future<void> eventHandled({hint}) async {
    try {
      await super.eventHandled();
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  // Confirm the last retrieved event handled.
  ///
  /// **Note:** This **MUST** be called after each event has been handled.
  @override
  Future<types.Event?> nextEvent({hint}) async {
    try {
      return await super.nextEvent();
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
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
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Returns our own node id
  @override
  Future<types.PublicKey> nodeId({hint}) async {
    try {
      return await super.nodeId();
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Returns our listening address
  @override
  Future<List<types.SocketAddress>?> listeningAddresses({hint}) async {
    try {
      return await super.listeningAddresses();
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Retrieve the currently spendable on-chain balance in satoshis.
  @override
  Future<types.BalanceDetails> listBalances({hint}) {
    try {
      return super.listBalances();
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  ///Returns the status of the Node.
  @override
  Future<types.NodeStatus> status({hint}) {
    return super.status();
  }

  ///Returns the config with which the Node was initialized.
  @override
  Future<types.Config> config({hint}) {
    return super.config();
  }

  ///Returns the next event in the event queue.
  /// Will asynchronously poll the event queue until the next event is ready.
  /// **Note:** this will always return the same event until handling is confirmed via `node.eventHandled()`.

  @override
  Future<types.Event> nextEventAsync({hint}) {
    return super.nextEventAsync();
  }

  /// Retrieve a new on-chain/funding address.
  @override
  Future<types.Address> newOnchainAddress({hint}) async {
    try {
      return await super.newOnchainAddress();
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Send an on-chain payment to the given address.
  @override
  Future<types.Txid> sendToOnchainAddress(
      {required types.Address address, required int amountSats, hint}) async {
    try {
      return await super
          .sendToOnchainAddress(address: address, amountSats: amountSats);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Send an on-chain payment to the given address, draining all the available funds.
  @override
  Future<types.Txid> sendAllToOnchainAddress(
      {required types.Address address, hint}) async {
    try {
      return await super.sendAllToOnchainAddress(address: address);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  ///Retrieve a list of known channels.
  @override
  Future<List<types.ChannelDetails>> listChannels({hint}) async {
    try {
      return await super.listChannels();
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
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
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
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
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
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
      {required types.SocketAddress address,
      required types.PublicKey nodeId,
      required int channelAmountSats,
      required bool announceChannel,
      types.ChannelConfig? channelConfig,
      int? pushToCounterpartyMsat,
      hint}) async {
    try {
      return await super.connectOpenChannel(
          address: address,
          nodeId: nodeId,
          pushToCounterpartyMsat: pushToCounterpartyMsat,
          channelAmountSats: channelAmountSats,
          channelConfig: channelConfig,
          announceChannel: announceChannel);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  ///Sync the LDK and BDK wallets with the current chain state.
  /// Note that the wallets will be also synced regularly in the background
  @override
  Future<void> syncWallets({hint}) async {
    try {
      await super.syncWallets();
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
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
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
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
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Send a payement given an invoice.
  @override
  Future<types.PaymentHash> sendPayment(
      {required types.Bolt11Invoice invoice, hint}) async {
    try {
      return await super.sendPayment(invoice: invoice);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Send a payment given an invoice and an amount in millisatoshi.
  ///
  /// This will fail if the amount given is less than the value required by the given invoice.
  ///
  /// This can be used to pay a so-called "zero-amount" invoice, i.e., an invoice that leaves the
  /// amount paid to be determined by the user.
  @override
  Future<types.PaymentHash> sendPaymentUsingAmount(
      {required types.Bolt11Invoice invoice,
      required int amountMsat,
      hint}) async {
    try {
      return await super
          .sendPaymentUsingAmount(invoice: invoice, amountMsat: amountMsat);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Send a spontaneous, aka. "keysend", payment
  @override
  Future<types.PaymentHash> sendSpontaneousPayment(
      {required types.PublicKey nodeId, required int amountMsat, hint}) async {
    try {
      return await super
          .sendSpontaneousPayment(amountMsat: amountMsat, nodeId: nodeId);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  ///Sends payment probes over all paths of a route that would be used to pay the given amount to the given node_id.
  @override
  Future<void> sendSpontaneousPaymentProbes(
      {required types.PublicKey nodeId, required int amountMsat, hint}) async {
    try {
      return await super
          .sendSpontaneousPaymentProbes(amountMsat: amountMsat, nodeId: nodeId);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
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
  @override
  Future<void> sendPaymentProbes(
      {required types.Bolt11Invoice invoice, hint}) async {
    try {
      return await super.sendPaymentProbes(invoice: invoice);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  @override
  Future<void> sendPaymentProbesUsingAmount(
      {required types.Bolt11Invoice invoice,
      required int amountMsat,
      hint}) async {
    try {
      return await super.sendPaymentProbesUsingAmount(
          invoice: invoice, amountMsat: amountMsat);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Returns a payable invoice that can be used to request and receive a payment of the amount
  /// given.
  @override
  Future<types.Bolt11Invoice> receivePayment(
      {required int amountMsat,
      required int expirySecs,
      required String description,
      hint}) async {
    try {
      return await super.receivePayment(
          amountMsat: amountMsat,
          description: description,
          expirySecs: expirySecs);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Returns a payable invoice that can be used to request and receive a payment for which the
  /// amount is to be determined by the user, also known as a "zero-amount" invoice.
  @override
  Future<types.Bolt11Invoice> receiveVariableAmountPayment(
      {required int expirySecs, required String description, hint}) async {
    try {
      return await super.receiveVariableAmountPayment(
          description: description, expirySecs: expirySecs);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Retrieve the details of a specific payment with the given hash.
  ///
  /// Returns `PaymentDetails` if the payment was known and `null` otherwise.
  @override
  Future<types.PaymentDetails?> payment(
      {required types.PaymentHash paymentHash, hint}) async {
    try {
      return await super.payment(paymentHash: paymentHash);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  ///Remove the payment with the given hash from the store.
  @override
  Future<void> removePayment(
      {required types.PaymentHash paymentHash, hint}) async {
    try {
      return await super.removePayment(paymentHash: paymentHash);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  ///Retrieves all payments that match the given predicate.
  @override
  Future<List<types.PaymentDetails>> listPaymentsWithFilter(
      {required types.PaymentDirection paymentDirection, hint}) async {
    try {
      return await super
          .listPaymentsWithFilter(paymentDirection: paymentDirection);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  ///Retrieves all payments.
  @override
  Future<List<types.PaymentDetails>> listPayments({hint}) async {
    try {
      return super.listPayments();
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  ///Retrieves a list of known peers.
  @override
  Future<List<types.PeerDetails>> listPeers({hint}) async {
    try {
      return await super.listPeers();
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
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
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
    }
  }

  /// Verifies that the given ECDSA signature was created for the given message with the
  /// secret key corresponding to the given public key.
  @override
  Future<bool> verifySignature(
      {required List<int> msg,
      required String sig,
      required types.PublicKey pkey,
      hint}) async {
    try {
      return await super.verifySignature(msg: msg, sig: sig, pkey: pkey);
    } on error.NodeBaseError catch (e) {
      throw mapNodeBaseError(e);
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
      final res = await finalizeBuilder(
        config: _config!,
        entropySourceConfig: _entropySource,
        chainDataSourceConfig: _chainDataSourceConfig,
        gossipSourceConfig: _gossipSourceConfig,
      );
      return Node._(ptr: res.ptr);
    } on error.BuilderError catch (e) {
      throw mapBuilderError(e);
    }
  }
}
