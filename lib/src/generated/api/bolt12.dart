// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.6.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../lib.dart';
import '../utils/error.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'types.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `assert_receiver_is_total_eq`, `clone`, `eq`, `fmt`, `from`, `from`, `from`, `from`, `try_from`, `try_from`, `try_from`

///A Bolt12Invoice is a payment request, typically corresponding to an Offer or a Refund.
class Bolt12Invoice {
  final Uint8List data;

  const Bolt12Invoice({
    required this.data,
  });

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Bolt12Invoice &&
          runtimeType == other.runtimeType &&
          data == other.data;
}

class FfiBolt12Payment {
  final Bolt12Payment opaque;

  const FfiBolt12Payment({
    required this.opaque,
  });

  Future<Refund> initiateRefund(
          {required BigInt amountMsat,
          required int expirySecs,
          BigInt? quantity,
          String? payerNote}) =>
      core.instance.api.crateApiBolt12FfiBolt12PaymentInitiateRefund(
          that: this,
          amountMsat: amountMsat,
          expirySecs: expirySecs,
          quantity: quantity,
          payerNote: payerNote);

  Future<Offer> receive(
          {required BigInt amountMsat,
          required String description,
          int? expirySecs,
          BigInt? quantity}) =>
      core.instance.api.crateApiBolt12FfiBolt12PaymentReceive(
          that: this,
          amountMsat: amountMsat,
          description: description,
          expirySecs: expirySecs,
          quantity: quantity);

  Future<Offer> receiveVariableAmount(
          {required String description, int? expirySecs}) =>
      core.instance.api.crateApiBolt12FfiBolt12PaymentReceiveVariableAmount(
          that: this, description: description, expirySecs: expirySecs);

  Future<Bolt12Invoice> requestRefundPayment({required Refund refund}) =>
      core.instance.api.crateApiBolt12FfiBolt12PaymentRequestRefundPayment(
          that: this, refund: refund);

  Future<PaymentId> send(
          {required Offer offer, BigInt? quantity, String? payerNote}) =>
      core.instance.api.crateApiBolt12FfiBolt12PaymentSend(
          that: this, offer: offer, quantity: quantity, payerNote: payerNote);

  Future<PaymentId> sendUsingAmount(
          {required Offer offer,
          required BigInt amountMsat,
          BigInt? quantity,
          String? payerNote}) =>
      core.instance.api.crateApiBolt12FfiBolt12PaymentSendUsingAmount(
          that: this,
          offer: offer,
          amountMsat: amountMsat,
          quantity: quantity,
          payerNote: payerNote);

  @override
  int get hashCode => opaque.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FfiBolt12Payment &&
          runtimeType == other.runtimeType &&
          opaque == other.opaque;
}

/// An `Offer` is a potentially long-lived proposal for payment of a good or service.
///
/// An offer is a precursor to an [InvoiceRequest]. A merchant publishes an offer from which a
/// customer may request an [Bolt12Invoice] for a specific quantity and using an amount sufficient
/// to cover that quantity (i.e., at least `quantity * amount`).
///
/// Offers may be denominated in currency other than bitcoin but are ultimately paid using the
/// latter.
///
class Offer {
  final String s;

  const Offer({
    required this.s,
  });

  @override
  int get hashCode => s.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Offer && runtimeType == other.runtimeType && s == other.s;
}

///A Refund is a request to send an `Bolt12Invoice` without a preceding `Offer`.
class Refund {
  final String s;

  const Refund({
    required this.s,
  });

  @override
  int get hashCode => s.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Refund && runtimeType == other.runtimeType && s == other.s;
}
