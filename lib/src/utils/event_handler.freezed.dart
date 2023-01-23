// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_handler.dart';

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
    required TResult Function(PaymentHash paymentHash, BigInt amountMsat)
        paymentReceived,
    required TResult Function(String channelId, BigInt userChannelId)
        channelReady,
    required TResult Function(String channelId, BigInt userChannelId)
        channelClosed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult? Function(String channelId, BigInt userChannelId)? channelReady,
    TResult? Function(String channelId, BigInt userChannelId)? channelClosed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult Function(String channelId, BigInt userChannelId)? channelReady,
    TResult Function(String channelId, BigInt userChannelId)? channelClosed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Event_paymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_paymentFailed value) paymentFailed,
    required TResult Function(Event_paymentReceived value) paymentReceived,
    required TResult Function(Event_channelReady value) channelReady,
    required TResult Function(Event_channelClosed value) channelClosed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_paymentFailed value)? paymentFailed,
    TResult? Function(Event_paymentReceived value)? paymentReceived,
    TResult? Function(Event_channelReady value)? channelReady,
    TResult? Function(Event_channelClosed value)? channelClosed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_paymentFailed value)? paymentFailed,
    TResult Function(Event_paymentReceived value)? paymentReceived,
    TResult Function(Event_channelReady value)? channelReady,
    TResult Function(Event_channelClosed value)? channelClosed,
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
abstract class _$$Event_paymentSuccessfulCopyWith<$Res> {
  factory _$$Event_paymentSuccessfulCopyWith(_$Event_paymentSuccessful value,
          $Res Function(_$Event_paymentSuccessful) then) =
      __$$Event_paymentSuccessfulCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentHash paymentHash});
}

/// @nodoc
class __$$Event_paymentSuccessfulCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_paymentSuccessful>
    implements _$$Event_paymentSuccessfulCopyWith<$Res> {
  __$$Event_paymentSuccessfulCopyWithImpl(_$Event_paymentSuccessful _value,
      $Res Function(_$Event_paymentSuccessful) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentHash = null,
  }) {
    return _then(_$Event_paymentSuccessful(
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
    ));
  }
}

/// @nodoc

class _$Event_paymentSuccessful
    with DiagnosticableTreeMixin
    implements Event_paymentSuccessful {
  const _$Event_paymentSuccessful({required this.paymentHash});

  @override
  final PaymentHash paymentHash;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event.paymentSuccessful(paymentHash: $paymentHash)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event.paymentSuccessful'))
      ..add(DiagnosticsProperty('paymentHash', paymentHash));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_paymentSuccessful &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentHash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_paymentSuccessfulCopyWith<_$Event_paymentSuccessful> get copyWith =>
      __$$Event_paymentSuccessfulCopyWithImpl<_$Event_paymentSuccessful>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, BigInt amountMsat)
        paymentReceived,
    required TResult Function(String channelId, BigInt userChannelId)
        channelReady,
    required TResult Function(String channelId, BigInt userChannelId)
        channelClosed,
  }) {
    return paymentSuccessful(paymentHash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult? Function(String channelId, BigInt userChannelId)? channelReady,
    TResult? Function(String channelId, BigInt userChannelId)? channelClosed,
  }) {
    return paymentSuccessful?.call(paymentHash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult Function(String channelId, BigInt userChannelId)? channelReady,
    TResult Function(String channelId, BigInt userChannelId)? channelClosed,
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
    required TResult Function(Event_paymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_paymentFailed value) paymentFailed,
    required TResult Function(Event_paymentReceived value) paymentReceived,
    required TResult Function(Event_channelReady value) channelReady,
    required TResult Function(Event_channelClosed value) channelClosed,
  }) {
    return paymentSuccessful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_paymentFailed value)? paymentFailed,
    TResult? Function(Event_paymentReceived value)? paymentReceived,
    TResult? Function(Event_channelReady value)? channelReady,
    TResult? Function(Event_channelClosed value)? channelClosed,
  }) {
    return paymentSuccessful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_paymentFailed value)? paymentFailed,
    TResult Function(Event_paymentReceived value)? paymentReceived,
    TResult Function(Event_channelReady value)? channelReady,
    TResult Function(Event_channelClosed value)? channelClosed,
    required TResult orElse(),
  }) {
    if (paymentSuccessful != null) {
      return paymentSuccessful(this);
    }
    return orElse();
  }
}

abstract class Event_paymentSuccessful implements Event {
  const factory Event_paymentSuccessful(
      {required final PaymentHash paymentHash}) = _$Event_paymentSuccessful;

  PaymentHash get paymentHash;
  @JsonKey(ignore: true)
  _$$Event_paymentSuccessfulCopyWith<_$Event_paymentSuccessful> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_paymentFailedCopyWith<$Res> {
  factory _$$Event_paymentFailedCopyWith(_$Event_paymentFailed value,
          $Res Function(_$Event_paymentFailed) then) =
      __$$Event_paymentFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentHash paymentHash});
}

/// @nodoc
class __$$Event_paymentFailedCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_paymentFailed>
    implements _$$Event_paymentFailedCopyWith<$Res> {
  __$$Event_paymentFailedCopyWithImpl(
      _$Event_paymentFailed _value, $Res Function(_$Event_paymentFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentHash = null,
  }) {
    return _then(_$Event_paymentFailed(
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
    ));
  }
}

/// @nodoc

class _$Event_paymentFailed
    with DiagnosticableTreeMixin
    implements Event_paymentFailed {
  const _$Event_paymentFailed({required this.paymentHash});

  @override
  final PaymentHash paymentHash;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event.paymentFailed(paymentHash: $paymentHash)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event.paymentFailed'))
      ..add(DiagnosticsProperty('paymentHash', paymentHash));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_paymentFailed &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentHash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_paymentFailedCopyWith<_$Event_paymentFailed> get copyWith =>
      __$$Event_paymentFailedCopyWithImpl<_$Event_paymentFailed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, BigInt amountMsat)
        paymentReceived,
    required TResult Function(String channelId, BigInt userChannelId)
        channelReady,
    required TResult Function(String channelId, BigInt userChannelId)
        channelClosed,
  }) {
    return paymentFailed(paymentHash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult? Function(String channelId, BigInt userChannelId)? channelReady,
    TResult? Function(String channelId, BigInt userChannelId)? channelClosed,
  }) {
    return paymentFailed?.call(paymentHash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult Function(String channelId, BigInt userChannelId)? channelReady,
    TResult Function(String channelId, BigInt userChannelId)? channelClosed,
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
    required TResult Function(Event_paymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_paymentFailed value) paymentFailed,
    required TResult Function(Event_paymentReceived value) paymentReceived,
    required TResult Function(Event_channelReady value) channelReady,
    required TResult Function(Event_channelClosed value) channelClosed,
  }) {
    return paymentFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_paymentFailed value)? paymentFailed,
    TResult? Function(Event_paymentReceived value)? paymentReceived,
    TResult? Function(Event_channelReady value)? channelReady,
    TResult? Function(Event_channelClosed value)? channelClosed,
  }) {
    return paymentFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_paymentFailed value)? paymentFailed,
    TResult Function(Event_paymentReceived value)? paymentReceived,
    TResult Function(Event_channelReady value)? channelReady,
    TResult Function(Event_channelClosed value)? channelClosed,
    required TResult orElse(),
  }) {
    if (paymentFailed != null) {
      return paymentFailed(this);
    }
    return orElse();
  }
}

abstract class Event_paymentFailed implements Event {
  const factory Event_paymentFailed({required final PaymentHash paymentHash}) =
      _$Event_paymentFailed;

  PaymentHash get paymentHash;
  @JsonKey(ignore: true)
  _$$Event_paymentFailedCopyWith<_$Event_paymentFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_paymentReceivedCopyWith<$Res> {
  factory _$$Event_paymentReceivedCopyWith(_$Event_paymentReceived value,
          $Res Function(_$Event_paymentReceived) then) =
      __$$Event_paymentReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentHash paymentHash, BigInt amountMsat});
}

/// @nodoc
class __$$Event_paymentReceivedCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_paymentReceived>
    implements _$$Event_paymentReceivedCopyWith<$Res> {
  __$$Event_paymentReceivedCopyWithImpl(_$Event_paymentReceived _value,
      $Res Function(_$Event_paymentReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentHash = null,
    Object? amountMsat = null,
  }) {
    return _then(_$Event_paymentReceived(
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      amountMsat: null == amountMsat
          ? _value.amountMsat
          : amountMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$Event_paymentReceived
    with DiagnosticableTreeMixin
    implements Event_paymentReceived {
  const _$Event_paymentReceived(
      {required this.paymentHash, required this.amountMsat});

  @override
  final PaymentHash paymentHash;
  @override
  final BigInt amountMsat;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event.paymentReceived(paymentHash: $paymentHash, amountMsat: $amountMsat)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event.paymentReceived'))
      ..add(DiagnosticsProperty('paymentHash', paymentHash))
      ..add(DiagnosticsProperty('amountMsat', amountMsat));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_paymentReceived &&
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
  _$$Event_paymentReceivedCopyWith<_$Event_paymentReceived> get copyWith =>
      __$$Event_paymentReceivedCopyWithImpl<_$Event_paymentReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, BigInt amountMsat)
        paymentReceived,
    required TResult Function(String channelId, BigInt userChannelId)
        channelReady,
    required TResult Function(String channelId, BigInt userChannelId)
        channelClosed,
  }) {
    return paymentReceived(paymentHash, amountMsat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult? Function(String channelId, BigInt userChannelId)? channelReady,
    TResult? Function(String channelId, BigInt userChannelId)? channelClosed,
  }) {
    return paymentReceived?.call(paymentHash, amountMsat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult Function(String channelId, BigInt userChannelId)? channelReady,
    TResult Function(String channelId, BigInt userChannelId)? channelClosed,
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
    required TResult Function(Event_paymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_paymentFailed value) paymentFailed,
    required TResult Function(Event_paymentReceived value) paymentReceived,
    required TResult Function(Event_channelReady value) channelReady,
    required TResult Function(Event_channelClosed value) channelClosed,
  }) {
    return paymentReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_paymentFailed value)? paymentFailed,
    TResult? Function(Event_paymentReceived value)? paymentReceived,
    TResult? Function(Event_channelReady value)? channelReady,
    TResult? Function(Event_channelClosed value)? channelClosed,
  }) {
    return paymentReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_paymentFailed value)? paymentFailed,
    TResult Function(Event_paymentReceived value)? paymentReceived,
    TResult Function(Event_channelReady value)? channelReady,
    TResult Function(Event_channelClosed value)? channelClosed,
    required TResult orElse(),
  }) {
    if (paymentReceived != null) {
      return paymentReceived(this);
    }
    return orElse();
  }
}

abstract class Event_paymentReceived implements Event {
  const factory Event_paymentReceived(
      {required final PaymentHash paymentHash,
      required final BigInt amountMsat}) = _$Event_paymentReceived;

  PaymentHash get paymentHash;
  BigInt get amountMsat;
  @JsonKey(ignore: true)
  _$$Event_paymentReceivedCopyWith<_$Event_paymentReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_channelReadyCopyWith<$Res> {
  factory _$$Event_channelReadyCopyWith(_$Event_channelReady value,
          $Res Function(_$Event_channelReady) then) =
      __$$Event_channelReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({String channelId, BigInt userChannelId});
}

/// @nodoc
class __$$Event_channelReadyCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_channelReady>
    implements _$$Event_channelReadyCopyWith<$Res> {
  __$$Event_channelReadyCopyWithImpl(
      _$Event_channelReady _value, $Res Function(_$Event_channelReady) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
  }) {
    return _then(_$Event_channelReady(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      userChannelId: null == userChannelId
          ? _value.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$Event_channelReady
    with DiagnosticableTreeMixin
    implements Event_channelReady {
  const _$Event_channelReady(
      {required this.channelId, required this.userChannelId});

  @override
  final String channelId;
  @override
  final BigInt userChannelId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event.channelReady(channelId: $channelId, userChannelId: $userChannelId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event.channelReady'))
      ..add(DiagnosticsProperty('channelId', channelId))
      ..add(DiagnosticsProperty('userChannelId', userChannelId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_channelReady &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, userChannelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_channelReadyCopyWith<_$Event_channelReady> get copyWith =>
      __$$Event_channelReadyCopyWithImpl<_$Event_channelReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, BigInt amountMsat)
        paymentReceived,
    required TResult Function(String channelId, BigInt userChannelId)
        channelReady,
    required TResult Function(String channelId, BigInt userChannelId)
        channelClosed,
  }) {
    return channelReady(channelId, userChannelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult? Function(String channelId, BigInt userChannelId)? channelReady,
    TResult? Function(String channelId, BigInt userChannelId)? channelClosed,
  }) {
    return channelReady?.call(channelId, userChannelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult Function(String channelId, BigInt userChannelId)? channelReady,
    TResult Function(String channelId, BigInt userChannelId)? channelClosed,
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
    required TResult Function(Event_paymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_paymentFailed value) paymentFailed,
    required TResult Function(Event_paymentReceived value) paymentReceived,
    required TResult Function(Event_channelReady value) channelReady,
    required TResult Function(Event_channelClosed value) channelClosed,
  }) {
    return channelReady(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_paymentFailed value)? paymentFailed,
    TResult? Function(Event_paymentReceived value)? paymentReceived,
    TResult? Function(Event_channelReady value)? channelReady,
    TResult? Function(Event_channelClosed value)? channelClosed,
  }) {
    return channelReady?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_paymentFailed value)? paymentFailed,
    TResult Function(Event_paymentReceived value)? paymentReceived,
    TResult Function(Event_channelReady value)? channelReady,
    TResult Function(Event_channelClosed value)? channelClosed,
    required TResult orElse(),
  }) {
    if (channelReady != null) {
      return channelReady(this);
    }
    return orElse();
  }
}

abstract class Event_channelReady implements Event {
  const factory Event_channelReady(
      {required final String channelId,
      required final BigInt userChannelId}) = _$Event_channelReady;

  String get channelId;
  BigInt get userChannelId;
  @JsonKey(ignore: true)
  _$$Event_channelReadyCopyWith<_$Event_channelReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_channelClosedCopyWith<$Res> {
  factory _$$Event_channelClosedCopyWith(_$Event_channelClosed value,
          $Res Function(_$Event_channelClosed) then) =
      __$$Event_channelClosedCopyWithImpl<$Res>;
  @useResult
  $Res call({String channelId, BigInt userChannelId});
}

/// @nodoc
class __$$Event_channelClosedCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_channelClosed>
    implements _$$Event_channelClosedCopyWith<$Res> {
  __$$Event_channelClosedCopyWithImpl(
      _$Event_channelClosed _value, $Res Function(_$Event_channelClosed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
  }) {
    return _then(_$Event_channelClosed(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      userChannelId: null == userChannelId
          ? _value.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$Event_channelClosed
    with DiagnosticableTreeMixin
    implements Event_channelClosed {
  const _$Event_channelClosed(
      {required this.channelId, required this.userChannelId});

  @override
  final String channelId;
  @override
  final BigInt userChannelId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event.channelClosed(channelId: $channelId, userChannelId: $userChannelId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event.channelClosed'))
      ..add(DiagnosticsProperty('channelId', channelId))
      ..add(DiagnosticsProperty('userChannelId', userChannelId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_channelClosed &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, userChannelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_channelClosedCopyWith<_$Event_channelClosed> get copyWith =>
      __$$Event_channelClosedCopyWithImpl<_$Event_channelClosed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentHash paymentHash) paymentSuccessful,
    required TResult Function(PaymentHash paymentHash) paymentFailed,
    required TResult Function(PaymentHash paymentHash, BigInt amountMsat)
        paymentReceived,
    required TResult Function(String channelId, BigInt userChannelId)
        channelReady,
    required TResult Function(String channelId, BigInt userChannelId)
        channelClosed,
  }) {
    return channelClosed(channelId, userChannelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult? Function(PaymentHash paymentHash)? paymentFailed,
    TResult? Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult? Function(String channelId, BigInt userChannelId)? channelReady,
    TResult? Function(String channelId, BigInt userChannelId)? channelClosed,
  }) {
    return channelClosed?.call(channelId, userChannelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentHash paymentHash)? paymentSuccessful,
    TResult Function(PaymentHash paymentHash)? paymentFailed,
    TResult Function(PaymentHash paymentHash, BigInt amountMsat)?
        paymentReceived,
    TResult Function(String channelId, BigInt userChannelId)? channelReady,
    TResult Function(String channelId, BigInt userChannelId)? channelClosed,
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
    required TResult Function(Event_paymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_paymentFailed value) paymentFailed,
    required TResult Function(Event_paymentReceived value) paymentReceived,
    required TResult Function(Event_channelReady value) channelReady,
    required TResult Function(Event_channelClosed value) channelClosed,
  }) {
    return channelClosed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_paymentFailed value)? paymentFailed,
    TResult? Function(Event_paymentReceived value)? paymentReceived,
    TResult? Function(Event_channelReady value)? channelReady,
    TResult? Function(Event_channelClosed value)? channelClosed,
  }) {
    return channelClosed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Event_paymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_paymentFailed value)? paymentFailed,
    TResult Function(Event_paymentReceived value)? paymentReceived,
    TResult Function(Event_channelReady value)? channelReady,
    TResult Function(Event_channelClosed value)? channelClosed,
    required TResult orElse(),
  }) {
    if (channelClosed != null) {
      return channelClosed(this);
    }
    return orElse();
  }
}

abstract class Event_channelClosed implements Event {
  const factory Event_channelClosed(
      {required final String channelId,
      required final BigInt userChannelId}) = _$Event_channelClosed;

  String get channelId;
  BigInt get userChannelId;
  @JsonKey(ignore: true)
  _$$Event_channelClosedCopyWith<_$Event_channelClosed> get copyWith =>
      throw _privateConstructorUsedError;
}
