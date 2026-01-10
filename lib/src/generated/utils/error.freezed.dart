// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bolt12ParseError {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Bolt12ParseError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Bolt12ParseError()';
  }
}

/// @nodoc
class $Bolt12ParseErrorCopyWith<$Res> {
  $Bolt12ParseErrorCopyWith(
      Bolt12ParseError _, $Res Function(Bolt12ParseError) __);
}

/// Adds pattern-matching-related methods to [Bolt12ParseError].
extension Bolt12ParseErrorPatterns on Bolt12ParseError {
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
    TResult Function(Bolt12ParseError_InvalidContinuation value)?
        invalidContinuation,
    TResult Function(Bolt12ParseError_InvalidBech32Hrp value)? invalidBech32Hrp,
    TResult Function(Bolt12ParseError_Bech32 value)? bech32,
    TResult Function(Bolt12ParseError_Decode value)? decode,
    TResult Function(Bolt12ParseError_InvalidSemantics value)? invalidSemantics,
    TResult Function(Bolt12ParseError_InvalidSignature value)? invalidSignature,
    TResult Function(Bolt12ParseError_InvalidLeadingWhitespace value)?
        invalidLeadingWhitespace,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Bolt12ParseError_InvalidContinuation()
          when invalidContinuation != null:
        return invalidContinuation(_that);
      case Bolt12ParseError_InvalidBech32Hrp() when invalidBech32Hrp != null:
        return invalidBech32Hrp(_that);
      case Bolt12ParseError_Bech32() when bech32 != null:
        return bech32(_that);
      case Bolt12ParseError_Decode() when decode != null:
        return decode(_that);
      case Bolt12ParseError_InvalidSemantics() when invalidSemantics != null:
        return invalidSemantics(_that);
      case Bolt12ParseError_InvalidSignature() when invalidSignature != null:
        return invalidSignature(_that);
      case Bolt12ParseError_InvalidLeadingWhitespace()
          when invalidLeadingWhitespace != null:
        return invalidLeadingWhitespace(_that);
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
    required TResult Function(Bolt12ParseError_InvalidContinuation value)
        invalidContinuation,
    required TResult Function(Bolt12ParseError_InvalidBech32Hrp value)
        invalidBech32Hrp,
    required TResult Function(Bolt12ParseError_Bech32 value) bech32,
    required TResult Function(Bolt12ParseError_Decode value) decode,
    required TResult Function(Bolt12ParseError_InvalidSemantics value)
        invalidSemantics,
    required TResult Function(Bolt12ParseError_InvalidSignature value)
        invalidSignature,
    required TResult Function(Bolt12ParseError_InvalidLeadingWhitespace value)
        invalidLeadingWhitespace,
  }) {
    final _that = this;
    switch (_that) {
      case Bolt12ParseError_InvalidContinuation():
        return invalidContinuation(_that);
      case Bolt12ParseError_InvalidBech32Hrp():
        return invalidBech32Hrp(_that);
      case Bolt12ParseError_Bech32():
        return bech32(_that);
      case Bolt12ParseError_Decode():
        return decode(_that);
      case Bolt12ParseError_InvalidSemantics():
        return invalidSemantics(_that);
      case Bolt12ParseError_InvalidSignature():
        return invalidSignature(_that);
      case Bolt12ParseError_InvalidLeadingWhitespace():
        return invalidLeadingWhitespace(_that);
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
    TResult? Function(Bolt12ParseError_InvalidContinuation value)?
        invalidContinuation,
    TResult? Function(Bolt12ParseError_InvalidBech32Hrp value)?
        invalidBech32Hrp,
    TResult? Function(Bolt12ParseError_Bech32 value)? bech32,
    TResult? Function(Bolt12ParseError_Decode value)? decode,
    TResult? Function(Bolt12ParseError_InvalidSemantics value)?
        invalidSemantics,
    TResult? Function(Bolt12ParseError_InvalidSignature value)?
        invalidSignature,
    TResult? Function(Bolt12ParseError_InvalidLeadingWhitespace value)?
        invalidLeadingWhitespace,
  }) {
    final _that = this;
    switch (_that) {
      case Bolt12ParseError_InvalidContinuation()
          when invalidContinuation != null:
        return invalidContinuation(_that);
      case Bolt12ParseError_InvalidBech32Hrp() when invalidBech32Hrp != null:
        return invalidBech32Hrp(_that);
      case Bolt12ParseError_Bech32() when bech32 != null:
        return bech32(_that);
      case Bolt12ParseError_Decode() when decode != null:
        return decode(_that);
      case Bolt12ParseError_InvalidSemantics() when invalidSemantics != null:
        return invalidSemantics(_that);
      case Bolt12ParseError_InvalidSignature() when invalidSignature != null:
        return invalidSignature(_that);
      case Bolt12ParseError_InvalidLeadingWhitespace()
          when invalidLeadingWhitespace != null:
        return invalidLeadingWhitespace(_that);
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
    TResult Function()? invalidContinuation,
    TResult Function()? invalidBech32Hrp,
    TResult Function(String field0)? bech32,
    TResult Function(DecodeError field0)? decode,
    TResult Function(String field0)? invalidSemantics,
    TResult Function(String field0)? invalidSignature,
    TResult Function()? invalidLeadingWhitespace,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Bolt12ParseError_InvalidContinuation()
          when invalidContinuation != null:
        return invalidContinuation();
      case Bolt12ParseError_InvalidBech32Hrp() when invalidBech32Hrp != null:
        return invalidBech32Hrp();
      case Bolt12ParseError_Bech32() when bech32 != null:
        return bech32(_that.field0);
      case Bolt12ParseError_Decode() when decode != null:
        return decode(_that.field0);
      case Bolt12ParseError_InvalidSemantics() when invalidSemantics != null:
        return invalidSemantics(_that.field0);
      case Bolt12ParseError_InvalidSignature() when invalidSignature != null:
        return invalidSignature(_that.field0);
      case Bolt12ParseError_InvalidLeadingWhitespace()
          when invalidLeadingWhitespace != null:
        return invalidLeadingWhitespace();
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
    required TResult Function() invalidContinuation,
    required TResult Function() invalidBech32Hrp,
    required TResult Function(String field0) bech32,
    required TResult Function(DecodeError field0) decode,
    required TResult Function(String field0) invalidSemantics,
    required TResult Function(String field0) invalidSignature,
    required TResult Function() invalidLeadingWhitespace,
  }) {
    final _that = this;
    switch (_that) {
      case Bolt12ParseError_InvalidContinuation():
        return invalidContinuation();
      case Bolt12ParseError_InvalidBech32Hrp():
        return invalidBech32Hrp();
      case Bolt12ParseError_Bech32():
        return bech32(_that.field0);
      case Bolt12ParseError_Decode():
        return decode(_that.field0);
      case Bolt12ParseError_InvalidSemantics():
        return invalidSemantics(_that.field0);
      case Bolt12ParseError_InvalidSignature():
        return invalidSignature(_that.field0);
      case Bolt12ParseError_InvalidLeadingWhitespace():
        return invalidLeadingWhitespace();
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
    TResult? Function()? invalidContinuation,
    TResult? Function()? invalidBech32Hrp,
    TResult? Function(String field0)? bech32,
    TResult? Function(DecodeError field0)? decode,
    TResult? Function(String field0)? invalidSemantics,
    TResult? Function(String field0)? invalidSignature,
    TResult? Function()? invalidLeadingWhitespace,
  }) {
    final _that = this;
    switch (_that) {
      case Bolt12ParseError_InvalidContinuation()
          when invalidContinuation != null:
        return invalidContinuation();
      case Bolt12ParseError_InvalidBech32Hrp() when invalidBech32Hrp != null:
        return invalidBech32Hrp();
      case Bolt12ParseError_Bech32() when bech32 != null:
        return bech32(_that.field0);
      case Bolt12ParseError_Decode() when decode != null:
        return decode(_that.field0);
      case Bolt12ParseError_InvalidSemantics() when invalidSemantics != null:
        return invalidSemantics(_that.field0);
      case Bolt12ParseError_InvalidSignature() when invalidSignature != null:
        return invalidSignature(_that.field0);
      case Bolt12ParseError_InvalidLeadingWhitespace()
          when invalidLeadingWhitespace != null:
        return invalidLeadingWhitespace();
      case _:
        return null;
    }
  }
}

/// @nodoc

class Bolt12ParseError_InvalidContinuation extends Bolt12ParseError {
  const Bolt12ParseError_InvalidContinuation() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bolt12ParseError_InvalidContinuation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Bolt12ParseError.invalidContinuation()';
  }
}

/// @nodoc

class Bolt12ParseError_InvalidBech32Hrp extends Bolt12ParseError {
  const Bolt12ParseError_InvalidBech32Hrp() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bolt12ParseError_InvalidBech32Hrp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Bolt12ParseError.invalidBech32Hrp()';
  }
}

/// @nodoc

class Bolt12ParseError_Bech32 extends Bolt12ParseError {
  const Bolt12ParseError_Bech32(this.field0) : super._();

  final String field0;

  /// Create a copy of Bolt12ParseError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Bolt12ParseError_Bech32CopyWith<Bolt12ParseError_Bech32> get copyWith =>
      _$Bolt12ParseError_Bech32CopyWithImpl<Bolt12ParseError_Bech32>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bolt12ParseError_Bech32 &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'Bolt12ParseError.bech32(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $Bolt12ParseError_Bech32CopyWith<$Res>
    implements $Bolt12ParseErrorCopyWith<$Res> {
  factory $Bolt12ParseError_Bech32CopyWith(Bolt12ParseError_Bech32 value,
          $Res Function(Bolt12ParseError_Bech32) _then) =
      _$Bolt12ParseError_Bech32CopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$Bolt12ParseError_Bech32CopyWithImpl<$Res>
    implements $Bolt12ParseError_Bech32CopyWith<$Res> {
  _$Bolt12ParseError_Bech32CopyWithImpl(this._self, this._then);

  final Bolt12ParseError_Bech32 _self;
  final $Res Function(Bolt12ParseError_Bech32) _then;

  /// Create a copy of Bolt12ParseError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(Bolt12ParseError_Bech32(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Bolt12ParseError_Decode extends Bolt12ParseError {
  const Bolt12ParseError_Decode(this.field0) : super._();

  final DecodeError field0;

  /// Create a copy of Bolt12ParseError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Bolt12ParseError_DecodeCopyWith<Bolt12ParseError_Decode> get copyWith =>
      _$Bolt12ParseError_DecodeCopyWithImpl<Bolt12ParseError_Decode>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bolt12ParseError_Decode &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'Bolt12ParseError.decode(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $Bolt12ParseError_DecodeCopyWith<$Res>
    implements $Bolt12ParseErrorCopyWith<$Res> {
  factory $Bolt12ParseError_DecodeCopyWith(Bolt12ParseError_Decode value,
          $Res Function(Bolt12ParseError_Decode) _then) =
      _$Bolt12ParseError_DecodeCopyWithImpl;
  @useResult
  $Res call({DecodeError field0});

  $DecodeErrorCopyWith<$Res> get field0;
}

/// @nodoc
class _$Bolt12ParseError_DecodeCopyWithImpl<$Res>
    implements $Bolt12ParseError_DecodeCopyWith<$Res> {
  _$Bolt12ParseError_DecodeCopyWithImpl(this._self, this._then);

  final Bolt12ParseError_Decode _self;
  final $Res Function(Bolt12ParseError_Decode) _then;

  /// Create a copy of Bolt12ParseError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(Bolt12ParseError_Decode(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DecodeError,
    ));
  }

  /// Create a copy of Bolt12ParseError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DecodeErrorCopyWith<$Res> get field0 {
    return $DecodeErrorCopyWith<$Res>(_self.field0, (value) {
      return _then(_self.copyWith(field0: value));
    });
  }
}

/// @nodoc

class Bolt12ParseError_InvalidSemantics extends Bolt12ParseError {
  const Bolt12ParseError_InvalidSemantics(this.field0) : super._();

  final String field0;

  /// Create a copy of Bolt12ParseError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Bolt12ParseError_InvalidSemanticsCopyWith<Bolt12ParseError_InvalidSemantics>
      get copyWith => _$Bolt12ParseError_InvalidSemanticsCopyWithImpl<
          Bolt12ParseError_InvalidSemantics>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bolt12ParseError_InvalidSemantics &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'Bolt12ParseError.invalidSemantics(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $Bolt12ParseError_InvalidSemanticsCopyWith<$Res>
    implements $Bolt12ParseErrorCopyWith<$Res> {
  factory $Bolt12ParseError_InvalidSemanticsCopyWith(
          Bolt12ParseError_InvalidSemantics value,
          $Res Function(Bolt12ParseError_InvalidSemantics) _then) =
      _$Bolt12ParseError_InvalidSemanticsCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$Bolt12ParseError_InvalidSemanticsCopyWithImpl<$Res>
    implements $Bolt12ParseError_InvalidSemanticsCopyWith<$Res> {
  _$Bolt12ParseError_InvalidSemanticsCopyWithImpl(this._self, this._then);

  final Bolt12ParseError_InvalidSemantics _self;
  final $Res Function(Bolt12ParseError_InvalidSemantics) _then;

  /// Create a copy of Bolt12ParseError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(Bolt12ParseError_InvalidSemantics(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Bolt12ParseError_InvalidSignature extends Bolt12ParseError {
  const Bolt12ParseError_InvalidSignature(this.field0) : super._();

  final String field0;

  /// Create a copy of Bolt12ParseError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Bolt12ParseError_InvalidSignatureCopyWith<Bolt12ParseError_InvalidSignature>
      get copyWith => _$Bolt12ParseError_InvalidSignatureCopyWithImpl<
          Bolt12ParseError_InvalidSignature>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bolt12ParseError_InvalidSignature &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'Bolt12ParseError.invalidSignature(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $Bolt12ParseError_InvalidSignatureCopyWith<$Res>
    implements $Bolt12ParseErrorCopyWith<$Res> {
  factory $Bolt12ParseError_InvalidSignatureCopyWith(
          Bolt12ParseError_InvalidSignature value,
          $Res Function(Bolt12ParseError_InvalidSignature) _then) =
      _$Bolt12ParseError_InvalidSignatureCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$Bolt12ParseError_InvalidSignatureCopyWithImpl<$Res>
    implements $Bolt12ParseError_InvalidSignatureCopyWith<$Res> {
  _$Bolt12ParseError_InvalidSignatureCopyWithImpl(this._self, this._then);

  final Bolt12ParseError_InvalidSignature _self;
  final $Res Function(Bolt12ParseError_InvalidSignature) _then;

  /// Create a copy of Bolt12ParseError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(Bolt12ParseError_InvalidSignature(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Bolt12ParseError_InvalidLeadingWhitespace extends Bolt12ParseError {
  const Bolt12ParseError_InvalidLeadingWhitespace() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bolt12ParseError_InvalidLeadingWhitespace);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Bolt12ParseError.invalidLeadingWhitespace()';
  }
}

/// @nodoc
mixin _$DecodeError {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DecodeError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DecodeError()';
  }
}

/// @nodoc
class $DecodeErrorCopyWith<$Res> {
  $DecodeErrorCopyWith(DecodeError _, $Res Function(DecodeError) __);
}

/// Adds pattern-matching-related methods to [DecodeError].
extension DecodeErrorPatterns on DecodeError {
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
    TResult Function(DecodeError_UnknownVersion value)? unknownVersion,
    TResult Function(DecodeError_UnknownRequiredFeature value)?
        unknownRequiredFeature,
    TResult Function(DecodeError_InvalidValue value)? invalidValue,
    TResult Function(DecodeError_ShortRead value)? shortRead,
    TResult Function(DecodeError_BadLengthDescriptor value)?
        badLengthDescriptor,
    TResult Function(DecodeError_Io value)? io,
    TResult Function(DecodeError_UnsupportedCompression value)?
        unsupportedCompression,
    TResult Function(DecodeError_DangerousValue value)? dangerousValue,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DecodeError_UnknownVersion() when unknownVersion != null:
        return unknownVersion(_that);
      case DecodeError_UnknownRequiredFeature()
          when unknownRequiredFeature != null:
        return unknownRequiredFeature(_that);
      case DecodeError_InvalidValue() when invalidValue != null:
        return invalidValue(_that);
      case DecodeError_ShortRead() when shortRead != null:
        return shortRead(_that);
      case DecodeError_BadLengthDescriptor() when badLengthDescriptor != null:
        return badLengthDescriptor(_that);
      case DecodeError_Io() when io != null:
        return io(_that);
      case DecodeError_UnsupportedCompression()
          when unsupportedCompression != null:
        return unsupportedCompression(_that);
      case DecodeError_DangerousValue() when dangerousValue != null:
        return dangerousValue(_that);
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
    required TResult Function(DecodeError_UnknownVersion value) unknownVersion,
    required TResult Function(DecodeError_UnknownRequiredFeature value)
        unknownRequiredFeature,
    required TResult Function(DecodeError_InvalidValue value) invalidValue,
    required TResult Function(DecodeError_ShortRead value) shortRead,
    required TResult Function(DecodeError_BadLengthDescriptor value)
        badLengthDescriptor,
    required TResult Function(DecodeError_Io value) io,
    required TResult Function(DecodeError_UnsupportedCompression value)
        unsupportedCompression,
    required TResult Function(DecodeError_DangerousValue value) dangerousValue,
  }) {
    final _that = this;
    switch (_that) {
      case DecodeError_UnknownVersion():
        return unknownVersion(_that);
      case DecodeError_UnknownRequiredFeature():
        return unknownRequiredFeature(_that);
      case DecodeError_InvalidValue():
        return invalidValue(_that);
      case DecodeError_ShortRead():
        return shortRead(_that);
      case DecodeError_BadLengthDescriptor():
        return badLengthDescriptor(_that);
      case DecodeError_Io():
        return io(_that);
      case DecodeError_UnsupportedCompression():
        return unsupportedCompression(_that);
      case DecodeError_DangerousValue():
        return dangerousValue(_that);
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
    TResult? Function(DecodeError_UnknownVersion value)? unknownVersion,
    TResult? Function(DecodeError_UnknownRequiredFeature value)?
        unknownRequiredFeature,
    TResult? Function(DecodeError_InvalidValue value)? invalidValue,
    TResult? Function(DecodeError_ShortRead value)? shortRead,
    TResult? Function(DecodeError_BadLengthDescriptor value)?
        badLengthDescriptor,
    TResult? Function(DecodeError_Io value)? io,
    TResult? Function(DecodeError_UnsupportedCompression value)?
        unsupportedCompression,
    TResult? Function(DecodeError_DangerousValue value)? dangerousValue,
  }) {
    final _that = this;
    switch (_that) {
      case DecodeError_UnknownVersion() when unknownVersion != null:
        return unknownVersion(_that);
      case DecodeError_UnknownRequiredFeature()
          when unknownRequiredFeature != null:
        return unknownRequiredFeature(_that);
      case DecodeError_InvalidValue() when invalidValue != null:
        return invalidValue(_that);
      case DecodeError_ShortRead() when shortRead != null:
        return shortRead(_that);
      case DecodeError_BadLengthDescriptor() when badLengthDescriptor != null:
        return badLengthDescriptor(_that);
      case DecodeError_Io() when io != null:
        return io(_that);
      case DecodeError_UnsupportedCompression()
          when unsupportedCompression != null:
        return unsupportedCompression(_that);
      case DecodeError_DangerousValue() when dangerousValue != null:
        return dangerousValue(_that);
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
    TResult Function()? unknownVersion,
    TResult Function()? unknownRequiredFeature,
    TResult Function()? invalidValue,
    TResult Function()? shortRead,
    TResult Function()? badLengthDescriptor,
    TResult Function(String field0)? io,
    TResult Function()? unsupportedCompression,
    TResult Function()? dangerousValue,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DecodeError_UnknownVersion() when unknownVersion != null:
        return unknownVersion();
      case DecodeError_UnknownRequiredFeature()
          when unknownRequiredFeature != null:
        return unknownRequiredFeature();
      case DecodeError_InvalidValue() when invalidValue != null:
        return invalidValue();
      case DecodeError_ShortRead() when shortRead != null:
        return shortRead();
      case DecodeError_BadLengthDescriptor() when badLengthDescriptor != null:
        return badLengthDescriptor();
      case DecodeError_Io() when io != null:
        return io(_that.field0);
      case DecodeError_UnsupportedCompression()
          when unsupportedCompression != null:
        return unsupportedCompression();
      case DecodeError_DangerousValue() when dangerousValue != null:
        return dangerousValue();
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
    required TResult Function() unknownVersion,
    required TResult Function() unknownRequiredFeature,
    required TResult Function() invalidValue,
    required TResult Function() shortRead,
    required TResult Function() badLengthDescriptor,
    required TResult Function(String field0) io,
    required TResult Function() unsupportedCompression,
    required TResult Function() dangerousValue,
  }) {
    final _that = this;
    switch (_that) {
      case DecodeError_UnknownVersion():
        return unknownVersion();
      case DecodeError_UnknownRequiredFeature():
        return unknownRequiredFeature();
      case DecodeError_InvalidValue():
        return invalidValue();
      case DecodeError_ShortRead():
        return shortRead();
      case DecodeError_BadLengthDescriptor():
        return badLengthDescriptor();
      case DecodeError_Io():
        return io(_that.field0);
      case DecodeError_UnsupportedCompression():
        return unsupportedCompression();
      case DecodeError_DangerousValue():
        return dangerousValue();
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
    TResult? Function()? unknownVersion,
    TResult? Function()? unknownRequiredFeature,
    TResult? Function()? invalidValue,
    TResult? Function()? shortRead,
    TResult? Function()? badLengthDescriptor,
    TResult? Function(String field0)? io,
    TResult? Function()? unsupportedCompression,
    TResult? Function()? dangerousValue,
  }) {
    final _that = this;
    switch (_that) {
      case DecodeError_UnknownVersion() when unknownVersion != null:
        return unknownVersion();
      case DecodeError_UnknownRequiredFeature()
          when unknownRequiredFeature != null:
        return unknownRequiredFeature();
      case DecodeError_InvalidValue() when invalidValue != null:
        return invalidValue();
      case DecodeError_ShortRead() when shortRead != null:
        return shortRead();
      case DecodeError_BadLengthDescriptor() when badLengthDescriptor != null:
        return badLengthDescriptor();
      case DecodeError_Io() when io != null:
        return io(_that.field0);
      case DecodeError_UnsupportedCompression()
          when unsupportedCompression != null:
        return unsupportedCompression();
      case DecodeError_DangerousValue() when dangerousValue != null:
        return dangerousValue();
      case _:
        return null;
    }
  }
}

/// @nodoc

class DecodeError_UnknownVersion extends DecodeError {
  const DecodeError_UnknownVersion() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecodeError_UnknownVersion);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DecodeError.unknownVersion()';
  }
}

/// @nodoc

class DecodeError_UnknownRequiredFeature extends DecodeError {
  const DecodeError_UnknownRequiredFeature() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecodeError_UnknownRequiredFeature);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DecodeError.unknownRequiredFeature()';
  }
}

/// @nodoc

class DecodeError_InvalidValue extends DecodeError {
  const DecodeError_InvalidValue() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DecodeError_InvalidValue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DecodeError.invalidValue()';
  }
}

/// @nodoc

class DecodeError_ShortRead extends DecodeError {
  const DecodeError_ShortRead() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DecodeError_ShortRead);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DecodeError.shortRead()';
  }
}

/// @nodoc

class DecodeError_BadLengthDescriptor extends DecodeError {
  const DecodeError_BadLengthDescriptor() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecodeError_BadLengthDescriptor);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DecodeError.badLengthDescriptor()';
  }
}

/// @nodoc

class DecodeError_Io extends DecodeError {
  const DecodeError_Io(this.field0) : super._();

  final String field0;

  /// Create a copy of DecodeError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DecodeError_IoCopyWith<DecodeError_Io> get copyWith =>
      _$DecodeError_IoCopyWithImpl<DecodeError_Io>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecodeError_Io &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'DecodeError.io(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $DecodeError_IoCopyWith<$Res>
    implements $DecodeErrorCopyWith<$Res> {
  factory $DecodeError_IoCopyWith(
          DecodeError_Io value, $Res Function(DecodeError_Io) _then) =
      _$DecodeError_IoCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$DecodeError_IoCopyWithImpl<$Res>
    implements $DecodeError_IoCopyWith<$Res> {
  _$DecodeError_IoCopyWithImpl(this._self, this._then);

  final DecodeError_Io _self;
  final $Res Function(DecodeError_Io) _then;

  /// Create a copy of DecodeError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(DecodeError_Io(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DecodeError_UnsupportedCompression extends DecodeError {
  const DecodeError_UnsupportedCompression() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecodeError_UnsupportedCompression);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DecodeError.unsupportedCompression()';
  }
}

/// @nodoc

class DecodeError_DangerousValue extends DecodeError {
  const DecodeError_DangerousValue() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecodeError_DangerousValue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DecodeError.dangerousValue()';
  }
}

/// @nodoc
mixin _$FfiNodeError {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FfiNodeError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError()';
  }
}

/// @nodoc
class $FfiNodeErrorCopyWith<$Res> {
  $FfiNodeErrorCopyWith(FfiNodeError _, $Res Function(FfiNodeError) __);
}

/// Adds pattern-matching-related methods to [FfiNodeError].
extension FfiNodeErrorPatterns on FfiNodeError {
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
    TResult Function(FfiNodeError_InvalidTxid value)? invalidTxid,
    TResult Function(FfiNodeError_InvalidBlockHash value)? invalidBlockHash,
    TResult Function(FfiNodeError_AlreadyRunning value)? alreadyRunning,
    TResult Function(FfiNodeError_NotRunning value)? notRunning,
    TResult Function(FfiNodeError_OnchainTxCreationFailed value)?
        onchainTxCreationFailed,
    TResult Function(FfiNodeError_ConnectionFailed value)? connectionFailed,
    TResult Function(FfiNodeError_InvoiceCreationFailed value)?
        invoiceCreationFailed,
    TResult Function(FfiNodeError_PaymentSendingFailed value)?
        paymentSendingFailed,
    TResult Function(FfiNodeError_ProbeSendingFailed value)? probeSendingFailed,
    TResult Function(FfiNodeError_ChannelCreationFailed value)?
        channelCreationFailed,
    TResult Function(FfiNodeError_ChannelClosingFailed value)?
        channelClosingFailed,
    TResult Function(FfiNodeError_ChannelConfigUpdateFailed value)?
        channelConfigUpdateFailed,
    TResult Function(FfiNodeError_PersistenceFailed value)? persistenceFailed,
    TResult Function(FfiNodeError_WalletOperationFailed value)?
        walletOperationFailed,
    TResult Function(FfiNodeError_OnchainTxSigningFailed value)?
        onchainTxSigningFailed,
    TResult Function(FfiNodeError_MessageSigningFailed value)?
        messageSigningFailed,
    TResult Function(FfiNodeError_TxSyncFailed value)? txSyncFailed,
    TResult Function(FfiNodeError_GossipUpdateFailed value)? gossipUpdateFailed,
    TResult Function(FfiNodeError_InvalidAddress value)? invalidAddress,
    TResult Function(FfiNodeError_InvalidSocketAddress value)?
        invalidSocketAddress,
    TResult Function(FfiNodeError_InvalidPublicKey value)? invalidPublicKey,
    TResult Function(FfiNodeError_InvalidSecretKey value)? invalidSecretKey,
    TResult Function(FfiNodeError_InvalidPaymentHash value)? invalidPaymentHash,
    TResult Function(FfiNodeError_InvalidPaymentPreimage value)?
        invalidPaymentPreimage,
    TResult Function(FfiNodeError_InvalidPaymentSecret value)?
        invalidPaymentSecret,
    TResult Function(FfiNodeError_InvalidAmount value)? invalidAmount,
    TResult Function(FfiNodeError_InvalidInvoice value)? invalidInvoice,
    TResult Function(FfiNodeError_InvalidChannelId value)? invalidChannelId,
    TResult Function(FfiNodeError_InvalidNetwork value)? invalidNetwork,
    TResult Function(FfiNodeError_DuplicatePayment value)? duplicatePayment,
    TResult Function(FfiNodeError_InsufficientFunds value)? insufficientFunds,
    TResult Function(FfiNodeError_FeerateEstimationUpdateFailed value)?
        feerateEstimationUpdateFailed,
    TResult Function(FfiNodeError_LiquidityRequestFailed value)?
        liquidityRequestFailed,
    TResult Function(FfiNodeError_LiquiditySourceUnavailable value)?
        liquiditySourceUnavailable,
    TResult Function(FfiNodeError_LiquidityFeeTooHigh value)?
        liquidityFeeTooHigh,
    TResult Function(FfiNodeError_InvalidPaymentId value)? invalidPaymentId,
    TResult Function(FfiNodeError_Decode value)? decode,
    TResult Function(FfiNodeError_Bolt12Parse value)? bolt12Parse,
    TResult Function(FfiNodeError_InvoiceRequestCreationFailed value)?
        invoiceRequestCreationFailed,
    TResult Function(FfiNodeError_OfferCreationFailed value)?
        offerCreationFailed,
    TResult Function(FfiNodeError_RefundCreationFailed value)?
        refundCreationFailed,
    TResult Function(FfiNodeError_FeerateEstimationUpdateTimeout value)?
        feerateEstimationUpdateTimeout,
    TResult Function(FfiNodeError_WalletOperationTimeout value)?
        walletOperationTimeout,
    TResult Function(FfiNodeError_TxSyncTimeout value)? txSyncTimeout,
    TResult Function(FfiNodeError_GossipUpdateTimeout value)?
        gossipUpdateTimeout,
    TResult Function(FfiNodeError_InvalidOfferId value)? invalidOfferId,
    TResult Function(FfiNodeError_InvalidNodeId value)? invalidNodeId,
    TResult Function(FfiNodeError_InvalidOffer value)? invalidOffer,
    TResult Function(FfiNodeError_InvalidRefund value)? invalidRefund,
    TResult Function(FfiNodeError_UnsupportedCurrency value)?
        unsupportedCurrency,
    TResult Function(FfiNodeError_UriParameterParsingFailed value)?
        uriParameterParsingFailed,
    TResult Function(FfiNodeError_InvalidUri value)? invalidUri,
    TResult Function(FfiNodeError_InvalidQuantity value)? invalidQuantity,
    TResult Function(FfiNodeError_InvalidNodeAlias value)? invalidNodeAlias,
    TResult Function(FfiNodeError_InvalidCustomTlvs value)? invalidCustomTlvs,
    TResult Function(FfiNodeError_InvalidDateTime value)? invalidDateTime,
    TResult Function(FfiNodeError_InvalidFeeRate value)? invalidFeeRate,
    TResult Function(FfiNodeError_ChannelSplicingFailed value)?
        channelSplicingFailed,
    TResult Function(FfiNodeError_InvalidBlindedPaths value)?
        invalidBlindedPaths,
    TResult Function(FfiNodeError_AsyncPaymentServicesDisabled value)?
        asyncPaymentServicesDisabled,
    TResult Function(FfiNodeError_CreationError value)? creationError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FfiNodeError_InvalidTxid() when invalidTxid != null:
        return invalidTxid(_that);
      case FfiNodeError_InvalidBlockHash() when invalidBlockHash != null:
        return invalidBlockHash(_that);
      case FfiNodeError_AlreadyRunning() when alreadyRunning != null:
        return alreadyRunning(_that);
      case FfiNodeError_NotRunning() when notRunning != null:
        return notRunning(_that);
      case FfiNodeError_OnchainTxCreationFailed()
          when onchainTxCreationFailed != null:
        return onchainTxCreationFailed(_that);
      case FfiNodeError_ConnectionFailed() when connectionFailed != null:
        return connectionFailed(_that);
      case FfiNodeError_InvoiceCreationFailed()
          when invoiceCreationFailed != null:
        return invoiceCreationFailed(_that);
      case FfiNodeError_PaymentSendingFailed()
          when paymentSendingFailed != null:
        return paymentSendingFailed(_that);
      case FfiNodeError_ProbeSendingFailed() when probeSendingFailed != null:
        return probeSendingFailed(_that);
      case FfiNodeError_ChannelCreationFailed()
          when channelCreationFailed != null:
        return channelCreationFailed(_that);
      case FfiNodeError_ChannelClosingFailed()
          when channelClosingFailed != null:
        return channelClosingFailed(_that);
      case FfiNodeError_ChannelConfigUpdateFailed()
          when channelConfigUpdateFailed != null:
        return channelConfigUpdateFailed(_that);
      case FfiNodeError_PersistenceFailed() when persistenceFailed != null:
        return persistenceFailed(_that);
      case FfiNodeError_WalletOperationFailed()
          when walletOperationFailed != null:
        return walletOperationFailed(_that);
      case FfiNodeError_OnchainTxSigningFailed()
          when onchainTxSigningFailed != null:
        return onchainTxSigningFailed(_that);
      case FfiNodeError_MessageSigningFailed()
          when messageSigningFailed != null:
        return messageSigningFailed(_that);
      case FfiNodeError_TxSyncFailed() when txSyncFailed != null:
        return txSyncFailed(_that);
      case FfiNodeError_GossipUpdateFailed() when gossipUpdateFailed != null:
        return gossipUpdateFailed(_that);
      case FfiNodeError_InvalidAddress() when invalidAddress != null:
        return invalidAddress(_that);
      case FfiNodeError_InvalidSocketAddress()
          when invalidSocketAddress != null:
        return invalidSocketAddress(_that);
      case FfiNodeError_InvalidPublicKey() when invalidPublicKey != null:
        return invalidPublicKey(_that);
      case FfiNodeError_InvalidSecretKey() when invalidSecretKey != null:
        return invalidSecretKey(_that);
      case FfiNodeError_InvalidPaymentHash() when invalidPaymentHash != null:
        return invalidPaymentHash(_that);
      case FfiNodeError_InvalidPaymentPreimage()
          when invalidPaymentPreimage != null:
        return invalidPaymentPreimage(_that);
      case FfiNodeError_InvalidPaymentSecret()
          when invalidPaymentSecret != null:
        return invalidPaymentSecret(_that);
      case FfiNodeError_InvalidAmount() when invalidAmount != null:
        return invalidAmount(_that);
      case FfiNodeError_InvalidInvoice() when invalidInvoice != null:
        return invalidInvoice(_that);
      case FfiNodeError_InvalidChannelId() when invalidChannelId != null:
        return invalidChannelId(_that);
      case FfiNodeError_InvalidNetwork() when invalidNetwork != null:
        return invalidNetwork(_that);
      case FfiNodeError_DuplicatePayment() when duplicatePayment != null:
        return duplicatePayment(_that);
      case FfiNodeError_InsufficientFunds() when insufficientFunds != null:
        return insufficientFunds(_that);
      case FfiNodeError_FeerateEstimationUpdateFailed()
          when feerateEstimationUpdateFailed != null:
        return feerateEstimationUpdateFailed(_that);
      case FfiNodeError_LiquidityRequestFailed()
          when liquidityRequestFailed != null:
        return liquidityRequestFailed(_that);
      case FfiNodeError_LiquiditySourceUnavailable()
          when liquiditySourceUnavailable != null:
        return liquiditySourceUnavailable(_that);
      case FfiNodeError_LiquidityFeeTooHigh() when liquidityFeeTooHigh != null:
        return liquidityFeeTooHigh(_that);
      case FfiNodeError_InvalidPaymentId() when invalidPaymentId != null:
        return invalidPaymentId(_that);
      case FfiNodeError_Decode() when decode != null:
        return decode(_that);
      case FfiNodeError_Bolt12Parse() when bolt12Parse != null:
        return bolt12Parse(_that);
      case FfiNodeError_InvoiceRequestCreationFailed()
          when invoiceRequestCreationFailed != null:
        return invoiceRequestCreationFailed(_that);
      case FfiNodeError_OfferCreationFailed() when offerCreationFailed != null:
        return offerCreationFailed(_that);
      case FfiNodeError_RefundCreationFailed()
          when refundCreationFailed != null:
        return refundCreationFailed(_that);
      case FfiNodeError_FeerateEstimationUpdateTimeout()
          when feerateEstimationUpdateTimeout != null:
        return feerateEstimationUpdateTimeout(_that);
      case FfiNodeError_WalletOperationTimeout()
          when walletOperationTimeout != null:
        return walletOperationTimeout(_that);
      case FfiNodeError_TxSyncTimeout() when txSyncTimeout != null:
        return txSyncTimeout(_that);
      case FfiNodeError_GossipUpdateTimeout() when gossipUpdateTimeout != null:
        return gossipUpdateTimeout(_that);
      case FfiNodeError_InvalidOfferId() when invalidOfferId != null:
        return invalidOfferId(_that);
      case FfiNodeError_InvalidNodeId() when invalidNodeId != null:
        return invalidNodeId(_that);
      case FfiNodeError_InvalidOffer() when invalidOffer != null:
        return invalidOffer(_that);
      case FfiNodeError_InvalidRefund() when invalidRefund != null:
        return invalidRefund(_that);
      case FfiNodeError_UnsupportedCurrency() when unsupportedCurrency != null:
        return unsupportedCurrency(_that);
      case FfiNodeError_UriParameterParsingFailed()
          when uriParameterParsingFailed != null:
        return uriParameterParsingFailed(_that);
      case FfiNodeError_InvalidUri() when invalidUri != null:
        return invalidUri(_that);
      case FfiNodeError_InvalidQuantity() when invalidQuantity != null:
        return invalidQuantity(_that);
      case FfiNodeError_InvalidNodeAlias() when invalidNodeAlias != null:
        return invalidNodeAlias(_that);
      case FfiNodeError_InvalidCustomTlvs() when invalidCustomTlvs != null:
        return invalidCustomTlvs(_that);
      case FfiNodeError_InvalidDateTime() when invalidDateTime != null:
        return invalidDateTime(_that);
      case FfiNodeError_InvalidFeeRate() when invalidFeeRate != null:
        return invalidFeeRate(_that);
      case FfiNodeError_ChannelSplicingFailed()
          when channelSplicingFailed != null:
        return channelSplicingFailed(_that);
      case FfiNodeError_InvalidBlindedPaths() when invalidBlindedPaths != null:
        return invalidBlindedPaths(_that);
      case FfiNodeError_AsyncPaymentServicesDisabled()
          when asyncPaymentServicesDisabled != null:
        return asyncPaymentServicesDisabled(_that);
      case FfiNodeError_CreationError() when creationError != null:
        return creationError(_that);
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
    required TResult Function(FfiNodeError_InvalidTxid value) invalidTxid,
    required TResult Function(FfiNodeError_InvalidBlockHash value)
        invalidBlockHash,
    required TResult Function(FfiNodeError_AlreadyRunning value) alreadyRunning,
    required TResult Function(FfiNodeError_NotRunning value) notRunning,
    required TResult Function(FfiNodeError_OnchainTxCreationFailed value)
        onchainTxCreationFailed,
    required TResult Function(FfiNodeError_ConnectionFailed value)
        connectionFailed,
    required TResult Function(FfiNodeError_InvoiceCreationFailed value)
        invoiceCreationFailed,
    required TResult Function(FfiNodeError_PaymentSendingFailed value)
        paymentSendingFailed,
    required TResult Function(FfiNodeError_ProbeSendingFailed value)
        probeSendingFailed,
    required TResult Function(FfiNodeError_ChannelCreationFailed value)
        channelCreationFailed,
    required TResult Function(FfiNodeError_ChannelClosingFailed value)
        channelClosingFailed,
    required TResult Function(FfiNodeError_ChannelConfigUpdateFailed value)
        channelConfigUpdateFailed,
    required TResult Function(FfiNodeError_PersistenceFailed value)
        persistenceFailed,
    required TResult Function(FfiNodeError_WalletOperationFailed value)
        walletOperationFailed,
    required TResult Function(FfiNodeError_OnchainTxSigningFailed value)
        onchainTxSigningFailed,
    required TResult Function(FfiNodeError_MessageSigningFailed value)
        messageSigningFailed,
    required TResult Function(FfiNodeError_TxSyncFailed value) txSyncFailed,
    required TResult Function(FfiNodeError_GossipUpdateFailed value)
        gossipUpdateFailed,
    required TResult Function(FfiNodeError_InvalidAddress value) invalidAddress,
    required TResult Function(FfiNodeError_InvalidSocketAddress value)
        invalidSocketAddress,
    required TResult Function(FfiNodeError_InvalidPublicKey value)
        invalidPublicKey,
    required TResult Function(FfiNodeError_InvalidSecretKey value)
        invalidSecretKey,
    required TResult Function(FfiNodeError_InvalidPaymentHash value)
        invalidPaymentHash,
    required TResult Function(FfiNodeError_InvalidPaymentPreimage value)
        invalidPaymentPreimage,
    required TResult Function(FfiNodeError_InvalidPaymentSecret value)
        invalidPaymentSecret,
    required TResult Function(FfiNodeError_InvalidAmount value) invalidAmount,
    required TResult Function(FfiNodeError_InvalidInvoice value) invalidInvoice,
    required TResult Function(FfiNodeError_InvalidChannelId value)
        invalidChannelId,
    required TResult Function(FfiNodeError_InvalidNetwork value) invalidNetwork,
    required TResult Function(FfiNodeError_DuplicatePayment value)
        duplicatePayment,
    required TResult Function(FfiNodeError_InsufficientFunds value)
        insufficientFunds,
    required TResult Function(FfiNodeError_FeerateEstimationUpdateFailed value)
        feerateEstimationUpdateFailed,
    required TResult Function(FfiNodeError_LiquidityRequestFailed value)
        liquidityRequestFailed,
    required TResult Function(FfiNodeError_LiquiditySourceUnavailable value)
        liquiditySourceUnavailable,
    required TResult Function(FfiNodeError_LiquidityFeeTooHigh value)
        liquidityFeeTooHigh,
    required TResult Function(FfiNodeError_InvalidPaymentId value)
        invalidPaymentId,
    required TResult Function(FfiNodeError_Decode value) decode,
    required TResult Function(FfiNodeError_Bolt12Parse value) bolt12Parse,
    required TResult Function(FfiNodeError_InvoiceRequestCreationFailed value)
        invoiceRequestCreationFailed,
    required TResult Function(FfiNodeError_OfferCreationFailed value)
        offerCreationFailed,
    required TResult Function(FfiNodeError_RefundCreationFailed value)
        refundCreationFailed,
    required TResult Function(FfiNodeError_FeerateEstimationUpdateTimeout value)
        feerateEstimationUpdateTimeout,
    required TResult Function(FfiNodeError_WalletOperationTimeout value)
        walletOperationTimeout,
    required TResult Function(FfiNodeError_TxSyncTimeout value) txSyncTimeout,
    required TResult Function(FfiNodeError_GossipUpdateTimeout value)
        gossipUpdateTimeout,
    required TResult Function(FfiNodeError_InvalidOfferId value) invalidOfferId,
    required TResult Function(FfiNodeError_InvalidNodeId value) invalidNodeId,
    required TResult Function(FfiNodeError_InvalidOffer value) invalidOffer,
    required TResult Function(FfiNodeError_InvalidRefund value) invalidRefund,
    required TResult Function(FfiNodeError_UnsupportedCurrency value)
        unsupportedCurrency,
    required TResult Function(FfiNodeError_UriParameterParsingFailed value)
        uriParameterParsingFailed,
    required TResult Function(FfiNodeError_InvalidUri value) invalidUri,
    required TResult Function(FfiNodeError_InvalidQuantity value)
        invalidQuantity,
    required TResult Function(FfiNodeError_InvalidNodeAlias value)
        invalidNodeAlias,
    required TResult Function(FfiNodeError_InvalidCustomTlvs value)
        invalidCustomTlvs,
    required TResult Function(FfiNodeError_InvalidDateTime value)
        invalidDateTime,
    required TResult Function(FfiNodeError_InvalidFeeRate value) invalidFeeRate,
    required TResult Function(FfiNodeError_ChannelSplicingFailed value)
        channelSplicingFailed,
    required TResult Function(FfiNodeError_InvalidBlindedPaths value)
        invalidBlindedPaths,
    required TResult Function(FfiNodeError_AsyncPaymentServicesDisabled value)
        asyncPaymentServicesDisabled,
    required TResult Function(FfiNodeError_CreationError value) creationError,
  }) {
    final _that = this;
    switch (_that) {
      case FfiNodeError_InvalidTxid():
        return invalidTxid(_that);
      case FfiNodeError_InvalidBlockHash():
        return invalidBlockHash(_that);
      case FfiNodeError_AlreadyRunning():
        return alreadyRunning(_that);
      case FfiNodeError_NotRunning():
        return notRunning(_that);
      case FfiNodeError_OnchainTxCreationFailed():
        return onchainTxCreationFailed(_that);
      case FfiNodeError_ConnectionFailed():
        return connectionFailed(_that);
      case FfiNodeError_InvoiceCreationFailed():
        return invoiceCreationFailed(_that);
      case FfiNodeError_PaymentSendingFailed():
        return paymentSendingFailed(_that);
      case FfiNodeError_ProbeSendingFailed():
        return probeSendingFailed(_that);
      case FfiNodeError_ChannelCreationFailed():
        return channelCreationFailed(_that);
      case FfiNodeError_ChannelClosingFailed():
        return channelClosingFailed(_that);
      case FfiNodeError_ChannelConfigUpdateFailed():
        return channelConfigUpdateFailed(_that);
      case FfiNodeError_PersistenceFailed():
        return persistenceFailed(_that);
      case FfiNodeError_WalletOperationFailed():
        return walletOperationFailed(_that);
      case FfiNodeError_OnchainTxSigningFailed():
        return onchainTxSigningFailed(_that);
      case FfiNodeError_MessageSigningFailed():
        return messageSigningFailed(_that);
      case FfiNodeError_TxSyncFailed():
        return txSyncFailed(_that);
      case FfiNodeError_GossipUpdateFailed():
        return gossipUpdateFailed(_that);
      case FfiNodeError_InvalidAddress():
        return invalidAddress(_that);
      case FfiNodeError_InvalidSocketAddress():
        return invalidSocketAddress(_that);
      case FfiNodeError_InvalidPublicKey():
        return invalidPublicKey(_that);
      case FfiNodeError_InvalidSecretKey():
        return invalidSecretKey(_that);
      case FfiNodeError_InvalidPaymentHash():
        return invalidPaymentHash(_that);
      case FfiNodeError_InvalidPaymentPreimage():
        return invalidPaymentPreimage(_that);
      case FfiNodeError_InvalidPaymentSecret():
        return invalidPaymentSecret(_that);
      case FfiNodeError_InvalidAmount():
        return invalidAmount(_that);
      case FfiNodeError_InvalidInvoice():
        return invalidInvoice(_that);
      case FfiNodeError_InvalidChannelId():
        return invalidChannelId(_that);
      case FfiNodeError_InvalidNetwork():
        return invalidNetwork(_that);
      case FfiNodeError_DuplicatePayment():
        return duplicatePayment(_that);
      case FfiNodeError_InsufficientFunds():
        return insufficientFunds(_that);
      case FfiNodeError_FeerateEstimationUpdateFailed():
        return feerateEstimationUpdateFailed(_that);
      case FfiNodeError_LiquidityRequestFailed():
        return liquidityRequestFailed(_that);
      case FfiNodeError_LiquiditySourceUnavailable():
        return liquiditySourceUnavailable(_that);
      case FfiNodeError_LiquidityFeeTooHigh():
        return liquidityFeeTooHigh(_that);
      case FfiNodeError_InvalidPaymentId():
        return invalidPaymentId(_that);
      case FfiNodeError_Decode():
        return decode(_that);
      case FfiNodeError_Bolt12Parse():
        return bolt12Parse(_that);
      case FfiNodeError_InvoiceRequestCreationFailed():
        return invoiceRequestCreationFailed(_that);
      case FfiNodeError_OfferCreationFailed():
        return offerCreationFailed(_that);
      case FfiNodeError_RefundCreationFailed():
        return refundCreationFailed(_that);
      case FfiNodeError_FeerateEstimationUpdateTimeout():
        return feerateEstimationUpdateTimeout(_that);
      case FfiNodeError_WalletOperationTimeout():
        return walletOperationTimeout(_that);
      case FfiNodeError_TxSyncTimeout():
        return txSyncTimeout(_that);
      case FfiNodeError_GossipUpdateTimeout():
        return gossipUpdateTimeout(_that);
      case FfiNodeError_InvalidOfferId():
        return invalidOfferId(_that);
      case FfiNodeError_InvalidNodeId():
        return invalidNodeId(_that);
      case FfiNodeError_InvalidOffer():
        return invalidOffer(_that);
      case FfiNodeError_InvalidRefund():
        return invalidRefund(_that);
      case FfiNodeError_UnsupportedCurrency():
        return unsupportedCurrency(_that);
      case FfiNodeError_UriParameterParsingFailed():
        return uriParameterParsingFailed(_that);
      case FfiNodeError_InvalidUri():
        return invalidUri(_that);
      case FfiNodeError_InvalidQuantity():
        return invalidQuantity(_that);
      case FfiNodeError_InvalidNodeAlias():
        return invalidNodeAlias(_that);
      case FfiNodeError_InvalidCustomTlvs():
        return invalidCustomTlvs(_that);
      case FfiNodeError_InvalidDateTime():
        return invalidDateTime(_that);
      case FfiNodeError_InvalidFeeRate():
        return invalidFeeRate(_that);
      case FfiNodeError_ChannelSplicingFailed():
        return channelSplicingFailed(_that);
      case FfiNodeError_InvalidBlindedPaths():
        return invalidBlindedPaths(_that);
      case FfiNodeError_AsyncPaymentServicesDisabled():
        return asyncPaymentServicesDisabled(_that);
      case FfiNodeError_CreationError():
        return creationError(_that);
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
    TResult? Function(FfiNodeError_InvalidTxid value)? invalidTxid,
    TResult? Function(FfiNodeError_InvalidBlockHash value)? invalidBlockHash,
    TResult? Function(FfiNodeError_AlreadyRunning value)? alreadyRunning,
    TResult? Function(FfiNodeError_NotRunning value)? notRunning,
    TResult? Function(FfiNodeError_OnchainTxCreationFailed value)?
        onchainTxCreationFailed,
    TResult? Function(FfiNodeError_ConnectionFailed value)? connectionFailed,
    TResult? Function(FfiNodeError_InvoiceCreationFailed value)?
        invoiceCreationFailed,
    TResult? Function(FfiNodeError_PaymentSendingFailed value)?
        paymentSendingFailed,
    TResult? Function(FfiNodeError_ProbeSendingFailed value)?
        probeSendingFailed,
    TResult? Function(FfiNodeError_ChannelCreationFailed value)?
        channelCreationFailed,
    TResult? Function(FfiNodeError_ChannelClosingFailed value)?
        channelClosingFailed,
    TResult? Function(FfiNodeError_ChannelConfigUpdateFailed value)?
        channelConfigUpdateFailed,
    TResult? Function(FfiNodeError_PersistenceFailed value)? persistenceFailed,
    TResult? Function(FfiNodeError_WalletOperationFailed value)?
        walletOperationFailed,
    TResult? Function(FfiNodeError_OnchainTxSigningFailed value)?
        onchainTxSigningFailed,
    TResult? Function(FfiNodeError_MessageSigningFailed value)?
        messageSigningFailed,
    TResult? Function(FfiNodeError_TxSyncFailed value)? txSyncFailed,
    TResult? Function(FfiNodeError_GossipUpdateFailed value)?
        gossipUpdateFailed,
    TResult? Function(FfiNodeError_InvalidAddress value)? invalidAddress,
    TResult? Function(FfiNodeError_InvalidSocketAddress value)?
        invalidSocketAddress,
    TResult? Function(FfiNodeError_InvalidPublicKey value)? invalidPublicKey,
    TResult? Function(FfiNodeError_InvalidSecretKey value)? invalidSecretKey,
    TResult? Function(FfiNodeError_InvalidPaymentHash value)?
        invalidPaymentHash,
    TResult? Function(FfiNodeError_InvalidPaymentPreimage value)?
        invalidPaymentPreimage,
    TResult? Function(FfiNodeError_InvalidPaymentSecret value)?
        invalidPaymentSecret,
    TResult? Function(FfiNodeError_InvalidAmount value)? invalidAmount,
    TResult? Function(FfiNodeError_InvalidInvoice value)? invalidInvoice,
    TResult? Function(FfiNodeError_InvalidChannelId value)? invalidChannelId,
    TResult? Function(FfiNodeError_InvalidNetwork value)? invalidNetwork,
    TResult? Function(FfiNodeError_DuplicatePayment value)? duplicatePayment,
    TResult? Function(FfiNodeError_InsufficientFunds value)? insufficientFunds,
    TResult? Function(FfiNodeError_FeerateEstimationUpdateFailed value)?
        feerateEstimationUpdateFailed,
    TResult? Function(FfiNodeError_LiquidityRequestFailed value)?
        liquidityRequestFailed,
    TResult? Function(FfiNodeError_LiquiditySourceUnavailable value)?
        liquiditySourceUnavailable,
    TResult? Function(FfiNodeError_LiquidityFeeTooHigh value)?
        liquidityFeeTooHigh,
    TResult? Function(FfiNodeError_InvalidPaymentId value)? invalidPaymentId,
    TResult? Function(FfiNodeError_Decode value)? decode,
    TResult? Function(FfiNodeError_Bolt12Parse value)? bolt12Parse,
    TResult? Function(FfiNodeError_InvoiceRequestCreationFailed value)?
        invoiceRequestCreationFailed,
    TResult? Function(FfiNodeError_OfferCreationFailed value)?
        offerCreationFailed,
    TResult? Function(FfiNodeError_RefundCreationFailed value)?
        refundCreationFailed,
    TResult? Function(FfiNodeError_FeerateEstimationUpdateTimeout value)?
        feerateEstimationUpdateTimeout,
    TResult? Function(FfiNodeError_WalletOperationTimeout value)?
        walletOperationTimeout,
    TResult? Function(FfiNodeError_TxSyncTimeout value)? txSyncTimeout,
    TResult? Function(FfiNodeError_GossipUpdateTimeout value)?
        gossipUpdateTimeout,
    TResult? Function(FfiNodeError_InvalidOfferId value)? invalidOfferId,
    TResult? Function(FfiNodeError_InvalidNodeId value)? invalidNodeId,
    TResult? Function(FfiNodeError_InvalidOffer value)? invalidOffer,
    TResult? Function(FfiNodeError_InvalidRefund value)? invalidRefund,
    TResult? Function(FfiNodeError_UnsupportedCurrency value)?
        unsupportedCurrency,
    TResult? Function(FfiNodeError_UriParameterParsingFailed value)?
        uriParameterParsingFailed,
    TResult? Function(FfiNodeError_InvalidUri value)? invalidUri,
    TResult? Function(FfiNodeError_InvalidQuantity value)? invalidQuantity,
    TResult? Function(FfiNodeError_InvalidNodeAlias value)? invalidNodeAlias,
    TResult? Function(FfiNodeError_InvalidCustomTlvs value)? invalidCustomTlvs,
    TResult? Function(FfiNodeError_InvalidDateTime value)? invalidDateTime,
    TResult? Function(FfiNodeError_InvalidFeeRate value)? invalidFeeRate,
    TResult? Function(FfiNodeError_ChannelSplicingFailed value)?
        channelSplicingFailed,
    TResult? Function(FfiNodeError_InvalidBlindedPaths value)?
        invalidBlindedPaths,
    TResult? Function(FfiNodeError_AsyncPaymentServicesDisabled value)?
        asyncPaymentServicesDisabled,
    TResult? Function(FfiNodeError_CreationError value)? creationError,
  }) {
    final _that = this;
    switch (_that) {
      case FfiNodeError_InvalidTxid() when invalidTxid != null:
        return invalidTxid(_that);
      case FfiNodeError_InvalidBlockHash() when invalidBlockHash != null:
        return invalidBlockHash(_that);
      case FfiNodeError_AlreadyRunning() when alreadyRunning != null:
        return alreadyRunning(_that);
      case FfiNodeError_NotRunning() when notRunning != null:
        return notRunning(_that);
      case FfiNodeError_OnchainTxCreationFailed()
          when onchainTxCreationFailed != null:
        return onchainTxCreationFailed(_that);
      case FfiNodeError_ConnectionFailed() when connectionFailed != null:
        return connectionFailed(_that);
      case FfiNodeError_InvoiceCreationFailed()
          when invoiceCreationFailed != null:
        return invoiceCreationFailed(_that);
      case FfiNodeError_PaymentSendingFailed()
          when paymentSendingFailed != null:
        return paymentSendingFailed(_that);
      case FfiNodeError_ProbeSendingFailed() when probeSendingFailed != null:
        return probeSendingFailed(_that);
      case FfiNodeError_ChannelCreationFailed()
          when channelCreationFailed != null:
        return channelCreationFailed(_that);
      case FfiNodeError_ChannelClosingFailed()
          when channelClosingFailed != null:
        return channelClosingFailed(_that);
      case FfiNodeError_ChannelConfigUpdateFailed()
          when channelConfigUpdateFailed != null:
        return channelConfigUpdateFailed(_that);
      case FfiNodeError_PersistenceFailed() when persistenceFailed != null:
        return persistenceFailed(_that);
      case FfiNodeError_WalletOperationFailed()
          when walletOperationFailed != null:
        return walletOperationFailed(_that);
      case FfiNodeError_OnchainTxSigningFailed()
          when onchainTxSigningFailed != null:
        return onchainTxSigningFailed(_that);
      case FfiNodeError_MessageSigningFailed()
          when messageSigningFailed != null:
        return messageSigningFailed(_that);
      case FfiNodeError_TxSyncFailed() when txSyncFailed != null:
        return txSyncFailed(_that);
      case FfiNodeError_GossipUpdateFailed() when gossipUpdateFailed != null:
        return gossipUpdateFailed(_that);
      case FfiNodeError_InvalidAddress() when invalidAddress != null:
        return invalidAddress(_that);
      case FfiNodeError_InvalidSocketAddress()
          when invalidSocketAddress != null:
        return invalidSocketAddress(_that);
      case FfiNodeError_InvalidPublicKey() when invalidPublicKey != null:
        return invalidPublicKey(_that);
      case FfiNodeError_InvalidSecretKey() when invalidSecretKey != null:
        return invalidSecretKey(_that);
      case FfiNodeError_InvalidPaymentHash() when invalidPaymentHash != null:
        return invalidPaymentHash(_that);
      case FfiNodeError_InvalidPaymentPreimage()
          when invalidPaymentPreimage != null:
        return invalidPaymentPreimage(_that);
      case FfiNodeError_InvalidPaymentSecret()
          when invalidPaymentSecret != null:
        return invalidPaymentSecret(_that);
      case FfiNodeError_InvalidAmount() when invalidAmount != null:
        return invalidAmount(_that);
      case FfiNodeError_InvalidInvoice() when invalidInvoice != null:
        return invalidInvoice(_that);
      case FfiNodeError_InvalidChannelId() when invalidChannelId != null:
        return invalidChannelId(_that);
      case FfiNodeError_InvalidNetwork() when invalidNetwork != null:
        return invalidNetwork(_that);
      case FfiNodeError_DuplicatePayment() when duplicatePayment != null:
        return duplicatePayment(_that);
      case FfiNodeError_InsufficientFunds() when insufficientFunds != null:
        return insufficientFunds(_that);
      case FfiNodeError_FeerateEstimationUpdateFailed()
          when feerateEstimationUpdateFailed != null:
        return feerateEstimationUpdateFailed(_that);
      case FfiNodeError_LiquidityRequestFailed()
          when liquidityRequestFailed != null:
        return liquidityRequestFailed(_that);
      case FfiNodeError_LiquiditySourceUnavailable()
          when liquiditySourceUnavailable != null:
        return liquiditySourceUnavailable(_that);
      case FfiNodeError_LiquidityFeeTooHigh() when liquidityFeeTooHigh != null:
        return liquidityFeeTooHigh(_that);
      case FfiNodeError_InvalidPaymentId() when invalidPaymentId != null:
        return invalidPaymentId(_that);
      case FfiNodeError_Decode() when decode != null:
        return decode(_that);
      case FfiNodeError_Bolt12Parse() when bolt12Parse != null:
        return bolt12Parse(_that);
      case FfiNodeError_InvoiceRequestCreationFailed()
          when invoiceRequestCreationFailed != null:
        return invoiceRequestCreationFailed(_that);
      case FfiNodeError_OfferCreationFailed() when offerCreationFailed != null:
        return offerCreationFailed(_that);
      case FfiNodeError_RefundCreationFailed()
          when refundCreationFailed != null:
        return refundCreationFailed(_that);
      case FfiNodeError_FeerateEstimationUpdateTimeout()
          when feerateEstimationUpdateTimeout != null:
        return feerateEstimationUpdateTimeout(_that);
      case FfiNodeError_WalletOperationTimeout()
          when walletOperationTimeout != null:
        return walletOperationTimeout(_that);
      case FfiNodeError_TxSyncTimeout() when txSyncTimeout != null:
        return txSyncTimeout(_that);
      case FfiNodeError_GossipUpdateTimeout() when gossipUpdateTimeout != null:
        return gossipUpdateTimeout(_that);
      case FfiNodeError_InvalidOfferId() when invalidOfferId != null:
        return invalidOfferId(_that);
      case FfiNodeError_InvalidNodeId() when invalidNodeId != null:
        return invalidNodeId(_that);
      case FfiNodeError_InvalidOffer() when invalidOffer != null:
        return invalidOffer(_that);
      case FfiNodeError_InvalidRefund() when invalidRefund != null:
        return invalidRefund(_that);
      case FfiNodeError_UnsupportedCurrency() when unsupportedCurrency != null:
        return unsupportedCurrency(_that);
      case FfiNodeError_UriParameterParsingFailed()
          when uriParameterParsingFailed != null:
        return uriParameterParsingFailed(_that);
      case FfiNodeError_InvalidUri() when invalidUri != null:
        return invalidUri(_that);
      case FfiNodeError_InvalidQuantity() when invalidQuantity != null:
        return invalidQuantity(_that);
      case FfiNodeError_InvalidNodeAlias() when invalidNodeAlias != null:
        return invalidNodeAlias(_that);
      case FfiNodeError_InvalidCustomTlvs() when invalidCustomTlvs != null:
        return invalidCustomTlvs(_that);
      case FfiNodeError_InvalidDateTime() when invalidDateTime != null:
        return invalidDateTime(_that);
      case FfiNodeError_InvalidFeeRate() when invalidFeeRate != null:
        return invalidFeeRate(_that);
      case FfiNodeError_ChannelSplicingFailed()
          when channelSplicingFailed != null:
        return channelSplicingFailed(_that);
      case FfiNodeError_InvalidBlindedPaths() when invalidBlindedPaths != null:
        return invalidBlindedPaths(_that);
      case FfiNodeError_AsyncPaymentServicesDisabled()
          when asyncPaymentServicesDisabled != null:
        return asyncPaymentServicesDisabled(_that);
      case FfiNodeError_CreationError() when creationError != null:
        return creationError(_that);
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
    TResult Function()? invalidTxid,
    TResult Function()? invalidBlockHash,
    TResult Function()? alreadyRunning,
    TResult Function()? notRunning,
    TResult Function()? onchainTxCreationFailed,
    TResult Function()? connectionFailed,
    TResult Function()? invoiceCreationFailed,
    TResult Function()? paymentSendingFailed,
    TResult Function()? probeSendingFailed,
    TResult Function()? channelCreationFailed,
    TResult Function()? channelClosingFailed,
    TResult Function()? channelConfigUpdateFailed,
    TResult Function()? persistenceFailed,
    TResult Function()? walletOperationFailed,
    TResult Function()? onchainTxSigningFailed,
    TResult Function()? messageSigningFailed,
    TResult Function()? txSyncFailed,
    TResult Function()? gossipUpdateFailed,
    TResult Function()? invalidAddress,
    TResult Function()? invalidSocketAddress,
    TResult Function()? invalidPublicKey,
    TResult Function()? invalidSecretKey,
    TResult Function()? invalidPaymentHash,
    TResult Function()? invalidPaymentPreimage,
    TResult Function()? invalidPaymentSecret,
    TResult Function()? invalidAmount,
    TResult Function()? invalidInvoice,
    TResult Function()? invalidChannelId,
    TResult Function()? invalidNetwork,
    TResult Function()? duplicatePayment,
    TResult Function()? insufficientFunds,
    TResult Function()? feerateEstimationUpdateFailed,
    TResult Function()? liquidityRequestFailed,
    TResult Function()? liquiditySourceUnavailable,
    TResult Function()? liquidityFeeTooHigh,
    TResult Function()? invalidPaymentId,
    TResult Function(DecodeError field0)? decode,
    TResult Function(Bolt12ParseError field0)? bolt12Parse,
    TResult Function()? invoiceRequestCreationFailed,
    TResult Function()? offerCreationFailed,
    TResult Function()? refundCreationFailed,
    TResult Function()? feerateEstimationUpdateTimeout,
    TResult Function()? walletOperationTimeout,
    TResult Function()? txSyncTimeout,
    TResult Function()? gossipUpdateTimeout,
    TResult Function()? invalidOfferId,
    TResult Function()? invalidNodeId,
    TResult Function()? invalidOffer,
    TResult Function()? invalidRefund,
    TResult Function()? unsupportedCurrency,
    TResult Function()? uriParameterParsingFailed,
    TResult Function()? invalidUri,
    TResult Function()? invalidQuantity,
    TResult Function()? invalidNodeAlias,
    TResult Function()? invalidCustomTlvs,
    TResult Function()? invalidDateTime,
    TResult Function()? invalidFeeRate,
    TResult Function()? channelSplicingFailed,
    TResult Function()? invalidBlindedPaths,
    TResult Function()? asyncPaymentServicesDisabled,
    TResult Function(FfiCreationError field0)? creationError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case FfiNodeError_InvalidTxid() when invalidTxid != null:
        return invalidTxid();
      case FfiNodeError_InvalidBlockHash() when invalidBlockHash != null:
        return invalidBlockHash();
      case FfiNodeError_AlreadyRunning() when alreadyRunning != null:
        return alreadyRunning();
      case FfiNodeError_NotRunning() when notRunning != null:
        return notRunning();
      case FfiNodeError_OnchainTxCreationFailed()
          when onchainTxCreationFailed != null:
        return onchainTxCreationFailed();
      case FfiNodeError_ConnectionFailed() when connectionFailed != null:
        return connectionFailed();
      case FfiNodeError_InvoiceCreationFailed()
          when invoiceCreationFailed != null:
        return invoiceCreationFailed();
      case FfiNodeError_PaymentSendingFailed()
          when paymentSendingFailed != null:
        return paymentSendingFailed();
      case FfiNodeError_ProbeSendingFailed() when probeSendingFailed != null:
        return probeSendingFailed();
      case FfiNodeError_ChannelCreationFailed()
          when channelCreationFailed != null:
        return channelCreationFailed();
      case FfiNodeError_ChannelClosingFailed()
          when channelClosingFailed != null:
        return channelClosingFailed();
      case FfiNodeError_ChannelConfigUpdateFailed()
          when channelConfigUpdateFailed != null:
        return channelConfigUpdateFailed();
      case FfiNodeError_PersistenceFailed() when persistenceFailed != null:
        return persistenceFailed();
      case FfiNodeError_WalletOperationFailed()
          when walletOperationFailed != null:
        return walletOperationFailed();
      case FfiNodeError_OnchainTxSigningFailed()
          when onchainTxSigningFailed != null:
        return onchainTxSigningFailed();
      case FfiNodeError_MessageSigningFailed()
          when messageSigningFailed != null:
        return messageSigningFailed();
      case FfiNodeError_TxSyncFailed() when txSyncFailed != null:
        return txSyncFailed();
      case FfiNodeError_GossipUpdateFailed() when gossipUpdateFailed != null:
        return gossipUpdateFailed();
      case FfiNodeError_InvalidAddress() when invalidAddress != null:
        return invalidAddress();
      case FfiNodeError_InvalidSocketAddress()
          when invalidSocketAddress != null:
        return invalidSocketAddress();
      case FfiNodeError_InvalidPublicKey() when invalidPublicKey != null:
        return invalidPublicKey();
      case FfiNodeError_InvalidSecretKey() when invalidSecretKey != null:
        return invalidSecretKey();
      case FfiNodeError_InvalidPaymentHash() when invalidPaymentHash != null:
        return invalidPaymentHash();
      case FfiNodeError_InvalidPaymentPreimage()
          when invalidPaymentPreimage != null:
        return invalidPaymentPreimage();
      case FfiNodeError_InvalidPaymentSecret()
          when invalidPaymentSecret != null:
        return invalidPaymentSecret();
      case FfiNodeError_InvalidAmount() when invalidAmount != null:
        return invalidAmount();
      case FfiNodeError_InvalidInvoice() when invalidInvoice != null:
        return invalidInvoice();
      case FfiNodeError_InvalidChannelId() when invalidChannelId != null:
        return invalidChannelId();
      case FfiNodeError_InvalidNetwork() when invalidNetwork != null:
        return invalidNetwork();
      case FfiNodeError_DuplicatePayment() when duplicatePayment != null:
        return duplicatePayment();
      case FfiNodeError_InsufficientFunds() when insufficientFunds != null:
        return insufficientFunds();
      case FfiNodeError_FeerateEstimationUpdateFailed()
          when feerateEstimationUpdateFailed != null:
        return feerateEstimationUpdateFailed();
      case FfiNodeError_LiquidityRequestFailed()
          when liquidityRequestFailed != null:
        return liquidityRequestFailed();
      case FfiNodeError_LiquiditySourceUnavailable()
          when liquiditySourceUnavailable != null:
        return liquiditySourceUnavailable();
      case FfiNodeError_LiquidityFeeTooHigh() when liquidityFeeTooHigh != null:
        return liquidityFeeTooHigh();
      case FfiNodeError_InvalidPaymentId() when invalidPaymentId != null:
        return invalidPaymentId();
      case FfiNodeError_Decode() when decode != null:
        return decode(_that.field0);
      case FfiNodeError_Bolt12Parse() when bolt12Parse != null:
        return bolt12Parse(_that.field0);
      case FfiNodeError_InvoiceRequestCreationFailed()
          when invoiceRequestCreationFailed != null:
        return invoiceRequestCreationFailed();
      case FfiNodeError_OfferCreationFailed() when offerCreationFailed != null:
        return offerCreationFailed();
      case FfiNodeError_RefundCreationFailed()
          when refundCreationFailed != null:
        return refundCreationFailed();
      case FfiNodeError_FeerateEstimationUpdateTimeout()
          when feerateEstimationUpdateTimeout != null:
        return feerateEstimationUpdateTimeout();
      case FfiNodeError_WalletOperationTimeout()
          when walletOperationTimeout != null:
        return walletOperationTimeout();
      case FfiNodeError_TxSyncTimeout() when txSyncTimeout != null:
        return txSyncTimeout();
      case FfiNodeError_GossipUpdateTimeout() when gossipUpdateTimeout != null:
        return gossipUpdateTimeout();
      case FfiNodeError_InvalidOfferId() when invalidOfferId != null:
        return invalidOfferId();
      case FfiNodeError_InvalidNodeId() when invalidNodeId != null:
        return invalidNodeId();
      case FfiNodeError_InvalidOffer() when invalidOffer != null:
        return invalidOffer();
      case FfiNodeError_InvalidRefund() when invalidRefund != null:
        return invalidRefund();
      case FfiNodeError_UnsupportedCurrency() when unsupportedCurrency != null:
        return unsupportedCurrency();
      case FfiNodeError_UriParameterParsingFailed()
          when uriParameterParsingFailed != null:
        return uriParameterParsingFailed();
      case FfiNodeError_InvalidUri() when invalidUri != null:
        return invalidUri();
      case FfiNodeError_InvalidQuantity() when invalidQuantity != null:
        return invalidQuantity();
      case FfiNodeError_InvalidNodeAlias() when invalidNodeAlias != null:
        return invalidNodeAlias();
      case FfiNodeError_InvalidCustomTlvs() when invalidCustomTlvs != null:
        return invalidCustomTlvs();
      case FfiNodeError_InvalidDateTime() when invalidDateTime != null:
        return invalidDateTime();
      case FfiNodeError_InvalidFeeRate() when invalidFeeRate != null:
        return invalidFeeRate();
      case FfiNodeError_ChannelSplicingFailed()
          when channelSplicingFailed != null:
        return channelSplicingFailed();
      case FfiNodeError_InvalidBlindedPaths() when invalidBlindedPaths != null:
        return invalidBlindedPaths();
      case FfiNodeError_AsyncPaymentServicesDisabled()
          when asyncPaymentServicesDisabled != null:
        return asyncPaymentServicesDisabled();
      case FfiNodeError_CreationError() when creationError != null:
        return creationError(_that.field0);
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
    required TResult Function() invalidTxid,
    required TResult Function() invalidBlockHash,
    required TResult Function() alreadyRunning,
    required TResult Function() notRunning,
    required TResult Function() onchainTxCreationFailed,
    required TResult Function() connectionFailed,
    required TResult Function() invoiceCreationFailed,
    required TResult Function() paymentSendingFailed,
    required TResult Function() probeSendingFailed,
    required TResult Function() channelCreationFailed,
    required TResult Function() channelClosingFailed,
    required TResult Function() channelConfigUpdateFailed,
    required TResult Function() persistenceFailed,
    required TResult Function() walletOperationFailed,
    required TResult Function() onchainTxSigningFailed,
    required TResult Function() messageSigningFailed,
    required TResult Function() txSyncFailed,
    required TResult Function() gossipUpdateFailed,
    required TResult Function() invalidAddress,
    required TResult Function() invalidSocketAddress,
    required TResult Function() invalidPublicKey,
    required TResult Function() invalidSecretKey,
    required TResult Function() invalidPaymentHash,
    required TResult Function() invalidPaymentPreimage,
    required TResult Function() invalidPaymentSecret,
    required TResult Function() invalidAmount,
    required TResult Function() invalidInvoice,
    required TResult Function() invalidChannelId,
    required TResult Function() invalidNetwork,
    required TResult Function() duplicatePayment,
    required TResult Function() insufficientFunds,
    required TResult Function() feerateEstimationUpdateFailed,
    required TResult Function() liquidityRequestFailed,
    required TResult Function() liquiditySourceUnavailable,
    required TResult Function() liquidityFeeTooHigh,
    required TResult Function() invalidPaymentId,
    required TResult Function(DecodeError field0) decode,
    required TResult Function(Bolt12ParseError field0) bolt12Parse,
    required TResult Function() invoiceRequestCreationFailed,
    required TResult Function() offerCreationFailed,
    required TResult Function() refundCreationFailed,
    required TResult Function() feerateEstimationUpdateTimeout,
    required TResult Function() walletOperationTimeout,
    required TResult Function() txSyncTimeout,
    required TResult Function() gossipUpdateTimeout,
    required TResult Function() invalidOfferId,
    required TResult Function() invalidNodeId,
    required TResult Function() invalidOffer,
    required TResult Function() invalidRefund,
    required TResult Function() unsupportedCurrency,
    required TResult Function() uriParameterParsingFailed,
    required TResult Function() invalidUri,
    required TResult Function() invalidQuantity,
    required TResult Function() invalidNodeAlias,
    required TResult Function() invalidCustomTlvs,
    required TResult Function() invalidDateTime,
    required TResult Function() invalidFeeRate,
    required TResult Function() channelSplicingFailed,
    required TResult Function() invalidBlindedPaths,
    required TResult Function() asyncPaymentServicesDisabled,
    required TResult Function(FfiCreationError field0) creationError,
  }) {
    final _that = this;
    switch (_that) {
      case FfiNodeError_InvalidTxid():
        return invalidTxid();
      case FfiNodeError_InvalidBlockHash():
        return invalidBlockHash();
      case FfiNodeError_AlreadyRunning():
        return alreadyRunning();
      case FfiNodeError_NotRunning():
        return notRunning();
      case FfiNodeError_OnchainTxCreationFailed():
        return onchainTxCreationFailed();
      case FfiNodeError_ConnectionFailed():
        return connectionFailed();
      case FfiNodeError_InvoiceCreationFailed():
        return invoiceCreationFailed();
      case FfiNodeError_PaymentSendingFailed():
        return paymentSendingFailed();
      case FfiNodeError_ProbeSendingFailed():
        return probeSendingFailed();
      case FfiNodeError_ChannelCreationFailed():
        return channelCreationFailed();
      case FfiNodeError_ChannelClosingFailed():
        return channelClosingFailed();
      case FfiNodeError_ChannelConfigUpdateFailed():
        return channelConfigUpdateFailed();
      case FfiNodeError_PersistenceFailed():
        return persistenceFailed();
      case FfiNodeError_WalletOperationFailed():
        return walletOperationFailed();
      case FfiNodeError_OnchainTxSigningFailed():
        return onchainTxSigningFailed();
      case FfiNodeError_MessageSigningFailed():
        return messageSigningFailed();
      case FfiNodeError_TxSyncFailed():
        return txSyncFailed();
      case FfiNodeError_GossipUpdateFailed():
        return gossipUpdateFailed();
      case FfiNodeError_InvalidAddress():
        return invalidAddress();
      case FfiNodeError_InvalidSocketAddress():
        return invalidSocketAddress();
      case FfiNodeError_InvalidPublicKey():
        return invalidPublicKey();
      case FfiNodeError_InvalidSecretKey():
        return invalidSecretKey();
      case FfiNodeError_InvalidPaymentHash():
        return invalidPaymentHash();
      case FfiNodeError_InvalidPaymentPreimage():
        return invalidPaymentPreimage();
      case FfiNodeError_InvalidPaymentSecret():
        return invalidPaymentSecret();
      case FfiNodeError_InvalidAmount():
        return invalidAmount();
      case FfiNodeError_InvalidInvoice():
        return invalidInvoice();
      case FfiNodeError_InvalidChannelId():
        return invalidChannelId();
      case FfiNodeError_InvalidNetwork():
        return invalidNetwork();
      case FfiNodeError_DuplicatePayment():
        return duplicatePayment();
      case FfiNodeError_InsufficientFunds():
        return insufficientFunds();
      case FfiNodeError_FeerateEstimationUpdateFailed():
        return feerateEstimationUpdateFailed();
      case FfiNodeError_LiquidityRequestFailed():
        return liquidityRequestFailed();
      case FfiNodeError_LiquiditySourceUnavailable():
        return liquiditySourceUnavailable();
      case FfiNodeError_LiquidityFeeTooHigh():
        return liquidityFeeTooHigh();
      case FfiNodeError_InvalidPaymentId():
        return invalidPaymentId();
      case FfiNodeError_Decode():
        return decode(_that.field0);
      case FfiNodeError_Bolt12Parse():
        return bolt12Parse(_that.field0);
      case FfiNodeError_InvoiceRequestCreationFailed():
        return invoiceRequestCreationFailed();
      case FfiNodeError_OfferCreationFailed():
        return offerCreationFailed();
      case FfiNodeError_RefundCreationFailed():
        return refundCreationFailed();
      case FfiNodeError_FeerateEstimationUpdateTimeout():
        return feerateEstimationUpdateTimeout();
      case FfiNodeError_WalletOperationTimeout():
        return walletOperationTimeout();
      case FfiNodeError_TxSyncTimeout():
        return txSyncTimeout();
      case FfiNodeError_GossipUpdateTimeout():
        return gossipUpdateTimeout();
      case FfiNodeError_InvalidOfferId():
        return invalidOfferId();
      case FfiNodeError_InvalidNodeId():
        return invalidNodeId();
      case FfiNodeError_InvalidOffer():
        return invalidOffer();
      case FfiNodeError_InvalidRefund():
        return invalidRefund();
      case FfiNodeError_UnsupportedCurrency():
        return unsupportedCurrency();
      case FfiNodeError_UriParameterParsingFailed():
        return uriParameterParsingFailed();
      case FfiNodeError_InvalidUri():
        return invalidUri();
      case FfiNodeError_InvalidQuantity():
        return invalidQuantity();
      case FfiNodeError_InvalidNodeAlias():
        return invalidNodeAlias();
      case FfiNodeError_InvalidCustomTlvs():
        return invalidCustomTlvs();
      case FfiNodeError_InvalidDateTime():
        return invalidDateTime();
      case FfiNodeError_InvalidFeeRate():
        return invalidFeeRate();
      case FfiNodeError_ChannelSplicingFailed():
        return channelSplicingFailed();
      case FfiNodeError_InvalidBlindedPaths():
        return invalidBlindedPaths();
      case FfiNodeError_AsyncPaymentServicesDisabled():
        return asyncPaymentServicesDisabled();
      case FfiNodeError_CreationError():
        return creationError(_that.field0);
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
    TResult? Function()? invalidTxid,
    TResult? Function()? invalidBlockHash,
    TResult? Function()? alreadyRunning,
    TResult? Function()? notRunning,
    TResult? Function()? onchainTxCreationFailed,
    TResult? Function()? connectionFailed,
    TResult? Function()? invoiceCreationFailed,
    TResult? Function()? paymentSendingFailed,
    TResult? Function()? probeSendingFailed,
    TResult? Function()? channelCreationFailed,
    TResult? Function()? channelClosingFailed,
    TResult? Function()? channelConfigUpdateFailed,
    TResult? Function()? persistenceFailed,
    TResult? Function()? walletOperationFailed,
    TResult? Function()? onchainTxSigningFailed,
    TResult? Function()? messageSigningFailed,
    TResult? Function()? txSyncFailed,
    TResult? Function()? gossipUpdateFailed,
    TResult? Function()? invalidAddress,
    TResult? Function()? invalidSocketAddress,
    TResult? Function()? invalidPublicKey,
    TResult? Function()? invalidSecretKey,
    TResult? Function()? invalidPaymentHash,
    TResult? Function()? invalidPaymentPreimage,
    TResult? Function()? invalidPaymentSecret,
    TResult? Function()? invalidAmount,
    TResult? Function()? invalidInvoice,
    TResult? Function()? invalidChannelId,
    TResult? Function()? invalidNetwork,
    TResult? Function()? duplicatePayment,
    TResult? Function()? insufficientFunds,
    TResult? Function()? feerateEstimationUpdateFailed,
    TResult? Function()? liquidityRequestFailed,
    TResult? Function()? liquiditySourceUnavailable,
    TResult? Function()? liquidityFeeTooHigh,
    TResult? Function()? invalidPaymentId,
    TResult? Function(DecodeError field0)? decode,
    TResult? Function(Bolt12ParseError field0)? bolt12Parse,
    TResult? Function()? invoiceRequestCreationFailed,
    TResult? Function()? offerCreationFailed,
    TResult? Function()? refundCreationFailed,
    TResult? Function()? feerateEstimationUpdateTimeout,
    TResult? Function()? walletOperationTimeout,
    TResult? Function()? txSyncTimeout,
    TResult? Function()? gossipUpdateTimeout,
    TResult? Function()? invalidOfferId,
    TResult? Function()? invalidNodeId,
    TResult? Function()? invalidOffer,
    TResult? Function()? invalidRefund,
    TResult? Function()? unsupportedCurrency,
    TResult? Function()? uriParameterParsingFailed,
    TResult? Function()? invalidUri,
    TResult? Function()? invalidQuantity,
    TResult? Function()? invalidNodeAlias,
    TResult? Function()? invalidCustomTlvs,
    TResult? Function()? invalidDateTime,
    TResult? Function()? invalidFeeRate,
    TResult? Function()? channelSplicingFailed,
    TResult? Function()? invalidBlindedPaths,
    TResult? Function()? asyncPaymentServicesDisabled,
    TResult? Function(FfiCreationError field0)? creationError,
  }) {
    final _that = this;
    switch (_that) {
      case FfiNodeError_InvalidTxid() when invalidTxid != null:
        return invalidTxid();
      case FfiNodeError_InvalidBlockHash() when invalidBlockHash != null:
        return invalidBlockHash();
      case FfiNodeError_AlreadyRunning() when alreadyRunning != null:
        return alreadyRunning();
      case FfiNodeError_NotRunning() when notRunning != null:
        return notRunning();
      case FfiNodeError_OnchainTxCreationFailed()
          when onchainTxCreationFailed != null:
        return onchainTxCreationFailed();
      case FfiNodeError_ConnectionFailed() when connectionFailed != null:
        return connectionFailed();
      case FfiNodeError_InvoiceCreationFailed()
          when invoiceCreationFailed != null:
        return invoiceCreationFailed();
      case FfiNodeError_PaymentSendingFailed()
          when paymentSendingFailed != null:
        return paymentSendingFailed();
      case FfiNodeError_ProbeSendingFailed() when probeSendingFailed != null:
        return probeSendingFailed();
      case FfiNodeError_ChannelCreationFailed()
          when channelCreationFailed != null:
        return channelCreationFailed();
      case FfiNodeError_ChannelClosingFailed()
          when channelClosingFailed != null:
        return channelClosingFailed();
      case FfiNodeError_ChannelConfigUpdateFailed()
          when channelConfigUpdateFailed != null:
        return channelConfigUpdateFailed();
      case FfiNodeError_PersistenceFailed() when persistenceFailed != null:
        return persistenceFailed();
      case FfiNodeError_WalletOperationFailed()
          when walletOperationFailed != null:
        return walletOperationFailed();
      case FfiNodeError_OnchainTxSigningFailed()
          when onchainTxSigningFailed != null:
        return onchainTxSigningFailed();
      case FfiNodeError_MessageSigningFailed()
          when messageSigningFailed != null:
        return messageSigningFailed();
      case FfiNodeError_TxSyncFailed() when txSyncFailed != null:
        return txSyncFailed();
      case FfiNodeError_GossipUpdateFailed() when gossipUpdateFailed != null:
        return gossipUpdateFailed();
      case FfiNodeError_InvalidAddress() when invalidAddress != null:
        return invalidAddress();
      case FfiNodeError_InvalidSocketAddress()
          when invalidSocketAddress != null:
        return invalidSocketAddress();
      case FfiNodeError_InvalidPublicKey() when invalidPublicKey != null:
        return invalidPublicKey();
      case FfiNodeError_InvalidSecretKey() when invalidSecretKey != null:
        return invalidSecretKey();
      case FfiNodeError_InvalidPaymentHash() when invalidPaymentHash != null:
        return invalidPaymentHash();
      case FfiNodeError_InvalidPaymentPreimage()
          when invalidPaymentPreimage != null:
        return invalidPaymentPreimage();
      case FfiNodeError_InvalidPaymentSecret()
          when invalidPaymentSecret != null:
        return invalidPaymentSecret();
      case FfiNodeError_InvalidAmount() when invalidAmount != null:
        return invalidAmount();
      case FfiNodeError_InvalidInvoice() when invalidInvoice != null:
        return invalidInvoice();
      case FfiNodeError_InvalidChannelId() when invalidChannelId != null:
        return invalidChannelId();
      case FfiNodeError_InvalidNetwork() when invalidNetwork != null:
        return invalidNetwork();
      case FfiNodeError_DuplicatePayment() when duplicatePayment != null:
        return duplicatePayment();
      case FfiNodeError_InsufficientFunds() when insufficientFunds != null:
        return insufficientFunds();
      case FfiNodeError_FeerateEstimationUpdateFailed()
          when feerateEstimationUpdateFailed != null:
        return feerateEstimationUpdateFailed();
      case FfiNodeError_LiquidityRequestFailed()
          when liquidityRequestFailed != null:
        return liquidityRequestFailed();
      case FfiNodeError_LiquiditySourceUnavailable()
          when liquiditySourceUnavailable != null:
        return liquiditySourceUnavailable();
      case FfiNodeError_LiquidityFeeTooHigh() when liquidityFeeTooHigh != null:
        return liquidityFeeTooHigh();
      case FfiNodeError_InvalidPaymentId() when invalidPaymentId != null:
        return invalidPaymentId();
      case FfiNodeError_Decode() when decode != null:
        return decode(_that.field0);
      case FfiNodeError_Bolt12Parse() when bolt12Parse != null:
        return bolt12Parse(_that.field0);
      case FfiNodeError_InvoiceRequestCreationFailed()
          when invoiceRequestCreationFailed != null:
        return invoiceRequestCreationFailed();
      case FfiNodeError_OfferCreationFailed() when offerCreationFailed != null:
        return offerCreationFailed();
      case FfiNodeError_RefundCreationFailed()
          when refundCreationFailed != null:
        return refundCreationFailed();
      case FfiNodeError_FeerateEstimationUpdateTimeout()
          when feerateEstimationUpdateTimeout != null:
        return feerateEstimationUpdateTimeout();
      case FfiNodeError_WalletOperationTimeout()
          when walletOperationTimeout != null:
        return walletOperationTimeout();
      case FfiNodeError_TxSyncTimeout() when txSyncTimeout != null:
        return txSyncTimeout();
      case FfiNodeError_GossipUpdateTimeout() when gossipUpdateTimeout != null:
        return gossipUpdateTimeout();
      case FfiNodeError_InvalidOfferId() when invalidOfferId != null:
        return invalidOfferId();
      case FfiNodeError_InvalidNodeId() when invalidNodeId != null:
        return invalidNodeId();
      case FfiNodeError_InvalidOffer() when invalidOffer != null:
        return invalidOffer();
      case FfiNodeError_InvalidRefund() when invalidRefund != null:
        return invalidRefund();
      case FfiNodeError_UnsupportedCurrency() when unsupportedCurrency != null:
        return unsupportedCurrency();
      case FfiNodeError_UriParameterParsingFailed()
          when uriParameterParsingFailed != null:
        return uriParameterParsingFailed();
      case FfiNodeError_InvalidUri() when invalidUri != null:
        return invalidUri();
      case FfiNodeError_InvalidQuantity() when invalidQuantity != null:
        return invalidQuantity();
      case FfiNodeError_InvalidNodeAlias() when invalidNodeAlias != null:
        return invalidNodeAlias();
      case FfiNodeError_InvalidCustomTlvs() when invalidCustomTlvs != null:
        return invalidCustomTlvs();
      case FfiNodeError_InvalidDateTime() when invalidDateTime != null:
        return invalidDateTime();
      case FfiNodeError_InvalidFeeRate() when invalidFeeRate != null:
        return invalidFeeRate();
      case FfiNodeError_ChannelSplicingFailed()
          when channelSplicingFailed != null:
        return channelSplicingFailed();
      case FfiNodeError_InvalidBlindedPaths() when invalidBlindedPaths != null:
        return invalidBlindedPaths();
      case FfiNodeError_AsyncPaymentServicesDisabled()
          when asyncPaymentServicesDisabled != null:
        return asyncPaymentServicesDisabled();
      case FfiNodeError_CreationError() when creationError != null:
        return creationError(_that.field0);
      case _:
        return null;
    }
  }
}

/// @nodoc

class FfiNodeError_InvalidTxid extends FfiNodeError {
  const FfiNodeError_InvalidTxid() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FfiNodeError_InvalidTxid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidTxid()';
  }
}

/// @nodoc

class FfiNodeError_InvalidBlockHash extends FfiNodeError {
  const FfiNodeError_InvalidBlockHash() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidBlockHash);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidBlockHash()';
  }
}

/// @nodoc

class FfiNodeError_AlreadyRunning extends FfiNodeError {
  const FfiNodeError_AlreadyRunning() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_AlreadyRunning);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.alreadyRunning()';
  }
}

/// @nodoc

class FfiNodeError_NotRunning extends FfiNodeError {
  const FfiNodeError_NotRunning() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FfiNodeError_NotRunning);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.notRunning()';
  }
}

/// @nodoc

class FfiNodeError_OnchainTxCreationFailed extends FfiNodeError {
  const FfiNodeError_OnchainTxCreationFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_OnchainTxCreationFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.onchainTxCreationFailed()';
  }
}

/// @nodoc

class FfiNodeError_ConnectionFailed extends FfiNodeError {
  const FfiNodeError_ConnectionFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_ConnectionFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.connectionFailed()';
  }
}

/// @nodoc

class FfiNodeError_InvoiceCreationFailed extends FfiNodeError {
  const FfiNodeError_InvoiceCreationFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvoiceCreationFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invoiceCreationFailed()';
  }
}

/// @nodoc

class FfiNodeError_PaymentSendingFailed extends FfiNodeError {
  const FfiNodeError_PaymentSendingFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_PaymentSendingFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.paymentSendingFailed()';
  }
}

/// @nodoc

class FfiNodeError_ProbeSendingFailed extends FfiNodeError {
  const FfiNodeError_ProbeSendingFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_ProbeSendingFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.probeSendingFailed()';
  }
}

/// @nodoc

class FfiNodeError_ChannelCreationFailed extends FfiNodeError {
  const FfiNodeError_ChannelCreationFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_ChannelCreationFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.channelCreationFailed()';
  }
}

/// @nodoc

class FfiNodeError_ChannelClosingFailed extends FfiNodeError {
  const FfiNodeError_ChannelClosingFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_ChannelClosingFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.channelClosingFailed()';
  }
}

/// @nodoc

class FfiNodeError_ChannelConfigUpdateFailed extends FfiNodeError {
  const FfiNodeError_ChannelConfigUpdateFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_ChannelConfigUpdateFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.channelConfigUpdateFailed()';
  }
}

/// @nodoc

class FfiNodeError_PersistenceFailed extends FfiNodeError {
  const FfiNodeError_PersistenceFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_PersistenceFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.persistenceFailed()';
  }
}

/// @nodoc

class FfiNodeError_WalletOperationFailed extends FfiNodeError {
  const FfiNodeError_WalletOperationFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_WalletOperationFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.walletOperationFailed()';
  }
}

/// @nodoc

class FfiNodeError_OnchainTxSigningFailed extends FfiNodeError {
  const FfiNodeError_OnchainTxSigningFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_OnchainTxSigningFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.onchainTxSigningFailed()';
  }
}

/// @nodoc

class FfiNodeError_MessageSigningFailed extends FfiNodeError {
  const FfiNodeError_MessageSigningFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_MessageSigningFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.messageSigningFailed()';
  }
}

/// @nodoc

class FfiNodeError_TxSyncFailed extends FfiNodeError {
  const FfiNodeError_TxSyncFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_TxSyncFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.txSyncFailed()';
  }
}

/// @nodoc

class FfiNodeError_GossipUpdateFailed extends FfiNodeError {
  const FfiNodeError_GossipUpdateFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_GossipUpdateFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.gossipUpdateFailed()';
  }
}

/// @nodoc

class FfiNodeError_InvalidAddress extends FfiNodeError {
  const FfiNodeError_InvalidAddress() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidAddress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidAddress()';
  }
}

/// @nodoc

class FfiNodeError_InvalidSocketAddress extends FfiNodeError {
  const FfiNodeError_InvalidSocketAddress() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidSocketAddress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidSocketAddress()';
  }
}

/// @nodoc

class FfiNodeError_InvalidPublicKey extends FfiNodeError {
  const FfiNodeError_InvalidPublicKey() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidPublicKey);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidPublicKey()';
  }
}

/// @nodoc

class FfiNodeError_InvalidSecretKey extends FfiNodeError {
  const FfiNodeError_InvalidSecretKey() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidSecretKey);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidSecretKey()';
  }
}

/// @nodoc

class FfiNodeError_InvalidPaymentHash extends FfiNodeError {
  const FfiNodeError_InvalidPaymentHash() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidPaymentHash);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidPaymentHash()';
  }
}

/// @nodoc

class FfiNodeError_InvalidPaymentPreimage extends FfiNodeError {
  const FfiNodeError_InvalidPaymentPreimage() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidPaymentPreimage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidPaymentPreimage()';
  }
}

/// @nodoc

class FfiNodeError_InvalidPaymentSecret extends FfiNodeError {
  const FfiNodeError_InvalidPaymentSecret() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidPaymentSecret);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidPaymentSecret()';
  }
}

/// @nodoc

class FfiNodeError_InvalidAmount extends FfiNodeError {
  const FfiNodeError_InvalidAmount() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidAmount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidAmount()';
  }
}

/// @nodoc

class FfiNodeError_InvalidInvoice extends FfiNodeError {
  const FfiNodeError_InvalidInvoice() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidInvoice);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidInvoice()';
  }
}

/// @nodoc

class FfiNodeError_InvalidChannelId extends FfiNodeError {
  const FfiNodeError_InvalidChannelId() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidChannelId);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidChannelId()';
  }
}

/// @nodoc

class FfiNodeError_InvalidNetwork extends FfiNodeError {
  const FfiNodeError_InvalidNetwork() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidNetwork);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidNetwork()';
  }
}

/// @nodoc

class FfiNodeError_DuplicatePayment extends FfiNodeError {
  const FfiNodeError_DuplicatePayment() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_DuplicatePayment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.duplicatePayment()';
  }
}

/// @nodoc

class FfiNodeError_InsufficientFunds extends FfiNodeError {
  const FfiNodeError_InsufficientFunds() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InsufficientFunds);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.insufficientFunds()';
  }
}

/// @nodoc

class FfiNodeError_FeerateEstimationUpdateFailed extends FfiNodeError {
  const FfiNodeError_FeerateEstimationUpdateFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_FeerateEstimationUpdateFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.feerateEstimationUpdateFailed()';
  }
}

/// @nodoc

class FfiNodeError_LiquidityRequestFailed extends FfiNodeError {
  const FfiNodeError_LiquidityRequestFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_LiquidityRequestFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.liquidityRequestFailed()';
  }
}

/// @nodoc

class FfiNodeError_LiquiditySourceUnavailable extends FfiNodeError {
  const FfiNodeError_LiquiditySourceUnavailable() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_LiquiditySourceUnavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.liquiditySourceUnavailable()';
  }
}

/// @nodoc

class FfiNodeError_LiquidityFeeTooHigh extends FfiNodeError {
  const FfiNodeError_LiquidityFeeTooHigh() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_LiquidityFeeTooHigh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.liquidityFeeTooHigh()';
  }
}

/// @nodoc

class FfiNodeError_InvalidPaymentId extends FfiNodeError {
  const FfiNodeError_InvalidPaymentId() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidPaymentId);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidPaymentId()';
  }
}

/// @nodoc

class FfiNodeError_Decode extends FfiNodeError {
  const FfiNodeError_Decode(this.field0) : super._();

  final DecodeError field0;

  /// Create a copy of FfiNodeError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FfiNodeError_DecodeCopyWith<FfiNodeError_Decode> get copyWith =>
      _$FfiNodeError_DecodeCopyWithImpl<FfiNodeError_Decode>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_Decode &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'FfiNodeError.decode(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $FfiNodeError_DecodeCopyWith<$Res>
    implements $FfiNodeErrorCopyWith<$Res> {
  factory $FfiNodeError_DecodeCopyWith(
          FfiNodeError_Decode value, $Res Function(FfiNodeError_Decode) _then) =
      _$FfiNodeError_DecodeCopyWithImpl;
  @useResult
  $Res call({DecodeError field0});

  $DecodeErrorCopyWith<$Res> get field0;
}

/// @nodoc
class _$FfiNodeError_DecodeCopyWithImpl<$Res>
    implements $FfiNodeError_DecodeCopyWith<$Res> {
  _$FfiNodeError_DecodeCopyWithImpl(this._self, this._then);

  final FfiNodeError_Decode _self;
  final $Res Function(FfiNodeError_Decode) _then;

  /// Create a copy of FfiNodeError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(FfiNodeError_Decode(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as DecodeError,
    ));
  }

  /// Create a copy of FfiNodeError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DecodeErrorCopyWith<$Res> get field0 {
    return $DecodeErrorCopyWith<$Res>(_self.field0, (value) {
      return _then(_self.copyWith(field0: value));
    });
  }
}

/// @nodoc

class FfiNodeError_Bolt12Parse extends FfiNodeError {
  const FfiNodeError_Bolt12Parse(this.field0) : super._();

  final Bolt12ParseError field0;

  /// Create a copy of FfiNodeError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FfiNodeError_Bolt12ParseCopyWith<FfiNodeError_Bolt12Parse> get copyWith =>
      _$FfiNodeError_Bolt12ParseCopyWithImpl<FfiNodeError_Bolt12Parse>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_Bolt12Parse &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'FfiNodeError.bolt12Parse(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $FfiNodeError_Bolt12ParseCopyWith<$Res>
    implements $FfiNodeErrorCopyWith<$Res> {
  factory $FfiNodeError_Bolt12ParseCopyWith(FfiNodeError_Bolt12Parse value,
          $Res Function(FfiNodeError_Bolt12Parse) _then) =
      _$FfiNodeError_Bolt12ParseCopyWithImpl;
  @useResult
  $Res call({Bolt12ParseError field0});

  $Bolt12ParseErrorCopyWith<$Res> get field0;
}

/// @nodoc
class _$FfiNodeError_Bolt12ParseCopyWithImpl<$Res>
    implements $FfiNodeError_Bolt12ParseCopyWith<$Res> {
  _$FfiNodeError_Bolt12ParseCopyWithImpl(this._self, this._then);

  final FfiNodeError_Bolt12Parse _self;
  final $Res Function(FfiNodeError_Bolt12Parse) _then;

  /// Create a copy of FfiNodeError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(FfiNodeError_Bolt12Parse(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Bolt12ParseError,
    ));
  }

  /// Create a copy of FfiNodeError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Bolt12ParseErrorCopyWith<$Res> get field0 {
    return $Bolt12ParseErrorCopyWith<$Res>(_self.field0, (value) {
      return _then(_self.copyWith(field0: value));
    });
  }
}

/// @nodoc

class FfiNodeError_InvoiceRequestCreationFailed extends FfiNodeError {
  const FfiNodeError_InvoiceRequestCreationFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvoiceRequestCreationFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invoiceRequestCreationFailed()';
  }
}

/// @nodoc

class FfiNodeError_OfferCreationFailed extends FfiNodeError {
  const FfiNodeError_OfferCreationFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_OfferCreationFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.offerCreationFailed()';
  }
}

/// @nodoc

class FfiNodeError_RefundCreationFailed extends FfiNodeError {
  const FfiNodeError_RefundCreationFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_RefundCreationFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.refundCreationFailed()';
  }
}

/// @nodoc

class FfiNodeError_FeerateEstimationUpdateTimeout extends FfiNodeError {
  const FfiNodeError_FeerateEstimationUpdateTimeout() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_FeerateEstimationUpdateTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.feerateEstimationUpdateTimeout()';
  }
}

/// @nodoc

class FfiNodeError_WalletOperationTimeout extends FfiNodeError {
  const FfiNodeError_WalletOperationTimeout() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_WalletOperationTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.walletOperationTimeout()';
  }
}

/// @nodoc

class FfiNodeError_TxSyncTimeout extends FfiNodeError {
  const FfiNodeError_TxSyncTimeout() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_TxSyncTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.txSyncTimeout()';
  }
}

/// @nodoc

class FfiNodeError_GossipUpdateTimeout extends FfiNodeError {
  const FfiNodeError_GossipUpdateTimeout() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_GossipUpdateTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.gossipUpdateTimeout()';
  }
}

/// @nodoc

class FfiNodeError_InvalidOfferId extends FfiNodeError {
  const FfiNodeError_InvalidOfferId() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidOfferId);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidOfferId()';
  }
}

/// @nodoc

class FfiNodeError_InvalidNodeId extends FfiNodeError {
  const FfiNodeError_InvalidNodeId() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidNodeId);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidNodeId()';
  }
}

/// @nodoc

class FfiNodeError_InvalidOffer extends FfiNodeError {
  const FfiNodeError_InvalidOffer() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidOffer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidOffer()';
  }
}

/// @nodoc

class FfiNodeError_InvalidRefund extends FfiNodeError {
  const FfiNodeError_InvalidRefund() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidRefund);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidRefund()';
  }
}

/// @nodoc

class FfiNodeError_UnsupportedCurrency extends FfiNodeError {
  const FfiNodeError_UnsupportedCurrency() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_UnsupportedCurrency);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.unsupportedCurrency()';
  }
}

/// @nodoc

class FfiNodeError_UriParameterParsingFailed extends FfiNodeError {
  const FfiNodeError_UriParameterParsingFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_UriParameterParsingFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.uriParameterParsingFailed()';
  }
}

/// @nodoc

class FfiNodeError_InvalidUri extends FfiNodeError {
  const FfiNodeError_InvalidUri() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FfiNodeError_InvalidUri);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidUri()';
  }
}

/// @nodoc

class FfiNodeError_InvalidQuantity extends FfiNodeError {
  const FfiNodeError_InvalidQuantity() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidQuantity);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidQuantity()';
  }
}

/// @nodoc

class FfiNodeError_InvalidNodeAlias extends FfiNodeError {
  const FfiNodeError_InvalidNodeAlias() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidNodeAlias);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidNodeAlias()';
  }
}

/// @nodoc

class FfiNodeError_InvalidCustomTlvs extends FfiNodeError {
  const FfiNodeError_InvalidCustomTlvs() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidCustomTlvs);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidCustomTlvs()';
  }
}

/// @nodoc

class FfiNodeError_InvalidDateTime extends FfiNodeError {
  const FfiNodeError_InvalidDateTime() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidDateTime);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidDateTime()';
  }
}

/// @nodoc

class FfiNodeError_InvalidFeeRate extends FfiNodeError {
  const FfiNodeError_InvalidFeeRate() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidFeeRate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidFeeRate()';
  }
}

/// @nodoc

class FfiNodeError_ChannelSplicingFailed extends FfiNodeError {
  const FfiNodeError_ChannelSplicingFailed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_ChannelSplicingFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.channelSplicingFailed()';
  }
}

/// @nodoc

class FfiNodeError_InvalidBlindedPaths extends FfiNodeError {
  const FfiNodeError_InvalidBlindedPaths() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_InvalidBlindedPaths);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.invalidBlindedPaths()';
  }
}

/// @nodoc

class FfiNodeError_AsyncPaymentServicesDisabled extends FfiNodeError {
  const FfiNodeError_AsyncPaymentServicesDisabled() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_AsyncPaymentServicesDisabled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FfiNodeError.asyncPaymentServicesDisabled()';
  }
}

/// @nodoc

class FfiNodeError_CreationError extends FfiNodeError {
  const FfiNodeError_CreationError(this.field0) : super._();

  final FfiCreationError field0;

  /// Create a copy of FfiNodeError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FfiNodeError_CreationErrorCopyWith<FfiNodeError_CreationError>
      get copyWith =>
          _$FfiNodeError_CreationErrorCopyWithImpl<FfiNodeError_CreationError>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FfiNodeError_CreationError &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'FfiNodeError.creationError(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $FfiNodeError_CreationErrorCopyWith<$Res>
    implements $FfiNodeErrorCopyWith<$Res> {
  factory $FfiNodeError_CreationErrorCopyWith(FfiNodeError_CreationError value,
          $Res Function(FfiNodeError_CreationError) _then) =
      _$FfiNodeError_CreationErrorCopyWithImpl;
  @useResult
  $Res call({FfiCreationError field0});
}

/// @nodoc
class _$FfiNodeError_CreationErrorCopyWithImpl<$Res>
    implements $FfiNodeError_CreationErrorCopyWith<$Res> {
  _$FfiNodeError_CreationErrorCopyWithImpl(this._self, this._then);

  final FfiNodeError_CreationError _self;
  final $Res Function(FfiNodeError_CreationError) _then;

  /// Create a copy of FfiNodeError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(FfiNodeError_CreationError(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as FfiCreationError,
    ));
  }
}

// dart format on
