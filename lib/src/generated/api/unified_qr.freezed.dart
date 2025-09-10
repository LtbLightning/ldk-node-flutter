// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unified_qr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrPaymentResult {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QrPaymentResult);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QrPaymentResult()';
  }
}

/// @nodoc
class $QrPaymentResultCopyWith<$Res> {
  $QrPaymentResultCopyWith(
      QrPaymentResult _, $Res Function(QrPaymentResult) __);
}

/// Adds pattern-matching-related methods to [QrPaymentResult].
extension QrPaymentResultPatterns on QrPaymentResult {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QrPaymentResult_Onchain value)? onchain,
    TResult Function(QrPaymentResult_Bolt11 value)? bolt11,
    TResult Function(QrPaymentResult_Bolt12 value)? bolt12,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case QrPaymentResult_Onchain() when onchain != null:
        return onchain(_that);
      case QrPaymentResult_Bolt11() when bolt11 != null:
        return bolt11(_that);
      case QrPaymentResult_Bolt12() when bolt12 != null:
        return bolt12(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QrPaymentResult_Onchain value) onchain,
    required TResult Function(QrPaymentResult_Bolt11 value) bolt11,
    required TResult Function(QrPaymentResult_Bolt12 value) bolt12,
  }) {
    final _that = this;
    switch (_that) {
      case QrPaymentResult_Onchain():
        return onchain(_that);
      case QrPaymentResult_Bolt11():
        return bolt11(_that);
      case QrPaymentResult_Bolt12():
        return bolt12(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QrPaymentResult_Onchain value)? onchain,
    TResult? Function(QrPaymentResult_Bolt11 value)? bolt11,
    TResult? Function(QrPaymentResult_Bolt12 value)? bolt12,
  }) {
    final _that = this;
    switch (_that) {
      case QrPaymentResult_Onchain() when onchain != null:
        return onchain(_that);
      case QrPaymentResult_Bolt11() when bolt11 != null:
        return bolt11(_that);
      case QrPaymentResult_Bolt12() when bolt12 != null:
        return bolt12(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Txid txid)? onchain,
    TResult Function(PaymentId paymentId)? bolt11,
    TResult Function(PaymentId paymentId)? bolt12,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case QrPaymentResult_Onchain() when onchain != null:
        return onchain(_that.txid);
      case QrPaymentResult_Bolt11() when bolt11 != null:
        return bolt11(_that.paymentId);
      case QrPaymentResult_Bolt12() when bolt12 != null:
        return bolt12(_that.paymentId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Txid txid) onchain,
    required TResult Function(PaymentId paymentId) bolt11,
    required TResult Function(PaymentId paymentId) bolt12,
  }) {
    final _that = this;
    switch (_that) {
      case QrPaymentResult_Onchain():
        return onchain(_that.txid);
      case QrPaymentResult_Bolt11():
        return bolt11(_that.paymentId);
      case QrPaymentResult_Bolt12():
        return bolt12(_that.paymentId);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Txid txid)? onchain,
    TResult? Function(PaymentId paymentId)? bolt11,
    TResult? Function(PaymentId paymentId)? bolt12,
  }) {
    final _that = this;
    switch (_that) {
      case QrPaymentResult_Onchain() when onchain != null:
        return onchain(_that.txid);
      case QrPaymentResult_Bolt11() when bolt11 != null:
        return bolt11(_that.paymentId);
      case QrPaymentResult_Bolt12() when bolt12 != null:
        return bolt12(_that.paymentId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class QrPaymentResult_Onchain extends QrPaymentResult {
  const QrPaymentResult_Onchain({required this.txid}) : super._();

  /// The transaction ID (txid) of the on-chain payment.
  final Txid txid;

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QrPaymentResult_OnchainCopyWith<QrPaymentResult_Onchain> get copyWith =>
      _$QrPaymentResult_OnchainCopyWithImpl<QrPaymentResult_Onchain>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QrPaymentResult_Onchain &&
            (identical(other.txid, txid) || other.txid == txid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, txid);

  @override
  String toString() {
    return 'QrPaymentResult.onchain(txid: $txid)';
  }
}

/// @nodoc
abstract mixin class $QrPaymentResult_OnchainCopyWith<$Res>
    implements $QrPaymentResultCopyWith<$Res> {
  factory $QrPaymentResult_OnchainCopyWith(QrPaymentResult_Onchain value,
          $Res Function(QrPaymentResult_Onchain) _then) =
      _$QrPaymentResult_OnchainCopyWithImpl;
  @useResult
  $Res call({Txid txid});
}

/// @nodoc
class _$QrPaymentResult_OnchainCopyWithImpl<$Res>
    implements $QrPaymentResult_OnchainCopyWith<$Res> {
  _$QrPaymentResult_OnchainCopyWithImpl(this._self, this._then);

  final QrPaymentResult_Onchain _self;
  final $Res Function(QrPaymentResult_Onchain) _then;

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? txid = null,
  }) {
    return _then(QrPaymentResult_Onchain(
      txid: null == txid
          ? _self.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as Txid,
    ));
  }
}

/// @nodoc

class QrPaymentResult_Bolt11 extends QrPaymentResult {
  const QrPaymentResult_Bolt11({required this.paymentId}) : super._();

  /// The payment ID for the BOLT11 invoice.
  final PaymentId paymentId;

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QrPaymentResult_Bolt11CopyWith<QrPaymentResult_Bolt11> get copyWith =>
      _$QrPaymentResult_Bolt11CopyWithImpl<QrPaymentResult_Bolt11>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QrPaymentResult_Bolt11 &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentId);

  @override
  String toString() {
    return 'QrPaymentResult.bolt11(paymentId: $paymentId)';
  }
}

/// @nodoc
abstract mixin class $QrPaymentResult_Bolt11CopyWith<$Res>
    implements $QrPaymentResultCopyWith<$Res> {
  factory $QrPaymentResult_Bolt11CopyWith(QrPaymentResult_Bolt11 value,
          $Res Function(QrPaymentResult_Bolt11) _then) =
      _$QrPaymentResult_Bolt11CopyWithImpl;
  @useResult
  $Res call({PaymentId paymentId});
}

/// @nodoc
class _$QrPaymentResult_Bolt11CopyWithImpl<$Res>
    implements $QrPaymentResult_Bolt11CopyWith<$Res> {
  _$QrPaymentResult_Bolt11CopyWithImpl(this._self, this._then);

  final QrPaymentResult_Bolt11 _self;
  final $Res Function(QrPaymentResult_Bolt11) _then;

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paymentId = null,
  }) {
    return _then(QrPaymentResult_Bolt11(
      paymentId: null == paymentId
          ? _self.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId,
    ));
  }
}

/// @nodoc

class QrPaymentResult_Bolt12 extends QrPaymentResult {
  const QrPaymentResult_Bolt12({required this.paymentId}) : super._();

  /// The payment ID for the BOLT12 offer.
  final PaymentId paymentId;

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QrPaymentResult_Bolt12CopyWith<QrPaymentResult_Bolt12> get copyWith =>
      _$QrPaymentResult_Bolt12CopyWithImpl<QrPaymentResult_Bolt12>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QrPaymentResult_Bolt12 &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentId);

  @override
  String toString() {
    return 'QrPaymentResult.bolt12(paymentId: $paymentId)';
  }
}

/// @nodoc
abstract mixin class $QrPaymentResult_Bolt12CopyWith<$Res>
    implements $QrPaymentResultCopyWith<$Res> {
  factory $QrPaymentResult_Bolt12CopyWith(QrPaymentResult_Bolt12 value,
          $Res Function(QrPaymentResult_Bolt12) _then) =
      _$QrPaymentResult_Bolt12CopyWithImpl;
  @useResult
  $Res call({PaymentId paymentId});
}

/// @nodoc
class _$QrPaymentResult_Bolt12CopyWithImpl<$Res>
    implements $QrPaymentResult_Bolt12CopyWith<$Res> {
  _$QrPaymentResult_Bolt12CopyWithImpl(this._self, this._then);

  final QrPaymentResult_Bolt12 _self;
  final $Res Function(QrPaymentResult_Bolt12) _then;

  /// Create a copy of QrPaymentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paymentId = null,
  }) {
    return _then(QrPaymentResult_Bolt12(
      paymentId: null == paymentId
          ? _self.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId,
    ));
  }
}

// dart format on
