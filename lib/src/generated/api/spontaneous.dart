// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.6.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../lib.dart';
import '../utils/error.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'types.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `from`

class FfiSpontaneousPayment {
  final SpontaneousPayment opaque;

  const FfiSpontaneousPayment({
    required this.opaque,
  });

  Future<PaymentId> send(
          {required BigInt amountMsat,
          required PublicKey nodeId,
          SendingParameters? sendingParameters}) =>
      core.instance.api.crateApiSpontaneousFfiSpontaneousPaymentSend(
          that: this,
          amountMsat: amountMsat,
          nodeId: nodeId,
          sendingParameters: sendingParameters);

  Future<void> sendProbes(
          {required BigInt amountMsat, required PublicKey nodeId}) =>
      core.instance.api.crateApiSpontaneousFfiSpontaneousPaymentSendProbes(
          that: this, amountMsat: amountMsat, nodeId: nodeId);

  @override
  int get hashCode => opaque.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FfiSpontaneousPayment &&
          runtimeType == other.runtimeType &&
          opaque == other.opaque;
}
