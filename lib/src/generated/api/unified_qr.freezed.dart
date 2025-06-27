// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unified_qr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QrPaymentResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Txid txid) onchain,
    required TResult Function(PaymentId paymentId) bolt11,
    required TResult Function(PaymentId paymentId) bolt12,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Txid txid)? onchain,
    TResult? Function(PaymentId paymentId)? bolt11,
    TResult? Function(PaymentId paymentId)? bolt12,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Txid txid)? onchain,
    TResult Function(PaymentId paymentId)? bolt11,
    TResult Function(PaymentId paymentId)? bolt12,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QrPaymentResult_Onchain value) onchain,
    required TResult Function(QrPaymentResult_Bolt11 value) bolt11,
    required TResult Function(QrPaymentResult_Bolt12 value) bolt12,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QrPaymentResult_Onchain value)? onchain,
    TResult? Function(QrPaymentResult_Bolt11 value)? bolt11,
    TResult? Function(QrPaymentResult_Bolt12 value)? bolt12,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QrPaymentResult_Onchain value)? onchain,
    TResult Function(QrPaymentResult_Bolt11 value)? bolt11,
    TResult Function(QrPaymentResult_Bolt12 value)? bolt12,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrPaymentResultCopyWith<$Res> {
  factory $QrPaymentResultCopyWith(
          QrPaymentResult value, $Res Function(QrPaymentResult) then) =
      _$QrPaymentResultCopyWithImpl<$Res, QrPaymentResult>;
}

/// @nodoc
class _$QrPaymentResultCopyWithImpl<$Res, $Val extends QrPaymentResult>
    implements $QrPaymentResultCopyWith<$Res> {
  _$QrPaymentResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$QrPaymentResult_OnchainImplCopyWith<$Res> {
  factory _$$QrPaymentResult_OnchainImplCopyWith(
          _$QrPaymentResult_OnchainImpl value,
          $Res Function(_$QrPaymentResult_OnchainImpl) then) =
      __$$QrPaymentResult_OnchainImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Txid txid});
}

/// @nodoc
class __$$QrPaymentResult_OnchainImplCopyWithImpl<$Res>
    extends _$QrPaymentResultCopyWithImpl<$Res, _$QrPaymentResult_OnchainImpl>
    implements _$$QrPaymentResult_OnchainImplCopyWith<$Res> {
  __$$QrPaymentResult_OnchainImplCopyWithImpl(
      _$QrPaymentResult_OnchainImpl _value,
      $Res Function(_$QrPaymentResult_OnchainImpl) _then)
      : super(_value, _then);

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
  }) {
    return _then(_$QrPaymentResult_OnchainImpl(
      txid: null == txid
          ? _value.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as Txid,
    ));
  }
}

/// @nodoc

class _$QrPaymentResult_OnchainImpl extends QrPaymentResult_Onchain {
  const _$QrPaymentResult_OnchainImpl({required this.txid}) : super._();

  /// The transaction ID (txid) of the on-chain payment.
  @override
  final Txid txid;

  @override
  String toString() {
    return 'QrPaymentResult.onchain(txid: $txid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrPaymentResult_OnchainImpl &&
            (identical(other.txid, txid) || other.txid == txid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, txid);

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrPaymentResult_OnchainImplCopyWith<_$QrPaymentResult_OnchainImpl>
      get copyWith => __$$QrPaymentResult_OnchainImplCopyWithImpl<
          _$QrPaymentResult_OnchainImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Txid txid) onchain,
    required TResult Function(PaymentId paymentId) bolt11,
    required TResult Function(PaymentId paymentId) bolt12,
  }) {
    return onchain(txid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Txid txid)? onchain,
    TResult? Function(PaymentId paymentId)? bolt11,
    TResult? Function(PaymentId paymentId)? bolt12,
  }) {
    return onchain?.call(txid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Txid txid)? onchain,
    TResult Function(PaymentId paymentId)? bolt11,
    TResult Function(PaymentId paymentId)? bolt12,
    required TResult orElse(),
  }) {
    if (onchain != null) {
      return onchain(txid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QrPaymentResult_Onchain value) onchain,
    required TResult Function(QrPaymentResult_Bolt11 value) bolt11,
    required TResult Function(QrPaymentResult_Bolt12 value) bolt12,
  }) {
    return onchain(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QrPaymentResult_Onchain value)? onchain,
    TResult? Function(QrPaymentResult_Bolt11 value)? bolt11,
    TResult? Function(QrPaymentResult_Bolt12 value)? bolt12,
  }) {
    return onchain?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QrPaymentResult_Onchain value)? onchain,
    TResult Function(QrPaymentResult_Bolt11 value)? bolt11,
    TResult Function(QrPaymentResult_Bolt12 value)? bolt12,
    required TResult orElse(),
  }) {
    if (onchain != null) {
      return onchain(this);
    }
    return orElse();
  }
}

abstract class QrPaymentResult_Onchain extends QrPaymentResult {
  const factory QrPaymentResult_Onchain({required final Txid txid}) =
      _$QrPaymentResult_OnchainImpl;
  const QrPaymentResult_Onchain._() : super._();

  /// The transaction ID (txid) of the on-chain payment.
  Txid get txid;

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrPaymentResult_OnchainImplCopyWith<_$QrPaymentResult_OnchainImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QrPaymentResult_Bolt11ImplCopyWith<$Res> {
  factory _$$QrPaymentResult_Bolt11ImplCopyWith(
          _$QrPaymentResult_Bolt11Impl value,
          $Res Function(_$QrPaymentResult_Bolt11Impl) then) =
      __$$QrPaymentResult_Bolt11ImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentId paymentId});
}

/// @nodoc
class __$$QrPaymentResult_Bolt11ImplCopyWithImpl<$Res>
    extends _$QrPaymentResultCopyWithImpl<$Res, _$QrPaymentResult_Bolt11Impl>
    implements _$$QrPaymentResult_Bolt11ImplCopyWith<$Res> {
  __$$QrPaymentResult_Bolt11ImplCopyWithImpl(
      _$QrPaymentResult_Bolt11Impl _value,
      $Res Function(_$QrPaymentResult_Bolt11Impl) _then)
      : super(_value, _then);

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
  }) {
    return _then(_$QrPaymentResult_Bolt11Impl(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId,
    ));
  }
}

/// @nodoc

class _$QrPaymentResult_Bolt11Impl extends QrPaymentResult_Bolt11 {
  const _$QrPaymentResult_Bolt11Impl({required this.paymentId}) : super._();

  /// The payment ID for the BOLT11 invoice.
  @override
  final PaymentId paymentId;

  @override
  String toString() {
    return 'QrPaymentResult.bolt11(paymentId: $paymentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrPaymentResult_Bolt11Impl &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentId);

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrPaymentResult_Bolt11ImplCopyWith<_$QrPaymentResult_Bolt11Impl>
      get copyWith => __$$QrPaymentResult_Bolt11ImplCopyWithImpl<
          _$QrPaymentResult_Bolt11Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Txid txid) onchain,
    required TResult Function(PaymentId paymentId) bolt11,
    required TResult Function(PaymentId paymentId) bolt12,
  }) {
    return bolt11(paymentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Txid txid)? onchain,
    TResult? Function(PaymentId paymentId)? bolt11,
    TResult? Function(PaymentId paymentId)? bolt12,
  }) {
    return bolt11?.call(paymentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Txid txid)? onchain,
    TResult Function(PaymentId paymentId)? bolt11,
    TResult Function(PaymentId paymentId)? bolt12,
    required TResult orElse(),
  }) {
    if (bolt11 != null) {
      return bolt11(paymentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QrPaymentResult_Onchain value) onchain,
    required TResult Function(QrPaymentResult_Bolt11 value) bolt11,
    required TResult Function(QrPaymentResult_Bolt12 value) bolt12,
  }) {
    return bolt11(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QrPaymentResult_Onchain value)? onchain,
    TResult? Function(QrPaymentResult_Bolt11 value)? bolt11,
    TResult? Function(QrPaymentResult_Bolt12 value)? bolt12,
  }) {
    return bolt11?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QrPaymentResult_Onchain value)? onchain,
    TResult Function(QrPaymentResult_Bolt11 value)? bolt11,
    TResult Function(QrPaymentResult_Bolt12 value)? bolt12,
    required TResult orElse(),
  }) {
    if (bolt11 != null) {
      return bolt11(this);
    }
    return orElse();
  }
}

abstract class QrPaymentResult_Bolt11 extends QrPaymentResult {
  const factory QrPaymentResult_Bolt11({required final PaymentId paymentId}) =
      _$QrPaymentResult_Bolt11Impl;
  const QrPaymentResult_Bolt11._() : super._();

  /// The payment ID for the BOLT11 invoice.
  PaymentId get paymentId;

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrPaymentResult_Bolt11ImplCopyWith<_$QrPaymentResult_Bolt11Impl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QrPaymentResult_Bolt12ImplCopyWith<$Res> {
  factory _$$QrPaymentResult_Bolt12ImplCopyWith(
          _$QrPaymentResult_Bolt12Impl value,
          $Res Function(_$QrPaymentResult_Bolt12Impl) then) =
      __$$QrPaymentResult_Bolt12ImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentId paymentId});
}

/// @nodoc
class __$$QrPaymentResult_Bolt12ImplCopyWithImpl<$Res>
    extends _$QrPaymentResultCopyWithImpl<$Res, _$QrPaymentResult_Bolt12Impl>
    implements _$$QrPaymentResult_Bolt12ImplCopyWith<$Res> {
  __$$QrPaymentResult_Bolt12ImplCopyWithImpl(
      _$QrPaymentResult_Bolt12Impl _value,
      $Res Function(_$QrPaymentResult_Bolt12Impl) _then)
      : super(_value, _then);

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
  }) {
    return _then(_$QrPaymentResult_Bolt12Impl(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId,
    ));
  }
}

/// @nodoc

class _$QrPaymentResult_Bolt12Impl extends QrPaymentResult_Bolt12 {
  const _$QrPaymentResult_Bolt12Impl({required this.paymentId}) : super._();

  /// The payment ID for the BOLT12 offer.
  @override
  final PaymentId paymentId;

  @override
  String toString() {
    return 'QrPaymentResult.bolt12(paymentId: $paymentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrPaymentResult_Bolt12Impl &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentId);

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrPaymentResult_Bolt12ImplCopyWith<_$QrPaymentResult_Bolt12Impl>
      get copyWith => __$$QrPaymentResult_Bolt12ImplCopyWithImpl<
          _$QrPaymentResult_Bolt12Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Txid txid) onchain,
    required TResult Function(PaymentId paymentId) bolt11,
    required TResult Function(PaymentId paymentId) bolt12,
  }) {
    return bolt12(paymentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Txid txid)? onchain,
    TResult? Function(PaymentId paymentId)? bolt11,
    TResult? Function(PaymentId paymentId)? bolt12,
  }) {
    return bolt12?.call(paymentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Txid txid)? onchain,
    TResult Function(PaymentId paymentId)? bolt11,
    TResult Function(PaymentId paymentId)? bolt12,
    required TResult orElse(),
  }) {
    if (bolt12 != null) {
      return bolt12(paymentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QrPaymentResult_Onchain value) onchain,
    required TResult Function(QrPaymentResult_Bolt11 value) bolt11,
    required TResult Function(QrPaymentResult_Bolt12 value) bolt12,
  }) {
    return bolt12(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QrPaymentResult_Onchain value)? onchain,
    TResult? Function(QrPaymentResult_Bolt11 value)? bolt11,
    TResult? Function(QrPaymentResult_Bolt12 value)? bolt12,
  }) {
    return bolt12?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QrPaymentResult_Onchain value)? onchain,
    TResult Function(QrPaymentResult_Bolt11 value)? bolt11,
    TResult Function(QrPaymentResult_Bolt12 value)? bolt12,
    required TResult orElse(),
  }) {
    if (bolt12 != null) {
      return bolt12(this);
    }
    return orElse();
  }
}

abstract class QrPaymentResult_Bolt12 extends QrPaymentResult {
  const factory QrPaymentResult_Bolt12({required final PaymentId paymentId}) =
      _$QrPaymentResult_Bolt12Impl;
  const QrPaymentResult_Bolt12._() : super._();

  /// The payment ID for the BOLT12 offer.
  PaymentId get paymentId;

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrPaymentResult_Bolt12ImplCopyWith<_$QrPaymentResult_Bolt12Impl>
      get copyWith => throw _privateConstructorUsedError;
}
