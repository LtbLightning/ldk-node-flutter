import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../generated/bridge_definitions.dart';
part 'event_handler.freezed.dart';

@freezed
class Event with _$Event {
  const factory Event.paymentSuccessful({
    required PaymentHash paymentHash,
  }) = Event_paymentSuccessful;

  const factory Event.paymentFailed({
    required PaymentHash paymentHash,
  }) = Event_paymentFailed;

  const factory Event.paymentReceived(
      {required PaymentHash paymentHash,
      required BigInt amountMsat}) = Event_paymentReceived;

  const factory Event.channelReady(
      {required String channelId,
      required BigInt userChannelId}) = Event_channelReady;

  const factory Event.channelClosed(
      {required String channelId,
      required BigInt userChannelId}) = Event_channelClosed;
}

class StreamHandler {
  final Stream<LogEntry> callback;
  StreamHandler({required this.callback});

  init() {
    callback.listen((e) {
      if (kDebugMode) {
        print(e.msg.toString());
      }
    });
  }
}

Event? handleLdkEvent(String jsonStr) {
  Event? event;
  final res = json.decode(jsonStr);
  switch (res["event"]) {
    case "ChannelReady":
      {
        event = Event.channelReady(
            channelId: res["channel_id"],
            userChannelId: BigInt.parse(res["user_channel_id"]));
      }
      break;
    case "ChannelClosed":
      {
        event = Event.channelClosed(
            channelId: res["channel_id"],
            userChannelId: BigInt.parse(res["user_channel_id"]));
      }
      break;
    case "PaymentReceived":
      {
        event = Event.paymentReceived(
            paymentHash: PaymentHash(asString: res["payment_hash"]),
            amountMsat: BigInt.parse(res["amount_msat"]));
      }
      break;
    case "PaymentFailed":
      {
        print(res["payment_hash"]);
        event = Event.paymentFailed(
          paymentHash: PaymentHash(asString: res["payment_hash"]),
        );
      }
      break;
    case "PaymentSuccessful":
      {
        event = Event.paymentSuccessful(
          paymentHash: PaymentHash(asString: res["payment_hash"]),
        );
      }
      break;
  }
  return event;
}
