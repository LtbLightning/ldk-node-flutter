// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bridge_definitions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Event {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, int amountMsat)
        paymentReceived,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelReady,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelClosed,
    required TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)
        channelPending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult? Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Event_PaymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_PaymentFailed value) paymentFailed,
    required TResult Function(Event_PaymentReceived value) paymentReceived,
    required TResult Function(Event_ChannelReady value) channelReady,
    required TResult Function(Event_ChannelClosed value) channelClosed,
    required TResult Function(Event_ChannelPending value) channelPending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_PaymentFailed value)? paymentFailed,
    TResult? Function(Event_PaymentReceived value)? paymentReceived,
    TResult? Function(Event_ChannelReady value)? channelReady,
    TResult? Function(Event_ChannelClosed value)? channelClosed,
    TResult? Function(Event_ChannelPending value)? channelPending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_PaymentFailed value)? paymentFailed,
    TResult Function(Event_PaymentReceived value)? paymentReceived,
    TResult Function(Event_ChannelReady value)? channelReady,
    TResult Function(Event_ChannelClosed value)? channelClosed,
    TResult Function(Event_ChannelPending value)? channelPending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$Event_PaymentSuccessfulCopyWith<$Res> {
  factory _$$Event_PaymentSuccessfulCopyWith(_$Event_PaymentSuccessful value,
          $Res Function(_$Event_PaymentSuccessful) then) =
      __$$Event_PaymentSuccessfulCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentHash paymentHash});
}

/// @nodoc
class __$$Event_PaymentSuccessfulCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_PaymentSuccessful>
    implements _$$Event_PaymentSuccessfulCopyWith<$Res> {
  __$$Event_PaymentSuccessfulCopyWithImpl(_$Event_PaymentSuccessful _value,
      $Res Function(_$Event_PaymentSuccessful) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentHash = null,
  }) {
    return _then(_$Event_PaymentSuccessful(
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
    ));
  }
}

/// @nodoc

class _$Event_PaymentSuccessful implements Event_PaymentSuccessful {
  const _$Event_PaymentSuccessful({required this.paymentHash});

  /// The hash of the payment.
  @override
  final PaymentHash paymentHash;

  @override
  String toString() {
    return 'Event.paymentSuccessful(paymentHash: $paymentHash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_PaymentSuccessful &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentHash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_PaymentSuccessfulCopyWith<_$Event_PaymentSuccessful> get copyWith =>
      __$$Event_PaymentSuccessfulCopyWithImpl<_$Event_PaymentSuccessful>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, int amountMsat)
        paymentReceived,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelReady,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelClosed,
    required TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)
        channelPending,
  }) {
    return paymentSuccessful(paymentHash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult? Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
  }) {
    return paymentSuccessful?.call(paymentHash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
    required TResult orElse(),
  }) {
    if (paymentSuccessful != null) {
      return paymentSuccessful(paymentHash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Event_PaymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_PaymentFailed value) paymentFailed,
    required TResult Function(Event_PaymentReceived value) paymentReceived,
    required TResult Function(Event_ChannelReady value) channelReady,
    required TResult Function(Event_ChannelClosed value) channelClosed,
    required TResult Function(Event_ChannelPending value) channelPending,
  }) {
    return paymentSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_PaymentFailed value)? paymentFailed,
    TResult? Function(Event_PaymentReceived value)? paymentReceived,
    TResult? Function(Event_ChannelReady value)? channelReady,
    TResult? Function(Event_ChannelClosed value)? channelClosed,
    TResult? Function(Event_ChannelPending value)? channelPending,
  }) {
    return paymentSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_PaymentFailed value)? paymentFailed,
    TResult Function(Event_PaymentReceived value)? paymentReceived,
    TResult Function(Event_ChannelReady value)? channelReady,
    TResult Function(Event_ChannelClosed value)? channelClosed,
    TResult Function(Event_ChannelPending value)? channelPending,
    required TResult orElse(),
  }) {
    if (paymentSuccessful != null) {
      return paymentSuccessful(this);
    }
    return orElse();
  }
}

abstract class Event_PaymentSuccessful implements Event {
  const factory Event_PaymentSuccessful(
      {required final PaymentHash paymentHash}) = _$Event_PaymentSuccessful;

  /// The hash of the payment.
  PaymentHash get paymentHash;
  @JsonKey(ignore: true)
  _$$Event_PaymentSuccessfulCopyWith<_$Event_PaymentSuccessful> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_PaymentFailedCopyWith<$Res> {
  factory _$$Event_PaymentFailedCopyWith(_$Event_PaymentFailed value,
          $Res Function(_$Event_PaymentFailed) then) =
      __$$Event_PaymentFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentHash paymentHash});
}

/// @nodoc
class __$$Event_PaymentFailedCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_PaymentFailed>
    implements _$$Event_PaymentFailedCopyWith<$Res> {
  __$$Event_PaymentFailedCopyWithImpl(
      _$Event_PaymentFailed _value, $Res Function(_$Event_PaymentFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentHash = null,
  }) {
    return _then(_$Event_PaymentFailed(
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
    ));
  }
}

/// @nodoc

class _$Event_PaymentFailed implements Event_PaymentFailed {
  const _$Event_PaymentFailed({required this.paymentHash});

  /// The hash of the payment.
  @override
  final PaymentHash paymentHash;

  @override
  String toString() {
    return 'Event.paymentFailed(paymentHash: $paymentHash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_PaymentFailed &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentHash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_PaymentFailedCopyWith<_$Event_PaymentFailed> get copyWith =>
      __$$Event_PaymentFailedCopyWithImpl<_$Event_PaymentFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, int amountMsat)
        paymentReceived,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelReady,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelClosed,
    required TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)
        channelPending,
  }) {
    return paymentFailed(paymentHash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult? Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
  }) {
    return paymentFailed?.call(paymentHash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
    required TResult orElse(),
  }) {
    if (paymentFailed != null) {
      return paymentFailed(paymentHash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Event_PaymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_PaymentFailed value) paymentFailed,
    required TResult Function(Event_PaymentReceived value) paymentReceived,
    required TResult Function(Event_ChannelReady value) channelReady,
    required TResult Function(Event_ChannelClosed value) channelClosed,
    required TResult Function(Event_ChannelPending value) channelPending,
  }) {
    return paymentFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_PaymentFailed value)? paymentFailed,
    TResult? Function(Event_PaymentReceived value)? paymentReceived,
    TResult? Function(Event_ChannelReady value)? channelReady,
    TResult? Function(Event_ChannelClosed value)? channelClosed,
    TResult? Function(Event_ChannelPending value)? channelPending,
  }) {
    return paymentFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_PaymentFailed value)? paymentFailed,
    TResult Function(Event_PaymentReceived value)? paymentReceived,
    TResult Function(Event_ChannelReady value)? channelReady,
    TResult Function(Event_ChannelClosed value)? channelClosed,
    TResult Function(Event_ChannelPending value)? channelPending,
    required TResult orElse(),
  }) {
    if (paymentFailed != null) {
      return paymentFailed(this);
    }
    return orElse();
  }
}

abstract class Event_PaymentFailed implements Event {
  const factory Event_PaymentFailed({required final PaymentHash paymentHash}) =
      _$Event_PaymentFailed;

  /// The hash of the payment.
  PaymentHash get paymentHash;
  @JsonKey(ignore: true)
  _$$Event_PaymentFailedCopyWith<_$Event_PaymentFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_PaymentReceivedCopyWith<$Res> {
  factory _$$Event_PaymentReceivedCopyWith(_$Event_PaymentReceived value,
          $Res Function(_$Event_PaymentReceived) then) =
      __$$Event_PaymentReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentHash paymentHash, int amountMsat});
}

/// @nodoc
class __$$Event_PaymentReceivedCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_PaymentReceived>
    implements _$$Event_PaymentReceivedCopyWith<$Res> {
  __$$Event_PaymentReceivedCopyWithImpl(_$Event_PaymentReceived _value,
      $Res Function(_$Event_PaymentReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentHash = null,
    Object? amountMsat = null,
  }) {
    return _then(_$Event_PaymentReceived(
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      amountMsat: null == amountMsat
          ? _value.amountMsat
          : amountMsat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Event_PaymentReceived implements Event_PaymentReceived {
  const _$Event_PaymentReceived(
      {required this.paymentHash, required this.amountMsat});

  /// The hash of the payment.
  @override
  final PaymentHash paymentHash;

  /// The value, in thousandths of a satoshi, that has been received.
  @override
  final int amountMsat;

  @override
  String toString() {
    return 'Event.paymentReceived(paymentHash: $paymentHash, amountMsat: $amountMsat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_PaymentReceived &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash) &&
            (identical(other.amountMsat, amountMsat) ||
                other.amountMsat == amountMsat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentHash, amountMsat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_PaymentReceivedCopyWith<_$Event_PaymentReceived> get copyWith =>
      __$$Event_PaymentReceivedCopyWithImpl<_$Event_PaymentReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, int amountMsat)
        paymentReceived,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelReady,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelClosed,
    required TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)
        channelPending,
  }) {
    return paymentReceived(paymentHash, amountMsat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult? Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
  }) {
    return paymentReceived?.call(paymentHash, amountMsat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
    required TResult orElse(),
  }) {
    if (paymentReceived != null) {
      return paymentReceived(paymentHash, amountMsat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Event_PaymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_PaymentFailed value) paymentFailed,
    required TResult Function(Event_PaymentReceived value) paymentReceived,
    required TResult Function(Event_ChannelReady value) channelReady,
    required TResult Function(Event_ChannelClosed value) channelClosed,
    required TResult Function(Event_ChannelPending value) channelPending,
  }) {
    return paymentReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_PaymentFailed value)? paymentFailed,
    TResult? Function(Event_PaymentReceived value)? paymentReceived,
    TResult? Function(Event_ChannelReady value)? channelReady,
    TResult? Function(Event_ChannelClosed value)? channelClosed,
    TResult? Function(Event_ChannelPending value)? channelPending,
  }) {
    return paymentReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_PaymentFailed value)? paymentFailed,
    TResult Function(Event_PaymentReceived value)? paymentReceived,
    TResult Function(Event_ChannelReady value)? channelReady,
    TResult Function(Event_ChannelClosed value)? channelClosed,
    TResult Function(Event_ChannelPending value)? channelPending,
    required TResult orElse(),
  }) {
    if (paymentReceived != null) {
      return paymentReceived(this);
    }
    return orElse();
  }
}

abstract class Event_PaymentReceived implements Event {
  const factory Event_PaymentReceived(
      {required final PaymentHash paymentHash,
      required final int amountMsat}) = _$Event_PaymentReceived;

  /// The hash of the payment.
  PaymentHash get paymentHash;

  /// The value, in thousandths of a satoshi, that has been received.
  int get amountMsat;
  @JsonKey(ignore: true)
  _$$Event_PaymentReceivedCopyWith<_$Event_PaymentReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_ChannelReadyCopyWith<$Res> {
  factory _$$Event_ChannelReadyCopyWith(_$Event_ChannelReady value,
          $Res Function(_$Event_ChannelReady) then) =
      __$$Event_ChannelReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({U8Array32 channelId, int userChannelId});
}

/// @nodoc
class __$$Event_ChannelReadyCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_ChannelReady>
    implements _$$Event_ChannelReadyCopyWith<$Res> {
  __$$Event_ChannelReadyCopyWithImpl(
      _$Event_ChannelReady _value, $Res Function(_$Event_ChannelReady) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
  }) {
    return _then(_$Event_ChannelReady(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as U8Array32,
      userChannelId: null == userChannelId
          ? _value.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Event_ChannelReady implements Event_ChannelReady {
  const _$Event_ChannelReady(
      {required this.channelId, required this.userChannelId});

  /// The channel_id of the channel.
  @override
  final U8Array32 channelId;

  /// The user_channel_id of the channel.
  @override
  final int userChannelId;

  @override
  String toString() {
    return 'Event.channelReady(channelId: $channelId, userChannelId: $userChannelId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_ChannelReady &&
            const DeepCollectionEquality().equals(other.channelId, channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(channelId), userChannelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_ChannelReadyCopyWith<_$Event_ChannelReady> get copyWith =>
      __$$Event_ChannelReadyCopyWithImpl<_$Event_ChannelReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, int amountMsat)
        paymentReceived,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelReady,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelClosed,
    required TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)
        channelPending,
  }) {
    return channelReady(channelId, userChannelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult? Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
  }) {
    return channelReady?.call(channelId, userChannelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
    required TResult orElse(),
  }) {
    if (channelReady != null) {
      return channelReady(channelId, userChannelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Event_PaymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_PaymentFailed value) paymentFailed,
    required TResult Function(Event_PaymentReceived value) paymentReceived,
    required TResult Function(Event_ChannelReady value) channelReady,
    required TResult Function(Event_ChannelClosed value) channelClosed,
    required TResult Function(Event_ChannelPending value) channelPending,
  }) {
    return channelReady(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_PaymentFailed value)? paymentFailed,
    TResult? Function(Event_PaymentReceived value)? paymentReceived,
    TResult? Function(Event_ChannelReady value)? channelReady,
    TResult? Function(Event_ChannelClosed value)? channelClosed,
    TResult? Function(Event_ChannelPending value)? channelPending,
  }) {
    return channelReady?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_PaymentFailed value)? paymentFailed,
    TResult Function(Event_PaymentReceived value)? paymentReceived,
    TResult Function(Event_ChannelReady value)? channelReady,
    TResult Function(Event_ChannelClosed value)? channelClosed,
    TResult Function(Event_ChannelPending value)? channelPending,
    required TResult orElse(),
  }) {
    if (channelReady != null) {
      return channelReady(this);
    }
    return orElse();
  }
}

abstract class Event_ChannelReady implements Event {
  const factory Event_ChannelReady(
      {required final U8Array32 channelId,
      required final int userChannelId}) = _$Event_ChannelReady;

  /// The channel_id of the channel.
  U8Array32 get channelId;

  /// The user_channel_id of the channel.
  int get userChannelId;
  @JsonKey(ignore: true)
  _$$Event_ChannelReadyCopyWith<_$Event_ChannelReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_ChannelClosedCopyWith<$Res> {
  factory _$$Event_ChannelClosedCopyWith(_$Event_ChannelClosed value,
          $Res Function(_$Event_ChannelClosed) then) =
      __$$Event_ChannelClosedCopyWithImpl<$Res>;
  @useResult
  $Res call({U8Array32 channelId, int userChannelId});
}

/// @nodoc
class __$$Event_ChannelClosedCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_ChannelClosed>
    implements _$$Event_ChannelClosedCopyWith<$Res> {
  __$$Event_ChannelClosedCopyWithImpl(
      _$Event_ChannelClosed _value, $Res Function(_$Event_ChannelClosed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
  }) {
    return _then(_$Event_ChannelClosed(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as U8Array32,
      userChannelId: null == userChannelId
          ? _value.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Event_ChannelClosed implements Event_ChannelClosed {
  const _$Event_ChannelClosed(
      {required this.channelId, required this.userChannelId});

  /// The channel_id of the channel.
  @override
  final U8Array32 channelId;

  /// The user_channel_id of the channel.
  @override
  final int userChannelId;

  @override
  String toString() {
    return 'Event.channelClosed(channelId: $channelId, userChannelId: $userChannelId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_ChannelClosed &&
            const DeepCollectionEquality().equals(other.channelId, channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(channelId), userChannelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_ChannelClosedCopyWith<_$Event_ChannelClosed> get copyWith =>
      __$$Event_ChannelClosedCopyWithImpl<_$Event_ChannelClosed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, int amountMsat)
        paymentReceived,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelReady,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelClosed,
    required TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)
        channelPending,
  }) {
    return channelClosed(channelId, userChannelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult? Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
  }) {
    return channelClosed?.call(channelId, userChannelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
    required TResult orElse(),
  }) {
    if (channelClosed != null) {
      return channelClosed(channelId, userChannelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Event_PaymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_PaymentFailed value) paymentFailed,
    required TResult Function(Event_PaymentReceived value) paymentReceived,
    required TResult Function(Event_ChannelReady value) channelReady,
    required TResult Function(Event_ChannelClosed value) channelClosed,
    required TResult Function(Event_ChannelPending value) channelPending,
  }) {
    return channelClosed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_PaymentFailed value)? paymentFailed,
    TResult? Function(Event_PaymentReceived value)? paymentReceived,
    TResult? Function(Event_ChannelReady value)? channelReady,
    TResult? Function(Event_ChannelClosed value)? channelClosed,
    TResult? Function(Event_ChannelPending value)? channelPending,
  }) {
    return channelClosed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_PaymentFailed value)? paymentFailed,
    TResult Function(Event_PaymentReceived value)? paymentReceived,
    TResult Function(Event_ChannelReady value)? channelReady,
    TResult Function(Event_ChannelClosed value)? channelClosed,
    TResult Function(Event_ChannelPending value)? channelPending,
    required TResult orElse(),
  }) {
    if (channelClosed != null) {
      return channelClosed(this);
    }
    return orElse();
  }
}

abstract class Event_ChannelClosed implements Event {
  const factory Event_ChannelClosed(
      {required final U8Array32 channelId,
      required final int userChannelId}) = _$Event_ChannelClosed;

  /// The channel_id of the channel.
  U8Array32 get channelId;

  /// The user_channel_id of the channel.
  int get userChannelId;
  @JsonKey(ignore: true)
  _$$Event_ChannelClosedCopyWith<_$Event_ChannelClosed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_ChannelPendingCopyWith<$Res> {
  factory _$$Event_ChannelPendingCopyWith(_$Event_ChannelPending value,
          $Res Function(_$Event_ChannelPending) then) =
      __$$Event_ChannelPendingCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {U8Array32 channelId,
      int userChannelId,
      U8Array32 formerTemporaryChannelId,
      PublicKey counterpartyNodeId,
      OutPoint fundingTxo});
}

/// @nodoc
class __$$Event_ChannelPendingCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_ChannelPending>
    implements _$$Event_ChannelPendingCopyWith<$Res> {
  __$$Event_ChannelPendingCopyWithImpl(_$Event_ChannelPending _value,
      $Res Function(_$Event_ChannelPending) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
    Object? formerTemporaryChannelId = null,
    Object? counterpartyNodeId = null,
    Object? fundingTxo = null,
  }) {
    return _then(_$Event_ChannelPending(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as U8Array32,
      userChannelId: null == userChannelId
          ? _value.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as int,
      formerTemporaryChannelId: null == formerTemporaryChannelId
          ? _value.formerTemporaryChannelId
          : formerTemporaryChannelId // ignore: cast_nullable_to_non_nullable
              as U8Array32,
      counterpartyNodeId: null == counterpartyNodeId
          ? _value.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      fundingTxo: null == fundingTxo
          ? _value.fundingTxo
          : fundingTxo // ignore: cast_nullable_to_non_nullable
              as OutPoint,
    ));
  }
}

/// @nodoc

class _$Event_ChannelPending implements Event_ChannelPending {
  const _$Event_ChannelPending(
      {required this.channelId,
      required this.userChannelId,
      required this.formerTemporaryChannelId,
      required this.counterpartyNodeId,
      required this.fundingTxo});

  /// The channel_id of the channel.
  @override
  final U8Array32 channelId;

  /// The user_channel_id of the channel.
  @override
  final int userChannelId;

  /// The temporary_channel_id this channel used to be known by during channel establishment.
  @override
  final U8Array32 formerTemporaryChannelId;

  /// The node_id of the channel counterparty.
  @override
  final PublicKey counterpartyNodeId;

  /// The outpoint of the channel's funding transaction.
  @override
  final OutPoint fundingTxo;

  @override
  String toString() {
    return 'Event.channelPending(channelId: $channelId, userChannelId: $userChannelId, formerTemporaryChannelId: $formerTemporaryChannelId, counterpartyNodeId: $counterpartyNodeId, fundingTxo: $fundingTxo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_ChannelPending &&
            const DeepCollectionEquality().equals(other.channelId, channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId) &&
            const DeepCollectionEquality().equals(
                other.formerTemporaryChannelId, formerTemporaryChannelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.fundingTxo, fundingTxo) ||
                other.fundingTxo == fundingTxo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(channelId),
      userChannelId,
      const DeepCollectionEquality().hash(formerTemporaryChannelId),
      counterpartyNodeId,
      fundingTxo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_ChannelPendingCopyWith<_$Event_ChannelPending> get copyWith =>
      __$$Event_ChannelPendingCopyWithImpl<_$Event_ChannelPending>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, int amountMsat)
        paymentReceived,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelReady,
    required TResult Function(U8Array32 channelId, int userChannelId)
        channelClosed,
    required TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)
        channelPending,
  }) {
    return channelPending(channelId, userChannelId, formerTemporaryChannelId,
        counterpartyNodeId, fundingTxo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult? Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult? Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
  }) {
    return channelPending?.call(channelId, userChannelId,
        formerTemporaryChannelId, counterpartyNodeId, fundingTxo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, int amountMsat)? paymentReceived,
    TResult Function(U8Array32 channelId, int userChannelId)? channelReady,
    TResult Function(U8Array32 channelId, int userChannelId)? channelClosed,
    TResult Function(
            U8Array32 channelId,
            int userChannelId,
            U8Array32 formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
    required TResult orElse(),
  }) {
    if (channelPending != null) {
      return channelPending(channelId, userChannelId, formerTemporaryChannelId,
          counterpartyNodeId, fundingTxo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Event_PaymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_PaymentFailed value) paymentFailed,
    required TResult Function(Event_PaymentReceived value) paymentReceived,
    required TResult Function(Event_ChannelReady value) channelReady,
    required TResult Function(Event_ChannelClosed value) channelClosed,
    required TResult Function(Event_ChannelPending value) channelPending,
  }) {
    return channelPending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_PaymentFailed value)? paymentFailed,
    TResult? Function(Event_PaymentReceived value)? paymentReceived,
    TResult? Function(Event_ChannelReady value)? channelReady,
    TResult? Function(Event_ChannelClosed value)? channelClosed,
    TResult? Function(Event_ChannelPending value)? channelPending,
  }) {
    return channelPending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_PaymentFailed value)? paymentFailed,
    TResult Function(Event_PaymentReceived value)? paymentReceived,
    TResult Function(Event_ChannelReady value)? channelReady,
    TResult Function(Event_ChannelClosed value)? channelClosed,
    TResult Function(Event_ChannelPending value)? channelPending,
    required TResult orElse(),
  }) {
    if (channelPending != null) {
      return channelPending(this);
    }
    return orElse();
  }
}

abstract class Event_ChannelPending implements Event {
  const factory Event_ChannelPending(
      {required final U8Array32 channelId,
      required final int userChannelId,
      required final U8Array32 formerTemporaryChannelId,
      required final PublicKey counterpartyNodeId,
      required final OutPoint fundingTxo}) = _$Event_ChannelPending;

  /// The channel_id of the channel.
  U8Array32 get channelId;

  /// The user_channel_id of the channel.
  int get userChannelId;

  /// The temporary_channel_id this channel used to be known by during channel establishment.
  U8Array32 get formerTemporaryChannelId;

  /// The node_id of the channel counterparty.
  PublicKey get counterpartyNodeId;

  /// The outpoint of the channel's funding transaction.
  OutPoint get fundingTxo;
  @JsonKey(ignore: true)
  _$$Event_ChannelPendingCopyWith<_$Event_ChannelPending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WalletEntropySource {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) seedFile,
    required TResult Function(U8Array64 field0) seedBytes,
    required TResult Function(String mnemonic, String? passphrase)
        bip39Mnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(U8Array64 field0)? seedBytes,
    TResult? Function(String mnemonic, String? passphrase)? bip39Mnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(U8Array64 field0)? seedBytes,
    TResult Function(String mnemonic, String? passphrase)? bip39Mnemonic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletEntropySource_SeedFile value) seedFile,
    required TResult Function(WalletEntropySource_SeedBytes value) seedBytes,
    required TResult Function(WalletEntropySource_Bip39Mnemonic value)
        bip39Mnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletEntropySource_SeedFile value)? seedFile,
    TResult? Function(WalletEntropySource_SeedBytes value)? seedBytes,
    TResult? Function(WalletEntropySource_Bip39Mnemonic value)? bip39Mnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletEntropySource_SeedFile value)? seedFile,
    TResult Function(WalletEntropySource_SeedBytes value)? seedBytes,
    TResult Function(WalletEntropySource_Bip39Mnemonic value)? bip39Mnemonic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletEntropySourceCopyWith<$Res> {
  factory $WalletEntropySourceCopyWith(
          WalletEntropySource value, $Res Function(WalletEntropySource) then) =
      _$WalletEntropySourceCopyWithImpl<$Res, WalletEntropySource>;
}

/// @nodoc
class _$WalletEntropySourceCopyWithImpl<$Res, $Val extends WalletEntropySource>
    implements $WalletEntropySourceCopyWith<$Res> {
  _$WalletEntropySourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WalletEntropySource_SeedFileCopyWith<$Res> {
  factory _$$WalletEntropySource_SeedFileCopyWith(
          _$WalletEntropySource_SeedFile value,
          $Res Function(_$WalletEntropySource_SeedFile) then) =
      __$$WalletEntropySource_SeedFileCopyWithImpl<$Res>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$WalletEntropySource_SeedFileCopyWithImpl<$Res>
    extends _$WalletEntropySourceCopyWithImpl<$Res,
        _$WalletEntropySource_SeedFile>
    implements _$$WalletEntropySource_SeedFileCopyWith<$Res> {
  __$$WalletEntropySource_SeedFileCopyWithImpl(
      _$WalletEntropySource_SeedFile _value,
      $Res Function(_$WalletEntropySource_SeedFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$WalletEntropySource_SeedFile(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WalletEntropySource_SeedFile implements WalletEntropySource_SeedFile {
  const _$WalletEntropySource_SeedFile(this.field0);

  @override
  final String field0;

  @override
  String toString() {
    return 'WalletEntropySource.seedFile(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEntropySource_SeedFile &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEntropySource_SeedFileCopyWith<_$WalletEntropySource_SeedFile>
      get copyWith => __$$WalletEntropySource_SeedFileCopyWithImpl<
          _$WalletEntropySource_SeedFile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) seedFile,
    required TResult Function(U8Array64 field0) seedBytes,
    required TResult Function(String mnemonic, String? passphrase)
        bip39Mnemonic,
  }) {
    return seedFile(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(U8Array64 field0)? seedBytes,
    TResult? Function(String mnemonic, String? passphrase)? bip39Mnemonic,
  }) {
    return seedFile?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(U8Array64 field0)? seedBytes,
    TResult Function(String mnemonic, String? passphrase)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    if (seedFile != null) {
      return seedFile(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletEntropySource_SeedFile value) seedFile,
    required TResult Function(WalletEntropySource_SeedBytes value) seedBytes,
    required TResult Function(WalletEntropySource_Bip39Mnemonic value)
        bip39Mnemonic,
  }) {
    return seedFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletEntropySource_SeedFile value)? seedFile,
    TResult? Function(WalletEntropySource_SeedBytes value)? seedBytes,
    TResult? Function(WalletEntropySource_Bip39Mnemonic value)? bip39Mnemonic,
  }) {
    return seedFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletEntropySource_SeedFile value)? seedFile,
    TResult Function(WalletEntropySource_SeedBytes value)? seedBytes,
    TResult Function(WalletEntropySource_Bip39Mnemonic value)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    if (seedFile != null) {
      return seedFile(this);
    }
    return orElse();
  }
}

abstract class WalletEntropySource_SeedFile implements WalletEntropySource {
  const factory WalletEntropySource_SeedFile(final String field0) =
      _$WalletEntropySource_SeedFile;

  String get field0;
  @JsonKey(ignore: true)
  _$$WalletEntropySource_SeedFileCopyWith<_$WalletEntropySource_SeedFile>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletEntropySource_SeedBytesCopyWith<$Res> {
  factory _$$WalletEntropySource_SeedBytesCopyWith(
          _$WalletEntropySource_SeedBytes value,
          $Res Function(_$WalletEntropySource_SeedBytes) then) =
      __$$WalletEntropySource_SeedBytesCopyWithImpl<$Res>;
  @useResult
  $Res call({U8Array64 field0});
}

/// @nodoc
class __$$WalletEntropySource_SeedBytesCopyWithImpl<$Res>
    extends _$WalletEntropySourceCopyWithImpl<$Res,
        _$WalletEntropySource_SeedBytes>
    implements _$$WalletEntropySource_SeedBytesCopyWith<$Res> {
  __$$WalletEntropySource_SeedBytesCopyWithImpl(
      _$WalletEntropySource_SeedBytes _value,
      $Res Function(_$WalletEntropySource_SeedBytes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$WalletEntropySource_SeedBytes(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as U8Array64,
    ));
  }
}

/// @nodoc

class _$WalletEntropySource_SeedBytes implements WalletEntropySource_SeedBytes {
  const _$WalletEntropySource_SeedBytes(this.field0);

  @override
  final U8Array64 field0;

  @override
  String toString() {
    return 'WalletEntropySource.seedBytes(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEntropySource_SeedBytes &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEntropySource_SeedBytesCopyWith<_$WalletEntropySource_SeedBytes>
      get copyWith => __$$WalletEntropySource_SeedBytesCopyWithImpl<
          _$WalletEntropySource_SeedBytes>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) seedFile,
    required TResult Function(U8Array64 field0) seedBytes,
    required TResult Function(String mnemonic, String? passphrase)
        bip39Mnemonic,
  }) {
    return seedBytes(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(U8Array64 field0)? seedBytes,
    TResult? Function(String mnemonic, String? passphrase)? bip39Mnemonic,
  }) {
    return seedBytes?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(U8Array64 field0)? seedBytes,
    TResult Function(String mnemonic, String? passphrase)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    if (seedBytes != null) {
      return seedBytes(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletEntropySource_SeedFile value) seedFile,
    required TResult Function(WalletEntropySource_SeedBytes value) seedBytes,
    required TResult Function(WalletEntropySource_Bip39Mnemonic value)
        bip39Mnemonic,
  }) {
    return seedBytes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletEntropySource_SeedFile value)? seedFile,
    TResult? Function(WalletEntropySource_SeedBytes value)? seedBytes,
    TResult? Function(WalletEntropySource_Bip39Mnemonic value)? bip39Mnemonic,
  }) {
    return seedBytes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletEntropySource_SeedFile value)? seedFile,
    TResult Function(WalletEntropySource_SeedBytes value)? seedBytes,
    TResult Function(WalletEntropySource_Bip39Mnemonic value)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    if (seedBytes != null) {
      return seedBytes(this);
    }
    return orElse();
  }
}

abstract class WalletEntropySource_SeedBytes implements WalletEntropySource {
  const factory WalletEntropySource_SeedBytes(final U8Array64 field0) =
      _$WalletEntropySource_SeedBytes;

  U8Array64 get field0;
  @JsonKey(ignore: true)
  _$$WalletEntropySource_SeedBytesCopyWith<_$WalletEntropySource_SeedBytes>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletEntropySource_Bip39MnemonicCopyWith<$Res> {
  factory _$$WalletEntropySource_Bip39MnemonicCopyWith(
          _$WalletEntropySource_Bip39Mnemonic value,
          $Res Function(_$WalletEntropySource_Bip39Mnemonic) then) =
      __$$WalletEntropySource_Bip39MnemonicCopyWithImpl<$Res>;
  @useResult
  $Res call({String mnemonic, String? passphrase});
}

/// @nodoc
class __$$WalletEntropySource_Bip39MnemonicCopyWithImpl<$Res>
    extends _$WalletEntropySourceCopyWithImpl<$Res,
        _$WalletEntropySource_Bip39Mnemonic>
    implements _$$WalletEntropySource_Bip39MnemonicCopyWith<$Res> {
  __$$WalletEntropySource_Bip39MnemonicCopyWithImpl(
      _$WalletEntropySource_Bip39Mnemonic _value,
      $Res Function(_$WalletEntropySource_Bip39Mnemonic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mnemonic = null,
    Object? passphrase = freezed,
  }) {
    return _then(_$WalletEntropySource_Bip39Mnemonic(
      mnemonic: null == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as String,
      passphrase: freezed == passphrase
          ? _value.passphrase
          : passphrase // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WalletEntropySource_Bip39Mnemonic
    implements WalletEntropySource_Bip39Mnemonic {
  const _$WalletEntropySource_Bip39Mnemonic(
      {required this.mnemonic, this.passphrase});

  @override
  final String mnemonic;
  @override
  final String? passphrase;

  @override
  String toString() {
    return 'WalletEntropySource.bip39Mnemonic(mnemonic: $mnemonic, passphrase: $passphrase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletEntropySource_Bip39Mnemonic &&
            (identical(other.mnemonic, mnemonic) ||
                other.mnemonic == mnemonic) &&
            (identical(other.passphrase, passphrase) ||
                other.passphrase == passphrase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mnemonic, passphrase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletEntropySource_Bip39MnemonicCopyWith<
          _$WalletEntropySource_Bip39Mnemonic>
      get copyWith => __$$WalletEntropySource_Bip39MnemonicCopyWithImpl<
          _$WalletEntropySource_Bip39Mnemonic>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) seedFile,
    required TResult Function(U8Array64 field0) seedBytes,
    required TResult Function(String mnemonic, String? passphrase)
        bip39Mnemonic,
  }) {
    return bip39Mnemonic(mnemonic, passphrase);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(U8Array64 field0)? seedBytes,
    TResult? Function(String mnemonic, String? passphrase)? bip39Mnemonic,
  }) {
    return bip39Mnemonic?.call(mnemonic, passphrase);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(U8Array64 field0)? seedBytes,
    TResult Function(String mnemonic, String? passphrase)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    if (bip39Mnemonic != null) {
      return bip39Mnemonic(mnemonic, passphrase);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WalletEntropySource_SeedFile value) seedFile,
    required TResult Function(WalletEntropySource_SeedBytes value) seedBytes,
    required TResult Function(WalletEntropySource_Bip39Mnemonic value)
        bip39Mnemonic,
  }) {
    return bip39Mnemonic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WalletEntropySource_SeedFile value)? seedFile,
    TResult? Function(WalletEntropySource_SeedBytes value)? seedBytes,
    TResult? Function(WalletEntropySource_Bip39Mnemonic value)? bip39Mnemonic,
  }) {
    return bip39Mnemonic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WalletEntropySource_SeedFile value)? seedFile,
    TResult Function(WalletEntropySource_SeedBytes value)? seedBytes,
    TResult Function(WalletEntropySource_Bip39Mnemonic value)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    if (bip39Mnemonic != null) {
      return bip39Mnemonic(this);
    }
    return orElse();
  }
}

abstract class WalletEntropySource_Bip39Mnemonic
    implements WalletEntropySource {
  const factory WalletEntropySource_Bip39Mnemonic(
      {required final String mnemonic,
      final String? passphrase}) = _$WalletEntropySource_Bip39Mnemonic;

  String get mnemonic;
  String? get passphrase;
  @JsonKey(ignore: true)
  _$$WalletEntropySource_Bip39MnemonicCopyWith<
          _$WalletEntropySource_Bip39Mnemonic>
      get copyWith => throw _privateConstructorUsedError;
}
