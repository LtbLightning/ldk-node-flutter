import 'dart:typed_data';

import '../generated/api/bolt11.dart' as bolt11;
import '../generated/api/bolt12.dart' as bolt12;
import '../generated/api/graph.dart' as graph;
import '../generated/api/spontaneous.dart' as spontaneous;
import '../generated/api/types.dart' as types;
import '../generated/api/unified_qr.dart' as unified_qr;
import '../generated/lib.dart';
import '../generated/utils/error.dart' as error;
import '../utils/frb.dart';
import '../utils/exceptions.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Extension methods for FfiNetworkGraph to provide safe operations
extension NetworkGraphExtensions on graph.FfiNetworkGraph {
  /// Returns information on a channel with the given id.
  Future<graph.ChannelInfo?> channel({required BigInt shortChannelId}) async {
    try {
      await Frb.verifyInit();
      return await channelUnsafe(shortChannelId: shortChannelId);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns the list of channels in the graph
  Future<Uint64List> listChannels() async {
    try {
      await Frb.verifyInit();
      return listChannelsUnsafe();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns the list of nodes in the graph
  Future<List<graph.NodeId>> listNodes() async {
    try {
      await Frb.verifyInit();
      return await listNodesUnsafe();
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns information on a node with the given id.
  Future<graph.NodeInfo?> node({required graph.NodeId nodeId}) async {
    try {
      await Frb.verifyInit();
      return await nodeUnsafe(nodeId: nodeId);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

/// Extension methods for FfiSpontaneousPayment to provide safe operations
extension SpontaneousPaymentExtensions on spontaneous.FfiSpontaneousPayment {
  /// Sends payment probes over all paths of a route that would be used to pay the given amount to the given node_id.
  Future<void> sendProbes({
    required BigInt amountMsat,
    required types.PublicKey nodeId,
  }) async {
    try {
      await Frb.verifyInit();
      return await sendProbesUnsafe(amountMsat: amountMsat, nodeId: nodeId);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Send a spontaneous, aka. "keysend", payment
  Future<types.PaymentId> send({
    required BigInt amountMsat,
    required types.PublicKey nodeId,
    types.SendingParameters? sendingParameters,
  }) async {
    try {
      await Frb.verifyInit();
      return await sendUnsafe(
        amountMsat: amountMsat,
        nodeId: nodeId,
        sendingParameters: sendingParameters,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

/// Extension methods for FfiUnifiedQrPayment to provide safe operations
extension UnifiedQrPaymentExtensions on unified_qr.FfiUnifiedQrPayment {
  /// Returns a payable URI that can be used to request and receive a payment of the amount given.
  /// 
  /// In case of an error, the function throws `WalletOperationFailed` for on-chain
  /// address issues, `InvoiceCreationFailed` for BOLT11 invoice issues, or
  /// `OfferCreationFailed` for BOLT12 offer issues.
  ///
  /// The generated URI can then be given to a QR code library.
  Future<String> receive({
    required BigInt amountSats,
    required String message,
    required int expirySec,
  }) async {
    try {
      await Frb.verifyInit();
      return await receiveUnsafe(
        amountSats: amountSats,
        message: message,
        expirySec: expirySec,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Sends a payment given a BIP 21 URI.
  /// 
  /// This method parses the provided URI string and attempts to send the payment. 
  /// If the URI has an offer and/or invoice, it will try to pay the offer first 
  /// followed by the invoice. If they both fail, the on-chain payment will be paid.
  Future<unified_qr.QrPaymentResult> send({required String uriStr}) async {
    try {
      await Frb.verifyInit();
      return await sendUnsafe(uriStr: uriStr);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

/// Extension methods for FfiBolt11Payment to provide safe operations
extension Bolt11PaymentExtensions on bolt11.FfiBolt11Payment {
  /// Allows to attempt manually claiming payments with the given preimage that have previously been registered via
  /// `receiveForHash` or `receiveVariableAmountForHash`.
  Future<void> claimForHash({
    required types.PaymentHash paymentHash,
    required BigInt claimableAmountMsat,
    required types.PaymentPreimage preimage,
  }) async {
    try {
      await Frb.verifyInit();
      return await claimForHashUnsafe(
        paymentHash: paymentHash,
        claimableAmountMsat: claimableAmountMsat,
        preimage: preimage,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Allows to manually fail payments with the given hash that have previously been registered via
  /// `receiveForHash` or `receiveVariableAmountForHash`.
  Future<void> failForHash({required types.PaymentHash paymentHash}) async {
    try {
      await Frb.verifyInit();
      return await failForHashUnsafe(paymentHash: paymentHash);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns a payable invoice that can be used to request a payment of the amount given for the given payment hash.
  Future<bolt11.Bolt11Invoice> receiveForHash({
    required types.PaymentHash paymentHash,
    required BigInt amountMsat,
    required String description,
    required int expirySecs,
  }) async {
    try {
      await Frb.verifyInit();
      return await receiveForHashUnsafe(
        paymentHash: paymentHash,
        amountMsat: amountMsat,
        description: description,
        expirySecs: expirySecs,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns a payable invoice that can be used to request a payment for the given payment hash and the amount to be determined by the user.
  Future<bolt11.Bolt11Invoice> receiveVariableAmountForHash({
    required String description,
    required int expirySecs,
    required types.PaymentHash paymentHash,
  }) async {
    try {
      await Frb.verifyInit();
      return await receiveVariableAmountForHashUnsafe(
        description: description,
        expirySecs: expirySecs,
        paymentHash: paymentHash,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns a payable invoice that can be used to request and receive a payment of the amount given.
  Future<bolt11.Bolt11Invoice> receive({
    required BigInt amountMsat,
    required String description,
    required int expirySecs,
  }) async {
    try {
      await Frb.verifyInit();
      return await receiveUnsafe(
        amountMsat: amountMsat,
        description: description,
        expirySecs: expirySecs,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns a payable invoice that can be used to request and receive a payment for which the amount is to be determined by the user.
  Future<bolt11.Bolt11Invoice> receiveVariableAmount({
    required String description,
    required int expirySecs,
  }) async {
    try {
      await Frb.verifyInit();
      return await receiveVariableAmountUnsafe(
        description: description,
        expirySecs: expirySecs,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns a payable invoice that can be used to request a variable amount payment via a newly created just-in-time (JIT) channel.
  Future<bolt11.Bolt11Invoice> receiveVariableAmountViaJitChannel({
    required String description,
    required int expirySecs,
    BigInt? maxProportionalLspFeeLimitPpmMsat,
  }) async {
    try {
      await Frb.verifyInit();
      return await receiveVariableAmountViaJitChannelUnsafe(
        description: description,
        expirySecs: expirySecs,
        maxProportionalLspFeeLimitPpmMsat: maxProportionalLspFeeLimitPpmMsat,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns a payable invoice that can be used to request a payment of the amount given and receive it via a newly created just-in-time (JIT) channel.
  Future<bolt11.Bolt11Invoice> receiveViaJitChannelUnsafe({
    required BigInt amountMsat,
    required String description,
    required int expirySecs,
    BigInt? maxTotalLspFeeLimitMsat,
  }) async {
    try {
      await Frb.verifyInit();
      return await receiveViaJitChannelUnsafe(
        description: description,
        expirySecs: expirySecs,
        maxTotalLspFeeLimitMsat: maxTotalLspFeeLimitMsat,
        amountMsat: amountMsat,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Send a payment given an invoice.
  Future<types.PaymentId> send({
    required bolt11.Bolt11Invoice invoice,
    types.SendingParameters? sendingParameters,
  }) async {
    try {
      await Frb.verifyInit();
      return await sendUnsafe(
        invoice: invoice,
        sendingParameters: sendingParameters,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Sends payment probes over all paths of a route that would be used to pay the given invoice.
  Future<void> sendProbes({required bolt11.Bolt11Invoice invoice}) async {
    try {
      await Frb.verifyInit();
      return await sendProbesUnsafe(invoice: invoice);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Sends payment probes over all paths of a route that would be used to pay the given zero-value invoice using the given amount.
  Future<void> sendProbesUsingAmount({
    required bolt11.Bolt11Invoice invoice,
    required BigInt amountMsat,
  }) async {
    try {
      await Frb.verifyInit();
      return await sendProbesUsingAmountUnsafe(
        invoice: invoice,
        amountMsat: amountMsat,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Send a payment given an invoice and an amount in millisatoshi.
  Future<types.PaymentId> sendUsingAmount({
    required bolt11.Bolt11Invoice invoice,
    required BigInt amountMsat,
    types.SendingParameters? sendingParameters,
  }) async {
    try {
      await Frb.verifyInit();
      return await sendUsingAmountUnsafe(
        invoice: invoice,
        amountMsat: amountMsat,
        sendingParameters: sendingParameters,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

/// Extension methods for FfiBolt12Payment to provide safe operations
extension Bolt12PaymentExtensions on bolt12.FfiBolt12Payment {
  /// Returns a Refund object that can be used to offer a refund payment of the amount given.
  Future<bolt12.Refund> initiateRefund({
    required BigInt amountMsat,
    required int expirySecs,
    BigInt? quantity,
    String? payerNote,
  }) async {
    try {
      await Frb.verifyInit();
      return await initiateRefundUnsafe(
        amountMsat: amountMsat,
        expirySecs: expirySecs,
        quantity: quantity,
        payerNote: payerNote,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns a payable offer that can be used to request and receive a payment of the amount given.
  Future<bolt12.Offer> receive({
    required BigInt amountMsat,
    required String description,
    int? expirySecs,
    BigInt? quantity,
  }) async {
    try {
      await Frb.verifyInit();
      return await receiveUnsafe(
        amountMsat: amountMsat,
        description: description,
        expirySecs: expirySecs,
        quantity: quantity,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Returns a payable offer that can be used to request and receive a payment for which the amount is to be determined by the user.
  Future<bolt12.Offer> receiveVariableAmount({
    required String description,
    int? expirySecs,
  }) async {
    try {
      await Frb.verifyInit();
      return await receiveVariableAmountUnsafe(
        description: description,
        expirySecs: expirySecs,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Requests a refund payment for the given Refund.
  Future<bolt12.Bolt12Invoice> requestRefundPayment({
    required bolt12.Refund refund,
  }) async {
    try {
      await Frb.verifyInit();
      return await requestRefundPaymentUnsafe(refund: refund);
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Send a payment given an offer and an amount in millisatoshi.
  Future<types.PaymentId> sendUsingAmount({
    required bolt12.Offer offer,
    BigInt? quantity,
    String? payerNote,
    required BigInt amountMsat,
  }) async {
    try {
      await Frb.verifyInit();
      return await sendUsingAmountUnsafe(
        offer: offer,
        payerNote: payerNote,
        amountMsat: amountMsat,
        quantity: quantity,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }

  /// Send a payment given an offer.
  Future<types.PaymentId> send({
    required bolt12.Offer offer,
    String? payerNote,
    BigInt? quantity,
  }) async {
    try {
      await Frb.verifyInit();
      return await sendUnsafe(
        offer: offer,
        payerNote: payerNote,
        quantity: quantity,
      );
    } on error.FfiNodeError catch (e) {
      throw mapFfiNodeError(e);
    }
  }
}

/// Extension methods for PaymentPreimage to provide convenience constructors
extension PaymentPreimageExtensions on types.PaymentPreimage {
  /// Creates a PaymentPreimage from a List<int> of 32 bytes.
  /// 
  /// This is a convenience method that handles the U8Array32 conversion internally.
  /// 
  /// Example:
  /// ```dart
  /// final preimage = PaymentPreimageExtensions.fromBytes([1, 2, 3, ..., 32]);
  /// ```
  static types.PaymentPreimage fromBytes(List<int> bytes) {
    if (bytes.length != 32) {
      throw ArgumentError('PaymentPreimage must be exactly 32 bytes, got ${bytes.length}');
    }
    return types.PaymentPreimage(data: U8Array32(Uint8List.fromList(bytes)));
  }
}