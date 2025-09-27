// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocketAddress {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SocketAddress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SocketAddress()';
  }
}

/// @nodoc
class $SocketAddressCopyWith<$Res> {
  $SocketAddressCopyWith(SocketAddress _, $Res Function(SocketAddress) __);
}

/// Adds pattern-matching-related methods to [SocketAddress].
extension SocketAddressPatterns on SocketAddress {
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
    TResult Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult Function(SocketAddress_OnionV2 value)? onionV2,
    TResult Function(SocketAddress_OnionV3 value)? onionV3,
    TResult Function(SocketAddress_Hostname value)? hostname,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SocketAddress_TcpIpV4() when tcpIpV4 != null:
        return tcpIpV4(_that);
      case SocketAddress_TcpIpV6() when tcpIpV6 != null:
        return tcpIpV6(_that);
      case SocketAddress_OnionV2() when onionV2 != null:
        return onionV2(_that);
      case SocketAddress_OnionV3() when onionV3 != null:
        return onionV3(_that);
      case SocketAddress_Hostname() when hostname != null:
        return hostname(_that);
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
    required TResult Function(SocketAddress_TcpIpV4 value) tcpIpV4,
    required TResult Function(SocketAddress_TcpIpV6 value) tcpIpV6,
    required TResult Function(SocketAddress_OnionV2 value) onionV2,
    required TResult Function(SocketAddress_OnionV3 value) onionV3,
    required TResult Function(SocketAddress_Hostname value) hostname,
  }) {
    final _that = this;
    switch (_that) {
      case SocketAddress_TcpIpV4():
        return tcpIpV4(_that);
      case SocketAddress_TcpIpV6():
        return tcpIpV6(_that);
      case SocketAddress_OnionV2():
        return onionV2(_that);
      case SocketAddress_OnionV3():
        return onionV3(_that);
      case SocketAddress_Hostname():
        return hostname(_that);
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
    TResult? Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult? Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult? Function(SocketAddress_OnionV2 value)? onionV2,
    TResult? Function(SocketAddress_OnionV3 value)? onionV3,
    TResult? Function(SocketAddress_Hostname value)? hostname,
  }) {
    final _that = this;
    switch (_that) {
      case SocketAddress_TcpIpV4() when tcpIpV4 != null:
        return tcpIpV4(_that);
      case SocketAddress_TcpIpV6() when tcpIpV6 != null:
        return tcpIpV6(_that);
      case SocketAddress_OnionV2() when onionV2 != null:
        return onionV2(_that);
      case SocketAddress_OnionV3() when onionV3 != null:
        return onionV3(_that);
      case SocketAddress_Hostname() when hostname != null:
        return hostname(_that);
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
    TResult Function(U8Array4 addr, int port)? tcpIpV4,
    TResult Function(U8Array16 addr, int port)? tcpIpV6,
    TResult Function(U8Array12 field0)? onionV2,
    TResult Function(
            U8Array32 ed25519Pubkey, int checksum, int version, int port)?
        onionV3,
    TResult Function(String addr, int port)? hostname,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SocketAddress_TcpIpV4() when tcpIpV4 != null:
        return tcpIpV4(_that.addr, _that.port);
      case SocketAddress_TcpIpV6() when tcpIpV6 != null:
        return tcpIpV6(_that.addr, _that.port);
      case SocketAddress_OnionV2() when onionV2 != null:
        return onionV2(_that.field0);
      case SocketAddress_OnionV3() when onionV3 != null:
        return onionV3(
            _that.ed25519Pubkey, _that.checksum, _that.version, _that.port);
      case SocketAddress_Hostname() when hostname != null:
        return hostname(_that.addr, _that.port);
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
    required TResult Function(U8Array4 addr, int port) tcpIpV4,
    required TResult Function(U8Array16 addr, int port) tcpIpV6,
    required TResult Function(U8Array12 field0) onionV2,
    required TResult Function(
            U8Array32 ed25519Pubkey, int checksum, int version, int port)
        onionV3,
    required TResult Function(String addr, int port) hostname,
  }) {
    final _that = this;
    switch (_that) {
      case SocketAddress_TcpIpV4():
        return tcpIpV4(_that.addr, _that.port);
      case SocketAddress_TcpIpV6():
        return tcpIpV6(_that.addr, _that.port);
      case SocketAddress_OnionV2():
        return onionV2(_that.field0);
      case SocketAddress_OnionV3():
        return onionV3(
            _that.ed25519Pubkey, _that.checksum, _that.version, _that.port);
      case SocketAddress_Hostname():
        return hostname(_that.addr, _that.port);
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
    TResult? Function(U8Array4 addr, int port)? tcpIpV4,
    TResult? Function(U8Array16 addr, int port)? tcpIpV6,
    TResult? Function(U8Array12 field0)? onionV2,
    TResult? Function(
            U8Array32 ed25519Pubkey, int checksum, int version, int port)?
        onionV3,
    TResult? Function(String addr, int port)? hostname,
  }) {
    final _that = this;
    switch (_that) {
      case SocketAddress_TcpIpV4() when tcpIpV4 != null:
        return tcpIpV4(_that.addr, _that.port);
      case SocketAddress_TcpIpV6() when tcpIpV6 != null:
        return tcpIpV6(_that.addr, _that.port);
      case SocketAddress_OnionV2() when onionV2 != null:
        return onionV2(_that.field0);
      case SocketAddress_OnionV3() when onionV3 != null:
        return onionV3(
            _that.ed25519Pubkey, _that.checksum, _that.version, _that.port);
      case SocketAddress_Hostname() when hostname != null:
        return hostname(_that.addr, _that.port);
      case _:
        return null;
    }
  }
}

/// @nodoc

class SocketAddress_TcpIpV4 extends SocketAddress {
  const SocketAddress_TcpIpV4({required this.addr, required this.port})
      : super._();

  final U8Array4 addr;
  final int port;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocketAddress_TcpIpV4CopyWith<SocketAddress_TcpIpV4> get copyWith =>
      _$SocketAddress_TcpIpV4CopyWithImpl<SocketAddress_TcpIpV4>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocketAddress_TcpIpV4 &&
            const DeepCollectionEquality().equals(other.addr, addr) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(addr), port);

  @override
  String toString() {
    return 'SocketAddress.tcpIpV4(addr: $addr, port: $port)';
  }
}

/// @nodoc
abstract mixin class $SocketAddress_TcpIpV4CopyWith<$Res>
    implements $SocketAddressCopyWith<$Res> {
  factory $SocketAddress_TcpIpV4CopyWith(SocketAddress_TcpIpV4 value,
          $Res Function(SocketAddress_TcpIpV4) _then) =
      _$SocketAddress_TcpIpV4CopyWithImpl;
  @useResult
  $Res call({U8Array4 addr, int port});
}

/// @nodoc
class _$SocketAddress_TcpIpV4CopyWithImpl<$Res>
    implements $SocketAddress_TcpIpV4CopyWith<$Res> {
  _$SocketAddress_TcpIpV4CopyWithImpl(this._self, this._then);

  final SocketAddress_TcpIpV4 _self;
  final $Res Function(SocketAddress_TcpIpV4) _then;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addr = null,
    Object? port = null,
  }) {
    return _then(SocketAddress_TcpIpV4(
      addr: null == addr
          ? _self.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as U8Array4,
      port: null == port
          ? _self.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SocketAddress_TcpIpV6 extends SocketAddress {
  const SocketAddress_TcpIpV6({required this.addr, required this.port})
      : super._();

  final U8Array16 addr;
  final int port;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocketAddress_TcpIpV6CopyWith<SocketAddress_TcpIpV6> get copyWith =>
      _$SocketAddress_TcpIpV6CopyWithImpl<SocketAddress_TcpIpV6>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocketAddress_TcpIpV6 &&
            const DeepCollectionEquality().equals(other.addr, addr) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(addr), port);

  @override
  String toString() {
    return 'SocketAddress.tcpIpV6(addr: $addr, port: $port)';
  }
}

/// @nodoc
abstract mixin class $SocketAddress_TcpIpV6CopyWith<$Res>
    implements $SocketAddressCopyWith<$Res> {
  factory $SocketAddress_TcpIpV6CopyWith(SocketAddress_TcpIpV6 value,
          $Res Function(SocketAddress_TcpIpV6) _then) =
      _$SocketAddress_TcpIpV6CopyWithImpl;
  @useResult
  $Res call({U8Array16 addr, int port});
}

/// @nodoc
class _$SocketAddress_TcpIpV6CopyWithImpl<$Res>
    implements $SocketAddress_TcpIpV6CopyWith<$Res> {
  _$SocketAddress_TcpIpV6CopyWithImpl(this._self, this._then);

  final SocketAddress_TcpIpV6 _self;
  final $Res Function(SocketAddress_TcpIpV6) _then;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addr = null,
    Object? port = null,
  }) {
    return _then(SocketAddress_TcpIpV6(
      addr: null == addr
          ? _self.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as U8Array16,
      port: null == port
          ? _self.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SocketAddress_OnionV2 extends SocketAddress {
  const SocketAddress_OnionV2(this.field0) : super._();

  final U8Array12 field0;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocketAddress_OnionV2CopyWith<SocketAddress_OnionV2> get copyWith =>
      _$SocketAddress_OnionV2CopyWithImpl<SocketAddress_OnionV2>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocketAddress_OnionV2 &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  @override
  String toString() {
    return 'SocketAddress.onionV2(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $SocketAddress_OnionV2CopyWith<$Res>
    implements $SocketAddressCopyWith<$Res> {
  factory $SocketAddress_OnionV2CopyWith(SocketAddress_OnionV2 value,
          $Res Function(SocketAddress_OnionV2) _then) =
      _$SocketAddress_OnionV2CopyWithImpl;
  @useResult
  $Res call({U8Array12 field0});
}

/// @nodoc
class _$SocketAddress_OnionV2CopyWithImpl<$Res>
    implements $SocketAddress_OnionV2CopyWith<$Res> {
  _$SocketAddress_OnionV2CopyWithImpl(this._self, this._then);

  final SocketAddress_OnionV2 _self;
  final $Res Function(SocketAddress_OnionV2) _then;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(SocketAddress_OnionV2(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as U8Array12,
    ));
  }
}

/// @nodoc

class SocketAddress_OnionV3 extends SocketAddress {
  const SocketAddress_OnionV3(
      {required this.ed25519Pubkey,
      required this.checksum,
      required this.version,
      required this.port})
      : super._();

  final U8Array32 ed25519Pubkey;
  final int checksum;
  final int version;
  final int port;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocketAddress_OnionV3CopyWith<SocketAddress_OnionV3> get copyWith =>
      _$SocketAddress_OnionV3CopyWithImpl<SocketAddress_OnionV3>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocketAddress_OnionV3 &&
            const DeepCollectionEquality()
                .equals(other.ed25519Pubkey, ed25519Pubkey) &&
            (identical(other.checksum, checksum) ||
                other.checksum == checksum) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ed25519Pubkey),
      checksum,
      version,
      port);

  @override
  String toString() {
    return 'SocketAddress.onionV3(ed25519Pubkey: $ed25519Pubkey, checksum: $checksum, version: $version, port: $port)';
  }
}

/// @nodoc
abstract mixin class $SocketAddress_OnionV3CopyWith<$Res>
    implements $SocketAddressCopyWith<$Res> {
  factory $SocketAddress_OnionV3CopyWith(SocketAddress_OnionV3 value,
          $Res Function(SocketAddress_OnionV3) _then) =
      _$SocketAddress_OnionV3CopyWithImpl;
  @useResult
  $Res call({U8Array32 ed25519Pubkey, int checksum, int version, int port});
}

/// @nodoc
class _$SocketAddress_OnionV3CopyWithImpl<$Res>
    implements $SocketAddress_OnionV3CopyWith<$Res> {
  _$SocketAddress_OnionV3CopyWithImpl(this._self, this._then);

  final SocketAddress_OnionV3 _self;
  final $Res Function(SocketAddress_OnionV3) _then;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ed25519Pubkey = null,
    Object? checksum = null,
    Object? version = null,
    Object? port = null,
  }) {
    return _then(SocketAddress_OnionV3(
      ed25519Pubkey: null == ed25519Pubkey
          ? _self.ed25519Pubkey
          : ed25519Pubkey // ignore: cast_nullable_to_non_nullable
              as U8Array32,
      checksum: null == checksum
          ? _self.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as int,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      port: null == port
          ? _self.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class SocketAddress_Hostname extends SocketAddress {
  const SocketAddress_Hostname({required this.addr, required this.port})
      : super._();

  final String addr;
  final int port;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocketAddress_HostnameCopyWith<SocketAddress_Hostname> get copyWith =>
      _$SocketAddress_HostnameCopyWithImpl<SocketAddress_Hostname>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocketAddress_Hostname &&
            (identical(other.addr, addr) || other.addr == addr) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addr, port);

  @override
  String toString() {
    return 'SocketAddress.hostname(addr: $addr, port: $port)';
  }
}

/// @nodoc
abstract mixin class $SocketAddress_HostnameCopyWith<$Res>
    implements $SocketAddressCopyWith<$Res> {
  factory $SocketAddress_HostnameCopyWith(SocketAddress_Hostname value,
          $Res Function(SocketAddress_Hostname) _then) =
      _$SocketAddress_HostnameCopyWithImpl;
  @useResult
  $Res call({String addr, int port});
}

/// @nodoc
class _$SocketAddress_HostnameCopyWithImpl<$Res>
    implements $SocketAddress_HostnameCopyWith<$Res> {
  _$SocketAddress_HostnameCopyWithImpl(this._self, this._then);

  final SocketAddress_Hostname _self;
  final $Res Function(SocketAddress_Hostname) _then;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addr = null,
    Object? port = null,
  }) {
    return _then(SocketAddress_Hostname(
      addr: null == addr
          ? _self.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _self.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
