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

///The from string implementation will try to determine the language of the mnemonic from all the supported languages. (Languages have to be explicitly enabled using the Cargo features.)
/// Supported number of words are 12, 15, 18, 21, and 24.
///
class Mnemonic extends builder.FfiMnemonic {
  Mnemonic({required super.seedPhrase});
  static Future<Mnemonic> generate() async {
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
      return NetworkGraph._(opaque: res.opaque);
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
      return Bolt11Payment._(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payment handler allowing to create and pay BOLT 12 invoices.
  Future<Bolt12Payment> bolt12Payment() async {
    try {
      final res = await FfiNode.bolt12Payment(ptr: this);
      return Bolt12Payment._(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payment handler allowing to send and receive on-chain payments.
  Future<OnChainPayment> onChainPayment() async {
    try {
      final res = await FfiNode.onChainPayment(ptr: this);
      return OnChainPayment._(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payment handler allowing to send spontaneous ("keysend") payments.
  Future<SpontaneousPayment> spontaneousPayment() async {
    try {
      final res = await FfiNode.spontaneousPayment(ptr: this);
      return SpontaneousPayment._(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payment handler allowing to create BIP 21 URIs with an on-chain, BOLT 11, and BOLT 12 payment options.
  Future<UnifiedQrPayment> unifiedQrPayment() async {
    try {
      final res = await FfiNode.unifiedQrPayment(ptr: this);
      return UnifiedQrPayment._(opaque: res.opaque);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

///A payment handler allowing to send spontaneous ("keysend") payments.
class SpontaneousPayment extends spontaneous.FfiSpontaneousPayment {
  SpontaneousPayment._({required super.opaque});

  ///Sends payment probes over all paths of a route that would be used to pay the given amount to the given node_id.
  @override
  Future<void> sendProbes(
      {required BigInt amountMsat,
      required types.PublicKey nodeId,
      hint}) async {
    try {
      return await super.sendProbes(amountMsat: amountMsat, nodeId: nodeId);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Send a spontaneous, aka. "keysend", payment
  @override
  Future<types.PaymentId> send(
      {required BigInt amountMsat,
      required types.PublicKey nodeId,
      types.SendingParameters? sendingParameters,
      dynamic hint}) async {
    try {
      return await super.send(
          amountMsat: amountMsat,
          nodeId: nodeId,
          sendingParameters: sendingParameters);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

///A payment handler allowing to send and receive on-chain payments.
class OnChainPayment extends on_chain.FfiOnChainPayment {
  OnChainPayment._({required super.opaque});
  @override
  Future<types.Address> newAddress({hint}) async {
    try {
      return await super.newAddress();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  @override
  Future<types.Txid> sendAllToAddress(
      {required types.Address address,
      required bool retainReserves,
      types.FeeRate? feeRate}) async {
    try {
      return await super.sendAllToAddress(
          address: address, retainReserves: retainReserves, feeRate: feeRate);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  @override
  Future<types.Txid> sendToAddress(
      {required types.Address address,
      required BigInt amountSats,
      types.FeeRate? feeRate}) async {
    try {
      return await super.sendToAddress(
          address: address, amountSats: amountSats, feeRate: feeRate);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

///Represents the network as nodes and channels between them.
class NetworkGraph extends graph.FfiNetworkGraph {
  NetworkGraph._({required super.opaque});

  ///Returns information on a channel with the given id.
  @override
  Future<graph.ChannelInfo?> channel({required BigInt shortChannelId}) async {
    try {
      return await super.channel(shortChannelId: shortChannelId);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns the list of channels in the graph
  @override
  Future<Uint64List> listChannels() async {
    try {
      return await super.listChannels();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns the list of nodes in the graph
  @override
  Future<List<graph.NodeId>> listNodes() async {
    try {
      return await super.listNodes();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns information on a node with the given id.
  @override
  Future<graph.NodeInfo?> node({required graph.NodeId nodeId}) async {
    try {
      return await super.node(nodeId: nodeId);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

///Represents a syntactically and semantically correct lightning BOLT11 invoice.
class Bolt11Payment extends bolt11.FfiBolt11Payment {
  Bolt11Payment._({required super.opaque});

  ///Allows to attempt manually claiming payments with the given preimage that have previously been registered via
  ///`receiveForHash` or `receiveVariableAmountForHash`.
  /// This should be called in response to a PaymentClaimable event as soon as the preimage is available.
  /// Will check that the payment is known, and that the given preimage and claimable amount match our expectations before attempting to claim the payment, and will return an error otherwise.
  /// When claiming the payment has succeeded, a PaymentReceived event will be emitted.
  @override
  Future<void> claimForHash(
      {required types.PaymentHash paymentHash,
      required BigInt claimableAmountMsat,
      required types.PaymentPreimage preimage}) async {
    try {
      return await super.claimForHash(
          paymentHash: paymentHash,
          claimableAmountMsat: claimableAmountMsat,
          preimage: preimage);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Allows to manually fail payments with the given hash that have previously been registered via
  ///`receiveForHash` or `receiveVariableAmountForHash`.
  /// This should be called in response to a PaymentClaimable event if the payment needs to be failed back, e. g., if the correct preimage can't be retrieved in time before the claim deadline has been reached.
  /// Will check that the payment is known before failing the payment, and will return an error otherwise.
  @override
  Future<void> failForHash({required types.PaymentHash paymentHash}) async {
    try {
      return await super.failForHash(paymentHash: paymentHash);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payable invoice that can be used to request a payment of the amount given for the given payment hash.
  /// We will register the given payment hash and emit a PaymentClaimable event once the inbound payment arrives.
  /// Note: users MUST handle this event and claim the payment manually via claimForHash as soon as they have obtained access to the preimage of the given payment hash.
  /// If they're unable to obtain the preimage, they MUST immediately fail the payment via failForHash.
  @override
  Future<bolt11.Bolt11Invoice> receiveForHash(
      {required types.PaymentHash paymentHash,
      required BigInt amountMsat,
      required String description,
      required int expirySecs}) async {
    try {
      return await super.receiveForHash(
          paymentHash: paymentHash,
          amountMsat: amountMsat,
          description: description,
          expirySecs: expirySecs);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payable invoice that can be used to request a payment for the given payment hash and the amount to be determined by the user, also known as a "zero-amount" invoice.
  /// We will register the given payment hash and emit a PaymentClaimable event once the inbound payment arrives.
  /// Note: users MUST handle this event and claim the payment manually via `claimForHash` as soon as they have obtained access to the preimage
  /// of the given payment hash. If they're unable to obtain the preimage, they MUST immediately fail the payment via `failForHash`.
  @override
  Future<bolt11.Bolt11Invoice> receiveVariableAmountForHash(
      {required String description,
      required int expirySecs,
      required types.PaymentHash paymentHash}) async {
    try {
      return await super.receiveVariableAmountForHash(
          description: description,
          expirySecs: expirySecs,
          paymentHash: paymentHash);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payable invoice that can be used to request and receive a payment of the amount given.
  /// The inbound payment will be automatically claimed upon arrival.
  @override
  Future<bolt11.Bolt11Invoice> receive(
      {required BigInt amountMsat,
      required String description,
      required int expirySecs,
      hint}) async {
    try {
      return await super.receive(
          amountMsat: amountMsat,
          description: description,
          expirySecs: expirySecs);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payable invoice that can be used to request and receive a payment for which the amount is to be determined by the user, also known as a "zero-amount" invoice.
  /// The inbound payment will be automatically claimed upon arrival.
  @override
  Future<bolt11.Bolt11Invoice> receiveVariableAmount(
      {required String description, required int expirySecs, hint}) async {
    try {
      return await super.receiveVariableAmount(
          description: description, expirySecs: expirySecs);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payable invoice that can be used to request a variable amount payment (also known as "zero-amount" invoice) and receive it via a newly created just-in-time (JIT) channel.
  /// When the returned invoice is paid, the configured LSPS2 -compliant LSP will open a channel to us, supplying just-in-time inbound liquidity.
  /// If set, `maxProportionalLspFeeLimitPpmMsat` will limit how much proportional fee, in parts-per-million millisatoshis, we allow the LSP to take for opening the channel to us. We'll use its cheapest offer otherwise.
  @override
  Future<bolt11.Bolt11Invoice> receiveVariableAmountViaJitChannel(
      {required String description,
      required int expirySecs,
      BigInt? maxProportionalLspFeeLimitPpmMsat,
      hint}) async {
    try {
      return await super.receiveVariableAmountViaJitChannel(
          description: description,
          expirySecs: expirySecs,
          maxProportionalLspFeeLimitPpmMsat: maxProportionalLspFeeLimitPpmMsat);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payable invoice that can be used to request a payment of the amount given and receive it via a newly created just-in-time (JIT) channel.
  /// When the returned invoice is paid, the configured LSPS2 -compliant LSP will open a channel to us, supplying just-in-time inbound liquidity.
  /// If set, `maxTotalLspFeeLimitMsat` will limit how much fee we allow the LSP to take for opening the channel to us. We'll use its cheapest offer otherwise.
  @override
  Future<bolt11.Bolt11Invoice> receiveViaJitChannel(
      {required BigInt amountMsat,
      required String description,
      required int expirySecs,
      BigInt? maxTotalLspFeeLimitMsat,
      hint}) async {
    try {
      return await super.receiveViaJitChannel(
          description: description,
          expirySecs: expirySecs,
          maxTotalLspFeeLimitMsat: maxTotalLspFeeLimitMsat,
          amountMsat: amountMsat);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Send a payment given an invoice.
  @override
  Future<types.PaymentId> send(
      {required bolt11.Bolt11Invoice invoice,
      types.SendingParameters? sendingParameters,
      hint}) async {
    try {
      return await super
          .send(invoice: invoice, sendingParameters: sendingParameters);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Sends payment probes over all paths of a route that would be used to pay the given invoice.
  /// This may be used to send "pre-flight" probes, i. e., to train our scorer before conducting the actual payment. Note this is only useful if there likely is sufficient time for the probe to settle before sending out the actual payment, e. g., when waiting for user confirmation in a wallet UI.
  /// Otherwise, there is a chance the probe could take up some liquidity needed to complete the actual payment.
  /// Users should therefore be cautious and might avoid sending probes if liquidity is scarce and/ or they don't expect the probe to return before they send the payment.
  /// To mitigate this issue, channels with available liquidity less than the required amount times
  @override
  Future<void> sendProbes({required bolt11.Bolt11Invoice invoice, hint}) async {
    try {
      return await super.sendProbes(invoice: invoice);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Sends payment probes over all paths of a route that would be used to pay the given zero-value invoice using the given amount.
  /// This can be used to send pre-flight probes for a so-called "zero-amount" invoice, i. e., an invoice that leaves the amount paid to be determined by the user.
  @override
  Future<void> sendProbesUsingAmount(
      {required bolt11.Bolt11Invoice invoice,
      required BigInt amountMsat,
      hint}) async {
    try {
      return await super
          .sendProbesUsingAmount(invoice: invoice, amountMsat: amountMsat);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Send a payment given an invoice and an amount in millisatoshi.
  /// This will fail if the amount given is less than the value required by the given invoice.
  /// This can be used to pay a so-called "zero-amount" invoice, i. e., an invoice that leaves the amount paid to be determined by the user.
  @override
  Future<types.PaymentId> sendUsingAmount(
      {required bolt11.Bolt11Invoice invoice,
      required BigInt amountMsat,
      types.SendingParameters? sendingParameters,
      hint}) async {
    try {
      return await super.sendUsingAmount(
          invoice: invoice,
          amountMsat: amountMsat,
          sendingParameters: sendingParameters);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

///A payment handler allowing to create and pay BOLT 12  offers and refunds.
class Bolt12Payment extends bolt12.FfiBolt12Payment {
  Bolt12Payment._({required super.opaque});

  ///Returns a Refund object that can be used to offer a refund payment of the amount given.
  @override
  Future<bolt12.Refund> initiateRefund({
    required BigInt amountMsat,
    required int expirySecs,
    BigInt? quantity,
    String? payerNote,
  }) async {
    try {
      return await super.initiateRefund(
          amountMsat: amountMsat,
          expirySecs: expirySecs,
          quantity: quantity,
          payerNote: payerNote);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payable offer that can be used to request and receive a payment of the amount given.
  @override
  Future<bolt12.Offer> receive({
    required BigInt amountMsat,
    required String description,
    int? expirySecs,
    BigInt? quantity,
  }) async {
    try {
      return await super.receive(
          amountMsat: amountMsat,
          description: description,
          expirySecs: expirySecs,
          quantity: quantity);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Returns a payable offer that can be used to request and receive a payment for which the amount is to be determined by the user, also known as a "zero-amount" offer.
  @override
  Future<bolt12.Offer> receiveVariableAmount(
      {required String description, int? expirySecs}) async {
    try {
      return await super.receiveVariableAmount(
          description: description, expirySecs: expirySecs);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Requests a refund payment for the given Refund.
  /// The returned `Bolt12Invoice` is for informational purposes only (i. e., isn't needed to retrieve the refund).
  @override
  Future<bolt12.Bolt12Invoice> requestRefundPayment(
      {required bolt12.Refund refund}) async {
    try {
      return await super.requestRefundPayment(refund: refund);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Send a payment given an offer and an amount in millisatoshi.
  /// This will fail if the amount given is less than the value required by the given offer.
  /// This can be used to pay a so-called "zero-amount" offers, i. e., an offer that leaves the amount paid to be determined by the user.
  /// If payer_note is Some it will be seen by the recipient and reflected back in the invoice response.
  @override
  Future<types.PaymentId> sendUsingAmount(
      {required bolt12.Offer offer,
      BigInt? quantity,
      String? payerNote,
      required BigInt amountMsat}) async {
    try {
      return await super.sendUsingAmount(
          offer: offer,
          payerNote: payerNote,
          amountMsat: amountMsat,
          quantity: quantity);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Send a payment given an offer.
  /// If payer_note is Some it will be seen by the recipient and reflected back in the invoice response.
  @override
  Future<types.PaymentId> send({
    required bolt12.Offer offer,
    String? payerNote,
    BigInt? quantity,
  }) async {
    try {
      return await super
          .send(offer: offer, payerNote: payerNote, quantity: quantity);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

class UnifiedQrPayment extends unified_qr.FfiUnifiedQrPayment {
  UnifiedQrPayment._({required super.opaque});

  /// typically opt to use the provided BOLT11 invoice or BOLT12 offer.
  ///
  /// # Parameters
  /// - `amount_sats`: The amount to be received, specified in satoshis.
  /// - `description`: A description or note associated with the payment.
  ///   This message is visible to the payer and can provide context or details about the payment.
  /// - `expiry_sec`: The expiration time for the payment, specified in seconds.
  ///
  /// Returns a payable URI that can be used to request and receive a payment of the amount
  /// given. In case of an error, the function throws `:WalletOperationFailed`for on-chain
  /// address issues, `InvoiceCreationFailed` for BOLT11 invoice issues, or
  /// `OfferCreationFailed` for BOLT12 offer issues.
  ///
  /// The generated URI can then be given to a QR code library.
  ///
  /// [BOLT 11]: https://github.com/lightning/bolts/blob/master/11-payment-encoding.md
  /// [BOLT 12]: https://github.com/lightning/bolts/blob/master/12-offer-encoding.md
  @override
  Future<String> receive(
      {required BigInt amountSats,
      required String message,
      required int expirySec}) async {
    try {
      return await super.receive(
          amountSats: amountSats, message: message, expirySec: expirySec);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  ///Sends a payment given a BIP 21 URI.
  ///This method parses the provided URI string and attempts to send the payment. If the URI has an offer and or invoice, it will try to pay the offer first followed by the invoice. If they both fail, the on-chain payment will be paid.
  @override
  Future<unified_qr.QrPaymentResult> send({required String uriStr}) async {
    try {
      return await super.send(uriStr: uriStr);
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
      throw BuilderException(message: "Given listening addresses are invalid.");
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
      throw BuilderException(message: "Invalid NodeAlias.");
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
  /// await builder.setFilesystemLogger(
  ///   logFilePath: '/path/to/logs/ldk.log',
  ///   maxLogLevel: types.LogLevel.info,
  /// );
  /// ```
  Future<Builder> setFilesystemLogger({
    String? logFilePath,
    types.LogLevel? maxLogLevel,
  }) async {
    try {
      await Frb.verifyInit();

      // Create or get the builder instance
      _configuredBuilder ??= await builder.FfiBuilder.createBuilder(
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
  /// await builder.setLogFacadeLogger();
  /// ```
  Future<Builder> setLogFacadeLogger() async {
    try {
      await Frb.verifyInit();

      // Create or get the builder instance
      _configuredBuilder ??= await builder.FfiBuilder.createBuilder(
        config: _config ?? Builder()._config!,
        chainDataSourceConfig: _chainDataSourceConfig,
        entropySourceConfig: _entropySource,
        liquiditySourceConfig: _liquiditySourceConfig,
        gossipSourceConfig: _gossipSourceConfig,
      );

      // Configure log facade
      _configuredBuilder = await _configuredBuilder!.setLogFacadeLogger();

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
