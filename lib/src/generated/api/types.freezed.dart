// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChainDataSourceConfig {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChainDataSourceConfig);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChainDataSourceConfig()';
  }
}

/// @nodoc
class $ChainDataSourceConfigCopyWith<$Res> {
  $ChainDataSourceConfigCopyWith(
      ChainDataSourceConfig _, $Res Function(ChainDataSourceConfig) __);
}

/// Adds pattern-matching-related methods to [ChainDataSourceConfig].
extension ChainDataSourceConfigPatterns on ChainDataSourceConfig {
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
    TResult Function(ChainDataSourceConfig_Esplora value)? esplora,
    TResult Function(ChainDataSourceConfig_EsploraWithHeaders value)?
        esploraWithHeaders,
    TResult Function(ChainDataSourceConfig_Electrum value)? electrum,
    TResult Function(ChainDataSourceConfig_BitcoindRpc value)? bitcoindRpc,
    TResult Function(ChainDataSourceConfig_BitcoindRest value)? bitcoindRest,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ChainDataSourceConfig_Esplora() when esplora != null:
        return esplora(_that);
      case ChainDataSourceConfig_EsploraWithHeaders()
          when esploraWithHeaders != null:
        return esploraWithHeaders(_that);
      case ChainDataSourceConfig_Electrum() when electrum != null:
        return electrum(_that);
      case ChainDataSourceConfig_BitcoindRpc() when bitcoindRpc != null:
        return bitcoindRpc(_that);
      case ChainDataSourceConfig_BitcoindRest() when bitcoindRest != null:
        return bitcoindRest(_that);
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
    required TResult Function(ChainDataSourceConfig_Esplora value) esplora,
    required TResult Function(ChainDataSourceConfig_EsploraWithHeaders value)
        esploraWithHeaders,
    required TResult Function(ChainDataSourceConfig_Electrum value) electrum,
    required TResult Function(ChainDataSourceConfig_BitcoindRpc value)
        bitcoindRpc,
    required TResult Function(ChainDataSourceConfig_BitcoindRest value)
        bitcoindRest,
  }) {
    final _that = this;
    switch (_that) {
      case ChainDataSourceConfig_Esplora():
        return esplora(_that);
      case ChainDataSourceConfig_EsploraWithHeaders():
        return esploraWithHeaders(_that);
      case ChainDataSourceConfig_Electrum():
        return electrum(_that);
      case ChainDataSourceConfig_BitcoindRpc():
        return bitcoindRpc(_that);
      case ChainDataSourceConfig_BitcoindRest():
        return bitcoindRest(_that);
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
    TResult? Function(ChainDataSourceConfig_Esplora value)? esplora,
    TResult? Function(ChainDataSourceConfig_EsploraWithHeaders value)?
        esploraWithHeaders,
    TResult? Function(ChainDataSourceConfig_Electrum value)? electrum,
    TResult? Function(ChainDataSourceConfig_BitcoindRpc value)? bitcoindRpc,
    TResult? Function(ChainDataSourceConfig_BitcoindRest value)? bitcoindRest,
  }) {
    final _that = this;
    switch (_that) {
      case ChainDataSourceConfig_Esplora() when esplora != null:
        return esplora(_that);
      case ChainDataSourceConfig_EsploraWithHeaders()
          when esploraWithHeaders != null:
        return esploraWithHeaders(_that);
      case ChainDataSourceConfig_Electrum() when electrum != null:
        return electrum(_that);
      case ChainDataSourceConfig_BitcoindRpc() when bitcoindRpc != null:
        return bitcoindRpc(_that);
      case ChainDataSourceConfig_BitcoindRest() when bitcoindRest != null:
        return bitcoindRest(_that);
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
    TResult Function(String serverUrl, EsploraSyncConfig? syncConfig)? esplora,
    TResult Function(String serverUrl, EsploraSyncConfig? syncConfig,
            Map<String, String> headers)?
        esploraWithHeaders,
    TResult Function(String serverUrl, ElectrumSyncConfig? syncConfig)?
        electrum,
    TResult Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRpc,
    TResult Function(String restHost, int restPort, String rpcHost, int rpcPort,
            String rpcUser, String rpcPassword)?
        bitcoindRest,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ChainDataSourceConfig_Esplora() when esplora != null:
        return esplora(_that.serverUrl, _that.syncConfig);
      case ChainDataSourceConfig_EsploraWithHeaders()
          when esploraWithHeaders != null:
        return esploraWithHeaders(
            _that.serverUrl, _that.syncConfig, _that.headers);
      case ChainDataSourceConfig_Electrum() when electrum != null:
        return electrum(_that.serverUrl, _that.syncConfig);
      case ChainDataSourceConfig_BitcoindRpc() when bitcoindRpc != null:
        return bitcoindRpc(
            _that.rpcHost, _that.rpcPort, _that.rpcUser, _that.rpcPassword);
      case ChainDataSourceConfig_BitcoindRest() when bitcoindRest != null:
        return bitcoindRest(_that.restHost, _that.restPort, _that.rpcHost,
            _that.rpcPort, _that.rpcUser, _that.rpcPassword);
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
    required TResult Function(String serverUrl, EsploraSyncConfig? syncConfig)
        esplora,
    required TResult Function(String serverUrl, EsploraSyncConfig? syncConfig,
            Map<String, String> headers)
        esploraWithHeaders,
    required TResult Function(String serverUrl, ElectrumSyncConfig? syncConfig)
        electrum,
    required TResult Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)
        bitcoindRpc,
    required TResult Function(String restHost, int restPort, String rpcHost,
            int rpcPort, String rpcUser, String rpcPassword)
        bitcoindRest,
  }) {
    final _that = this;
    switch (_that) {
      case ChainDataSourceConfig_Esplora():
        return esplora(_that.serverUrl, _that.syncConfig);
      case ChainDataSourceConfig_EsploraWithHeaders():
        return esploraWithHeaders(
            _that.serverUrl, _that.syncConfig, _that.headers);
      case ChainDataSourceConfig_Electrum():
        return electrum(_that.serverUrl, _that.syncConfig);
      case ChainDataSourceConfig_BitcoindRpc():
        return bitcoindRpc(
            _that.rpcHost, _that.rpcPort, _that.rpcUser, _that.rpcPassword);
      case ChainDataSourceConfig_BitcoindRest():
        return bitcoindRest(_that.restHost, _that.restPort, _that.rpcHost,
            _that.rpcPort, _that.rpcUser, _that.rpcPassword);
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
    TResult? Function(String serverUrl, EsploraSyncConfig? syncConfig)? esplora,
    TResult? Function(String serverUrl, EsploraSyncConfig? syncConfig,
            Map<String, String> headers)?
        esploraWithHeaders,
    TResult? Function(String serverUrl, ElectrumSyncConfig? syncConfig)?
        electrum,
    TResult? Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRpc,
    TResult? Function(String restHost, int restPort, String rpcHost,
            int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRest,
  }) {
    final _that = this;
    switch (_that) {
      case ChainDataSourceConfig_Esplora() when esplora != null:
        return esplora(_that.serverUrl, _that.syncConfig);
      case ChainDataSourceConfig_EsploraWithHeaders()
          when esploraWithHeaders != null:
        return esploraWithHeaders(
            _that.serverUrl, _that.syncConfig, _that.headers);
      case ChainDataSourceConfig_Electrum() when electrum != null:
        return electrum(_that.serverUrl, _that.syncConfig);
      case ChainDataSourceConfig_BitcoindRpc() when bitcoindRpc != null:
        return bitcoindRpc(
            _that.rpcHost, _that.rpcPort, _that.rpcUser, _that.rpcPassword);
      case ChainDataSourceConfig_BitcoindRest() when bitcoindRest != null:
        return bitcoindRest(_that.restHost, _that.restPort, _that.rpcHost,
            _that.rpcPort, _that.rpcUser, _that.rpcPassword);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ChainDataSourceConfig_Esplora extends ChainDataSourceConfig {
  const ChainDataSourceConfig_Esplora(
      {required this.serverUrl, this.syncConfig})
      : super._();

  final String serverUrl;
  final EsploraSyncConfig? syncConfig;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChainDataSourceConfig_EsploraCopyWith<ChainDataSourceConfig_Esplora>
      get copyWith => _$ChainDataSourceConfig_EsploraCopyWithImpl<
          ChainDataSourceConfig_Esplora>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChainDataSourceConfig_Esplora &&
            (identical(other.serverUrl, serverUrl) ||
                other.serverUrl == serverUrl) &&
            (identical(other.syncConfig, syncConfig) ||
                other.syncConfig == syncConfig));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serverUrl, syncConfig);

  @override
  String toString() {
    return 'ChainDataSourceConfig.esplora(serverUrl: $serverUrl, syncConfig: $syncConfig)';
  }
}

/// @nodoc
abstract mixin class $ChainDataSourceConfig_EsploraCopyWith<$Res>
    implements $ChainDataSourceConfigCopyWith<$Res> {
  factory $ChainDataSourceConfig_EsploraCopyWith(
          ChainDataSourceConfig_Esplora value,
          $Res Function(ChainDataSourceConfig_Esplora) _then) =
      _$ChainDataSourceConfig_EsploraCopyWithImpl;
  @useResult
  $Res call({String serverUrl, EsploraSyncConfig? syncConfig});
}

/// @nodoc
class _$ChainDataSourceConfig_EsploraCopyWithImpl<$Res>
    implements $ChainDataSourceConfig_EsploraCopyWith<$Res> {
  _$ChainDataSourceConfig_EsploraCopyWithImpl(this._self, this._then);

  final ChainDataSourceConfig_Esplora _self;
  final $Res Function(ChainDataSourceConfig_Esplora) _then;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serverUrl = null,
    Object? syncConfig = freezed,
  }) {
    return _then(ChainDataSourceConfig_Esplora(
      serverUrl: null == serverUrl
          ? _self.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      syncConfig: freezed == syncConfig
          ? _self.syncConfig
          : syncConfig // ignore: cast_nullable_to_non_nullable
              as EsploraSyncConfig?,
    ));
  }
}

/// @nodoc

class ChainDataSourceConfig_EsploraWithHeaders extends ChainDataSourceConfig {
  const ChainDataSourceConfig_EsploraWithHeaders(
      {required this.serverUrl,
      this.syncConfig,
      required final Map<String, String> headers})
      : _headers = headers,
        super._();

  final String serverUrl;
  final EsploraSyncConfig? syncConfig;
  final Map<String, String> _headers;
  Map<String, String> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChainDataSourceConfig_EsploraWithHeadersCopyWith<
          ChainDataSourceConfig_EsploraWithHeaders>
      get copyWith => _$ChainDataSourceConfig_EsploraWithHeadersCopyWithImpl<
          ChainDataSourceConfig_EsploraWithHeaders>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChainDataSourceConfig_EsploraWithHeaders &&
            (identical(other.serverUrl, serverUrl) ||
                other.serverUrl == serverUrl) &&
            (identical(other.syncConfig, syncConfig) ||
                other.syncConfig == syncConfig) &&
            const DeepCollectionEquality().equals(other._headers, _headers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serverUrl, syncConfig,
      const DeepCollectionEquality().hash(_headers));

  @override
  String toString() {
    return 'ChainDataSourceConfig.esploraWithHeaders(serverUrl: $serverUrl, syncConfig: $syncConfig, headers: $headers)';
  }
}

/// @nodoc
abstract mixin class $ChainDataSourceConfig_EsploraWithHeadersCopyWith<$Res>
    implements $ChainDataSourceConfigCopyWith<$Res> {
  factory $ChainDataSourceConfig_EsploraWithHeadersCopyWith(
          ChainDataSourceConfig_EsploraWithHeaders value,
          $Res Function(ChainDataSourceConfig_EsploraWithHeaders) _then) =
      _$ChainDataSourceConfig_EsploraWithHeadersCopyWithImpl;
  @useResult
  $Res call(
      {String serverUrl,
      EsploraSyncConfig? syncConfig,
      Map<String, String> headers});
}

/// @nodoc
class _$ChainDataSourceConfig_EsploraWithHeadersCopyWithImpl<$Res>
    implements $ChainDataSourceConfig_EsploraWithHeadersCopyWith<$Res> {
  _$ChainDataSourceConfig_EsploraWithHeadersCopyWithImpl(
      this._self, this._then);

  final ChainDataSourceConfig_EsploraWithHeaders _self;
  final $Res Function(ChainDataSourceConfig_EsploraWithHeaders) _then;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serverUrl = null,
    Object? syncConfig = freezed,
    Object? headers = null,
  }) {
    return _then(ChainDataSourceConfig_EsploraWithHeaders(
      serverUrl: null == serverUrl
          ? _self.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      syncConfig: freezed == syncConfig
          ? _self.syncConfig
          : syncConfig // ignore: cast_nullable_to_non_nullable
              as EsploraSyncConfig?,
      headers: null == headers
          ? _self._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class ChainDataSourceConfig_Electrum extends ChainDataSourceConfig {
  const ChainDataSourceConfig_Electrum(
      {required this.serverUrl, this.syncConfig})
      : super._();

  final String serverUrl;
  final ElectrumSyncConfig? syncConfig;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChainDataSourceConfig_ElectrumCopyWith<ChainDataSourceConfig_Electrum>
      get copyWith => _$ChainDataSourceConfig_ElectrumCopyWithImpl<
          ChainDataSourceConfig_Electrum>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChainDataSourceConfig_Electrum &&
            (identical(other.serverUrl, serverUrl) ||
                other.serverUrl == serverUrl) &&
            (identical(other.syncConfig, syncConfig) ||
                other.syncConfig == syncConfig));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serverUrl, syncConfig);

  @override
  String toString() {
    return 'ChainDataSourceConfig.electrum(serverUrl: $serverUrl, syncConfig: $syncConfig)';
  }
}

/// @nodoc
abstract mixin class $ChainDataSourceConfig_ElectrumCopyWith<$Res>
    implements $ChainDataSourceConfigCopyWith<$Res> {
  factory $ChainDataSourceConfig_ElectrumCopyWith(
          ChainDataSourceConfig_Electrum value,
          $Res Function(ChainDataSourceConfig_Electrum) _then) =
      _$ChainDataSourceConfig_ElectrumCopyWithImpl;
  @useResult
  $Res call({String serverUrl, ElectrumSyncConfig? syncConfig});
}

/// @nodoc
class _$ChainDataSourceConfig_ElectrumCopyWithImpl<$Res>
    implements $ChainDataSourceConfig_ElectrumCopyWith<$Res> {
  _$ChainDataSourceConfig_ElectrumCopyWithImpl(this._self, this._then);

  final ChainDataSourceConfig_Electrum _self;
  final $Res Function(ChainDataSourceConfig_Electrum) _then;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serverUrl = null,
    Object? syncConfig = freezed,
  }) {
    return _then(ChainDataSourceConfig_Electrum(
      serverUrl: null == serverUrl
          ? _self.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      syncConfig: freezed == syncConfig
          ? _self.syncConfig
          : syncConfig // ignore: cast_nullable_to_non_nullable
              as ElectrumSyncConfig?,
    ));
  }
}

/// @nodoc

class ChainDataSourceConfig_BitcoindRpc extends ChainDataSourceConfig {
  const ChainDataSourceConfig_BitcoindRpc(
      {required this.rpcHost,
      required this.rpcPort,
      required this.rpcUser,
      required this.rpcPassword})
      : super._();

  final String rpcHost;
  final int rpcPort;
  final String rpcUser;
  final String rpcPassword;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChainDataSourceConfig_BitcoindRpcCopyWith<ChainDataSourceConfig_BitcoindRpc>
      get copyWith => _$ChainDataSourceConfig_BitcoindRpcCopyWithImpl<
          ChainDataSourceConfig_BitcoindRpc>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChainDataSourceConfig_BitcoindRpc &&
            (identical(other.rpcHost, rpcHost) || other.rpcHost == rpcHost) &&
            (identical(other.rpcPort, rpcPort) || other.rpcPort == rpcPort) &&
            (identical(other.rpcUser, rpcUser) || other.rpcUser == rpcUser) &&
            (identical(other.rpcPassword, rpcPassword) ||
                other.rpcPassword == rpcPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, rpcHost, rpcPort, rpcUser, rpcPassword);

  @override
  String toString() {
    return 'ChainDataSourceConfig.bitcoindRpc(rpcHost: $rpcHost, rpcPort: $rpcPort, rpcUser: $rpcUser, rpcPassword: $rpcPassword)';
  }
}

/// @nodoc
abstract mixin class $ChainDataSourceConfig_BitcoindRpcCopyWith<$Res>
    implements $ChainDataSourceConfigCopyWith<$Res> {
  factory $ChainDataSourceConfig_BitcoindRpcCopyWith(
          ChainDataSourceConfig_BitcoindRpc value,
          $Res Function(ChainDataSourceConfig_BitcoindRpc) _then) =
      _$ChainDataSourceConfig_BitcoindRpcCopyWithImpl;
  @useResult
  $Res call({String rpcHost, int rpcPort, String rpcUser, String rpcPassword});
}

/// @nodoc
class _$ChainDataSourceConfig_BitcoindRpcCopyWithImpl<$Res>
    implements $ChainDataSourceConfig_BitcoindRpcCopyWith<$Res> {
  _$ChainDataSourceConfig_BitcoindRpcCopyWithImpl(this._self, this._then);

  final ChainDataSourceConfig_BitcoindRpc _self;
  final $Res Function(ChainDataSourceConfig_BitcoindRpc) _then;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rpcHost = null,
    Object? rpcPort = null,
    Object? rpcUser = null,
    Object? rpcPassword = null,
  }) {
    return _then(ChainDataSourceConfig_BitcoindRpc(
      rpcHost: null == rpcHost
          ? _self.rpcHost
          : rpcHost // ignore: cast_nullable_to_non_nullable
              as String,
      rpcPort: null == rpcPort
          ? _self.rpcPort
          : rpcPort // ignore: cast_nullable_to_non_nullable
              as int,
      rpcUser: null == rpcUser
          ? _self.rpcUser
          : rpcUser // ignore: cast_nullable_to_non_nullable
              as String,
      rpcPassword: null == rpcPassword
          ? _self.rpcPassword
          : rpcPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ChainDataSourceConfig_BitcoindRest extends ChainDataSourceConfig {
  const ChainDataSourceConfig_BitcoindRest(
      {required this.restHost,
      required this.restPort,
      required this.rpcHost,
      required this.rpcPort,
      required this.rpcUser,
      required this.rpcPassword})
      : super._();

  final String restHost;
  final int restPort;
  final String rpcHost;
  final int rpcPort;
  final String rpcUser;
  final String rpcPassword;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChainDataSourceConfig_BitcoindRestCopyWith<
          ChainDataSourceConfig_BitcoindRest>
      get copyWith => _$ChainDataSourceConfig_BitcoindRestCopyWithImpl<
          ChainDataSourceConfig_BitcoindRest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChainDataSourceConfig_BitcoindRest &&
            (identical(other.restHost, restHost) ||
                other.restHost == restHost) &&
            (identical(other.restPort, restPort) ||
                other.restPort == restPort) &&
            (identical(other.rpcHost, rpcHost) || other.rpcHost == rpcHost) &&
            (identical(other.rpcPort, rpcPort) || other.rpcPort == rpcPort) &&
            (identical(other.rpcUser, rpcUser) || other.rpcUser == rpcUser) &&
            (identical(other.rpcPassword, rpcPassword) ||
                other.rpcPassword == rpcPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, restHost, restPort, rpcHost, rpcPort, rpcUser, rpcPassword);

  @override
  String toString() {
    return 'ChainDataSourceConfig.bitcoindRest(restHost: $restHost, restPort: $restPort, rpcHost: $rpcHost, rpcPort: $rpcPort, rpcUser: $rpcUser, rpcPassword: $rpcPassword)';
  }
}

/// @nodoc
abstract mixin class $ChainDataSourceConfig_BitcoindRestCopyWith<$Res>
    implements $ChainDataSourceConfigCopyWith<$Res> {
  factory $ChainDataSourceConfig_BitcoindRestCopyWith(
          ChainDataSourceConfig_BitcoindRest value,
          $Res Function(ChainDataSourceConfig_BitcoindRest) _then) =
      _$ChainDataSourceConfig_BitcoindRestCopyWithImpl;
  @useResult
  $Res call(
      {String restHost,
      int restPort,
      String rpcHost,
      int rpcPort,
      String rpcUser,
      String rpcPassword});
}

/// @nodoc
class _$ChainDataSourceConfig_BitcoindRestCopyWithImpl<$Res>
    implements $ChainDataSourceConfig_BitcoindRestCopyWith<$Res> {
  _$ChainDataSourceConfig_BitcoindRestCopyWithImpl(this._self, this._then);

  final ChainDataSourceConfig_BitcoindRest _self;
  final $Res Function(ChainDataSourceConfig_BitcoindRest) _then;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? restHost = null,
    Object? restPort = null,
    Object? rpcHost = null,
    Object? rpcPort = null,
    Object? rpcUser = null,
    Object? rpcPassword = null,
  }) {
    return _then(ChainDataSourceConfig_BitcoindRest(
      restHost: null == restHost
          ? _self.restHost
          : restHost // ignore: cast_nullable_to_non_nullable
              as String,
      restPort: null == restPort
          ? _self.restPort
          : restPort // ignore: cast_nullable_to_non_nullable
              as int,
      rpcHost: null == rpcHost
          ? _self.rpcHost
          : rpcHost // ignore: cast_nullable_to_non_nullable
              as String,
      rpcPort: null == rpcPort
          ? _self.rpcPort
          : rpcPort // ignore: cast_nullable_to_non_nullable
              as int,
      rpcUser: null == rpcUser
          ? _self.rpcUser
          : rpcUser // ignore: cast_nullable_to_non_nullable
              as String,
      rpcPassword: null == rpcPassword
          ? _self.rpcPassword
          : rpcPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ClosureReason {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClosureReason);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason()';
  }
}

/// @nodoc
class $ClosureReasonCopyWith<$Res> {
  $ClosureReasonCopyWith(ClosureReason _, $Res Function(ClosureReason) __);
}

/// Adds pattern-matching-related methods to [ClosureReason].
extension ClosureReasonPatterns on ClosureReason {
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
    TResult Function(ClosureReason_PeerFeerateTooLow value)? peerFeerateTooLow,
    TResult Function(ClosureReason_CounterpartyForceClosed value)?
        counterpartyForceClosed,
    TResult Function(ClosureReason_HolderForceClosed value)? holderForceClosed,
    TResult Function(ClosureReason_LegacyCooperativeClosure value)?
        legacyCooperativeClosure,
    TResult Function(
            ClosureReason_CounterpartyInitiatedCooperativeClosure value)?
        counterpartyInitiatedCooperativeClosure,
    TResult Function(ClosureReason_LocallyInitiatedCooperativeClosure value)?
        locallyInitiatedCooperativeClosure,
    TResult Function(ClosureReason_CommitmentTxConfirmed value)?
        commitmentTxConfirmed,
    TResult Function(ClosureReason_FundingTimedOut value)? fundingTimedOut,
    TResult Function(ClosureReason_ProcessingError value)? processingError,
    TResult Function(ClosureReason_DisconnectedPeer value)? disconnectedPeer,
    TResult Function(ClosureReason_OutdatedChannelManager value)?
        outdatedChannelManager,
    TResult Function(ClosureReason_CounterpartyCoopClosedUnfundedChannel value)?
        counterpartyCoopClosedUnfundedChannel,
    TResult Function(ClosureReason_FundingBatchClosure value)?
        fundingBatchClosure,
    TResult Function(ClosureReason_HTLCsTimedOut value)? htlCsTimedOut,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ClosureReason_PeerFeerateTooLow() when peerFeerateTooLow != null:
        return peerFeerateTooLow(_that);
      case ClosureReason_CounterpartyForceClosed()
          when counterpartyForceClosed != null:
        return counterpartyForceClosed(_that);
      case ClosureReason_HolderForceClosed() when holderForceClosed != null:
        return holderForceClosed(_that);
      case ClosureReason_LegacyCooperativeClosure()
          when legacyCooperativeClosure != null:
        return legacyCooperativeClosure(_that);
      case ClosureReason_CounterpartyInitiatedCooperativeClosure()
          when counterpartyInitiatedCooperativeClosure != null:
        return counterpartyInitiatedCooperativeClosure(_that);
      case ClosureReason_LocallyInitiatedCooperativeClosure()
          when locallyInitiatedCooperativeClosure != null:
        return locallyInitiatedCooperativeClosure(_that);
      case ClosureReason_CommitmentTxConfirmed()
          when commitmentTxConfirmed != null:
        return commitmentTxConfirmed(_that);
      case ClosureReason_FundingTimedOut() when fundingTimedOut != null:
        return fundingTimedOut(_that);
      case ClosureReason_ProcessingError() when processingError != null:
        return processingError(_that);
      case ClosureReason_DisconnectedPeer() when disconnectedPeer != null:
        return disconnectedPeer(_that);
      case ClosureReason_OutdatedChannelManager()
          when outdatedChannelManager != null:
        return outdatedChannelManager(_that);
      case ClosureReason_CounterpartyCoopClosedUnfundedChannel()
          when counterpartyCoopClosedUnfundedChannel != null:
        return counterpartyCoopClosedUnfundedChannel(_that);
      case ClosureReason_FundingBatchClosure() when fundingBatchClosure != null:
        return fundingBatchClosure(_that);
      case ClosureReason_HTLCsTimedOut() when htlCsTimedOut != null:
        return htlCsTimedOut(_that);
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
    required TResult Function(ClosureReason_PeerFeerateTooLow value)
        peerFeerateTooLow,
    required TResult Function(ClosureReason_CounterpartyForceClosed value)
        counterpartyForceClosed,
    required TResult Function(ClosureReason_HolderForceClosed value)
        holderForceClosed,
    required TResult Function(ClosureReason_LegacyCooperativeClosure value)
        legacyCooperativeClosure,
    required TResult Function(
            ClosureReason_CounterpartyInitiatedCooperativeClosure value)
        counterpartyInitiatedCooperativeClosure,
    required TResult Function(
            ClosureReason_LocallyInitiatedCooperativeClosure value)
        locallyInitiatedCooperativeClosure,
    required TResult Function(ClosureReason_CommitmentTxConfirmed value)
        commitmentTxConfirmed,
    required TResult Function(ClosureReason_FundingTimedOut value)
        fundingTimedOut,
    required TResult Function(ClosureReason_ProcessingError value)
        processingError,
    required TResult Function(ClosureReason_DisconnectedPeer value)
        disconnectedPeer,
    required TResult Function(ClosureReason_OutdatedChannelManager value)
        outdatedChannelManager,
    required TResult Function(
            ClosureReason_CounterpartyCoopClosedUnfundedChannel value)
        counterpartyCoopClosedUnfundedChannel,
    required TResult Function(ClosureReason_FundingBatchClosure value)
        fundingBatchClosure,
    required TResult Function(ClosureReason_HTLCsTimedOut value) htlCsTimedOut,
  }) {
    final _that = this;
    switch (_that) {
      case ClosureReason_PeerFeerateTooLow():
        return peerFeerateTooLow(_that);
      case ClosureReason_CounterpartyForceClosed():
        return counterpartyForceClosed(_that);
      case ClosureReason_HolderForceClosed():
        return holderForceClosed(_that);
      case ClosureReason_LegacyCooperativeClosure():
        return legacyCooperativeClosure(_that);
      case ClosureReason_CounterpartyInitiatedCooperativeClosure():
        return counterpartyInitiatedCooperativeClosure(_that);
      case ClosureReason_LocallyInitiatedCooperativeClosure():
        return locallyInitiatedCooperativeClosure(_that);
      case ClosureReason_CommitmentTxConfirmed():
        return commitmentTxConfirmed(_that);
      case ClosureReason_FundingTimedOut():
        return fundingTimedOut(_that);
      case ClosureReason_ProcessingError():
        return processingError(_that);
      case ClosureReason_DisconnectedPeer():
        return disconnectedPeer(_that);
      case ClosureReason_OutdatedChannelManager():
        return outdatedChannelManager(_that);
      case ClosureReason_CounterpartyCoopClosedUnfundedChannel():
        return counterpartyCoopClosedUnfundedChannel(_that);
      case ClosureReason_FundingBatchClosure():
        return fundingBatchClosure(_that);
      case ClosureReason_HTLCsTimedOut():
        return htlCsTimedOut(_that);
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
    TResult? Function(ClosureReason_PeerFeerateTooLow value)? peerFeerateTooLow,
    TResult? Function(ClosureReason_CounterpartyForceClosed value)?
        counterpartyForceClosed,
    TResult? Function(ClosureReason_HolderForceClosed value)? holderForceClosed,
    TResult? Function(ClosureReason_LegacyCooperativeClosure value)?
        legacyCooperativeClosure,
    TResult? Function(
            ClosureReason_CounterpartyInitiatedCooperativeClosure value)?
        counterpartyInitiatedCooperativeClosure,
    TResult? Function(ClosureReason_LocallyInitiatedCooperativeClosure value)?
        locallyInitiatedCooperativeClosure,
    TResult? Function(ClosureReason_CommitmentTxConfirmed value)?
        commitmentTxConfirmed,
    TResult? Function(ClosureReason_FundingTimedOut value)? fundingTimedOut,
    TResult? Function(ClosureReason_ProcessingError value)? processingError,
    TResult? Function(ClosureReason_DisconnectedPeer value)? disconnectedPeer,
    TResult? Function(ClosureReason_OutdatedChannelManager value)?
        outdatedChannelManager,
    TResult? Function(
            ClosureReason_CounterpartyCoopClosedUnfundedChannel value)?
        counterpartyCoopClosedUnfundedChannel,
    TResult? Function(ClosureReason_FundingBatchClosure value)?
        fundingBatchClosure,
    TResult? Function(ClosureReason_HTLCsTimedOut value)? htlCsTimedOut,
  }) {
    final _that = this;
    switch (_that) {
      case ClosureReason_PeerFeerateTooLow() when peerFeerateTooLow != null:
        return peerFeerateTooLow(_that);
      case ClosureReason_CounterpartyForceClosed()
          when counterpartyForceClosed != null:
        return counterpartyForceClosed(_that);
      case ClosureReason_HolderForceClosed() when holderForceClosed != null:
        return holderForceClosed(_that);
      case ClosureReason_LegacyCooperativeClosure()
          when legacyCooperativeClosure != null:
        return legacyCooperativeClosure(_that);
      case ClosureReason_CounterpartyInitiatedCooperativeClosure()
          when counterpartyInitiatedCooperativeClosure != null:
        return counterpartyInitiatedCooperativeClosure(_that);
      case ClosureReason_LocallyInitiatedCooperativeClosure()
          when locallyInitiatedCooperativeClosure != null:
        return locallyInitiatedCooperativeClosure(_that);
      case ClosureReason_CommitmentTxConfirmed()
          when commitmentTxConfirmed != null:
        return commitmentTxConfirmed(_that);
      case ClosureReason_FundingTimedOut() when fundingTimedOut != null:
        return fundingTimedOut(_that);
      case ClosureReason_ProcessingError() when processingError != null:
        return processingError(_that);
      case ClosureReason_DisconnectedPeer() when disconnectedPeer != null:
        return disconnectedPeer(_that);
      case ClosureReason_OutdatedChannelManager()
          when outdatedChannelManager != null:
        return outdatedChannelManager(_that);
      case ClosureReason_CounterpartyCoopClosedUnfundedChannel()
          when counterpartyCoopClosedUnfundedChannel != null:
        return counterpartyCoopClosedUnfundedChannel(_that);
      case ClosureReason_FundingBatchClosure() when fundingBatchClosure != null:
        return fundingBatchClosure(_that);
      case ClosureReason_HTLCsTimedOut() when htlCsTimedOut != null:
        return htlCsTimedOut(_that);
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
    TResult Function(int peerFeerateSatPerKw, int requiredFeerateSatPerKw)?
        peerFeerateTooLow,
    TResult Function(String peerMsg)? counterpartyForceClosed,
    TResult Function(bool? broadcastedLatestTxn)? holderForceClosed,
    TResult Function()? legacyCooperativeClosure,
    TResult Function()? counterpartyInitiatedCooperativeClosure,
    TResult Function()? locallyInitiatedCooperativeClosure,
    TResult Function()? commitmentTxConfirmed,
    TResult Function()? fundingTimedOut,
    TResult Function(String err)? processingError,
    TResult Function()? disconnectedPeer,
    TResult Function()? outdatedChannelManager,
    TResult Function()? counterpartyCoopClosedUnfundedChannel,
    TResult Function()? fundingBatchClosure,
    TResult Function()? htlCsTimedOut,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ClosureReason_PeerFeerateTooLow() when peerFeerateTooLow != null:
        return peerFeerateTooLow(
            _that.peerFeerateSatPerKw, _that.requiredFeerateSatPerKw);
      case ClosureReason_CounterpartyForceClosed()
          when counterpartyForceClosed != null:
        return counterpartyForceClosed(_that.peerMsg);
      case ClosureReason_HolderForceClosed() when holderForceClosed != null:
        return holderForceClosed(_that.broadcastedLatestTxn);
      case ClosureReason_LegacyCooperativeClosure()
          when legacyCooperativeClosure != null:
        return legacyCooperativeClosure();
      case ClosureReason_CounterpartyInitiatedCooperativeClosure()
          when counterpartyInitiatedCooperativeClosure != null:
        return counterpartyInitiatedCooperativeClosure();
      case ClosureReason_LocallyInitiatedCooperativeClosure()
          when locallyInitiatedCooperativeClosure != null:
        return locallyInitiatedCooperativeClosure();
      case ClosureReason_CommitmentTxConfirmed()
          when commitmentTxConfirmed != null:
        return commitmentTxConfirmed();
      case ClosureReason_FundingTimedOut() when fundingTimedOut != null:
        return fundingTimedOut();
      case ClosureReason_ProcessingError() when processingError != null:
        return processingError(_that.err);
      case ClosureReason_DisconnectedPeer() when disconnectedPeer != null:
        return disconnectedPeer();
      case ClosureReason_OutdatedChannelManager()
          when outdatedChannelManager != null:
        return outdatedChannelManager();
      case ClosureReason_CounterpartyCoopClosedUnfundedChannel()
          when counterpartyCoopClosedUnfundedChannel != null:
        return counterpartyCoopClosedUnfundedChannel();
      case ClosureReason_FundingBatchClosure() when fundingBatchClosure != null:
        return fundingBatchClosure();
      case ClosureReason_HTLCsTimedOut() when htlCsTimedOut != null:
        return htlCsTimedOut();
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
    required TResult Function(
            int peerFeerateSatPerKw, int requiredFeerateSatPerKw)
        peerFeerateTooLow,
    required TResult Function(String peerMsg) counterpartyForceClosed,
    required TResult Function(bool? broadcastedLatestTxn) holderForceClosed,
    required TResult Function() legacyCooperativeClosure,
    required TResult Function() counterpartyInitiatedCooperativeClosure,
    required TResult Function() locallyInitiatedCooperativeClosure,
    required TResult Function() commitmentTxConfirmed,
    required TResult Function() fundingTimedOut,
    required TResult Function(String err) processingError,
    required TResult Function() disconnectedPeer,
    required TResult Function() outdatedChannelManager,
    required TResult Function() counterpartyCoopClosedUnfundedChannel,
    required TResult Function() fundingBatchClosure,
    required TResult Function() htlCsTimedOut,
  }) {
    final _that = this;
    switch (_that) {
      case ClosureReason_PeerFeerateTooLow():
        return peerFeerateTooLow(
            _that.peerFeerateSatPerKw, _that.requiredFeerateSatPerKw);
      case ClosureReason_CounterpartyForceClosed():
        return counterpartyForceClosed(_that.peerMsg);
      case ClosureReason_HolderForceClosed():
        return holderForceClosed(_that.broadcastedLatestTxn);
      case ClosureReason_LegacyCooperativeClosure():
        return legacyCooperativeClosure();
      case ClosureReason_CounterpartyInitiatedCooperativeClosure():
        return counterpartyInitiatedCooperativeClosure();
      case ClosureReason_LocallyInitiatedCooperativeClosure():
        return locallyInitiatedCooperativeClosure();
      case ClosureReason_CommitmentTxConfirmed():
        return commitmentTxConfirmed();
      case ClosureReason_FundingTimedOut():
        return fundingTimedOut();
      case ClosureReason_ProcessingError():
        return processingError(_that.err);
      case ClosureReason_DisconnectedPeer():
        return disconnectedPeer();
      case ClosureReason_OutdatedChannelManager():
        return outdatedChannelManager();
      case ClosureReason_CounterpartyCoopClosedUnfundedChannel():
        return counterpartyCoopClosedUnfundedChannel();
      case ClosureReason_FundingBatchClosure():
        return fundingBatchClosure();
      case ClosureReason_HTLCsTimedOut():
        return htlCsTimedOut();
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
    TResult? Function(int peerFeerateSatPerKw, int requiredFeerateSatPerKw)?
        peerFeerateTooLow,
    TResult? Function(String peerMsg)? counterpartyForceClosed,
    TResult? Function(bool? broadcastedLatestTxn)? holderForceClosed,
    TResult? Function()? legacyCooperativeClosure,
    TResult? Function()? counterpartyInitiatedCooperativeClosure,
    TResult? Function()? locallyInitiatedCooperativeClosure,
    TResult? Function()? commitmentTxConfirmed,
    TResult? Function()? fundingTimedOut,
    TResult? Function(String err)? processingError,
    TResult? Function()? disconnectedPeer,
    TResult? Function()? outdatedChannelManager,
    TResult? Function()? counterpartyCoopClosedUnfundedChannel,
    TResult? Function()? fundingBatchClosure,
    TResult? Function()? htlCsTimedOut,
  }) {
    final _that = this;
    switch (_that) {
      case ClosureReason_PeerFeerateTooLow() when peerFeerateTooLow != null:
        return peerFeerateTooLow(
            _that.peerFeerateSatPerKw, _that.requiredFeerateSatPerKw);
      case ClosureReason_CounterpartyForceClosed()
          when counterpartyForceClosed != null:
        return counterpartyForceClosed(_that.peerMsg);
      case ClosureReason_HolderForceClosed() when holderForceClosed != null:
        return holderForceClosed(_that.broadcastedLatestTxn);
      case ClosureReason_LegacyCooperativeClosure()
          when legacyCooperativeClosure != null:
        return legacyCooperativeClosure();
      case ClosureReason_CounterpartyInitiatedCooperativeClosure()
          when counterpartyInitiatedCooperativeClosure != null:
        return counterpartyInitiatedCooperativeClosure();
      case ClosureReason_LocallyInitiatedCooperativeClosure()
          when locallyInitiatedCooperativeClosure != null:
        return locallyInitiatedCooperativeClosure();
      case ClosureReason_CommitmentTxConfirmed()
          when commitmentTxConfirmed != null:
        return commitmentTxConfirmed();
      case ClosureReason_FundingTimedOut() when fundingTimedOut != null:
        return fundingTimedOut();
      case ClosureReason_ProcessingError() when processingError != null:
        return processingError(_that.err);
      case ClosureReason_DisconnectedPeer() when disconnectedPeer != null:
        return disconnectedPeer();
      case ClosureReason_OutdatedChannelManager()
          when outdatedChannelManager != null:
        return outdatedChannelManager();
      case ClosureReason_CounterpartyCoopClosedUnfundedChannel()
          when counterpartyCoopClosedUnfundedChannel != null:
        return counterpartyCoopClosedUnfundedChannel();
      case ClosureReason_FundingBatchClosure() when fundingBatchClosure != null:
        return fundingBatchClosure();
      case ClosureReason_HTLCsTimedOut() when htlCsTimedOut != null:
        return htlCsTimedOut();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ClosureReason_PeerFeerateTooLow extends ClosureReason {
  const ClosureReason_PeerFeerateTooLow(
      {required this.peerFeerateSatPerKw,
      required this.requiredFeerateSatPerKw})
      : super._();

  final int peerFeerateSatPerKw;
  final int requiredFeerateSatPerKw;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClosureReason_PeerFeerateTooLowCopyWith<ClosureReason_PeerFeerateTooLow>
      get copyWith => _$ClosureReason_PeerFeerateTooLowCopyWithImpl<
          ClosureReason_PeerFeerateTooLow>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_PeerFeerateTooLow &&
            (identical(other.peerFeerateSatPerKw, peerFeerateSatPerKw) ||
                other.peerFeerateSatPerKw == peerFeerateSatPerKw) &&
            (identical(
                    other.requiredFeerateSatPerKw, requiredFeerateSatPerKw) ||
                other.requiredFeerateSatPerKw == requiredFeerateSatPerKw));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, peerFeerateSatPerKw, requiredFeerateSatPerKw);

  @override
  String toString() {
    return 'ClosureReason.peerFeerateTooLow(peerFeerateSatPerKw: $peerFeerateSatPerKw, requiredFeerateSatPerKw: $requiredFeerateSatPerKw)';
  }
}

/// @nodoc
abstract mixin class $ClosureReason_PeerFeerateTooLowCopyWith<$Res>
    implements $ClosureReasonCopyWith<$Res> {
  factory $ClosureReason_PeerFeerateTooLowCopyWith(
          ClosureReason_PeerFeerateTooLow value,
          $Res Function(ClosureReason_PeerFeerateTooLow) _then) =
      _$ClosureReason_PeerFeerateTooLowCopyWithImpl;
  @useResult
  $Res call({int peerFeerateSatPerKw, int requiredFeerateSatPerKw});
}

/// @nodoc
class _$ClosureReason_PeerFeerateTooLowCopyWithImpl<$Res>
    implements $ClosureReason_PeerFeerateTooLowCopyWith<$Res> {
  _$ClosureReason_PeerFeerateTooLowCopyWithImpl(this._self, this._then);

  final ClosureReason_PeerFeerateTooLow _self;
  final $Res Function(ClosureReason_PeerFeerateTooLow) _then;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? peerFeerateSatPerKw = null,
    Object? requiredFeerateSatPerKw = null,
  }) {
    return _then(ClosureReason_PeerFeerateTooLow(
      peerFeerateSatPerKw: null == peerFeerateSatPerKw
          ? _self.peerFeerateSatPerKw
          : peerFeerateSatPerKw // ignore: cast_nullable_to_non_nullable
              as int,
      requiredFeerateSatPerKw: null == requiredFeerateSatPerKw
          ? _self.requiredFeerateSatPerKw
          : requiredFeerateSatPerKw // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ClosureReason_CounterpartyForceClosed extends ClosureReason {
  const ClosureReason_CounterpartyForceClosed({required this.peerMsg})
      : super._();

  /// The error which the peer sent us.
  ///
  /// Be careful about printing the peer_msg, a well-crafted message could exploit
  /// a security vulnerability in the terminal emulator or the logging subsystem.
  /// To be safe, use `Display` on `UntrustedString`
  ///
  /// [`UntrustedString`]: crate::util::string::UntrustedString
  final String peerMsg;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClosureReason_CounterpartyForceClosedCopyWith<
          ClosureReason_CounterpartyForceClosed>
      get copyWith => _$ClosureReason_CounterpartyForceClosedCopyWithImpl<
          ClosureReason_CounterpartyForceClosed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_CounterpartyForceClosed &&
            (identical(other.peerMsg, peerMsg) || other.peerMsg == peerMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, peerMsg);

  @override
  String toString() {
    return 'ClosureReason.counterpartyForceClosed(peerMsg: $peerMsg)';
  }
}

/// @nodoc
abstract mixin class $ClosureReason_CounterpartyForceClosedCopyWith<$Res>
    implements $ClosureReasonCopyWith<$Res> {
  factory $ClosureReason_CounterpartyForceClosedCopyWith(
          ClosureReason_CounterpartyForceClosed value,
          $Res Function(ClosureReason_CounterpartyForceClosed) _then) =
      _$ClosureReason_CounterpartyForceClosedCopyWithImpl;
  @useResult
  $Res call({String peerMsg});
}

/// @nodoc
class _$ClosureReason_CounterpartyForceClosedCopyWithImpl<$Res>
    implements $ClosureReason_CounterpartyForceClosedCopyWith<$Res> {
  _$ClosureReason_CounterpartyForceClosedCopyWithImpl(this._self, this._then);

  final ClosureReason_CounterpartyForceClosed _self;
  final $Res Function(ClosureReason_CounterpartyForceClosed) _then;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? peerMsg = null,
  }) {
    return _then(ClosureReason_CounterpartyForceClosed(
      peerMsg: null == peerMsg
          ? _self.peerMsg
          : peerMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ClosureReason_HolderForceClosed extends ClosureReason {
  const ClosureReason_HolderForceClosed({this.broadcastedLatestTxn})
      : super._();

  final bool? broadcastedLatestTxn;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClosureReason_HolderForceClosedCopyWith<ClosureReason_HolderForceClosed>
      get copyWith => _$ClosureReason_HolderForceClosedCopyWithImpl<
          ClosureReason_HolderForceClosed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_HolderForceClosed &&
            (identical(other.broadcastedLatestTxn, broadcastedLatestTxn) ||
                other.broadcastedLatestTxn == broadcastedLatestTxn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, broadcastedLatestTxn);

  @override
  String toString() {
    return 'ClosureReason.holderForceClosed(broadcastedLatestTxn: $broadcastedLatestTxn)';
  }
}

/// @nodoc
abstract mixin class $ClosureReason_HolderForceClosedCopyWith<$Res>
    implements $ClosureReasonCopyWith<$Res> {
  factory $ClosureReason_HolderForceClosedCopyWith(
          ClosureReason_HolderForceClosed value,
          $Res Function(ClosureReason_HolderForceClosed) _then) =
      _$ClosureReason_HolderForceClosedCopyWithImpl;
  @useResult
  $Res call({bool? broadcastedLatestTxn});
}

/// @nodoc
class _$ClosureReason_HolderForceClosedCopyWithImpl<$Res>
    implements $ClosureReason_HolderForceClosedCopyWith<$Res> {
  _$ClosureReason_HolderForceClosedCopyWithImpl(this._self, this._then);

  final ClosureReason_HolderForceClosed _self;
  final $Res Function(ClosureReason_HolderForceClosed) _then;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? broadcastedLatestTxn = freezed,
  }) {
    return _then(ClosureReason_HolderForceClosed(
      broadcastedLatestTxn: freezed == broadcastedLatestTxn
          ? _self.broadcastedLatestTxn
          : broadcastedLatestTxn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class ClosureReason_LegacyCooperativeClosure extends ClosureReason {
  const ClosureReason_LegacyCooperativeClosure() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_LegacyCooperativeClosure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason.legacyCooperativeClosure()';
  }
}

/// @nodoc

class ClosureReason_CounterpartyInitiatedCooperativeClosure
    extends ClosureReason {
  const ClosureReason_CounterpartyInitiatedCooperativeClosure() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_CounterpartyInitiatedCooperativeClosure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason.counterpartyInitiatedCooperativeClosure()';
  }
}

/// @nodoc

class ClosureReason_LocallyInitiatedCooperativeClosure extends ClosureReason {
  const ClosureReason_LocallyInitiatedCooperativeClosure() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_LocallyInitiatedCooperativeClosure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason.locallyInitiatedCooperativeClosure()';
  }
}

/// @nodoc

class ClosureReason_CommitmentTxConfirmed extends ClosureReason {
  const ClosureReason_CommitmentTxConfirmed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_CommitmentTxConfirmed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason.commitmentTxConfirmed()';
  }
}

/// @nodoc

class ClosureReason_FundingTimedOut extends ClosureReason {
  const ClosureReason_FundingTimedOut() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_FundingTimedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason.fundingTimedOut()';
  }
}

/// @nodoc

class ClosureReason_ProcessingError extends ClosureReason {
  const ClosureReason_ProcessingError({required this.err}) : super._();

  /// A developer-readable error message which we generated.
  final String err;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClosureReason_ProcessingErrorCopyWith<ClosureReason_ProcessingError>
      get copyWith => _$ClosureReason_ProcessingErrorCopyWithImpl<
          ClosureReason_ProcessingError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_ProcessingError &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @override
  String toString() {
    return 'ClosureReason.processingError(err: $err)';
  }
}

/// @nodoc
abstract mixin class $ClosureReason_ProcessingErrorCopyWith<$Res>
    implements $ClosureReasonCopyWith<$Res> {
  factory $ClosureReason_ProcessingErrorCopyWith(
          ClosureReason_ProcessingError value,
          $Res Function(ClosureReason_ProcessingError) _then) =
      _$ClosureReason_ProcessingErrorCopyWithImpl;
  @useResult
  $Res call({String err});
}

/// @nodoc
class _$ClosureReason_ProcessingErrorCopyWithImpl<$Res>
    implements $ClosureReason_ProcessingErrorCopyWith<$Res> {
  _$ClosureReason_ProcessingErrorCopyWithImpl(this._self, this._then);

  final ClosureReason_ProcessingError _self;
  final $Res Function(ClosureReason_ProcessingError) _then;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? err = null,
  }) {
    return _then(ClosureReason_ProcessingError(
      err: null == err
          ? _self.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ClosureReason_DisconnectedPeer extends ClosureReason {
  const ClosureReason_DisconnectedPeer() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_DisconnectedPeer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason.disconnectedPeer()';
  }
}

/// @nodoc

class ClosureReason_OutdatedChannelManager extends ClosureReason {
  const ClosureReason_OutdatedChannelManager() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_OutdatedChannelManager);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason.outdatedChannelManager()';
  }
}

/// @nodoc

class ClosureReason_CounterpartyCoopClosedUnfundedChannel
    extends ClosureReason {
  const ClosureReason_CounterpartyCoopClosedUnfundedChannel() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_CounterpartyCoopClosedUnfundedChannel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason.counterpartyCoopClosedUnfundedChannel()';
  }
}

/// @nodoc

class ClosureReason_FundingBatchClosure extends ClosureReason {
  const ClosureReason_FundingBatchClosure() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_FundingBatchClosure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason.fundingBatchClosure()';
  }
}

/// @nodoc

class ClosureReason_HTLCsTimedOut extends ClosureReason {
  const ClosureReason_HTLCsTimedOut() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosureReason_HTLCsTimedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ClosureReason.htlCsTimedOut()';
  }
}

/// @nodoc
mixin _$ConfirmationStatus {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConfirmationStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConfirmationStatus()';
  }
}

/// @nodoc
class $ConfirmationStatusCopyWith<$Res> {
  $ConfirmationStatusCopyWith(
      ConfirmationStatus _, $Res Function(ConfirmationStatus) __);
}

/// Adds pattern-matching-related methods to [ConfirmationStatus].
extension ConfirmationStatusPatterns on ConfirmationStatus {
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
    TResult Function(ConfirmationStatus_Confirmed value)? confirmed,
    TResult Function(ConfirmationStatus_Unconfirmed value)? unconfirmed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmationStatus_Confirmed() when confirmed != null:
        return confirmed(_that);
      case ConfirmationStatus_Unconfirmed() when unconfirmed != null:
        return unconfirmed(_that);
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
    required TResult Function(ConfirmationStatus_Confirmed value) confirmed,
    required TResult Function(ConfirmationStatus_Unconfirmed value) unconfirmed,
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmationStatus_Confirmed():
        return confirmed(_that);
      case ConfirmationStatus_Unconfirmed():
        return unconfirmed(_that);
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
    TResult? Function(ConfirmationStatus_Confirmed value)? confirmed,
    TResult? Function(ConfirmationStatus_Unconfirmed value)? unconfirmed,
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmationStatus_Confirmed() when confirmed != null:
        return confirmed(_that);
      case ConfirmationStatus_Unconfirmed() when unconfirmed != null:
        return unconfirmed(_that);
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
    TResult Function(String blockHash, int height, BigInt timestamp)? confirmed,
    TResult Function()? unconfirmed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmationStatus_Confirmed() when confirmed != null:
        return confirmed(_that.blockHash, _that.height, _that.timestamp);
      case ConfirmationStatus_Unconfirmed() when unconfirmed != null:
        return unconfirmed();
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
    required TResult Function(String blockHash, int height, BigInt timestamp)
        confirmed,
    required TResult Function() unconfirmed,
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmationStatus_Confirmed():
        return confirmed(_that.blockHash, _that.height, _that.timestamp);
      case ConfirmationStatus_Unconfirmed():
        return unconfirmed();
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
    TResult? Function(String blockHash, int height, BigInt timestamp)?
        confirmed,
    TResult? Function()? unconfirmed,
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmationStatus_Confirmed() when confirmed != null:
        return confirmed(_that.blockHash, _that.height, _that.timestamp);
      case ConfirmationStatus_Unconfirmed() when unconfirmed != null:
        return unconfirmed();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ConfirmationStatus_Confirmed extends ConfirmationStatus {
  const ConfirmationStatus_Confirmed(
      {required this.blockHash, required this.height, required this.timestamp})
      : super._();

  /// The hash of the block in which the transaction was confirmed.
  final String blockHash;

  /// The height under which the block was confirmed.
  final int height;

  /// The timestamp, in seconds since start of the UNIX epoch, when this entry was last updated.
  final BigInt timestamp;

  /// Create a copy of ConfirmationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfirmationStatus_ConfirmedCopyWith<ConfirmationStatus_Confirmed>
      get copyWith => _$ConfirmationStatus_ConfirmedCopyWithImpl<
          ConfirmationStatus_Confirmed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfirmationStatus_Confirmed &&
            (identical(other.blockHash, blockHash) ||
                other.blockHash == blockHash) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockHash, height, timestamp);

  @override
  String toString() {
    return 'ConfirmationStatus.confirmed(blockHash: $blockHash, height: $height, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $ConfirmationStatus_ConfirmedCopyWith<$Res>
    implements $ConfirmationStatusCopyWith<$Res> {
  factory $ConfirmationStatus_ConfirmedCopyWith(
          ConfirmationStatus_Confirmed value,
          $Res Function(ConfirmationStatus_Confirmed) _then) =
      _$ConfirmationStatus_ConfirmedCopyWithImpl;
  @useResult
  $Res call({String blockHash, int height, BigInt timestamp});
}

/// @nodoc
class _$ConfirmationStatus_ConfirmedCopyWithImpl<$Res>
    implements $ConfirmationStatus_ConfirmedCopyWith<$Res> {
  _$ConfirmationStatus_ConfirmedCopyWithImpl(this._self, this._then);

  final ConfirmationStatus_Confirmed _self;
  final $Res Function(ConfirmationStatus_Confirmed) _then;

  /// Create a copy of ConfirmationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? blockHash = null,
    Object? height = null,
    Object? timestamp = null,
  }) {
    return _then(ConfirmationStatus_Confirmed(
      blockHash: null == blockHash
          ? _self.blockHash
          : blockHash // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class ConfirmationStatus_Unconfirmed extends ConfirmationStatus {
  const ConfirmationStatus_Unconfirmed() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfirmationStatus_Unconfirmed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConfirmationStatus.unconfirmed()';
  }
}

/// @nodoc
mixin _$EntropySourceConfig {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EntropySourceConfig);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'EntropySourceConfig()';
  }
}

/// @nodoc
class $EntropySourceConfigCopyWith<$Res> {
  $EntropySourceConfigCopyWith(
      EntropySourceConfig _, $Res Function(EntropySourceConfig) __);
}

/// Adds pattern-matching-related methods to [EntropySourceConfig].
extension EntropySourceConfigPatterns on EntropySourceConfig {
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
    TResult Function(EntropySourceConfig_SeedFile value)? seedFile,
    TResult Function(EntropySourceConfig_SeedBytes value)? seedBytes,
    TResult Function(EntropySourceConfig_Bip39Mnemonic value)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case EntropySourceConfig_SeedFile() when seedFile != null:
        return seedFile(_that);
      case EntropySourceConfig_SeedBytes() when seedBytes != null:
        return seedBytes(_that);
      case EntropySourceConfig_Bip39Mnemonic() when bip39Mnemonic != null:
        return bip39Mnemonic(_that);
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
    required TResult Function(EntropySourceConfig_SeedFile value) seedFile,
    required TResult Function(EntropySourceConfig_SeedBytes value) seedBytes,
    required TResult Function(EntropySourceConfig_Bip39Mnemonic value)
        bip39Mnemonic,
  }) {
    final _that = this;
    switch (_that) {
      case EntropySourceConfig_SeedFile():
        return seedFile(_that);
      case EntropySourceConfig_SeedBytes():
        return seedBytes(_that);
      case EntropySourceConfig_Bip39Mnemonic():
        return bip39Mnemonic(_that);
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
    TResult? Function(EntropySourceConfig_SeedFile value)? seedFile,
    TResult? Function(EntropySourceConfig_SeedBytes value)? seedBytes,
    TResult? Function(EntropySourceConfig_Bip39Mnemonic value)? bip39Mnemonic,
  }) {
    final _that = this;
    switch (_that) {
      case EntropySourceConfig_SeedFile() when seedFile != null:
        return seedFile(_that);
      case EntropySourceConfig_SeedBytes() when seedBytes != null:
        return seedBytes(_that);
      case EntropySourceConfig_Bip39Mnemonic() when bip39Mnemonic != null:
        return bip39Mnemonic(_that);
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
    TResult Function(String field0)? seedFile,
    TResult Function(U8Array64 field0)? seedBytes,
    TResult Function(FfiMnemonic mnemonic, String? passphrase)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case EntropySourceConfig_SeedFile() when seedFile != null:
        return seedFile(_that.field0);
      case EntropySourceConfig_SeedBytes() when seedBytes != null:
        return seedBytes(_that.field0);
      case EntropySourceConfig_Bip39Mnemonic() when bip39Mnemonic != null:
        return bip39Mnemonic(_that.mnemonic, _that.passphrase);
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
    required TResult Function(String field0) seedFile,
    required TResult Function(U8Array64 field0) seedBytes,
    required TResult Function(FfiMnemonic mnemonic, String? passphrase)
        bip39Mnemonic,
  }) {
    final _that = this;
    switch (_that) {
      case EntropySourceConfig_SeedFile():
        return seedFile(_that.field0);
      case EntropySourceConfig_SeedBytes():
        return seedBytes(_that.field0);
      case EntropySourceConfig_Bip39Mnemonic():
        return bip39Mnemonic(_that.mnemonic, _that.passphrase);
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
    TResult? Function(String field0)? seedFile,
    TResult? Function(U8Array64 field0)? seedBytes,
    TResult? Function(FfiMnemonic mnemonic, String? passphrase)? bip39Mnemonic,
  }) {
    final _that = this;
    switch (_that) {
      case EntropySourceConfig_SeedFile() when seedFile != null:
        return seedFile(_that.field0);
      case EntropySourceConfig_SeedBytes() when seedBytes != null:
        return seedBytes(_that.field0);
      case EntropySourceConfig_Bip39Mnemonic() when bip39Mnemonic != null:
        return bip39Mnemonic(_that.mnemonic, _that.passphrase);
      case _:
        return null;
    }
  }
}

/// @nodoc

class EntropySourceConfig_SeedFile extends EntropySourceConfig {
  const EntropySourceConfig_SeedFile(this.field0) : super._();

  final String field0;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntropySourceConfig_SeedFileCopyWith<EntropySourceConfig_SeedFile>
      get copyWith => _$EntropySourceConfig_SeedFileCopyWithImpl<
          EntropySourceConfig_SeedFile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntropySourceConfig_SeedFile &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'EntropySourceConfig.seedFile(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $EntropySourceConfig_SeedFileCopyWith<$Res>
    implements $EntropySourceConfigCopyWith<$Res> {
  factory $EntropySourceConfig_SeedFileCopyWith(
          EntropySourceConfig_SeedFile value,
          $Res Function(EntropySourceConfig_SeedFile) _then) =
      _$EntropySourceConfig_SeedFileCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$EntropySourceConfig_SeedFileCopyWithImpl<$Res>
    implements $EntropySourceConfig_SeedFileCopyWith<$Res> {
  _$EntropySourceConfig_SeedFileCopyWithImpl(this._self, this._then);

  final EntropySourceConfig_SeedFile _self;
  final $Res Function(EntropySourceConfig_SeedFile) _then;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(EntropySourceConfig_SeedFile(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class EntropySourceConfig_SeedBytes extends EntropySourceConfig {
  const EntropySourceConfig_SeedBytes(this.field0) : super._();

  final U8Array64 field0;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntropySourceConfig_SeedBytesCopyWith<EntropySourceConfig_SeedBytes>
      get copyWith => _$EntropySourceConfig_SeedBytesCopyWithImpl<
          EntropySourceConfig_SeedBytes>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntropySourceConfig_SeedBytes &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  @override
  String toString() {
    return 'EntropySourceConfig.seedBytes(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $EntropySourceConfig_SeedBytesCopyWith<$Res>
    implements $EntropySourceConfigCopyWith<$Res> {
  factory $EntropySourceConfig_SeedBytesCopyWith(
          EntropySourceConfig_SeedBytes value,
          $Res Function(EntropySourceConfig_SeedBytes) _then) =
      _$EntropySourceConfig_SeedBytesCopyWithImpl;
  @useResult
  $Res call({U8Array64 field0});
}

/// @nodoc
class _$EntropySourceConfig_SeedBytesCopyWithImpl<$Res>
    implements $EntropySourceConfig_SeedBytesCopyWith<$Res> {
  _$EntropySourceConfig_SeedBytesCopyWithImpl(this._self, this._then);

  final EntropySourceConfig_SeedBytes _self;
  final $Res Function(EntropySourceConfig_SeedBytes) _then;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(EntropySourceConfig_SeedBytes(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as U8Array64,
    ));
  }
}

/// @nodoc

class EntropySourceConfig_Bip39Mnemonic extends EntropySourceConfig {
  const EntropySourceConfig_Bip39Mnemonic(
      {required this.mnemonic, this.passphrase})
      : super._();

  final FfiMnemonic mnemonic;
  final String? passphrase;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntropySourceConfig_Bip39MnemonicCopyWith<EntropySourceConfig_Bip39Mnemonic>
      get copyWith => _$EntropySourceConfig_Bip39MnemonicCopyWithImpl<
          EntropySourceConfig_Bip39Mnemonic>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntropySourceConfig_Bip39Mnemonic &&
            (identical(other.mnemonic, mnemonic) ||
                other.mnemonic == mnemonic) &&
            (identical(other.passphrase, passphrase) ||
                other.passphrase == passphrase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mnemonic, passphrase);

  @override
  String toString() {
    return 'EntropySourceConfig.bip39Mnemonic(mnemonic: $mnemonic, passphrase: $passphrase)';
  }
}

/// @nodoc
abstract mixin class $EntropySourceConfig_Bip39MnemonicCopyWith<$Res>
    implements $EntropySourceConfigCopyWith<$Res> {
  factory $EntropySourceConfig_Bip39MnemonicCopyWith(
          EntropySourceConfig_Bip39Mnemonic value,
          $Res Function(EntropySourceConfig_Bip39Mnemonic) _then) =
      _$EntropySourceConfig_Bip39MnemonicCopyWithImpl;
  @useResult
  $Res call({FfiMnemonic mnemonic, String? passphrase});
}

/// @nodoc
class _$EntropySourceConfig_Bip39MnemonicCopyWithImpl<$Res>
    implements $EntropySourceConfig_Bip39MnemonicCopyWith<$Res> {
  _$EntropySourceConfig_Bip39MnemonicCopyWithImpl(this._self, this._then);

  final EntropySourceConfig_Bip39Mnemonic _self;
  final $Res Function(EntropySourceConfig_Bip39Mnemonic) _then;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mnemonic = null,
    Object? passphrase = freezed,
  }) {
    return _then(EntropySourceConfig_Bip39Mnemonic(
      mnemonic: null == mnemonic
          ? _self.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as FfiMnemonic,
      passphrase: freezed == passphrase
          ? _self.passphrase
          : passphrase // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Event {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Event);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Event()';
  }
}

/// @nodoc
class $EventCopyWith<$Res> {
  $EventCopyWith(Event _, $Res Function(Event) __);
}

/// Adds pattern-matching-related methods to [Event].
extension EventPatterns on Event {
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
    TResult Function(Event_PaymentClaimable value)? paymentClaimable,
    TResult Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult Function(Event_PaymentFailed value)? paymentFailed,
    TResult Function(Event_PaymentReceived value)? paymentReceived,
    TResult Function(Event_ChannelPending value)? channelPending,
    TResult Function(Event_ChannelReady value)? channelReady,
    TResult Function(Event_ChannelClosed value)? channelClosed,
    TResult Function(Event_PaymentForwarded value)? paymentForwarded,
    TResult Function(Event_SplicePending value)? splicePending,
    TResult Function(Event_SpliceFailed value)? spliceFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Event_PaymentClaimable() when paymentClaimable != null:
        return paymentClaimable(_that);
      case Event_PaymentSuccessful() when paymentSuccessful != null:
        return paymentSuccessful(_that);
      case Event_PaymentFailed() when paymentFailed != null:
        return paymentFailed(_that);
      case Event_PaymentReceived() when paymentReceived != null:
        return paymentReceived(_that);
      case Event_ChannelPending() when channelPending != null:
        return channelPending(_that);
      case Event_ChannelReady() when channelReady != null:
        return channelReady(_that);
      case Event_ChannelClosed() when channelClosed != null:
        return channelClosed(_that);
      case Event_PaymentForwarded() when paymentForwarded != null:
        return paymentForwarded(_that);
      case Event_SplicePending() when splicePending != null:
        return splicePending(_that);
      case Event_SpliceFailed() when spliceFailed != null:
        return spliceFailed(_that);
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
    required TResult Function(Event_PaymentClaimable value) paymentClaimable,
    required TResult Function(Event_PaymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_PaymentFailed value) paymentFailed,
    required TResult Function(Event_PaymentReceived value) paymentReceived,
    required TResult Function(Event_ChannelPending value) channelPending,
    required TResult Function(Event_ChannelReady value) channelReady,
    required TResult Function(Event_ChannelClosed value) channelClosed,
    required TResult Function(Event_PaymentForwarded value) paymentForwarded,
    required TResult Function(Event_SplicePending value) splicePending,
    required TResult Function(Event_SpliceFailed value) spliceFailed,
  }) {
    final _that = this;
    switch (_that) {
      case Event_PaymentClaimable():
        return paymentClaimable(_that);
      case Event_PaymentSuccessful():
        return paymentSuccessful(_that);
      case Event_PaymentFailed():
        return paymentFailed(_that);
      case Event_PaymentReceived():
        return paymentReceived(_that);
      case Event_ChannelPending():
        return channelPending(_that);
      case Event_ChannelReady():
        return channelReady(_that);
      case Event_ChannelClosed():
        return channelClosed(_that);
      case Event_PaymentForwarded():
        return paymentForwarded(_that);
      case Event_SplicePending():
        return splicePending(_that);
      case Event_SpliceFailed():
        return spliceFailed(_that);
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
    TResult? Function(Event_PaymentClaimable value)? paymentClaimable,
    TResult? Function(Event_PaymentSuccessful value)? paymentSuccessful,
    TResult? Function(Event_PaymentFailed value)? paymentFailed,
    TResult? Function(Event_PaymentReceived value)? paymentReceived,
    TResult? Function(Event_ChannelPending value)? channelPending,
    TResult? Function(Event_ChannelReady value)? channelReady,
    TResult? Function(Event_ChannelClosed value)? channelClosed,
    TResult? Function(Event_PaymentForwarded value)? paymentForwarded,
    TResult? Function(Event_SplicePending value)? splicePending,
    TResult? Function(Event_SpliceFailed value)? spliceFailed,
  }) {
    final _that = this;
    switch (_that) {
      case Event_PaymentClaimable() when paymentClaimable != null:
        return paymentClaimable(_that);
      case Event_PaymentSuccessful() when paymentSuccessful != null:
        return paymentSuccessful(_that);
      case Event_PaymentFailed() when paymentFailed != null:
        return paymentFailed(_that);
      case Event_PaymentReceived() when paymentReceived != null:
        return paymentReceived(_that);
      case Event_ChannelPending() when channelPending != null:
        return channelPending(_that);
      case Event_ChannelReady() when channelReady != null:
        return channelReady(_that);
      case Event_ChannelClosed() when channelClosed != null:
        return channelClosed(_that);
      case Event_PaymentForwarded() when paymentForwarded != null:
        return paymentForwarded(_that);
      case Event_SplicePending() when splicePending != null:
        return splicePending(_that);
      case Event_SpliceFailed() when spliceFailed != null:
        return spliceFailed(_that);
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
    TResult Function(
            PaymentId paymentId,
            PaymentHash paymentHash,
            BigInt claimableAmountMsat,
            int? claimDeadline,
            List<CustomTlvRecord> customRecords)?
        paymentClaimable,
    TResult Function(PaymentId? paymentId, PaymentHash paymentHash,
            BigInt? feePaidMsat, PaymentPreimage? preimage)?
        paymentSuccessful,
    TResult Function(PaymentId? paymentId, PaymentHash? paymentHash,
            PaymentFailureReason? reason)?
        paymentFailed,
    TResult Function(PaymentId? paymentId, PaymentHash paymentHash,
            BigInt amountMsat, List<CustomTlvRecord> customRecords)?
        paymentReceived,
    TResult Function(
            ChannelId channelId,
            UserChannelId userChannelId,
            ChannelId formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
    TResult Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey? counterpartyNodeId, OutPoint? fundingTxo)?
        channelReady,
    TResult Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey? counterpartyNodeId, ClosureReason? reason)?
        channelClosed,
    TResult Function(
            ChannelId prevChannelId,
            ChannelId nextChannelId,
            UserChannelId? prevUserChannelId,
            UserChannelId? nextUserChannelId,
            PublicKey? prevNodeId,
            PublicKey? nextNodeId,
            BigInt? totalFeeEarnedMsat,
            BigInt? skimmedFeeMsat,
            bool claimFromOnchainTx,
            BigInt? outboundAmountForwardedMsat)?
        paymentForwarded,
    TResult Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey counterpartyNodeId, OutPoint newFundingTxo)?
        splicePending,
    TResult Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey counterpartyNodeId, OutPoint? abandonedFundingTxo)?
        spliceFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Event_PaymentClaimable() when paymentClaimable != null:
        return paymentClaimable(
            _that.paymentId,
            _that.paymentHash,
            _that.claimableAmountMsat,
            _that.claimDeadline,
            _that.customRecords);
      case Event_PaymentSuccessful() when paymentSuccessful != null:
        return paymentSuccessful(_that.paymentId, _that.paymentHash,
            _that.feePaidMsat, _that.preimage);
      case Event_PaymentFailed() when paymentFailed != null:
        return paymentFailed(_that.paymentId, _that.paymentHash, _that.reason);
      case Event_PaymentReceived() when paymentReceived != null:
        return paymentReceived(_that.paymentId, _that.paymentHash,
            _that.amountMsat, _that.customRecords);
      case Event_ChannelPending() when channelPending != null:
        return channelPending(
            _that.channelId,
            _that.userChannelId,
            _that.formerTemporaryChannelId,
            _that.counterpartyNodeId,
            _that.fundingTxo);
      case Event_ChannelReady() when channelReady != null:
        return channelReady(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.fundingTxo);
      case Event_ChannelClosed() when channelClosed != null:
        return channelClosed(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.reason);
      case Event_PaymentForwarded() when paymentForwarded != null:
        return paymentForwarded(
            _that.prevChannelId,
            _that.nextChannelId,
            _that.prevUserChannelId,
            _that.nextUserChannelId,
            _that.prevNodeId,
            _that.nextNodeId,
            _that.totalFeeEarnedMsat,
            _that.skimmedFeeMsat,
            _that.claimFromOnchainTx,
            _that.outboundAmountForwardedMsat);
      case Event_SplicePending() when splicePending != null:
        return splicePending(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.newFundingTxo);
      case Event_SpliceFailed() when spliceFailed != null:
        return spliceFailed(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.abandonedFundingTxo);
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
    required TResult Function(
            PaymentId paymentId,
            PaymentHash paymentHash,
            BigInt claimableAmountMsat,
            int? claimDeadline,
            List<CustomTlvRecord> customRecords)
        paymentClaimable,
    required TResult Function(PaymentId? paymentId, PaymentHash paymentHash,
            BigInt? feePaidMsat, PaymentPreimage? preimage)
        paymentSuccessful,
    required TResult Function(PaymentId? paymentId, PaymentHash? paymentHash,
            PaymentFailureReason? reason)
        paymentFailed,
    required TResult Function(PaymentId? paymentId, PaymentHash paymentHash,
            BigInt amountMsat, List<CustomTlvRecord> customRecords)
        paymentReceived,
    required TResult Function(
            ChannelId channelId,
            UserChannelId userChannelId,
            ChannelId formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)
        channelPending,
    required TResult Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey? counterpartyNodeId, OutPoint? fundingTxo)
        channelReady,
    required TResult Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey? counterpartyNodeId, ClosureReason? reason)
        channelClosed,
    required TResult Function(
            ChannelId prevChannelId,
            ChannelId nextChannelId,
            UserChannelId? prevUserChannelId,
            UserChannelId? nextUserChannelId,
            PublicKey? prevNodeId,
            PublicKey? nextNodeId,
            BigInt? totalFeeEarnedMsat,
            BigInt? skimmedFeeMsat,
            bool claimFromOnchainTx,
            BigInt? outboundAmountForwardedMsat)
        paymentForwarded,
    required TResult Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey counterpartyNodeId, OutPoint newFundingTxo)
        splicePending,
    required TResult Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey counterpartyNodeId, OutPoint? abandonedFundingTxo)
        spliceFailed,
  }) {
    final _that = this;
    switch (_that) {
      case Event_PaymentClaimable():
        return paymentClaimable(
            _that.paymentId,
            _that.paymentHash,
            _that.claimableAmountMsat,
            _that.claimDeadline,
            _that.customRecords);
      case Event_PaymentSuccessful():
        return paymentSuccessful(_that.paymentId, _that.paymentHash,
            _that.feePaidMsat, _that.preimage);
      case Event_PaymentFailed():
        return paymentFailed(_that.paymentId, _that.paymentHash, _that.reason);
      case Event_PaymentReceived():
        return paymentReceived(_that.paymentId, _that.paymentHash,
            _that.amountMsat, _that.customRecords);
      case Event_ChannelPending():
        return channelPending(
            _that.channelId,
            _that.userChannelId,
            _that.formerTemporaryChannelId,
            _that.counterpartyNodeId,
            _that.fundingTxo);
      case Event_ChannelReady():
        return channelReady(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.fundingTxo);
      case Event_ChannelClosed():
        return channelClosed(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.reason);
      case Event_PaymentForwarded():
        return paymentForwarded(
            _that.prevChannelId,
            _that.nextChannelId,
            _that.prevUserChannelId,
            _that.nextUserChannelId,
            _that.prevNodeId,
            _that.nextNodeId,
            _that.totalFeeEarnedMsat,
            _that.skimmedFeeMsat,
            _that.claimFromOnchainTx,
            _that.outboundAmountForwardedMsat);
      case Event_SplicePending():
        return splicePending(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.newFundingTxo);
      case Event_SpliceFailed():
        return spliceFailed(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.abandonedFundingTxo);
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
    TResult? Function(
            PaymentId paymentId,
            PaymentHash paymentHash,
            BigInt claimableAmountMsat,
            int? claimDeadline,
            List<CustomTlvRecord> customRecords)?
        paymentClaimable,
    TResult? Function(PaymentId? paymentId, PaymentHash paymentHash,
            BigInt? feePaidMsat, PaymentPreimage? preimage)?
        paymentSuccessful,
    TResult? Function(PaymentId? paymentId, PaymentHash? paymentHash,
            PaymentFailureReason? reason)?
        paymentFailed,
    TResult? Function(PaymentId? paymentId, PaymentHash paymentHash,
            BigInt amountMsat, List<CustomTlvRecord> customRecords)?
        paymentReceived,
    TResult? Function(
            ChannelId channelId,
            UserChannelId userChannelId,
            ChannelId formerTemporaryChannelId,
            PublicKey counterpartyNodeId,
            OutPoint fundingTxo)?
        channelPending,
    TResult? Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey? counterpartyNodeId, OutPoint? fundingTxo)?
        channelReady,
    TResult? Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey? counterpartyNodeId, ClosureReason? reason)?
        channelClosed,
    TResult? Function(
            ChannelId prevChannelId,
            ChannelId nextChannelId,
            UserChannelId? prevUserChannelId,
            UserChannelId? nextUserChannelId,
            PublicKey? prevNodeId,
            PublicKey? nextNodeId,
            BigInt? totalFeeEarnedMsat,
            BigInt? skimmedFeeMsat,
            bool claimFromOnchainTx,
            BigInt? outboundAmountForwardedMsat)?
        paymentForwarded,
    TResult? Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey counterpartyNodeId, OutPoint newFundingTxo)?
        splicePending,
    TResult? Function(ChannelId channelId, UserChannelId userChannelId,
            PublicKey counterpartyNodeId, OutPoint? abandonedFundingTxo)?
        spliceFailed,
  }) {
    final _that = this;
    switch (_that) {
      case Event_PaymentClaimable() when paymentClaimable != null:
        return paymentClaimable(
            _that.paymentId,
            _that.paymentHash,
            _that.claimableAmountMsat,
            _that.claimDeadline,
            _that.customRecords);
      case Event_PaymentSuccessful() when paymentSuccessful != null:
        return paymentSuccessful(_that.paymentId, _that.paymentHash,
            _that.feePaidMsat, _that.preimage);
      case Event_PaymentFailed() when paymentFailed != null:
        return paymentFailed(_that.paymentId, _that.paymentHash, _that.reason);
      case Event_PaymentReceived() when paymentReceived != null:
        return paymentReceived(_that.paymentId, _that.paymentHash,
            _that.amountMsat, _that.customRecords);
      case Event_ChannelPending() when channelPending != null:
        return channelPending(
            _that.channelId,
            _that.userChannelId,
            _that.formerTemporaryChannelId,
            _that.counterpartyNodeId,
            _that.fundingTxo);
      case Event_ChannelReady() when channelReady != null:
        return channelReady(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.fundingTxo);
      case Event_ChannelClosed() when channelClosed != null:
        return channelClosed(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.reason);
      case Event_PaymentForwarded() when paymentForwarded != null:
        return paymentForwarded(
            _that.prevChannelId,
            _that.nextChannelId,
            _that.prevUserChannelId,
            _that.nextUserChannelId,
            _that.prevNodeId,
            _that.nextNodeId,
            _that.totalFeeEarnedMsat,
            _that.skimmedFeeMsat,
            _that.claimFromOnchainTx,
            _that.outboundAmountForwardedMsat);
      case Event_SplicePending() when splicePending != null:
        return splicePending(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.newFundingTxo);
      case Event_SpliceFailed() when spliceFailed != null:
        return spliceFailed(_that.channelId, _that.userChannelId,
            _that.counterpartyNodeId, _that.abandonedFundingTxo);
      case _:
        return null;
    }
  }
}

/// @nodoc

class Event_PaymentClaimable extends Event {
  const Event_PaymentClaimable(
      {required this.paymentId,
      required this.paymentHash,
      required this.claimableAmountMsat,
      this.claimDeadline,
      required final List<CustomTlvRecord> customRecords})
      : _customRecords = customRecords,
        super._();

  /// A local identifier used to track the payment.
  final PaymentId paymentId;

  /// The hash of the payment.
  final PaymentHash paymentHash;

  /// The value, in thousandths of a satoshi, that is claimable.
  final BigInt claimableAmountMsat;

  /// The block height at which this payment will be failed back and will no longer be
  /// eligible for claiming.
  final int? claimDeadline;

  /// Custom TLV records attached to the payment
  final List<CustomTlvRecord> _customRecords;

  /// Custom TLV records attached to the payment
  List<CustomTlvRecord> get customRecords {
    if (_customRecords is EqualUnmodifiableListView) return _customRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customRecords);
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Event_PaymentClaimableCopyWith<Event_PaymentClaimable> get copyWith =>
      _$Event_PaymentClaimableCopyWithImpl<Event_PaymentClaimable>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event_PaymentClaimable &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash) &&
            (identical(other.claimableAmountMsat, claimableAmountMsat) ||
                other.claimableAmountMsat == claimableAmountMsat) &&
            (identical(other.claimDeadline, claimDeadline) ||
                other.claimDeadline == claimDeadline) &&
            const DeepCollectionEquality()
                .equals(other._customRecords, _customRecords));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentId,
      paymentHash,
      claimableAmountMsat,
      claimDeadline,
      const DeepCollectionEquality().hash(_customRecords));

  @override
  String toString() {
    return 'Event.paymentClaimable(paymentId: $paymentId, paymentHash: $paymentHash, claimableAmountMsat: $claimableAmountMsat, claimDeadline: $claimDeadline, customRecords: $customRecords)';
  }
}

/// @nodoc
abstract mixin class $Event_PaymentClaimableCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory $Event_PaymentClaimableCopyWith(Event_PaymentClaimable value,
          $Res Function(Event_PaymentClaimable) _then) =
      _$Event_PaymentClaimableCopyWithImpl;
  @useResult
  $Res call(
      {PaymentId paymentId,
      PaymentHash paymentHash,
      BigInt claimableAmountMsat,
      int? claimDeadline,
      List<CustomTlvRecord> customRecords});
}

/// @nodoc
class _$Event_PaymentClaimableCopyWithImpl<$Res>
    implements $Event_PaymentClaimableCopyWith<$Res> {
  _$Event_PaymentClaimableCopyWithImpl(this._self, this._then);

  final Event_PaymentClaimable _self;
  final $Res Function(Event_PaymentClaimable) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paymentId = null,
    Object? paymentHash = null,
    Object? claimableAmountMsat = null,
    Object? claimDeadline = freezed,
    Object? customRecords = null,
  }) {
    return _then(Event_PaymentClaimable(
      paymentId: null == paymentId
          ? _self.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId,
      paymentHash: null == paymentHash
          ? _self.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      claimableAmountMsat: null == claimableAmountMsat
          ? _self.claimableAmountMsat
          : claimableAmountMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
      claimDeadline: freezed == claimDeadline
          ? _self.claimDeadline
          : claimDeadline // ignore: cast_nullable_to_non_nullable
              as int?,
      customRecords: null == customRecords
          ? _self._customRecords
          : customRecords // ignore: cast_nullable_to_non_nullable
              as List<CustomTlvRecord>,
    ));
  }
}

/// @nodoc

class Event_PaymentSuccessful extends Event {
  const Event_PaymentSuccessful(
      {this.paymentId,
      required this.paymentHash,
      this.feePaidMsat,
      this.preimage})
      : super._();

  /// A local identifier used to track the payment.
  ///
  /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
  final PaymentId? paymentId;

  /// The hash of the payment.
  final PaymentHash paymentHash;

  /// The total fee which was spent at intermediate hops in this payment.
  final BigInt? feePaidMsat;

  /// The preimage of the payment hash, which can be used to claim the payment.
  final PaymentPreimage? preimage;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Event_PaymentSuccessfulCopyWith<Event_PaymentSuccessful> get copyWith =>
      _$Event_PaymentSuccessfulCopyWithImpl<Event_PaymentSuccessful>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event_PaymentSuccessful &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash) &&
            (identical(other.feePaidMsat, feePaidMsat) ||
                other.feePaidMsat == feePaidMsat) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentId, paymentHash, feePaidMsat, preimage);

  @override
  String toString() {
    return 'Event.paymentSuccessful(paymentId: $paymentId, paymentHash: $paymentHash, feePaidMsat: $feePaidMsat, preimage: $preimage)';
  }
}

/// @nodoc
abstract mixin class $Event_PaymentSuccessfulCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory $Event_PaymentSuccessfulCopyWith(Event_PaymentSuccessful value,
          $Res Function(Event_PaymentSuccessful) _then) =
      _$Event_PaymentSuccessfulCopyWithImpl;
  @useResult
  $Res call(
      {PaymentId? paymentId,
      PaymentHash paymentHash,
      BigInt? feePaidMsat,
      PaymentPreimage? preimage});
}

/// @nodoc
class _$Event_PaymentSuccessfulCopyWithImpl<$Res>
    implements $Event_PaymentSuccessfulCopyWith<$Res> {
  _$Event_PaymentSuccessfulCopyWithImpl(this._self, this._then);

  final Event_PaymentSuccessful _self;
  final $Res Function(Event_PaymentSuccessful) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paymentId = freezed,
    Object? paymentHash = null,
    Object? feePaidMsat = freezed,
    Object? preimage = freezed,
  }) {
    return _then(Event_PaymentSuccessful(
      paymentId: freezed == paymentId
          ? _self.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId?,
      paymentHash: null == paymentHash
          ? _self.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      feePaidMsat: freezed == feePaidMsat
          ? _self.feePaidMsat
          : feePaidMsat // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      preimage: freezed == preimage
          ? _self.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PaymentPreimage?,
    ));
  }
}

/// @nodoc

class Event_PaymentFailed extends Event {
  const Event_PaymentFailed({this.paymentId, this.paymentHash, this.reason})
      : super._();

  /// A local identifier used to track the payment.
  ///
  /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
  final PaymentId? paymentId;

  /// The hash of the payment.
  final PaymentHash? paymentHash;

  /// The reason why the payment failed.
  ///
  /// This will be `None` for events serialized by LDK Node v0.2.1 and prior.
  final PaymentFailureReason? reason;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Event_PaymentFailedCopyWith<Event_PaymentFailed> get copyWith =>
      _$Event_PaymentFailedCopyWithImpl<Event_PaymentFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event_PaymentFailed &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentId, paymentHash, reason);

  @override
  String toString() {
    return 'Event.paymentFailed(paymentId: $paymentId, paymentHash: $paymentHash, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $Event_PaymentFailedCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory $Event_PaymentFailedCopyWith(
          Event_PaymentFailed value, $Res Function(Event_PaymentFailed) _then) =
      _$Event_PaymentFailedCopyWithImpl;
  @useResult
  $Res call(
      {PaymentId? paymentId,
      PaymentHash? paymentHash,
      PaymentFailureReason? reason});
}

/// @nodoc
class _$Event_PaymentFailedCopyWithImpl<$Res>
    implements $Event_PaymentFailedCopyWith<$Res> {
  _$Event_PaymentFailedCopyWithImpl(this._self, this._then);

  final Event_PaymentFailed _self;
  final $Res Function(Event_PaymentFailed) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paymentId = freezed,
    Object? paymentHash = freezed,
    Object? reason = freezed,
  }) {
    return _then(Event_PaymentFailed(
      paymentId: freezed == paymentId
          ? _self.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId?,
      paymentHash: freezed == paymentHash
          ? _self.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as PaymentFailureReason?,
    ));
  }
}

/// @nodoc

class Event_PaymentReceived extends Event {
  const Event_PaymentReceived(
      {this.paymentId,
      required this.paymentHash,
      required this.amountMsat,
      required final List<CustomTlvRecord> customRecords})
      : _customRecords = customRecords,
        super._();

  /// A local identifier used to track the payment.
  ///
  /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
  final PaymentId? paymentId;

  /// The hash of the payment.
  final PaymentHash paymentHash;

  /// The value, in thousandths of a satoshi, that has been received.
  final BigInt amountMsat;

  /// Custom TLV records received on the payment
  final List<CustomTlvRecord> _customRecords;

  /// Custom TLV records received on the payment
  List<CustomTlvRecord> get customRecords {
    if (_customRecords is EqualUnmodifiableListView) return _customRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customRecords);
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Event_PaymentReceivedCopyWith<Event_PaymentReceived> get copyWith =>
      _$Event_PaymentReceivedCopyWithImpl<Event_PaymentReceived>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event_PaymentReceived &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash) &&
            (identical(other.amountMsat, amountMsat) ||
                other.amountMsat == amountMsat) &&
            const DeepCollectionEquality()
                .equals(other._customRecords, _customRecords));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentId, paymentHash,
      amountMsat, const DeepCollectionEquality().hash(_customRecords));

  @override
  String toString() {
    return 'Event.paymentReceived(paymentId: $paymentId, paymentHash: $paymentHash, amountMsat: $amountMsat, customRecords: $customRecords)';
  }
}

/// @nodoc
abstract mixin class $Event_PaymentReceivedCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory $Event_PaymentReceivedCopyWith(Event_PaymentReceived value,
          $Res Function(Event_PaymentReceived) _then) =
      _$Event_PaymentReceivedCopyWithImpl;
  @useResult
  $Res call(
      {PaymentId? paymentId,
      PaymentHash paymentHash,
      BigInt amountMsat,
      List<CustomTlvRecord> customRecords});
}

/// @nodoc
class _$Event_PaymentReceivedCopyWithImpl<$Res>
    implements $Event_PaymentReceivedCopyWith<$Res> {
  _$Event_PaymentReceivedCopyWithImpl(this._self, this._then);

  final Event_PaymentReceived _self;
  final $Res Function(Event_PaymentReceived) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paymentId = freezed,
    Object? paymentHash = null,
    Object? amountMsat = null,
    Object? customRecords = null,
  }) {
    return _then(Event_PaymentReceived(
      paymentId: freezed == paymentId
          ? _self.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId?,
      paymentHash: null == paymentHash
          ? _self.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      amountMsat: null == amountMsat
          ? _self.amountMsat
          : amountMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
      customRecords: null == customRecords
          ? _self._customRecords
          : customRecords // ignore: cast_nullable_to_non_nullable
              as List<CustomTlvRecord>,
    ));
  }
}

/// @nodoc

class Event_ChannelPending extends Event {
  const Event_ChannelPending(
      {required this.channelId,
      required this.userChannelId,
      required this.formerTemporaryChannelId,
      required this.counterpartyNodeId,
      required this.fundingTxo})
      : super._();

  /// The `channelId` of the channel.
  final ChannelId channelId;

  /// The `userChannelId` of the channel.
  final UserChannelId userChannelId;

  /// The `temporaryChannelId` this channel used to be known by during channel establishment.
  final ChannelId formerTemporaryChannelId;

  /// The `nodeId` of the channel counterparty.
  final PublicKey counterpartyNodeId;

  /// The outpoint of the channel's funding transaction.
  final OutPoint fundingTxo;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Event_ChannelPendingCopyWith<Event_ChannelPending> get copyWith =>
      _$Event_ChannelPendingCopyWithImpl<Event_ChannelPending>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event_ChannelPending &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId) &&
            (identical(
                    other.formerTemporaryChannelId, formerTemporaryChannelId) ||
                other.formerTemporaryChannelId == formerTemporaryChannelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.fundingTxo, fundingTxo) ||
                other.fundingTxo == fundingTxo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, userChannelId,
      formerTemporaryChannelId, counterpartyNodeId, fundingTxo);

  @override
  String toString() {
    return 'Event.channelPending(channelId: $channelId, userChannelId: $userChannelId, formerTemporaryChannelId: $formerTemporaryChannelId, counterpartyNodeId: $counterpartyNodeId, fundingTxo: $fundingTxo)';
  }
}

/// @nodoc
abstract mixin class $Event_ChannelPendingCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory $Event_ChannelPendingCopyWith(Event_ChannelPending value,
          $Res Function(Event_ChannelPending) _then) =
      _$Event_ChannelPendingCopyWithImpl;
  @useResult
  $Res call(
      {ChannelId channelId,
      UserChannelId userChannelId,
      ChannelId formerTemporaryChannelId,
      PublicKey counterpartyNodeId,
      OutPoint fundingTxo});
}

/// @nodoc
class _$Event_ChannelPendingCopyWithImpl<$Res>
    implements $Event_ChannelPendingCopyWith<$Res> {
  _$Event_ChannelPendingCopyWithImpl(this._self, this._then);

  final Event_ChannelPending _self;
  final $Res Function(Event_ChannelPending) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
    Object? formerTemporaryChannelId = null,
    Object? counterpartyNodeId = null,
    Object? fundingTxo = null,
  }) {
    return _then(Event_ChannelPending(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      userChannelId: null == userChannelId
          ? _self.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId,
      formerTemporaryChannelId: null == formerTemporaryChannelId
          ? _self.formerTemporaryChannelId
          : formerTemporaryChannelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      fundingTxo: null == fundingTxo
          ? _self.fundingTxo
          : fundingTxo // ignore: cast_nullable_to_non_nullable
              as OutPoint,
    ));
  }
}

/// @nodoc

class Event_ChannelReady extends Event {
  const Event_ChannelReady(
      {required this.channelId,
      required this.userChannelId,
      this.counterpartyNodeId,
      this.fundingTxo})
      : super._();

  /// The `channelId` of the channel.
  final ChannelId channelId;

  /// The `userChannelId` of the channel.
  final UserChannelId userChannelId;

  /// The `nodeId` of the channel counterparty.
  ///
  /// This will be `None` for events serialized by LDK Node v0.1.0 and prior.
  final PublicKey? counterpartyNodeId;

  /// The outpoint of the channel's funding transaction.
  ///
  /// This will be `None` for events serialized by LDK Node v0.6.0 and prior.
  final OutPoint? fundingTxo;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Event_ChannelReadyCopyWith<Event_ChannelReady> get copyWith =>
      _$Event_ChannelReadyCopyWithImpl<Event_ChannelReady>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event_ChannelReady &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.fundingTxo, fundingTxo) ||
                other.fundingTxo == fundingTxo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, channelId, userChannelId, counterpartyNodeId, fundingTxo);

  @override
  String toString() {
    return 'Event.channelReady(channelId: $channelId, userChannelId: $userChannelId, counterpartyNodeId: $counterpartyNodeId, fundingTxo: $fundingTxo)';
  }
}

/// @nodoc
abstract mixin class $Event_ChannelReadyCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory $Event_ChannelReadyCopyWith(
          Event_ChannelReady value, $Res Function(Event_ChannelReady) _then) =
      _$Event_ChannelReadyCopyWithImpl;
  @useResult
  $Res call(
      {ChannelId channelId,
      UserChannelId userChannelId,
      PublicKey? counterpartyNodeId,
      OutPoint? fundingTxo});
}

/// @nodoc
class _$Event_ChannelReadyCopyWithImpl<$Res>
    implements $Event_ChannelReadyCopyWith<$Res> {
  _$Event_ChannelReadyCopyWithImpl(this._self, this._then);

  final Event_ChannelReady _self;
  final $Res Function(Event_ChannelReady) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
    Object? counterpartyNodeId = freezed,
    Object? fundingTxo = freezed,
  }) {
    return _then(Event_ChannelReady(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      userChannelId: null == userChannelId
          ? _self.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId,
      counterpartyNodeId: freezed == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey?,
      fundingTxo: freezed == fundingTxo
          ? _self.fundingTxo
          : fundingTxo // ignore: cast_nullable_to_non_nullable
              as OutPoint?,
    ));
  }
}

/// @nodoc

class Event_ChannelClosed extends Event {
  const Event_ChannelClosed(
      {required this.channelId,
      required this.userChannelId,
      this.counterpartyNodeId,
      this.reason})
      : super._();

  /// The `channelId` of the channel.
  final ChannelId channelId;

  /// The `userChannelId` of the channel.
  final UserChannelId userChannelId;

  /// The `nodeId` of the channel counterparty.
  ///
  /// This will be `None` for events serialized by LDK Node v0.1.0 and prior.
  final PublicKey? counterpartyNodeId;

  /// This will be `None` for events serialized by LDK Node v0.2.1 and prior.
  final ClosureReason? reason;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Event_ChannelClosedCopyWith<Event_ChannelClosed> get copyWith =>
      _$Event_ChannelClosedCopyWithImpl<Event_ChannelClosed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event_ChannelClosed &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, channelId, userChannelId, counterpartyNodeId, reason);

  @override
  String toString() {
    return 'Event.channelClosed(channelId: $channelId, userChannelId: $userChannelId, counterpartyNodeId: $counterpartyNodeId, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $Event_ChannelClosedCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory $Event_ChannelClosedCopyWith(
          Event_ChannelClosed value, $Res Function(Event_ChannelClosed) _then) =
      _$Event_ChannelClosedCopyWithImpl;
  @useResult
  $Res call(
      {ChannelId channelId,
      UserChannelId userChannelId,
      PublicKey? counterpartyNodeId,
      ClosureReason? reason});

  $ClosureReasonCopyWith<$Res>? get reason;
}

/// @nodoc
class _$Event_ChannelClosedCopyWithImpl<$Res>
    implements $Event_ChannelClosedCopyWith<$Res> {
  _$Event_ChannelClosedCopyWithImpl(this._self, this._then);

  final Event_ChannelClosed _self;
  final $Res Function(Event_ChannelClosed) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
    Object? counterpartyNodeId = freezed,
    Object? reason = freezed,
  }) {
    return _then(Event_ChannelClosed(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      userChannelId: null == userChannelId
          ? _self.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId,
      counterpartyNodeId: freezed == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as ClosureReason?,
    ));
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClosureReasonCopyWith<$Res>? get reason {
    if (_self.reason == null) {
      return null;
    }

    return $ClosureReasonCopyWith<$Res>(_self.reason!, (value) {
      return _then(_self.copyWith(reason: value));
    });
  }
}

/// @nodoc

class Event_PaymentForwarded extends Event {
  const Event_PaymentForwarded(
      {required this.prevChannelId,
      required this.nextChannelId,
      this.prevUserChannelId,
      this.nextUserChannelId,
      this.prevNodeId,
      this.nextNodeId,
      this.totalFeeEarnedMsat,
      this.skimmedFeeMsat,
      required this.claimFromOnchainTx,
      this.outboundAmountForwardedMsat})
      : super._();

  /// The channel id of the incoming channel between the previous node and us.
  final ChannelId prevChannelId;

  /// The channel id of the outgoing channel between the next node and us.
  final ChannelId nextChannelId;

  /// The `user_channel_id` of the incoming channel between the previous node and us.
  final UserChannelId? prevUserChannelId;

  /// The `user_channel_id` of the outgoing channel between the next node and us.
  final UserChannelId? nextUserChannelId;

  /// The node id of the previous node.
  ///
  /// This is only null for HTLCs received prior to LDK Node v0.5 or for events serialized by
  /// versions prior to v0.5.
  final PublicKey? prevNodeId;

  /// The node id of the next node.
  ///
  /// This is only null for HTLCs received prior to LDK Node v0.5 or for events serialized by
  /// versions prior to v0.5.
  final PublicKey? nextNodeId;

  /// The total fee, in milli-satoshis, which was earned as a result of the payment.
  final BigInt? totalFeeEarnedMsat;

  /// The share of the total fee, in milli-satoshis, which was withheld in addition to the
  /// forwarding fee.
  final BigInt? skimmedFeeMsat;

  /// If this is `true`, the forwarded HTLC was claimed by our counterparty via an on-chain
  /// transaction.
  final bool claimFromOnchainTx;

  /// The final amount forwarded, in milli-satoshis, after the fee is deducted.
  final BigInt? outboundAmountForwardedMsat;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Event_PaymentForwardedCopyWith<Event_PaymentForwarded> get copyWith =>
      _$Event_PaymentForwardedCopyWithImpl<Event_PaymentForwarded>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event_PaymentForwarded &&
            (identical(other.prevChannelId, prevChannelId) ||
                other.prevChannelId == prevChannelId) &&
            (identical(other.nextChannelId, nextChannelId) ||
                other.nextChannelId == nextChannelId) &&
            (identical(other.prevUserChannelId, prevUserChannelId) ||
                other.prevUserChannelId == prevUserChannelId) &&
            (identical(other.nextUserChannelId, nextUserChannelId) ||
                other.nextUserChannelId == nextUserChannelId) &&
            (identical(other.prevNodeId, prevNodeId) ||
                other.prevNodeId == prevNodeId) &&
            (identical(other.nextNodeId, nextNodeId) ||
                other.nextNodeId == nextNodeId) &&
            (identical(other.totalFeeEarnedMsat, totalFeeEarnedMsat) ||
                other.totalFeeEarnedMsat == totalFeeEarnedMsat) &&
            (identical(other.skimmedFeeMsat, skimmedFeeMsat) ||
                other.skimmedFeeMsat == skimmedFeeMsat) &&
            (identical(other.claimFromOnchainTx, claimFromOnchainTx) ||
                other.claimFromOnchainTx == claimFromOnchainTx) &&
            (identical(other.outboundAmountForwardedMsat,
                    outboundAmountForwardedMsat) ||
                other.outboundAmountForwardedMsat ==
                    outboundAmountForwardedMsat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      prevChannelId,
      nextChannelId,
      prevUserChannelId,
      nextUserChannelId,
      prevNodeId,
      nextNodeId,
      totalFeeEarnedMsat,
      skimmedFeeMsat,
      claimFromOnchainTx,
      outboundAmountForwardedMsat);

  @override
  String toString() {
    return 'Event.paymentForwarded(prevChannelId: $prevChannelId, nextChannelId: $nextChannelId, prevUserChannelId: $prevUserChannelId, nextUserChannelId: $nextUserChannelId, prevNodeId: $prevNodeId, nextNodeId: $nextNodeId, totalFeeEarnedMsat: $totalFeeEarnedMsat, skimmedFeeMsat: $skimmedFeeMsat, claimFromOnchainTx: $claimFromOnchainTx, outboundAmountForwardedMsat: $outboundAmountForwardedMsat)';
  }
}

/// @nodoc
abstract mixin class $Event_PaymentForwardedCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory $Event_PaymentForwardedCopyWith(Event_PaymentForwarded value,
          $Res Function(Event_PaymentForwarded) _then) =
      _$Event_PaymentForwardedCopyWithImpl;
  @useResult
  $Res call(
      {ChannelId prevChannelId,
      ChannelId nextChannelId,
      UserChannelId? prevUserChannelId,
      UserChannelId? nextUserChannelId,
      PublicKey? prevNodeId,
      PublicKey? nextNodeId,
      BigInt? totalFeeEarnedMsat,
      BigInt? skimmedFeeMsat,
      bool claimFromOnchainTx,
      BigInt? outboundAmountForwardedMsat});
}

/// @nodoc
class _$Event_PaymentForwardedCopyWithImpl<$Res>
    implements $Event_PaymentForwardedCopyWith<$Res> {
  _$Event_PaymentForwardedCopyWithImpl(this._self, this._then);

  final Event_PaymentForwarded _self;
  final $Res Function(Event_PaymentForwarded) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? prevChannelId = null,
    Object? nextChannelId = null,
    Object? prevUserChannelId = freezed,
    Object? nextUserChannelId = freezed,
    Object? prevNodeId = freezed,
    Object? nextNodeId = freezed,
    Object? totalFeeEarnedMsat = freezed,
    Object? skimmedFeeMsat = freezed,
    Object? claimFromOnchainTx = null,
    Object? outboundAmountForwardedMsat = freezed,
  }) {
    return _then(Event_PaymentForwarded(
      prevChannelId: null == prevChannelId
          ? _self.prevChannelId
          : prevChannelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      nextChannelId: null == nextChannelId
          ? _self.nextChannelId
          : nextChannelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      prevUserChannelId: freezed == prevUserChannelId
          ? _self.prevUserChannelId
          : prevUserChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId?,
      nextUserChannelId: freezed == nextUserChannelId
          ? _self.nextUserChannelId
          : nextUserChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId?,
      prevNodeId: freezed == prevNodeId
          ? _self.prevNodeId
          : prevNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey?,
      nextNodeId: freezed == nextNodeId
          ? _self.nextNodeId
          : nextNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey?,
      totalFeeEarnedMsat: freezed == totalFeeEarnedMsat
          ? _self.totalFeeEarnedMsat
          : totalFeeEarnedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      skimmedFeeMsat: freezed == skimmedFeeMsat
          ? _self.skimmedFeeMsat
          : skimmedFeeMsat // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      claimFromOnchainTx: null == claimFromOnchainTx
          ? _self.claimFromOnchainTx
          : claimFromOnchainTx // ignore: cast_nullable_to_non_nullable
              as bool,
      outboundAmountForwardedMsat: freezed == outboundAmountForwardedMsat
          ? _self.outboundAmountForwardedMsat
          : outboundAmountForwardedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt?,
    ));
  }
}

/// @nodoc

class Event_SplicePending extends Event {
  const Event_SplicePending(
      {required this.channelId,
      required this.userChannelId,
      required this.counterpartyNodeId,
      required this.newFundingTxo})
      : super._();

  /// The channel id of the channel being spliced.
  final ChannelId channelId;

  /// The user_channel_id of the channel being spliced.
  final UserChannelId userChannelId;

  /// The node id of the channel counterparty.
  final PublicKey counterpartyNodeId;

  /// The outpoint of the new funding transaction.
  final OutPoint newFundingTxo;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Event_SplicePendingCopyWith<Event_SplicePending> get copyWith =>
      _$Event_SplicePendingCopyWithImpl<Event_SplicePending>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event_SplicePending &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.newFundingTxo, newFundingTxo) ||
                other.newFundingTxo == newFundingTxo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, channelId, userChannelId, counterpartyNodeId, newFundingTxo);

  @override
  String toString() {
    return 'Event.splicePending(channelId: $channelId, userChannelId: $userChannelId, counterpartyNodeId: $counterpartyNodeId, newFundingTxo: $newFundingTxo)';
  }
}

/// @nodoc
abstract mixin class $Event_SplicePendingCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory $Event_SplicePendingCopyWith(
          Event_SplicePending value, $Res Function(Event_SplicePending) _then) =
      _$Event_SplicePendingCopyWithImpl;
  @useResult
  $Res call(
      {ChannelId channelId,
      UserChannelId userChannelId,
      PublicKey counterpartyNodeId,
      OutPoint newFundingTxo});
}

/// @nodoc
class _$Event_SplicePendingCopyWithImpl<$Res>
    implements $Event_SplicePendingCopyWith<$Res> {
  _$Event_SplicePendingCopyWithImpl(this._self, this._then);

  final Event_SplicePending _self;
  final $Res Function(Event_SplicePending) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
    Object? counterpartyNodeId = null,
    Object? newFundingTxo = null,
  }) {
    return _then(Event_SplicePending(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      userChannelId: null == userChannelId
          ? _self.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      newFundingTxo: null == newFundingTxo
          ? _self.newFundingTxo
          : newFundingTxo // ignore: cast_nullable_to_non_nullable
              as OutPoint,
    ));
  }
}

/// @nodoc

class Event_SpliceFailed extends Event {
  const Event_SpliceFailed(
      {required this.channelId,
      required this.userChannelId,
      required this.counterpartyNodeId,
      this.abandonedFundingTxo})
      : super._();

  /// The channel id of the channel that failed to splice.
  final ChannelId channelId;

  /// The user_channel_id of the channel that failed to splice.
  final UserChannelId userChannelId;

  /// The node id of the channel counterparty.
  final PublicKey counterpartyNodeId;

  /// The outpoint of the channel's splice funding transaction, if one was created.
  final OutPoint? abandonedFundingTxo;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Event_SpliceFailedCopyWith<Event_SpliceFailed> get copyWith =>
      _$Event_SpliceFailedCopyWithImpl<Event_SpliceFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event_SpliceFailed &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.abandonedFundingTxo, abandonedFundingTxo) ||
                other.abandonedFundingTxo == abandonedFundingTxo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, userChannelId,
      counterpartyNodeId, abandonedFundingTxo);

  @override
  String toString() {
    return 'Event.spliceFailed(channelId: $channelId, userChannelId: $userChannelId, counterpartyNodeId: $counterpartyNodeId, abandonedFundingTxo: $abandonedFundingTxo)';
  }
}

/// @nodoc
abstract mixin class $Event_SpliceFailedCopyWith<$Res>
    implements $EventCopyWith<$Res> {
  factory $Event_SpliceFailedCopyWith(
          Event_SpliceFailed value, $Res Function(Event_SpliceFailed) _then) =
      _$Event_SpliceFailedCopyWithImpl;
  @useResult
  $Res call(
      {ChannelId channelId,
      UserChannelId userChannelId,
      PublicKey counterpartyNodeId,
      OutPoint? abandonedFundingTxo});
}

/// @nodoc
class _$Event_SpliceFailedCopyWithImpl<$Res>
    implements $Event_SpliceFailedCopyWith<$Res> {
  _$Event_SpliceFailedCopyWithImpl(this._self, this._then);

  final Event_SpliceFailed _self;
  final $Res Function(Event_SpliceFailed) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
    Object? counterpartyNodeId = null,
    Object? abandonedFundingTxo = freezed,
  }) {
    return _then(Event_SpliceFailed(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      userChannelId: null == userChannelId
          ? _self.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      abandonedFundingTxo: freezed == abandonedFundingTxo
          ? _self.abandonedFundingTxo
          : abandonedFundingTxo // ignore: cast_nullable_to_non_nullable
              as OutPoint?,
    ));
  }
}

/// @nodoc
mixin _$GossipSourceConfig {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GossipSourceConfig);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GossipSourceConfig()';
  }
}

/// @nodoc
class $GossipSourceConfigCopyWith<$Res> {
  $GossipSourceConfigCopyWith(
      GossipSourceConfig _, $Res Function(GossipSourceConfig) __);
}

/// Adds pattern-matching-related methods to [GossipSourceConfig].
extension GossipSourceConfigPatterns on GossipSourceConfig {
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
    TResult Function(GossipSourceConfig_P2PNetwork value)? p2PNetwork,
    TResult Function(GossipSourceConfig_RapidGossipSync value)? rapidGossipSync,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GossipSourceConfig_P2PNetwork() when p2PNetwork != null:
        return p2PNetwork(_that);
      case GossipSourceConfig_RapidGossipSync() when rapidGossipSync != null:
        return rapidGossipSync(_that);
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
    required TResult Function(GossipSourceConfig_P2PNetwork value) p2PNetwork,
    required TResult Function(GossipSourceConfig_RapidGossipSync value)
        rapidGossipSync,
  }) {
    final _that = this;
    switch (_that) {
      case GossipSourceConfig_P2PNetwork():
        return p2PNetwork(_that);
      case GossipSourceConfig_RapidGossipSync():
        return rapidGossipSync(_that);
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
    TResult? Function(GossipSourceConfig_P2PNetwork value)? p2PNetwork,
    TResult? Function(GossipSourceConfig_RapidGossipSync value)?
        rapidGossipSync,
  }) {
    final _that = this;
    switch (_that) {
      case GossipSourceConfig_P2PNetwork() when p2PNetwork != null:
        return p2PNetwork(_that);
      case GossipSourceConfig_RapidGossipSync() when rapidGossipSync != null:
        return rapidGossipSync(_that);
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
    TResult Function()? p2PNetwork,
    TResult Function(String field0)? rapidGossipSync,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GossipSourceConfig_P2PNetwork() when p2PNetwork != null:
        return p2PNetwork();
      case GossipSourceConfig_RapidGossipSync() when rapidGossipSync != null:
        return rapidGossipSync(_that.field0);
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
    required TResult Function() p2PNetwork,
    required TResult Function(String field0) rapidGossipSync,
  }) {
    final _that = this;
    switch (_that) {
      case GossipSourceConfig_P2PNetwork():
        return p2PNetwork();
      case GossipSourceConfig_RapidGossipSync():
        return rapidGossipSync(_that.field0);
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
    TResult? Function()? p2PNetwork,
    TResult? Function(String field0)? rapidGossipSync,
  }) {
    final _that = this;
    switch (_that) {
      case GossipSourceConfig_P2PNetwork() when p2PNetwork != null:
        return p2PNetwork();
      case GossipSourceConfig_RapidGossipSync() when rapidGossipSync != null:
        return rapidGossipSync(_that.field0);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GossipSourceConfig_P2PNetwork extends GossipSourceConfig {
  const GossipSourceConfig_P2PNetwork() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GossipSourceConfig_P2PNetwork);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GossipSourceConfig.p2PNetwork()';
  }
}

/// @nodoc

class GossipSourceConfig_RapidGossipSync extends GossipSourceConfig {
  const GossipSourceConfig_RapidGossipSync(this.field0) : super._();

  final String field0;

  /// Create a copy of GossipSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GossipSourceConfig_RapidGossipSyncCopyWith<
          GossipSourceConfig_RapidGossipSync>
      get copyWith => _$GossipSourceConfig_RapidGossipSyncCopyWithImpl<
          GossipSourceConfig_RapidGossipSync>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GossipSourceConfig_RapidGossipSync &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'GossipSourceConfig.rapidGossipSync(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $GossipSourceConfig_RapidGossipSyncCopyWith<$Res>
    implements $GossipSourceConfigCopyWith<$Res> {
  factory $GossipSourceConfig_RapidGossipSyncCopyWith(
          GossipSourceConfig_RapidGossipSync value,
          $Res Function(GossipSourceConfig_RapidGossipSync) _then) =
      _$GossipSourceConfig_RapidGossipSyncCopyWithImpl;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class _$GossipSourceConfig_RapidGossipSyncCopyWithImpl<$Res>
    implements $GossipSourceConfig_RapidGossipSyncCopyWith<$Res> {
  _$GossipSourceConfig_RapidGossipSyncCopyWithImpl(this._self, this._then);

  final GossipSourceConfig_RapidGossipSync _self;
  final $Res Function(GossipSourceConfig_RapidGossipSync) _then;

  /// Create a copy of GossipSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(GossipSourceConfig_RapidGossipSync(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$LightningBalance {
  /// The identifier of the channel this balance belongs to.
  ChannelId get channelId;

  /// The identifier of our channel counterparty.
  PublicKey get counterpartyNodeId;

  /// The amount available to claim, in satoshis, excluding the on-chain fees which will be
  /// required to do so.
  BigInt get amountSatoshis;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LightningBalanceCopyWith<LightningBalance> get copyWith =>
      _$LightningBalanceCopyWithImpl<LightningBalance>(
          this as LightningBalance, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LightningBalance &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, channelId, counterpartyNodeId, amountSatoshis);

  @override
  String toString() {
    return 'LightningBalance(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis)';
  }
}

/// @nodoc
abstract mixin class $LightningBalanceCopyWith<$Res> {
  factory $LightningBalanceCopyWith(
          LightningBalance value, $Res Function(LightningBalance) _then) =
      _$LightningBalanceCopyWithImpl;
  @useResult
  $Res call(
      {ChannelId channelId,
      PublicKey counterpartyNodeId,
      BigInt amountSatoshis});
}

/// @nodoc
class _$LightningBalanceCopyWithImpl<$Res>
    implements $LightningBalanceCopyWith<$Res> {
  _$LightningBalanceCopyWithImpl(this._self, this._then);

  final LightningBalance _self;
  final $Res Function(LightningBalance) _then;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
  }) {
    return _then(_self.copyWith(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// Adds pattern-matching-related methods to [LightningBalance].
extension LightningBalancePatterns on LightningBalance {
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
    TResult Function(LightningBalance_ClaimableOnChannelClose value)?
        claimableOnChannelClose,
    TResult Function(LightningBalance_ClaimableAwaitingConfirmations value)?
        claimableAwaitingConfirmations,
    TResult Function(LightningBalance_ContentiousClaimable value)?
        contentiousClaimable,
    TResult Function(LightningBalance_MaybeTimeoutClaimableHTLC value)?
        maybeTimeoutClaimableHtlc,
    TResult Function(LightningBalance_MaybePreimageClaimableHTLC value)?
        maybePreimageClaimableHtlc,
    TResult Function(LightningBalance_CounterpartyRevokedOutputClaimable value)?
        counterpartyRevokedOutputClaimable,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LightningBalance_ClaimableOnChannelClose()
          when claimableOnChannelClose != null:
        return claimableOnChannelClose(_that);
      case LightningBalance_ClaimableAwaitingConfirmations()
          when claimableAwaitingConfirmations != null:
        return claimableAwaitingConfirmations(_that);
      case LightningBalance_ContentiousClaimable()
          when contentiousClaimable != null:
        return contentiousClaimable(_that);
      case LightningBalance_MaybeTimeoutClaimableHTLC()
          when maybeTimeoutClaimableHtlc != null:
        return maybeTimeoutClaimableHtlc(_that);
      case LightningBalance_MaybePreimageClaimableHTLC()
          when maybePreimageClaimableHtlc != null:
        return maybePreimageClaimableHtlc(_that);
      case LightningBalance_CounterpartyRevokedOutputClaimable()
          when counterpartyRevokedOutputClaimable != null:
        return counterpartyRevokedOutputClaimable(_that);
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
    required TResult Function(LightningBalance_ClaimableOnChannelClose value)
        claimableOnChannelClose,
    required TResult Function(
            LightningBalance_ClaimableAwaitingConfirmations value)
        claimableAwaitingConfirmations,
    required TResult Function(LightningBalance_ContentiousClaimable value)
        contentiousClaimable,
    required TResult Function(LightningBalance_MaybeTimeoutClaimableHTLC value)
        maybeTimeoutClaimableHtlc,
    required TResult Function(LightningBalance_MaybePreimageClaimableHTLC value)
        maybePreimageClaimableHtlc,
    required TResult Function(
            LightningBalance_CounterpartyRevokedOutputClaimable value)
        counterpartyRevokedOutputClaimable,
  }) {
    final _that = this;
    switch (_that) {
      case LightningBalance_ClaimableOnChannelClose():
        return claimableOnChannelClose(_that);
      case LightningBalance_ClaimableAwaitingConfirmations():
        return claimableAwaitingConfirmations(_that);
      case LightningBalance_ContentiousClaimable():
        return contentiousClaimable(_that);
      case LightningBalance_MaybeTimeoutClaimableHTLC():
        return maybeTimeoutClaimableHtlc(_that);
      case LightningBalance_MaybePreimageClaimableHTLC():
        return maybePreimageClaimableHtlc(_that);
      case LightningBalance_CounterpartyRevokedOutputClaimable():
        return counterpartyRevokedOutputClaimable(_that);
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
    TResult? Function(LightningBalance_ClaimableOnChannelClose value)?
        claimableOnChannelClose,
    TResult? Function(LightningBalance_ClaimableAwaitingConfirmations value)?
        claimableAwaitingConfirmations,
    TResult? Function(LightningBalance_ContentiousClaimable value)?
        contentiousClaimable,
    TResult? Function(LightningBalance_MaybeTimeoutClaimableHTLC value)?
        maybeTimeoutClaimableHtlc,
    TResult? Function(LightningBalance_MaybePreimageClaimableHTLC value)?
        maybePreimageClaimableHtlc,
    TResult? Function(
            LightningBalance_CounterpartyRevokedOutputClaimable value)?
        counterpartyRevokedOutputClaimable,
  }) {
    final _that = this;
    switch (_that) {
      case LightningBalance_ClaimableOnChannelClose()
          when claimableOnChannelClose != null:
        return claimableOnChannelClose(_that);
      case LightningBalance_ClaimableAwaitingConfirmations()
          when claimableAwaitingConfirmations != null:
        return claimableAwaitingConfirmations(_that);
      case LightningBalance_ContentiousClaimable()
          when contentiousClaimable != null:
        return contentiousClaimable(_that);
      case LightningBalance_MaybeTimeoutClaimableHTLC()
          when maybeTimeoutClaimableHtlc != null:
        return maybeTimeoutClaimableHtlc(_that);
      case LightningBalance_MaybePreimageClaimableHTLC()
          when maybePreimageClaimableHtlc != null:
        return maybePreimageClaimableHtlc(_that);
      case LightningBalance_CounterpartyRevokedOutputClaimable()
          when counterpartyRevokedOutputClaimable != null:
        return counterpartyRevokedOutputClaimable(_that);
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
    TResult Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            BigInt transactionFeeSatoshis,
            BigInt outboundPaymentHtlcRoundedMsat,
            BigInt outboundForwardedHtlcRoundedMsat,
            BigInt inboundClaimingHtlcRoundedMsat,
            BigInt inboundHtlcRoundedMsat)?
        claimableOnChannelClose,
    TResult Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            int confirmationHeight,
            BalanceSource source)?
        claimableAwaitingConfirmations,
    TResult Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            int timeoutHeight,
            PaymentHash paymentHash,
            PaymentPreimage paymentPreimage)?
        contentiousClaimable,
    TResult Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            int claimableHeight,
            PaymentHash paymentHash,
            bool outboundPayment)?
        maybeTimeoutClaimableHtlc,
    TResult Function(ChannelId channelId, PublicKey counterpartyNodeId,
            BigInt amountSatoshis, int expiryHeight, PaymentHash paymentHash)?
        maybePreimageClaimableHtlc,
    TResult Function(ChannelId channelId, PublicKey counterpartyNodeId,
            BigInt amountSatoshis)?
        counterpartyRevokedOutputClaimable,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LightningBalance_ClaimableOnChannelClose()
          when claimableOnChannelClose != null:
        return claimableOnChannelClose(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.transactionFeeSatoshis,
            _that.outboundPaymentHtlcRoundedMsat,
            _that.outboundForwardedHtlcRoundedMsat,
            _that.inboundClaimingHtlcRoundedMsat,
            _that.inboundHtlcRoundedMsat);
      case LightningBalance_ClaimableAwaitingConfirmations()
          when claimableAwaitingConfirmations != null:
        return claimableAwaitingConfirmations(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.confirmationHeight,
            _that.source);
      case LightningBalance_ContentiousClaimable()
          when contentiousClaimable != null:
        return contentiousClaimable(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.timeoutHeight,
            _that.paymentHash,
            _that.paymentPreimage);
      case LightningBalance_MaybeTimeoutClaimableHTLC()
          when maybeTimeoutClaimableHtlc != null:
        return maybeTimeoutClaimableHtlc(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.claimableHeight,
            _that.paymentHash,
            _that.outboundPayment);
      case LightningBalance_MaybePreimageClaimableHTLC()
          when maybePreimageClaimableHtlc != null:
        return maybePreimageClaimableHtlc(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.expiryHeight,
            _that.paymentHash);
      case LightningBalance_CounterpartyRevokedOutputClaimable()
          when counterpartyRevokedOutputClaimable != null:
        return counterpartyRevokedOutputClaimable(
            _that.channelId, _that.counterpartyNodeId, _that.amountSatoshis);
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
    required TResult Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            BigInt transactionFeeSatoshis,
            BigInt outboundPaymentHtlcRoundedMsat,
            BigInt outboundForwardedHtlcRoundedMsat,
            BigInt inboundClaimingHtlcRoundedMsat,
            BigInt inboundHtlcRoundedMsat)
        claimableOnChannelClose,
    required TResult Function(ChannelId channelId, PublicKey counterpartyNodeId,
            BigInt amountSatoshis, int confirmationHeight, BalanceSource source)
        claimableAwaitingConfirmations,
    required TResult Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            int timeoutHeight,
            PaymentHash paymentHash,
            PaymentPreimage paymentPreimage)
        contentiousClaimable,
    required TResult Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            int claimableHeight,
            PaymentHash paymentHash,
            bool outboundPayment)
        maybeTimeoutClaimableHtlc,
    required TResult Function(ChannelId channelId, PublicKey counterpartyNodeId,
            BigInt amountSatoshis, int expiryHeight, PaymentHash paymentHash)
        maybePreimageClaimableHtlc,
    required TResult Function(ChannelId channelId, PublicKey counterpartyNodeId,
            BigInt amountSatoshis)
        counterpartyRevokedOutputClaimable,
  }) {
    final _that = this;
    switch (_that) {
      case LightningBalance_ClaimableOnChannelClose():
        return claimableOnChannelClose(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.transactionFeeSatoshis,
            _that.outboundPaymentHtlcRoundedMsat,
            _that.outboundForwardedHtlcRoundedMsat,
            _that.inboundClaimingHtlcRoundedMsat,
            _that.inboundHtlcRoundedMsat);
      case LightningBalance_ClaimableAwaitingConfirmations():
        return claimableAwaitingConfirmations(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.confirmationHeight,
            _that.source);
      case LightningBalance_ContentiousClaimable():
        return contentiousClaimable(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.timeoutHeight,
            _that.paymentHash,
            _that.paymentPreimage);
      case LightningBalance_MaybeTimeoutClaimableHTLC():
        return maybeTimeoutClaimableHtlc(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.claimableHeight,
            _that.paymentHash,
            _that.outboundPayment);
      case LightningBalance_MaybePreimageClaimableHTLC():
        return maybePreimageClaimableHtlc(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.expiryHeight,
            _that.paymentHash);
      case LightningBalance_CounterpartyRevokedOutputClaimable():
        return counterpartyRevokedOutputClaimable(
            _that.channelId, _that.counterpartyNodeId, _that.amountSatoshis);
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
    TResult? Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            BigInt transactionFeeSatoshis,
            BigInt outboundPaymentHtlcRoundedMsat,
            BigInt outboundForwardedHtlcRoundedMsat,
            BigInt inboundClaimingHtlcRoundedMsat,
            BigInt inboundHtlcRoundedMsat)?
        claimableOnChannelClose,
    TResult? Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            int confirmationHeight,
            BalanceSource source)?
        claimableAwaitingConfirmations,
    TResult? Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            int timeoutHeight,
            PaymentHash paymentHash,
            PaymentPreimage paymentPreimage)?
        contentiousClaimable,
    TResult? Function(
            ChannelId channelId,
            PublicKey counterpartyNodeId,
            BigInt amountSatoshis,
            int claimableHeight,
            PaymentHash paymentHash,
            bool outboundPayment)?
        maybeTimeoutClaimableHtlc,
    TResult? Function(ChannelId channelId, PublicKey counterpartyNodeId,
            BigInt amountSatoshis, int expiryHeight, PaymentHash paymentHash)?
        maybePreimageClaimableHtlc,
    TResult? Function(ChannelId channelId, PublicKey counterpartyNodeId,
            BigInt amountSatoshis)?
        counterpartyRevokedOutputClaimable,
  }) {
    final _that = this;
    switch (_that) {
      case LightningBalance_ClaimableOnChannelClose()
          when claimableOnChannelClose != null:
        return claimableOnChannelClose(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.transactionFeeSatoshis,
            _that.outboundPaymentHtlcRoundedMsat,
            _that.outboundForwardedHtlcRoundedMsat,
            _that.inboundClaimingHtlcRoundedMsat,
            _that.inboundHtlcRoundedMsat);
      case LightningBalance_ClaimableAwaitingConfirmations()
          when claimableAwaitingConfirmations != null:
        return claimableAwaitingConfirmations(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.confirmationHeight,
            _that.source);
      case LightningBalance_ContentiousClaimable()
          when contentiousClaimable != null:
        return contentiousClaimable(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.timeoutHeight,
            _that.paymentHash,
            _that.paymentPreimage);
      case LightningBalance_MaybeTimeoutClaimableHTLC()
          when maybeTimeoutClaimableHtlc != null:
        return maybeTimeoutClaimableHtlc(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.claimableHeight,
            _that.paymentHash,
            _that.outboundPayment);
      case LightningBalance_MaybePreimageClaimableHTLC()
          when maybePreimageClaimableHtlc != null:
        return maybePreimageClaimableHtlc(
            _that.channelId,
            _that.counterpartyNodeId,
            _that.amountSatoshis,
            _that.expiryHeight,
            _that.paymentHash);
      case LightningBalance_CounterpartyRevokedOutputClaimable()
          when counterpartyRevokedOutputClaimable != null:
        return counterpartyRevokedOutputClaimable(
            _that.channelId, _that.counterpartyNodeId, _that.amountSatoshis);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LightningBalance_ClaimableOnChannelClose extends LightningBalance {
  const LightningBalance_ClaimableOnChannelClose(
      {required this.channelId,
      required this.counterpartyNodeId,
      required this.amountSatoshis,
      required this.transactionFeeSatoshis,
      required this.outboundPaymentHtlcRoundedMsat,
      required this.outboundForwardedHtlcRoundedMsat,
      required this.inboundClaimingHtlcRoundedMsat,
      required this.inboundHtlcRoundedMsat})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId channelId;

  /// The identifier of our channel counterparty.
  @override
  final PublicKey counterpartyNodeId;

  /// The amount available to claim, in satoshis, excluding the on-chain fees which will be
  /// required to do so.
  @override
  final BigInt amountSatoshis;

  /// The transaction fee we pay for the closing commitment transaction. This amount is not
  /// included in the `amount_satoshis` value.
  ///
  /// Note that if this channel is inbound (and thus our counterparty pays the commitment
  /// transaction fee) this value will be zero. For channels created prior to LDK Node 0.4
  /// the channel is always treated as outbound (and thus this value is never zero).
  final BigInt transactionFeeSatoshis;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are outbound
  /// from us and are related to a payment which was sent by us. This is the sum of the
  /// millisatoshis part of all HTLCs which are otherwise represented by
  /// This amount (rounded up to a whole satoshi value) will not be included in `amountSatoshis`.
  final BigInt outboundPaymentHtlcRoundedMsat;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are outbound
  /// from us and are related to a forwarded HTLC. This is the sum of the millisatoshis part
  /// of all HTLCs which are otherwise represented by
  /// This amount (rounded up to a whole satoshi value) will not be included in `amountSatoshis`.
  final BigInt outboundForwardedHtlcRoundedMsat;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are inbound
  /// to us and for which we know the preimage. This is the sum of the millisatoshis part of
  /// all HTLCs which would be represented by `lightningBalance.ContentiousClaimable` on
  /// channel close, but whose current value is included in `amountSatoshis`, as well as any
  /// dust HTLCs which would otherwise be represented the same.
  ///
  /// This amount (rounded up to a whole satoshi value) will not be included in `amountSatoshis`.
  final BigInt inboundClaimingHtlcRoundedMsat;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are inbound
  /// to us and for which we do not know the preimage. This is the sum of the millisatoshis
  /// part of all HTLCs which would be represented by
  /// `lightningBalance.MaybePreimageClaimableHTLC` on channel close, as well as any dust
  /// HTLCs which would otherwise be represented the same.
  ///
  /// This amount (rounded up to a whole satoshi value) will not be included in the
  /// counterparty's `amountSatoshis`.
  final BigInt inboundHtlcRoundedMsat;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LightningBalance_ClaimableOnChannelCloseCopyWith<
          LightningBalance_ClaimableOnChannelClose>
      get copyWith => _$LightningBalance_ClaimableOnChannelCloseCopyWithImpl<
          LightningBalance_ClaimableOnChannelClose>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LightningBalance_ClaimableOnChannelClose &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis) &&
            (identical(other.transactionFeeSatoshis, transactionFeeSatoshis) ||
                other.transactionFeeSatoshis == transactionFeeSatoshis) &&
            (identical(other.outboundPaymentHtlcRoundedMsat,
                    outboundPaymentHtlcRoundedMsat) ||
                other.outboundPaymentHtlcRoundedMsat ==
                    outboundPaymentHtlcRoundedMsat) &&
            (identical(other.outboundForwardedHtlcRoundedMsat,
                    outboundForwardedHtlcRoundedMsat) ||
                other.outboundForwardedHtlcRoundedMsat ==
                    outboundForwardedHtlcRoundedMsat) &&
            (identical(other.inboundClaimingHtlcRoundedMsat,
                    inboundClaimingHtlcRoundedMsat) ||
                other.inboundClaimingHtlcRoundedMsat ==
                    inboundClaimingHtlcRoundedMsat) &&
            (identical(other.inboundHtlcRoundedMsat, inboundHtlcRoundedMsat) ||
                other.inboundHtlcRoundedMsat == inboundHtlcRoundedMsat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      channelId,
      counterpartyNodeId,
      amountSatoshis,
      transactionFeeSatoshis,
      outboundPaymentHtlcRoundedMsat,
      outboundForwardedHtlcRoundedMsat,
      inboundClaimingHtlcRoundedMsat,
      inboundHtlcRoundedMsat);

  @override
  String toString() {
    return 'LightningBalance.claimableOnChannelClose(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis, transactionFeeSatoshis: $transactionFeeSatoshis, outboundPaymentHtlcRoundedMsat: $outboundPaymentHtlcRoundedMsat, outboundForwardedHtlcRoundedMsat: $outboundForwardedHtlcRoundedMsat, inboundClaimingHtlcRoundedMsat: $inboundClaimingHtlcRoundedMsat, inboundHtlcRoundedMsat: $inboundHtlcRoundedMsat)';
  }
}

/// @nodoc
abstract mixin class $LightningBalance_ClaimableOnChannelCloseCopyWith<$Res>
    implements $LightningBalanceCopyWith<$Res> {
  factory $LightningBalance_ClaimableOnChannelCloseCopyWith(
          LightningBalance_ClaimableOnChannelClose value,
          $Res Function(LightningBalance_ClaimableOnChannelClose) _then) =
      _$LightningBalance_ClaimableOnChannelCloseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ChannelId channelId,
      PublicKey counterpartyNodeId,
      BigInt amountSatoshis,
      BigInt transactionFeeSatoshis,
      BigInt outboundPaymentHtlcRoundedMsat,
      BigInt outboundForwardedHtlcRoundedMsat,
      BigInt inboundClaimingHtlcRoundedMsat,
      BigInt inboundHtlcRoundedMsat});
}

/// @nodoc
class _$LightningBalance_ClaimableOnChannelCloseCopyWithImpl<$Res>
    implements $LightningBalance_ClaimableOnChannelCloseCopyWith<$Res> {
  _$LightningBalance_ClaimableOnChannelCloseCopyWithImpl(
      this._self, this._then);

  final LightningBalance_ClaimableOnChannelClose _self;
  final $Res Function(LightningBalance_ClaimableOnChannelClose) _then;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
    Object? transactionFeeSatoshis = null,
    Object? outboundPaymentHtlcRoundedMsat = null,
    Object? outboundForwardedHtlcRoundedMsat = null,
    Object? inboundClaimingHtlcRoundedMsat = null,
    Object? inboundHtlcRoundedMsat = null,
  }) {
    return _then(LightningBalance_ClaimableOnChannelClose(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      transactionFeeSatoshis: null == transactionFeeSatoshis
          ? _self.transactionFeeSatoshis
          : transactionFeeSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      outboundPaymentHtlcRoundedMsat: null == outboundPaymentHtlcRoundedMsat
          ? _self.outboundPaymentHtlcRoundedMsat
          : outboundPaymentHtlcRoundedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
      outboundForwardedHtlcRoundedMsat: null == outboundForwardedHtlcRoundedMsat
          ? _self.outboundForwardedHtlcRoundedMsat
          : outboundForwardedHtlcRoundedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
      inboundClaimingHtlcRoundedMsat: null == inboundClaimingHtlcRoundedMsat
          ? _self.inboundClaimingHtlcRoundedMsat
          : inboundClaimingHtlcRoundedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
      inboundHtlcRoundedMsat: null == inboundHtlcRoundedMsat
          ? _self.inboundHtlcRoundedMsat
          : inboundHtlcRoundedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class LightningBalance_ClaimableAwaitingConfirmations extends LightningBalance {
  const LightningBalance_ClaimableAwaitingConfirmations(
      {required this.channelId,
      required this.counterpartyNodeId,
      required this.amountSatoshis,
      required this.confirmationHeight,
      required this.source})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId channelId;

  /// The identifier of our channel counterparty.
  @override
  final PublicKey counterpartyNodeId;

  /// The amount available to claim, in satoshis, possibly excluding the on-chain fees which
  /// were spent in broadcasting the transaction.
  @override
  final BigInt amountSatoshis;

  /// The height at which an `event.SpendableOutputs` event will be generated for this
  /// amount.
  ///
  final int confirmationHeight;

  /// Whether this balance is a result of cooperative close, a force-close, or an HTLC.
  final BalanceSource source;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LightningBalance_ClaimableAwaitingConfirmationsCopyWith<
          LightningBalance_ClaimableAwaitingConfirmations>
      get copyWith =>
          _$LightningBalance_ClaimableAwaitingConfirmationsCopyWithImpl<
                  LightningBalance_ClaimableAwaitingConfirmations>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LightningBalance_ClaimableAwaitingConfirmations &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis) &&
            (identical(other.confirmationHeight, confirmationHeight) ||
                other.confirmationHeight == confirmationHeight) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, counterpartyNodeId,
      amountSatoshis, confirmationHeight, source);

  @override
  String toString() {
    return 'LightningBalance.claimableAwaitingConfirmations(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis, confirmationHeight: $confirmationHeight, source: $source)';
  }
}

/// @nodoc
abstract mixin class $LightningBalance_ClaimableAwaitingConfirmationsCopyWith<
    $Res> implements $LightningBalanceCopyWith<$Res> {
  factory $LightningBalance_ClaimableAwaitingConfirmationsCopyWith(
          LightningBalance_ClaimableAwaitingConfirmations value,
          $Res Function(LightningBalance_ClaimableAwaitingConfirmations)
              _then) =
      _$LightningBalance_ClaimableAwaitingConfirmationsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ChannelId channelId,
      PublicKey counterpartyNodeId,
      BigInt amountSatoshis,
      int confirmationHeight,
      BalanceSource source});
}

/// @nodoc
class _$LightningBalance_ClaimableAwaitingConfirmationsCopyWithImpl<$Res>
    implements $LightningBalance_ClaimableAwaitingConfirmationsCopyWith<$Res> {
  _$LightningBalance_ClaimableAwaitingConfirmationsCopyWithImpl(
      this._self, this._then);

  final LightningBalance_ClaimableAwaitingConfirmations _self;
  final $Res Function(LightningBalance_ClaimableAwaitingConfirmations) _then;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
    Object? confirmationHeight = null,
    Object? source = null,
  }) {
    return _then(LightningBalance_ClaimableAwaitingConfirmations(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      confirmationHeight: null == confirmationHeight
          ? _self.confirmationHeight
          : confirmationHeight // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as BalanceSource,
    ));
  }
}

/// @nodoc

class LightningBalance_ContentiousClaimable extends LightningBalance {
  const LightningBalance_ContentiousClaimable(
      {required this.channelId,
      required this.counterpartyNodeId,
      required this.amountSatoshis,
      required this.timeoutHeight,
      required this.paymentHash,
      required this.paymentPreimage})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId channelId;

  /// The identifier of our channel counterparty.
  @override
  final PublicKey counterpartyNodeId;

  /// The amount available to claim, in satoshis, excluding the on-chain fees which will be
  /// required to do so.
  @override
  final BigInt amountSatoshis;

  /// The height at which the counterparty may be able to claim the balance if we have not
  /// done so.
  final int timeoutHeight;

  /// The payment hash that locks this HTLC.
  final PaymentHash paymentHash;

  /// The preimage that can be used to claim this HTLC.
  final PaymentPreimage paymentPreimage;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LightningBalance_ContentiousClaimableCopyWith<
          LightningBalance_ContentiousClaimable>
      get copyWith => _$LightningBalance_ContentiousClaimableCopyWithImpl<
          LightningBalance_ContentiousClaimable>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LightningBalance_ContentiousClaimable &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis) &&
            (identical(other.timeoutHeight, timeoutHeight) ||
                other.timeoutHeight == timeoutHeight) &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash) &&
            (identical(other.paymentPreimage, paymentPreimage) ||
                other.paymentPreimage == paymentPreimage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, counterpartyNodeId,
      amountSatoshis, timeoutHeight, paymentHash, paymentPreimage);

  @override
  String toString() {
    return 'LightningBalance.contentiousClaimable(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis, timeoutHeight: $timeoutHeight, paymentHash: $paymentHash, paymentPreimage: $paymentPreimage)';
  }
}

/// @nodoc
abstract mixin class $LightningBalance_ContentiousClaimableCopyWith<$Res>
    implements $LightningBalanceCopyWith<$Res> {
  factory $LightningBalance_ContentiousClaimableCopyWith(
          LightningBalance_ContentiousClaimable value,
          $Res Function(LightningBalance_ContentiousClaimable) _then) =
      _$LightningBalance_ContentiousClaimableCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ChannelId channelId,
      PublicKey counterpartyNodeId,
      BigInt amountSatoshis,
      int timeoutHeight,
      PaymentHash paymentHash,
      PaymentPreimage paymentPreimage});
}

/// @nodoc
class _$LightningBalance_ContentiousClaimableCopyWithImpl<$Res>
    implements $LightningBalance_ContentiousClaimableCopyWith<$Res> {
  _$LightningBalance_ContentiousClaimableCopyWithImpl(this._self, this._then);

  final LightningBalance_ContentiousClaimable _self;
  final $Res Function(LightningBalance_ContentiousClaimable) _then;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
    Object? timeoutHeight = null,
    Object? paymentHash = null,
    Object? paymentPreimage = null,
  }) {
    return _then(LightningBalance_ContentiousClaimable(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      timeoutHeight: null == timeoutHeight
          ? _self.timeoutHeight
          : timeoutHeight // ignore: cast_nullable_to_non_nullable
              as int,
      paymentHash: null == paymentHash
          ? _self.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      paymentPreimage: null == paymentPreimage
          ? _self.paymentPreimage
          : paymentPreimage // ignore: cast_nullable_to_non_nullable
              as PaymentPreimage,
    ));
  }
}

/// @nodoc

class LightningBalance_MaybeTimeoutClaimableHTLC extends LightningBalance {
  const LightningBalance_MaybeTimeoutClaimableHTLC(
      {required this.channelId,
      required this.counterpartyNodeId,
      required this.amountSatoshis,
      required this.claimableHeight,
      required this.paymentHash,
      required this.outboundPayment})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId channelId;

  /// The identifier of our channel counterparty.
  @override
  final PublicKey counterpartyNodeId;

  /// The amount potentially available to claim, in satoshis, excluding the on-chain fees
  /// which will be required to do so.
  @override
  final BigInt amountSatoshis;

  /// The height at which we will be able to claim the balance if our counterparty has not
  /// done so.
  final int claimableHeight;

  /// The payment hash whose preimage our counterparty needs to claim this HTLC.
  final PaymentHash paymentHash;

  ///
  final bool outboundPayment;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LightningBalance_MaybeTimeoutClaimableHTLCCopyWith<
          LightningBalance_MaybeTimeoutClaimableHTLC>
      get copyWith => _$LightningBalance_MaybeTimeoutClaimableHTLCCopyWithImpl<
          LightningBalance_MaybeTimeoutClaimableHTLC>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LightningBalance_MaybeTimeoutClaimableHTLC &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis) &&
            (identical(other.claimableHeight, claimableHeight) ||
                other.claimableHeight == claimableHeight) &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash) &&
            (identical(other.outboundPayment, outboundPayment) ||
                other.outboundPayment == outboundPayment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, counterpartyNodeId,
      amountSatoshis, claimableHeight, paymentHash, outboundPayment);

  @override
  String toString() {
    return 'LightningBalance.maybeTimeoutClaimableHtlc(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis, claimableHeight: $claimableHeight, paymentHash: $paymentHash, outboundPayment: $outboundPayment)';
  }
}

/// @nodoc
abstract mixin class $LightningBalance_MaybeTimeoutClaimableHTLCCopyWith<$Res>
    implements $LightningBalanceCopyWith<$Res> {
  factory $LightningBalance_MaybeTimeoutClaimableHTLCCopyWith(
          LightningBalance_MaybeTimeoutClaimableHTLC value,
          $Res Function(LightningBalance_MaybeTimeoutClaimableHTLC) _then) =
      _$LightningBalance_MaybeTimeoutClaimableHTLCCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ChannelId channelId,
      PublicKey counterpartyNodeId,
      BigInt amountSatoshis,
      int claimableHeight,
      PaymentHash paymentHash,
      bool outboundPayment});
}

/// @nodoc
class _$LightningBalance_MaybeTimeoutClaimableHTLCCopyWithImpl<$Res>
    implements $LightningBalance_MaybeTimeoutClaimableHTLCCopyWith<$Res> {
  _$LightningBalance_MaybeTimeoutClaimableHTLCCopyWithImpl(
      this._self, this._then);

  final LightningBalance_MaybeTimeoutClaimableHTLC _self;
  final $Res Function(LightningBalance_MaybeTimeoutClaimableHTLC) _then;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
    Object? claimableHeight = null,
    Object? paymentHash = null,
    Object? outboundPayment = null,
  }) {
    return _then(LightningBalance_MaybeTimeoutClaimableHTLC(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      claimableHeight: null == claimableHeight
          ? _self.claimableHeight
          : claimableHeight // ignore: cast_nullable_to_non_nullable
              as int,
      paymentHash: null == paymentHash
          ? _self.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      outboundPayment: null == outboundPayment
          ? _self.outboundPayment
          : outboundPayment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class LightningBalance_MaybePreimageClaimableHTLC extends LightningBalance {
  const LightningBalance_MaybePreimageClaimableHTLC(
      {required this.channelId,
      required this.counterpartyNodeId,
      required this.amountSatoshis,
      required this.expiryHeight,
      required this.paymentHash})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId channelId;

  /// The identifier of our channel counterparty.
  @override
  final PublicKey counterpartyNodeId;

  /// The amount potentially available to claim, in satoshis, excluding the on-chain fees
  /// which will be required to do so.
  @override
  final BigInt amountSatoshis;

  /// The height at which our counterparty will be able to claim the balance if we have not
  /// yet received the preimage and claimed it ourselves.
  final int expiryHeight;

  /// The payment hash whose preimage we need to claim this HTLC.
  final PaymentHash paymentHash;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LightningBalance_MaybePreimageClaimableHTLCCopyWith<
          LightningBalance_MaybePreimageClaimableHTLC>
      get copyWith => _$LightningBalance_MaybePreimageClaimableHTLCCopyWithImpl<
          LightningBalance_MaybePreimageClaimableHTLC>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LightningBalance_MaybePreimageClaimableHTLC &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis) &&
            (identical(other.expiryHeight, expiryHeight) ||
                other.expiryHeight == expiryHeight) &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, counterpartyNodeId,
      amountSatoshis, expiryHeight, paymentHash);

  @override
  String toString() {
    return 'LightningBalance.maybePreimageClaimableHtlc(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis, expiryHeight: $expiryHeight, paymentHash: $paymentHash)';
  }
}

/// @nodoc
abstract mixin class $LightningBalance_MaybePreimageClaimableHTLCCopyWith<$Res>
    implements $LightningBalanceCopyWith<$Res> {
  factory $LightningBalance_MaybePreimageClaimableHTLCCopyWith(
          LightningBalance_MaybePreimageClaimableHTLC value,
          $Res Function(LightningBalance_MaybePreimageClaimableHTLC) _then) =
      _$LightningBalance_MaybePreimageClaimableHTLCCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ChannelId channelId,
      PublicKey counterpartyNodeId,
      BigInt amountSatoshis,
      int expiryHeight,
      PaymentHash paymentHash});
}

/// @nodoc
class _$LightningBalance_MaybePreimageClaimableHTLCCopyWithImpl<$Res>
    implements $LightningBalance_MaybePreimageClaimableHTLCCopyWith<$Res> {
  _$LightningBalance_MaybePreimageClaimableHTLCCopyWithImpl(
      this._self, this._then);

  final LightningBalance_MaybePreimageClaimableHTLC _self;
  final $Res Function(LightningBalance_MaybePreimageClaimableHTLC) _then;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
    Object? expiryHeight = null,
    Object? paymentHash = null,
  }) {
    return _then(LightningBalance_MaybePreimageClaimableHTLC(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      expiryHeight: null == expiryHeight
          ? _self.expiryHeight
          : expiryHeight // ignore: cast_nullable_to_non_nullable
              as int,
      paymentHash: null == paymentHash
          ? _self.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
    ));
  }
}

/// @nodoc

class LightningBalance_CounterpartyRevokedOutputClaimable
    extends LightningBalance {
  const LightningBalance_CounterpartyRevokedOutputClaimable(
      {required this.channelId,
      required this.counterpartyNodeId,
      required this.amountSatoshis})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId channelId;

  /// The identifier of our channel counterparty.
  @override
  final PublicKey counterpartyNodeId;

  /// The amount, in satoshis, of the output which we can claim.
  @override
  final BigInt amountSatoshis;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LightningBalance_CounterpartyRevokedOutputClaimableCopyWith<
          LightningBalance_CounterpartyRevokedOutputClaimable>
      get copyWith =>
          _$LightningBalance_CounterpartyRevokedOutputClaimableCopyWithImpl<
                  LightningBalance_CounterpartyRevokedOutputClaimable>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LightningBalance_CounterpartyRevokedOutputClaimable &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, channelId, counterpartyNodeId, amountSatoshis);

  @override
  String toString() {
    return 'LightningBalance.counterpartyRevokedOutputClaimable(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis)';
  }
}

/// @nodoc
abstract mixin class $LightningBalance_CounterpartyRevokedOutputClaimableCopyWith<
    $Res> implements $LightningBalanceCopyWith<$Res> {
  factory $LightningBalance_CounterpartyRevokedOutputClaimableCopyWith(
          LightningBalance_CounterpartyRevokedOutputClaimable value,
          $Res Function(LightningBalance_CounterpartyRevokedOutputClaimable)
              _then) =
      _$LightningBalance_CounterpartyRevokedOutputClaimableCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ChannelId channelId,
      PublicKey counterpartyNodeId,
      BigInt amountSatoshis});
}

/// @nodoc
class _$LightningBalance_CounterpartyRevokedOutputClaimableCopyWithImpl<$Res>
    implements
        $LightningBalance_CounterpartyRevokedOutputClaimableCopyWith<$Res> {
  _$LightningBalance_CounterpartyRevokedOutputClaimableCopyWithImpl(
      this._self, this._then);

  final LightningBalance_CounterpartyRevokedOutputClaimable _self;
  final $Res Function(LightningBalance_CounterpartyRevokedOutputClaimable)
      _then;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
  }) {
    return _then(LightningBalance_CounterpartyRevokedOutputClaimable(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _self.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc
mixin _$MaxDustHTLCExposure {
  BigInt get field0;

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MaxDustHTLCExposureCopyWith<MaxDustHTLCExposure> get copyWith =>
      _$MaxDustHTLCExposureCopyWithImpl<MaxDustHTLCExposure>(
          this as MaxDustHTLCExposure, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaxDustHTLCExposure &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'MaxDustHTLCExposure(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $MaxDustHTLCExposureCopyWith<$Res> {
  factory $MaxDustHTLCExposureCopyWith(
          MaxDustHTLCExposure value, $Res Function(MaxDustHTLCExposure) _then) =
      _$MaxDustHTLCExposureCopyWithImpl;
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class _$MaxDustHTLCExposureCopyWithImpl<$Res>
    implements $MaxDustHTLCExposureCopyWith<$Res> {
  _$MaxDustHTLCExposureCopyWithImpl(this._self, this._then);

  final MaxDustHTLCExposure _self;
  final $Res Function(MaxDustHTLCExposure) _then;

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_self.copyWith(
      field0: null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// Adds pattern-matching-related methods to [MaxDustHTLCExposure].
extension MaxDustHTLCExposurePatterns on MaxDustHTLCExposure {
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
    TResult Function(MaxDustHTLCExposure_FixedLimitMsat value)? fixedLimitMsat,
    TResult Function(MaxDustHTLCExposure_FeeRateMultiplier value)?
        feeRateMultiplier,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case MaxDustHTLCExposure_FixedLimitMsat() when fixedLimitMsat != null:
        return fixedLimitMsat(_that);
      case MaxDustHTLCExposure_FeeRateMultiplier()
          when feeRateMultiplier != null:
        return feeRateMultiplier(_that);
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
    required TResult Function(MaxDustHTLCExposure_FixedLimitMsat value)
        fixedLimitMsat,
    required TResult Function(MaxDustHTLCExposure_FeeRateMultiplier value)
        feeRateMultiplier,
  }) {
    final _that = this;
    switch (_that) {
      case MaxDustHTLCExposure_FixedLimitMsat():
        return fixedLimitMsat(_that);
      case MaxDustHTLCExposure_FeeRateMultiplier():
        return feeRateMultiplier(_that);
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
    TResult? Function(MaxDustHTLCExposure_FixedLimitMsat value)? fixedLimitMsat,
    TResult? Function(MaxDustHTLCExposure_FeeRateMultiplier value)?
        feeRateMultiplier,
  }) {
    final _that = this;
    switch (_that) {
      case MaxDustHTLCExposure_FixedLimitMsat() when fixedLimitMsat != null:
        return fixedLimitMsat(_that);
      case MaxDustHTLCExposure_FeeRateMultiplier()
          when feeRateMultiplier != null:
        return feeRateMultiplier(_that);
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
    TResult Function(BigInt field0)? fixedLimitMsat,
    TResult Function(BigInt field0)? feeRateMultiplier,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case MaxDustHTLCExposure_FixedLimitMsat() when fixedLimitMsat != null:
        return fixedLimitMsat(_that.field0);
      case MaxDustHTLCExposure_FeeRateMultiplier()
          when feeRateMultiplier != null:
        return feeRateMultiplier(_that.field0);
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
    required TResult Function(BigInt field0) fixedLimitMsat,
    required TResult Function(BigInt field0) feeRateMultiplier,
  }) {
    final _that = this;
    switch (_that) {
      case MaxDustHTLCExposure_FixedLimitMsat():
        return fixedLimitMsat(_that.field0);
      case MaxDustHTLCExposure_FeeRateMultiplier():
        return feeRateMultiplier(_that.field0);
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
    TResult? Function(BigInt field0)? fixedLimitMsat,
    TResult? Function(BigInt field0)? feeRateMultiplier,
  }) {
    final _that = this;
    switch (_that) {
      case MaxDustHTLCExposure_FixedLimitMsat() when fixedLimitMsat != null:
        return fixedLimitMsat(_that.field0);
      case MaxDustHTLCExposure_FeeRateMultiplier()
          when feeRateMultiplier != null:
        return feeRateMultiplier(_that.field0);
      case _:
        return null;
    }
  }
}

/// @nodoc

class MaxDustHTLCExposure_FixedLimitMsat extends MaxDustHTLCExposure {
  const MaxDustHTLCExposure_FixedLimitMsat(this.field0) : super._();

  @override
  final BigInt field0;

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MaxDustHTLCExposure_FixedLimitMsatCopyWith<
          MaxDustHTLCExposure_FixedLimitMsat>
      get copyWith => _$MaxDustHTLCExposure_FixedLimitMsatCopyWithImpl<
          MaxDustHTLCExposure_FixedLimitMsat>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaxDustHTLCExposure_FixedLimitMsat &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'MaxDustHTLCExposure.fixedLimitMsat(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $MaxDustHTLCExposure_FixedLimitMsatCopyWith<$Res>
    implements $MaxDustHTLCExposureCopyWith<$Res> {
  factory $MaxDustHTLCExposure_FixedLimitMsatCopyWith(
          MaxDustHTLCExposure_FixedLimitMsat value,
          $Res Function(MaxDustHTLCExposure_FixedLimitMsat) _then) =
      _$MaxDustHTLCExposure_FixedLimitMsatCopyWithImpl;
  @override
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class _$MaxDustHTLCExposure_FixedLimitMsatCopyWithImpl<$Res>
    implements $MaxDustHTLCExposure_FixedLimitMsatCopyWith<$Res> {
  _$MaxDustHTLCExposure_FixedLimitMsatCopyWithImpl(this._self, this._then);

  final MaxDustHTLCExposure_FixedLimitMsat _self;
  final $Res Function(MaxDustHTLCExposure_FixedLimitMsat) _then;

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(MaxDustHTLCExposure_FixedLimitMsat(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class MaxDustHTLCExposure_FeeRateMultiplier extends MaxDustHTLCExposure {
  const MaxDustHTLCExposure_FeeRateMultiplier(this.field0) : super._();

  @override
  final BigInt field0;

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MaxDustHTLCExposure_FeeRateMultiplierCopyWith<
          MaxDustHTLCExposure_FeeRateMultiplier>
      get copyWith => _$MaxDustHTLCExposure_FeeRateMultiplierCopyWithImpl<
          MaxDustHTLCExposure_FeeRateMultiplier>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaxDustHTLCExposure_FeeRateMultiplier &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @override
  String toString() {
    return 'MaxDustHTLCExposure.feeRateMultiplier(field0: $field0)';
  }
}

/// @nodoc
abstract mixin class $MaxDustHTLCExposure_FeeRateMultiplierCopyWith<$Res>
    implements $MaxDustHTLCExposureCopyWith<$Res> {
  factory $MaxDustHTLCExposure_FeeRateMultiplierCopyWith(
          MaxDustHTLCExposure_FeeRateMultiplier value,
          $Res Function(MaxDustHTLCExposure_FeeRateMultiplier) _then) =
      _$MaxDustHTLCExposure_FeeRateMultiplierCopyWithImpl;
  @override
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class _$MaxDustHTLCExposure_FeeRateMultiplierCopyWithImpl<$Res>
    implements $MaxDustHTLCExposure_FeeRateMultiplierCopyWith<$Res> {
  _$MaxDustHTLCExposure_FeeRateMultiplierCopyWithImpl(this._self, this._then);

  final MaxDustHTLCExposure_FeeRateMultiplier _self;
  final $Res Function(MaxDustHTLCExposure_FeeRateMultiplier) _then;

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? field0 = null,
  }) {
    return _then(MaxDustHTLCExposure_FeeRateMultiplier(
      null == field0
          ? _self.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc
mixin _$MaxTotalRoutingFeeLimit {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MaxTotalRoutingFeeLimit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MaxTotalRoutingFeeLimit()';
  }
}

/// @nodoc
class $MaxTotalRoutingFeeLimitCopyWith<$Res> {
  $MaxTotalRoutingFeeLimitCopyWith(
      MaxTotalRoutingFeeLimit _, $Res Function(MaxTotalRoutingFeeLimit) __);
}

/// Adds pattern-matching-related methods to [MaxTotalRoutingFeeLimit].
extension MaxTotalRoutingFeeLimitPatterns on MaxTotalRoutingFeeLimit {
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
    TResult Function(MaxTotalRoutingFeeLimit_NoFeeCap value)? noFeeCap,
    TResult Function(MaxTotalRoutingFeeLimit_FeeCap value)? feeCap,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case MaxTotalRoutingFeeLimit_NoFeeCap() when noFeeCap != null:
        return noFeeCap(_that);
      case MaxTotalRoutingFeeLimit_FeeCap() when feeCap != null:
        return feeCap(_that);
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
    required TResult Function(MaxTotalRoutingFeeLimit_NoFeeCap value) noFeeCap,
    required TResult Function(MaxTotalRoutingFeeLimit_FeeCap value) feeCap,
  }) {
    final _that = this;
    switch (_that) {
      case MaxTotalRoutingFeeLimit_NoFeeCap():
        return noFeeCap(_that);
      case MaxTotalRoutingFeeLimit_FeeCap():
        return feeCap(_that);
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
    TResult? Function(MaxTotalRoutingFeeLimit_NoFeeCap value)? noFeeCap,
    TResult? Function(MaxTotalRoutingFeeLimit_FeeCap value)? feeCap,
  }) {
    final _that = this;
    switch (_that) {
      case MaxTotalRoutingFeeLimit_NoFeeCap() when noFeeCap != null:
        return noFeeCap(_that);
      case MaxTotalRoutingFeeLimit_FeeCap() when feeCap != null:
        return feeCap(_that);
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
    TResult Function()? noFeeCap,
    TResult Function(BigInt amountMsat)? feeCap,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case MaxTotalRoutingFeeLimit_NoFeeCap() when noFeeCap != null:
        return noFeeCap();
      case MaxTotalRoutingFeeLimit_FeeCap() when feeCap != null:
        return feeCap(_that.amountMsat);
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
    required TResult Function() noFeeCap,
    required TResult Function(BigInt amountMsat) feeCap,
  }) {
    final _that = this;
    switch (_that) {
      case MaxTotalRoutingFeeLimit_NoFeeCap():
        return noFeeCap();
      case MaxTotalRoutingFeeLimit_FeeCap():
        return feeCap(_that.amountMsat);
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
    TResult? Function()? noFeeCap,
    TResult? Function(BigInt amountMsat)? feeCap,
  }) {
    final _that = this;
    switch (_that) {
      case MaxTotalRoutingFeeLimit_NoFeeCap() when noFeeCap != null:
        return noFeeCap();
      case MaxTotalRoutingFeeLimit_FeeCap() when feeCap != null:
        return feeCap(_that.amountMsat);
      case _:
        return null;
    }
  }
}

/// @nodoc

class MaxTotalRoutingFeeLimit_NoFeeCap extends MaxTotalRoutingFeeLimit {
  const MaxTotalRoutingFeeLimit_NoFeeCap() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaxTotalRoutingFeeLimit_NoFeeCap);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MaxTotalRoutingFeeLimit.noFeeCap()';
  }
}

/// @nodoc

class MaxTotalRoutingFeeLimit_FeeCap extends MaxTotalRoutingFeeLimit {
  const MaxTotalRoutingFeeLimit_FeeCap({required this.amountMsat}) : super._();

  final BigInt amountMsat;

  /// Create a copy of MaxTotalRoutingFeeLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MaxTotalRoutingFeeLimit_FeeCapCopyWith<MaxTotalRoutingFeeLimit_FeeCap>
      get copyWith => _$MaxTotalRoutingFeeLimit_FeeCapCopyWithImpl<
          MaxTotalRoutingFeeLimit_FeeCap>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaxTotalRoutingFeeLimit_FeeCap &&
            (identical(other.amountMsat, amountMsat) ||
                other.amountMsat == amountMsat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amountMsat);

  @override
  String toString() {
    return 'MaxTotalRoutingFeeLimit.feeCap(amountMsat: $amountMsat)';
  }
}

/// @nodoc
abstract mixin class $MaxTotalRoutingFeeLimit_FeeCapCopyWith<$Res>
    implements $MaxTotalRoutingFeeLimitCopyWith<$Res> {
  factory $MaxTotalRoutingFeeLimit_FeeCapCopyWith(
          MaxTotalRoutingFeeLimit_FeeCap value,
          $Res Function(MaxTotalRoutingFeeLimit_FeeCap) _then) =
      _$MaxTotalRoutingFeeLimit_FeeCapCopyWithImpl;
  @useResult
  $Res call({BigInt amountMsat});
}

/// @nodoc
class _$MaxTotalRoutingFeeLimit_FeeCapCopyWithImpl<$Res>
    implements $MaxTotalRoutingFeeLimit_FeeCapCopyWith<$Res> {
  _$MaxTotalRoutingFeeLimit_FeeCapCopyWithImpl(this._self, this._then);

  final MaxTotalRoutingFeeLimit_FeeCap _self;
  final $Res Function(MaxTotalRoutingFeeLimit_FeeCap) _then;

  /// Create a copy of MaxTotalRoutingFeeLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? amountMsat = null,
  }) {
    return _then(MaxTotalRoutingFeeLimit_FeeCap(
      amountMsat: null == amountMsat
          ? _self.amountMsat
          : amountMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc
mixin _$PaymentKind {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentKind);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentKind()';
  }
}

/// @nodoc
class $PaymentKindCopyWith<$Res> {
  $PaymentKindCopyWith(PaymentKind _, $Res Function(PaymentKind) __);
}

/// Adds pattern-matching-related methods to [PaymentKind].
extension PaymentKindPatterns on PaymentKind {
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
    TResult Function(PaymentKind_Onchain value)? onchain,
    TResult Function(PaymentKind_Bolt11 value)? bolt11,
    TResult Function(PaymentKind_Bolt11Jit value)? bolt11Jit,
    TResult Function(PaymentKind_Spontaneous value)? spontaneous,
    TResult Function(PaymentKind_Bolt12Offer value)? bolt12Offer,
    TResult Function(PaymentKind_Bolt12Refund value)? bolt12Refund,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PaymentKind_Onchain() when onchain != null:
        return onchain(_that);
      case PaymentKind_Bolt11() when bolt11 != null:
        return bolt11(_that);
      case PaymentKind_Bolt11Jit() when bolt11Jit != null:
        return bolt11Jit(_that);
      case PaymentKind_Spontaneous() when spontaneous != null:
        return spontaneous(_that);
      case PaymentKind_Bolt12Offer() when bolt12Offer != null:
        return bolt12Offer(_that);
      case PaymentKind_Bolt12Refund() when bolt12Refund != null:
        return bolt12Refund(_that);
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
    required TResult Function(PaymentKind_Onchain value) onchain,
    required TResult Function(PaymentKind_Bolt11 value) bolt11,
    required TResult Function(PaymentKind_Bolt11Jit value) bolt11Jit,
    required TResult Function(PaymentKind_Spontaneous value) spontaneous,
    required TResult Function(PaymentKind_Bolt12Offer value) bolt12Offer,
    required TResult Function(PaymentKind_Bolt12Refund value) bolt12Refund,
  }) {
    final _that = this;
    switch (_that) {
      case PaymentKind_Onchain():
        return onchain(_that);
      case PaymentKind_Bolt11():
        return bolt11(_that);
      case PaymentKind_Bolt11Jit():
        return bolt11Jit(_that);
      case PaymentKind_Spontaneous():
        return spontaneous(_that);
      case PaymentKind_Bolt12Offer():
        return bolt12Offer(_that);
      case PaymentKind_Bolt12Refund():
        return bolt12Refund(_that);
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
    TResult? Function(PaymentKind_Onchain value)? onchain,
    TResult? Function(PaymentKind_Bolt11 value)? bolt11,
    TResult? Function(PaymentKind_Bolt11Jit value)? bolt11Jit,
    TResult? Function(PaymentKind_Spontaneous value)? spontaneous,
    TResult? Function(PaymentKind_Bolt12Offer value)? bolt12Offer,
    TResult? Function(PaymentKind_Bolt12Refund value)? bolt12Refund,
  }) {
    final _that = this;
    switch (_that) {
      case PaymentKind_Onchain() when onchain != null:
        return onchain(_that);
      case PaymentKind_Bolt11() when bolt11 != null:
        return bolt11(_that);
      case PaymentKind_Bolt11Jit() when bolt11Jit != null:
        return bolt11Jit(_that);
      case PaymentKind_Spontaneous() when spontaneous != null:
        return spontaneous(_that);
      case PaymentKind_Bolt12Offer() when bolt12Offer != null:
        return bolt12Offer(_that);
      case PaymentKind_Bolt12Refund() when bolt12Refund != null:
        return bolt12Refund(_that);
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
    TResult Function(Txid txid, ConfirmationStatus status)? onchain,
    TResult Function(
            PaymentHash hash, PaymentPreimage? preimage, PaymentSecret? secret)?
        bolt11,
    TResult Function(
            PaymentHash hash,
            PaymentPreimage? preimage,
            PaymentSecret? secret,
            LSPFeeLimits lspFeeLimits,
            BigInt? counterpartySkimmedFeeMsat)?
        bolt11Jit,
    TResult Function(PaymentHash hash, PaymentPreimage? preimage)? spontaneous,
    TResult Function(
            PaymentHash? hash,
            PaymentPreimage? preimage,
            PaymentSecret? secret,
            OfferId offerId,
            String? payerNote,
            BigInt? quantity)?
        bolt12Offer,
    TResult Function(PaymentHash? hash, PaymentPreimage? preimage,
            PaymentSecret? secret, String? payerNote, BigInt? quantity)?
        bolt12Refund,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PaymentKind_Onchain() when onchain != null:
        return onchain(_that.txid, _that.status);
      case PaymentKind_Bolt11() when bolt11 != null:
        return bolt11(_that.hash, _that.preimage, _that.secret);
      case PaymentKind_Bolt11Jit() when bolt11Jit != null:
        return bolt11Jit(_that.hash, _that.preimage, _that.secret,
            _that.lspFeeLimits, _that.counterpartySkimmedFeeMsat);
      case PaymentKind_Spontaneous() when spontaneous != null:
        return spontaneous(_that.hash, _that.preimage);
      case PaymentKind_Bolt12Offer() when bolt12Offer != null:
        return bolt12Offer(_that.hash, _that.preimage, _that.secret,
            _that.offerId, _that.payerNote, _that.quantity);
      case PaymentKind_Bolt12Refund() when bolt12Refund != null:
        return bolt12Refund(_that.hash, _that.preimage, _that.secret,
            _that.payerNote, _that.quantity);
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
    required TResult Function(Txid txid, ConfirmationStatus status) onchain,
    required TResult Function(
            PaymentHash hash, PaymentPreimage? preimage, PaymentSecret? secret)
        bolt11,
    required TResult Function(
            PaymentHash hash,
            PaymentPreimage? preimage,
            PaymentSecret? secret,
            LSPFeeLimits lspFeeLimits,
            BigInt? counterpartySkimmedFeeMsat)
        bolt11Jit,
    required TResult Function(PaymentHash hash, PaymentPreimage? preimage)
        spontaneous,
    required TResult Function(
            PaymentHash? hash,
            PaymentPreimage? preimage,
            PaymentSecret? secret,
            OfferId offerId,
            String? payerNote,
            BigInt? quantity)
        bolt12Offer,
    required TResult Function(PaymentHash? hash, PaymentPreimage? preimage,
            PaymentSecret? secret, String? payerNote, BigInt? quantity)
        bolt12Refund,
  }) {
    final _that = this;
    switch (_that) {
      case PaymentKind_Onchain():
        return onchain(_that.txid, _that.status);
      case PaymentKind_Bolt11():
        return bolt11(_that.hash, _that.preimage, _that.secret);
      case PaymentKind_Bolt11Jit():
        return bolt11Jit(_that.hash, _that.preimage, _that.secret,
            _that.lspFeeLimits, _that.counterpartySkimmedFeeMsat);
      case PaymentKind_Spontaneous():
        return spontaneous(_that.hash, _that.preimage);
      case PaymentKind_Bolt12Offer():
        return bolt12Offer(_that.hash, _that.preimage, _that.secret,
            _that.offerId, _that.payerNote, _that.quantity);
      case PaymentKind_Bolt12Refund():
        return bolt12Refund(_that.hash, _that.preimage, _that.secret,
            _that.payerNote, _that.quantity);
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
    TResult? Function(Txid txid, ConfirmationStatus status)? onchain,
    TResult? Function(
            PaymentHash hash, PaymentPreimage? preimage, PaymentSecret? secret)?
        bolt11,
    TResult? Function(
            PaymentHash hash,
            PaymentPreimage? preimage,
            PaymentSecret? secret,
            LSPFeeLimits lspFeeLimits,
            BigInt? counterpartySkimmedFeeMsat)?
        bolt11Jit,
    TResult? Function(PaymentHash hash, PaymentPreimage? preimage)? spontaneous,
    TResult? Function(
            PaymentHash? hash,
            PaymentPreimage? preimage,
            PaymentSecret? secret,
            OfferId offerId,
            String? payerNote,
            BigInt? quantity)?
        bolt12Offer,
    TResult? Function(PaymentHash? hash, PaymentPreimage? preimage,
            PaymentSecret? secret, String? payerNote, BigInt? quantity)?
        bolt12Refund,
  }) {
    final _that = this;
    switch (_that) {
      case PaymentKind_Onchain() when onchain != null:
        return onchain(_that.txid, _that.status);
      case PaymentKind_Bolt11() when bolt11 != null:
        return bolt11(_that.hash, _that.preimage, _that.secret);
      case PaymentKind_Bolt11Jit() when bolt11Jit != null:
        return bolt11Jit(_that.hash, _that.preimage, _that.secret,
            _that.lspFeeLimits, _that.counterpartySkimmedFeeMsat);
      case PaymentKind_Spontaneous() when spontaneous != null:
        return spontaneous(_that.hash, _that.preimage);
      case PaymentKind_Bolt12Offer() when bolt12Offer != null:
        return bolt12Offer(_that.hash, _that.preimage, _that.secret,
            _that.offerId, _that.payerNote, _that.quantity);
      case PaymentKind_Bolt12Refund() when bolt12Refund != null:
        return bolt12Refund(_that.hash, _that.preimage, _that.secret,
            _that.payerNote, _that.quantity);
      case _:
        return null;
    }
  }
}

/// @nodoc

class PaymentKind_Onchain extends PaymentKind {
  const PaymentKind_Onchain({required this.txid, required this.status})
      : super._();

  /// The transaction ID of the on-chain payment.
  final Txid txid;

  /// The status of the on-chain payment.
  final ConfirmationStatus status;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentKind_OnchainCopyWith<PaymentKind_Onchain> get copyWith =>
      _$PaymentKind_OnchainCopyWithImpl<PaymentKind_Onchain>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentKind_Onchain &&
            (identical(other.txid, txid) || other.txid == txid) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, txid, status);

  @override
  String toString() {
    return 'PaymentKind.onchain(txid: $txid, status: $status)';
  }
}

/// @nodoc
abstract mixin class $PaymentKind_OnchainCopyWith<$Res>
    implements $PaymentKindCopyWith<$Res> {
  factory $PaymentKind_OnchainCopyWith(
          PaymentKind_Onchain value, $Res Function(PaymentKind_Onchain) _then) =
      _$PaymentKind_OnchainCopyWithImpl;
  @useResult
  $Res call({Txid txid, ConfirmationStatus status});

  $ConfirmationStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$PaymentKind_OnchainCopyWithImpl<$Res>
    implements $PaymentKind_OnchainCopyWith<$Res> {
  _$PaymentKind_OnchainCopyWithImpl(this._self, this._then);

  final PaymentKind_Onchain _self;
  final $Res Function(PaymentKind_Onchain) _then;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? txid = null,
    Object? status = null,
  }) {
    return _then(PaymentKind_Onchain(
      txid: null == txid
          ? _self.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as Txid,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConfirmationStatus,
    ));
  }

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfirmationStatusCopyWith<$Res> get status {
    return $ConfirmationStatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}

/// @nodoc

class PaymentKind_Bolt11 extends PaymentKind {
  const PaymentKind_Bolt11({required this.hash, this.preimage, this.secret})
      : super._();

  /// The payment hash, i.e., the hash of the `preimage`.
  final PaymentHash hash;

  /// The pre-image used by the payment.
  final PaymentPreimage? preimage;

  /// The secret used by the payment.
  final PaymentSecret? secret;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentKind_Bolt11CopyWith<PaymentKind_Bolt11> get copyWith =>
      _$PaymentKind_Bolt11CopyWithImpl<PaymentKind_Bolt11>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentKind_Bolt11 &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage) &&
            (identical(other.secret, secret) || other.secret == secret));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hash, preimage, secret);

  @override
  String toString() {
    return 'PaymentKind.bolt11(hash: $hash, preimage: $preimage, secret: $secret)';
  }
}

/// @nodoc
abstract mixin class $PaymentKind_Bolt11CopyWith<$Res>
    implements $PaymentKindCopyWith<$Res> {
  factory $PaymentKind_Bolt11CopyWith(
          PaymentKind_Bolt11 value, $Res Function(PaymentKind_Bolt11) _then) =
      _$PaymentKind_Bolt11CopyWithImpl;
  @useResult
  $Res call(
      {PaymentHash hash, PaymentPreimage? preimage, PaymentSecret? secret});
}

/// @nodoc
class _$PaymentKind_Bolt11CopyWithImpl<$Res>
    implements $PaymentKind_Bolt11CopyWith<$Res> {
  _$PaymentKind_Bolt11CopyWithImpl(this._self, this._then);

  final PaymentKind_Bolt11 _self;
  final $Res Function(PaymentKind_Bolt11) _then;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hash = null,
    Object? preimage = freezed,
    Object? secret = freezed,
  }) {
    return _then(PaymentKind_Bolt11(
      hash: null == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      preimage: freezed == preimage
          ? _self.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PaymentPreimage?,
      secret: freezed == secret
          ? _self.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as PaymentSecret?,
    ));
  }
}

/// @nodoc

class PaymentKind_Bolt11Jit extends PaymentKind {
  const PaymentKind_Bolt11Jit(
      {required this.hash,
      this.preimage,
      this.secret,
      required this.lspFeeLimits,
      this.counterpartySkimmedFeeMsat})
      : super._();

  /// The payment hash, i.e., the hash of the `preimage`.
  final PaymentHash hash;

  /// The pre-image used by the payment.
  final PaymentPreimage? preimage;

  /// The secret used by the payment.
  final PaymentSecret? secret;

  /// Limits applying to how much fee we allow an LSP to deduct from the payment amount.
  ///
  /// Allowing them to deduct this fee from the first inbound payment will pay for the LSP's
  /// channel opening fees.
  ///
  final LSPFeeLimits lspFeeLimits;

  /// The value, in thousands of a satoshi, that was deducted from this payment as an extra
  /// fee taken by our channel counterparty.
  ///
  /// Will only be `Some` once we received the payment. Will always be `None` for LDK Node
  /// v0.4 and prior.
  final BigInt? counterpartySkimmedFeeMsat;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentKind_Bolt11JitCopyWith<PaymentKind_Bolt11Jit> get copyWith =>
      _$PaymentKind_Bolt11JitCopyWithImpl<PaymentKind_Bolt11Jit>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentKind_Bolt11Jit &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage) &&
            (identical(other.secret, secret) || other.secret == secret) &&
            (identical(other.lspFeeLimits, lspFeeLimits) ||
                other.lspFeeLimits == lspFeeLimits) &&
            (identical(other.counterpartySkimmedFeeMsat,
                    counterpartySkimmedFeeMsat) ||
                other.counterpartySkimmedFeeMsat ==
                    counterpartySkimmedFeeMsat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hash, preimage, secret,
      lspFeeLimits, counterpartySkimmedFeeMsat);

  @override
  String toString() {
    return 'PaymentKind.bolt11Jit(hash: $hash, preimage: $preimage, secret: $secret, lspFeeLimits: $lspFeeLimits, counterpartySkimmedFeeMsat: $counterpartySkimmedFeeMsat)';
  }
}

/// @nodoc
abstract mixin class $PaymentKind_Bolt11JitCopyWith<$Res>
    implements $PaymentKindCopyWith<$Res> {
  factory $PaymentKind_Bolt11JitCopyWith(PaymentKind_Bolt11Jit value,
          $Res Function(PaymentKind_Bolt11Jit) _then) =
      _$PaymentKind_Bolt11JitCopyWithImpl;
  @useResult
  $Res call(
      {PaymentHash hash,
      PaymentPreimage? preimage,
      PaymentSecret? secret,
      LSPFeeLimits lspFeeLimits,
      BigInt? counterpartySkimmedFeeMsat});
}

/// @nodoc
class _$PaymentKind_Bolt11JitCopyWithImpl<$Res>
    implements $PaymentKind_Bolt11JitCopyWith<$Res> {
  _$PaymentKind_Bolt11JitCopyWithImpl(this._self, this._then);

  final PaymentKind_Bolt11Jit _self;
  final $Res Function(PaymentKind_Bolt11Jit) _then;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hash = null,
    Object? preimage = freezed,
    Object? secret = freezed,
    Object? lspFeeLimits = null,
    Object? counterpartySkimmedFeeMsat = freezed,
  }) {
    return _then(PaymentKind_Bolt11Jit(
      hash: null == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      preimage: freezed == preimage
          ? _self.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PaymentPreimage?,
      secret: freezed == secret
          ? _self.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as PaymentSecret?,
      lspFeeLimits: null == lspFeeLimits
          ? _self.lspFeeLimits
          : lspFeeLimits // ignore: cast_nullable_to_non_nullable
              as LSPFeeLimits,
      counterpartySkimmedFeeMsat: freezed == counterpartySkimmedFeeMsat
          ? _self.counterpartySkimmedFeeMsat
          : counterpartySkimmedFeeMsat // ignore: cast_nullable_to_non_nullable
              as BigInt?,
    ));
  }
}

/// @nodoc

class PaymentKind_Spontaneous extends PaymentKind {
  const PaymentKind_Spontaneous({required this.hash, this.preimage})
      : super._();

  /// The payment hash, i.e., the hash of the `preimage`.
  final PaymentHash hash;

  /// The pre-image used by the payment.
  final PaymentPreimage? preimage;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentKind_SpontaneousCopyWith<PaymentKind_Spontaneous> get copyWith =>
      _$PaymentKind_SpontaneousCopyWithImpl<PaymentKind_Spontaneous>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentKind_Spontaneous &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hash, preimage);

  @override
  String toString() {
    return 'PaymentKind.spontaneous(hash: $hash, preimage: $preimage)';
  }
}

/// @nodoc
abstract mixin class $PaymentKind_SpontaneousCopyWith<$Res>
    implements $PaymentKindCopyWith<$Res> {
  factory $PaymentKind_SpontaneousCopyWith(PaymentKind_Spontaneous value,
          $Res Function(PaymentKind_Spontaneous) _then) =
      _$PaymentKind_SpontaneousCopyWithImpl;
  @useResult
  $Res call({PaymentHash hash, PaymentPreimage? preimage});
}

/// @nodoc
class _$PaymentKind_SpontaneousCopyWithImpl<$Res>
    implements $PaymentKind_SpontaneousCopyWith<$Res> {
  _$PaymentKind_SpontaneousCopyWithImpl(this._self, this._then);

  final PaymentKind_Spontaneous _self;
  final $Res Function(PaymentKind_Spontaneous) _then;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hash = null,
    Object? preimage = freezed,
  }) {
    return _then(PaymentKind_Spontaneous(
      hash: null == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      preimage: freezed == preimage
          ? _self.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PaymentPreimage?,
    ));
  }
}

/// @nodoc

class PaymentKind_Bolt12Offer extends PaymentKind {
  const PaymentKind_Bolt12Offer(
      {this.hash,
      this.preimage,
      this.secret,
      required this.offerId,
      this.payerNote,
      this.quantity})
      : super._();

  /// The payment hash, i.e., the hash of the `preimage`.
  final PaymentHash? hash;

  /// The pre-image used by the payment.
  final PaymentPreimage? preimage;

  /// The secret used by the payment.
  final PaymentSecret? secret;

  /// The ID of the offer this payment is for.
  final OfferId offerId;

  /// The payer note for the payment.
  ///
  /// Truncated to `PAYER_NOTE_LIMIT` characters.
  ///
  /// This will always be `None` for payments serialized with version `v0.3.0`.
  final String? payerNote;

  /// The quantity of an item requested in the offer.
  ///
  /// This will always be `None` for payments serialized with version `v0.3.0`.
  final BigInt? quantity;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentKind_Bolt12OfferCopyWith<PaymentKind_Bolt12Offer> get copyWith =>
      _$PaymentKind_Bolt12OfferCopyWithImpl<PaymentKind_Bolt12Offer>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentKind_Bolt12Offer &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage) &&
            (identical(other.secret, secret) || other.secret == secret) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.payerNote, payerNote) ||
                other.payerNote == payerNote) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hash, preimage, secret, offerId, payerNote, quantity);

  @override
  String toString() {
    return 'PaymentKind.bolt12Offer(hash: $hash, preimage: $preimage, secret: $secret, offerId: $offerId, payerNote: $payerNote, quantity: $quantity)';
  }
}

/// @nodoc
abstract mixin class $PaymentKind_Bolt12OfferCopyWith<$Res>
    implements $PaymentKindCopyWith<$Res> {
  factory $PaymentKind_Bolt12OfferCopyWith(PaymentKind_Bolt12Offer value,
          $Res Function(PaymentKind_Bolt12Offer) _then) =
      _$PaymentKind_Bolt12OfferCopyWithImpl;
  @useResult
  $Res call(
      {PaymentHash? hash,
      PaymentPreimage? preimage,
      PaymentSecret? secret,
      OfferId offerId,
      String? payerNote,
      BigInt? quantity});
}

/// @nodoc
class _$PaymentKind_Bolt12OfferCopyWithImpl<$Res>
    implements $PaymentKind_Bolt12OfferCopyWith<$Res> {
  _$PaymentKind_Bolt12OfferCopyWithImpl(this._self, this._then);

  final PaymentKind_Bolt12Offer _self;
  final $Res Function(PaymentKind_Bolt12Offer) _then;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hash = freezed,
    Object? preimage = freezed,
    Object? secret = freezed,
    Object? offerId = null,
    Object? payerNote = freezed,
    Object? quantity = freezed,
  }) {
    return _then(PaymentKind_Bolt12Offer(
      hash: freezed == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as PaymentHash?,
      preimage: freezed == preimage
          ? _self.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PaymentPreimage?,
      secret: freezed == secret
          ? _self.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as PaymentSecret?,
      offerId: null == offerId
          ? _self.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as OfferId,
      payerNote: freezed == payerNote
          ? _self.payerNote
          : payerNote // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as BigInt?,
    ));
  }
}

/// @nodoc

class PaymentKind_Bolt12Refund extends PaymentKind {
  const PaymentKind_Bolt12Refund(
      {this.hash, this.preimage, this.secret, this.payerNote, this.quantity})
      : super._();

  /// The payment hash, i.e., the hash of the `preimage`.
  final PaymentHash? hash;

  /// The pre-image used by the payment.
  final PaymentPreimage? preimage;

  /// The secret used by the payment.
  final PaymentSecret? secret;

  ///
  /// This will always be `None` for payments serialized with version `v0.3.0`.
  final String? payerNote;

  /// The quantity of an item that the refund is for.
  ///
  /// This will always be `None` for payments serialized with version `v0.3.0`.
  final BigInt? quantity;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentKind_Bolt12RefundCopyWith<PaymentKind_Bolt12Refund> get copyWith =>
      _$PaymentKind_Bolt12RefundCopyWithImpl<PaymentKind_Bolt12Refund>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentKind_Bolt12Refund &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.preimage, preimage) ||
                other.preimage == preimage) &&
            (identical(other.secret, secret) || other.secret == secret) &&
            (identical(other.payerNote, payerNote) ||
                other.payerNote == payerNote) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hash, preimage, secret, payerNote, quantity);

  @override
  String toString() {
    return 'PaymentKind.bolt12Refund(hash: $hash, preimage: $preimage, secret: $secret, payerNote: $payerNote, quantity: $quantity)';
  }
}

/// @nodoc
abstract mixin class $PaymentKind_Bolt12RefundCopyWith<$Res>
    implements $PaymentKindCopyWith<$Res> {
  factory $PaymentKind_Bolt12RefundCopyWith(PaymentKind_Bolt12Refund value,
          $Res Function(PaymentKind_Bolt12Refund) _then) =
      _$PaymentKind_Bolt12RefundCopyWithImpl;
  @useResult
  $Res call(
      {PaymentHash? hash,
      PaymentPreimage? preimage,
      PaymentSecret? secret,
      String? payerNote,
      BigInt? quantity});
}

/// @nodoc
class _$PaymentKind_Bolt12RefundCopyWithImpl<$Res>
    implements $PaymentKind_Bolt12RefundCopyWith<$Res> {
  _$PaymentKind_Bolt12RefundCopyWithImpl(this._self, this._then);

  final PaymentKind_Bolt12Refund _self;
  final $Res Function(PaymentKind_Bolt12Refund) _then;

  /// Create a copy of PaymentKind
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hash = freezed,
    Object? preimage = freezed,
    Object? secret = freezed,
    Object? payerNote = freezed,
    Object? quantity = freezed,
  }) {
    return _then(PaymentKind_Bolt12Refund(
      hash: freezed == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as PaymentHash?,
      preimage: freezed == preimage
          ? _self.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PaymentPreimage?,
      secret: freezed == secret
          ? _self.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as PaymentSecret?,
      payerNote: freezed == payerNote
          ? _self.payerNote
          : payerNote // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as BigInt?,
    ));
  }
}

/// @nodoc
mixin _$PendingSweepBalance {
  /// The identifier of the channel this balance belongs to.
  ChannelId? get channelId;

  /// The amount, in satoshis, of the output being swept.
  BigInt get amountSatoshis;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PendingSweepBalanceCopyWith<PendingSweepBalance> get copyWith =>
      _$PendingSweepBalanceCopyWithImpl<PendingSweepBalance>(
          this as PendingSweepBalance, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PendingSweepBalance &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, amountSatoshis);

  @override
  String toString() {
    return 'PendingSweepBalance(channelId: $channelId, amountSatoshis: $amountSatoshis)';
  }
}

/// @nodoc
abstract mixin class $PendingSweepBalanceCopyWith<$Res> {
  factory $PendingSweepBalanceCopyWith(
          PendingSweepBalance value, $Res Function(PendingSweepBalance) _then) =
      _$PendingSweepBalanceCopyWithImpl;
  @useResult
  $Res call({ChannelId? channelId, BigInt amountSatoshis});
}

/// @nodoc
class _$PendingSweepBalanceCopyWithImpl<$Res>
    implements $PendingSweepBalanceCopyWith<$Res> {
  _$PendingSweepBalanceCopyWithImpl(this._self, this._then);

  final PendingSweepBalance _self;
  final $Res Function(PendingSweepBalance) _then;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = freezed,
    Object? amountSatoshis = null,
  }) {
    return _then(_self.copyWith(
      channelId: freezed == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId?,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// Adds pattern-matching-related methods to [PendingSweepBalance].
extension PendingSweepBalancePatterns on PendingSweepBalance {
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
    TResult Function(PendingSweepBalance_PendingBroadcast value)?
        pendingBroadcast,
    TResult Function(PendingSweepBalance_BroadcastAwaitingConfirmation value)?
        broadcastAwaitingConfirmation,
    TResult Function(PendingSweepBalance_AwaitingThresholdConfirmations value)?
        awaitingThresholdConfirmations,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PendingSweepBalance_PendingBroadcast() when pendingBroadcast != null:
        return pendingBroadcast(_that);
      case PendingSweepBalance_BroadcastAwaitingConfirmation()
          when broadcastAwaitingConfirmation != null:
        return broadcastAwaitingConfirmation(_that);
      case PendingSweepBalance_AwaitingThresholdConfirmations()
          when awaitingThresholdConfirmations != null:
        return awaitingThresholdConfirmations(_that);
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
    required TResult Function(PendingSweepBalance_PendingBroadcast value)
        pendingBroadcast,
    required TResult Function(
            PendingSweepBalance_BroadcastAwaitingConfirmation value)
        broadcastAwaitingConfirmation,
    required TResult Function(
            PendingSweepBalance_AwaitingThresholdConfirmations value)
        awaitingThresholdConfirmations,
  }) {
    final _that = this;
    switch (_that) {
      case PendingSweepBalance_PendingBroadcast():
        return pendingBroadcast(_that);
      case PendingSweepBalance_BroadcastAwaitingConfirmation():
        return broadcastAwaitingConfirmation(_that);
      case PendingSweepBalance_AwaitingThresholdConfirmations():
        return awaitingThresholdConfirmations(_that);
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
    TResult? Function(PendingSweepBalance_PendingBroadcast value)?
        pendingBroadcast,
    TResult? Function(PendingSweepBalance_BroadcastAwaitingConfirmation value)?
        broadcastAwaitingConfirmation,
    TResult? Function(PendingSweepBalance_AwaitingThresholdConfirmations value)?
        awaitingThresholdConfirmations,
  }) {
    final _that = this;
    switch (_that) {
      case PendingSweepBalance_PendingBroadcast() when pendingBroadcast != null:
        return pendingBroadcast(_that);
      case PendingSweepBalance_BroadcastAwaitingConfirmation()
          when broadcastAwaitingConfirmation != null:
        return broadcastAwaitingConfirmation(_that);
      case PendingSweepBalance_AwaitingThresholdConfirmations()
          when awaitingThresholdConfirmations != null:
        return awaitingThresholdConfirmations(_that);
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
    TResult Function(ChannelId? channelId, BigInt amountSatoshis)?
        pendingBroadcast,
    TResult Function(ChannelId? channelId, int latestBroadcastHeight,
            Txid latestSpendingTxid, BigInt amountSatoshis)?
        broadcastAwaitingConfirmation,
    TResult Function(
            ChannelId? channelId,
            Txid latestSpendingTxid,
            String confirmationHash,
            int confirmationHeight,
            BigInt amountSatoshis)?
        awaitingThresholdConfirmations,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PendingSweepBalance_PendingBroadcast() when pendingBroadcast != null:
        return pendingBroadcast(_that.channelId, _that.amountSatoshis);
      case PendingSweepBalance_BroadcastAwaitingConfirmation()
          when broadcastAwaitingConfirmation != null:
        return broadcastAwaitingConfirmation(
            _that.channelId,
            _that.latestBroadcastHeight,
            _that.latestSpendingTxid,
            _that.amountSatoshis);
      case PendingSweepBalance_AwaitingThresholdConfirmations()
          when awaitingThresholdConfirmations != null:
        return awaitingThresholdConfirmations(
            _that.channelId,
            _that.latestSpendingTxid,
            _that.confirmationHash,
            _that.confirmationHeight,
            _that.amountSatoshis);
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
    required TResult Function(ChannelId? channelId, BigInt amountSatoshis)
        pendingBroadcast,
    required TResult Function(ChannelId? channelId, int latestBroadcastHeight,
            Txid latestSpendingTxid, BigInt amountSatoshis)
        broadcastAwaitingConfirmation,
    required TResult Function(
            ChannelId? channelId,
            Txid latestSpendingTxid,
            String confirmationHash,
            int confirmationHeight,
            BigInt amountSatoshis)
        awaitingThresholdConfirmations,
  }) {
    final _that = this;
    switch (_that) {
      case PendingSweepBalance_PendingBroadcast():
        return pendingBroadcast(_that.channelId, _that.amountSatoshis);
      case PendingSweepBalance_BroadcastAwaitingConfirmation():
        return broadcastAwaitingConfirmation(
            _that.channelId,
            _that.latestBroadcastHeight,
            _that.latestSpendingTxid,
            _that.amountSatoshis);
      case PendingSweepBalance_AwaitingThresholdConfirmations():
        return awaitingThresholdConfirmations(
            _that.channelId,
            _that.latestSpendingTxid,
            _that.confirmationHash,
            _that.confirmationHeight,
            _that.amountSatoshis);
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
    TResult? Function(ChannelId? channelId, BigInt amountSatoshis)?
        pendingBroadcast,
    TResult? Function(ChannelId? channelId, int latestBroadcastHeight,
            Txid latestSpendingTxid, BigInt amountSatoshis)?
        broadcastAwaitingConfirmation,
    TResult? Function(
            ChannelId? channelId,
            Txid latestSpendingTxid,
            String confirmationHash,
            int confirmationHeight,
            BigInt amountSatoshis)?
        awaitingThresholdConfirmations,
  }) {
    final _that = this;
    switch (_that) {
      case PendingSweepBalance_PendingBroadcast() when pendingBroadcast != null:
        return pendingBroadcast(_that.channelId, _that.amountSatoshis);
      case PendingSweepBalance_BroadcastAwaitingConfirmation()
          when broadcastAwaitingConfirmation != null:
        return broadcastAwaitingConfirmation(
            _that.channelId,
            _that.latestBroadcastHeight,
            _that.latestSpendingTxid,
            _that.amountSatoshis);
      case PendingSweepBalance_AwaitingThresholdConfirmations()
          when awaitingThresholdConfirmations != null:
        return awaitingThresholdConfirmations(
            _that.channelId,
            _that.latestSpendingTxid,
            _that.confirmationHash,
            _that.confirmationHeight,
            _that.amountSatoshis);
      case _:
        return null;
    }
  }
}

/// @nodoc

class PendingSweepBalance_PendingBroadcast extends PendingSweepBalance {
  const PendingSweepBalance_PendingBroadcast(
      {this.channelId, required this.amountSatoshis})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId? channelId;

  /// The amount, in satoshis, of the output being swept.
  @override
  final BigInt amountSatoshis;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PendingSweepBalance_PendingBroadcastCopyWith<
          PendingSweepBalance_PendingBroadcast>
      get copyWith => _$PendingSweepBalance_PendingBroadcastCopyWithImpl<
          PendingSweepBalance_PendingBroadcast>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PendingSweepBalance_PendingBroadcast &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, amountSatoshis);

  @override
  String toString() {
    return 'PendingSweepBalance.pendingBroadcast(channelId: $channelId, amountSatoshis: $amountSatoshis)';
  }
}

/// @nodoc
abstract mixin class $PendingSweepBalance_PendingBroadcastCopyWith<$Res>
    implements $PendingSweepBalanceCopyWith<$Res> {
  factory $PendingSweepBalance_PendingBroadcastCopyWith(
          PendingSweepBalance_PendingBroadcast value,
          $Res Function(PendingSweepBalance_PendingBroadcast) _then) =
      _$PendingSweepBalance_PendingBroadcastCopyWithImpl;
  @override
  @useResult
  $Res call({ChannelId? channelId, BigInt amountSatoshis});
}

/// @nodoc
class _$PendingSweepBalance_PendingBroadcastCopyWithImpl<$Res>
    implements $PendingSweepBalance_PendingBroadcastCopyWith<$Res> {
  _$PendingSweepBalance_PendingBroadcastCopyWithImpl(this._self, this._then);

  final PendingSweepBalance_PendingBroadcast _self;
  final $Res Function(PendingSweepBalance_PendingBroadcast) _then;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = freezed,
    Object? amountSatoshis = null,
  }) {
    return _then(PendingSweepBalance_PendingBroadcast(
      channelId: freezed == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId?,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class PendingSweepBalance_BroadcastAwaitingConfirmation
    extends PendingSweepBalance {
  const PendingSweepBalance_BroadcastAwaitingConfirmation(
      {this.channelId,
      required this.latestBroadcastHeight,
      required this.latestSpendingTxid,
      required this.amountSatoshis})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId? channelId;

  /// The best height when we last broadcast a transaction spending the output being swept.
  final int latestBroadcastHeight;

  /// The identifier of the transaction spending the swept output we last broadcast.
  final Txid latestSpendingTxid;

  /// The amount, in satoshis, of the output being swept.
  @override
  final BigInt amountSatoshis;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PendingSweepBalance_BroadcastAwaitingConfirmationCopyWith<
          PendingSweepBalance_BroadcastAwaitingConfirmation>
      get copyWith =>
          _$PendingSweepBalance_BroadcastAwaitingConfirmationCopyWithImpl<
                  PendingSweepBalance_BroadcastAwaitingConfirmation>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PendingSweepBalance_BroadcastAwaitingConfirmation &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.latestBroadcastHeight, latestBroadcastHeight) ||
                other.latestBroadcastHeight == latestBroadcastHeight) &&
            (identical(other.latestSpendingTxid, latestSpendingTxid) ||
                other.latestSpendingTxid == latestSpendingTxid) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, latestBroadcastHeight,
      latestSpendingTxid, amountSatoshis);

  @override
  String toString() {
    return 'PendingSweepBalance.broadcastAwaitingConfirmation(channelId: $channelId, latestBroadcastHeight: $latestBroadcastHeight, latestSpendingTxid: $latestSpendingTxid, amountSatoshis: $amountSatoshis)';
  }
}

/// @nodoc
abstract mixin class $PendingSweepBalance_BroadcastAwaitingConfirmationCopyWith<
    $Res> implements $PendingSweepBalanceCopyWith<$Res> {
  factory $PendingSweepBalance_BroadcastAwaitingConfirmationCopyWith(
          PendingSweepBalance_BroadcastAwaitingConfirmation value,
          $Res Function(PendingSweepBalance_BroadcastAwaitingConfirmation)
              _then) =
      _$PendingSweepBalance_BroadcastAwaitingConfirmationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ChannelId? channelId,
      int latestBroadcastHeight,
      Txid latestSpendingTxid,
      BigInt amountSatoshis});
}

/// @nodoc
class _$PendingSweepBalance_BroadcastAwaitingConfirmationCopyWithImpl<$Res>
    implements
        $PendingSweepBalance_BroadcastAwaitingConfirmationCopyWith<$Res> {
  _$PendingSweepBalance_BroadcastAwaitingConfirmationCopyWithImpl(
      this._self, this._then);

  final PendingSweepBalance_BroadcastAwaitingConfirmation _self;
  final $Res Function(PendingSweepBalance_BroadcastAwaitingConfirmation) _then;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = freezed,
    Object? latestBroadcastHeight = null,
    Object? latestSpendingTxid = null,
    Object? amountSatoshis = null,
  }) {
    return _then(PendingSweepBalance_BroadcastAwaitingConfirmation(
      channelId: freezed == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId?,
      latestBroadcastHeight: null == latestBroadcastHeight
          ? _self.latestBroadcastHeight
          : latestBroadcastHeight // ignore: cast_nullable_to_non_nullable
              as int,
      latestSpendingTxid: null == latestSpendingTxid
          ? _self.latestSpendingTxid
          : latestSpendingTxid // ignore: cast_nullable_to_non_nullable
              as Txid,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class PendingSweepBalance_AwaitingThresholdConfirmations
    extends PendingSweepBalance {
  const PendingSweepBalance_AwaitingThresholdConfirmations(
      {this.channelId,
      required this.latestSpendingTxid,
      required this.confirmationHash,
      required this.confirmationHeight,
      required this.amountSatoshis})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId? channelId;

  /// The identifier of the confirmed transaction spending the swept output.
  final Txid latestSpendingTxid;

  /// The hash of the block in which the spending transaction was confirmed.
  final String confirmationHash;

  /// The height at which the spending transaction was confirmed.
  final int confirmationHeight;

  /// The amount, in satoshis, of the output being swept.
  @override
  final BigInt amountSatoshis;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PendingSweepBalance_AwaitingThresholdConfirmationsCopyWith<
          PendingSweepBalance_AwaitingThresholdConfirmations>
      get copyWith =>
          _$PendingSweepBalance_AwaitingThresholdConfirmationsCopyWithImpl<
                  PendingSweepBalance_AwaitingThresholdConfirmations>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PendingSweepBalance_AwaitingThresholdConfirmations &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.latestSpendingTxid, latestSpendingTxid) ||
                other.latestSpendingTxid == latestSpendingTxid) &&
            (identical(other.confirmationHash, confirmationHash) ||
                other.confirmationHash == confirmationHash) &&
            (identical(other.confirmationHeight, confirmationHeight) ||
                other.confirmationHeight == confirmationHeight) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, latestSpendingTxid,
      confirmationHash, confirmationHeight, amountSatoshis);

  @override
  String toString() {
    return 'PendingSweepBalance.awaitingThresholdConfirmations(channelId: $channelId, latestSpendingTxid: $latestSpendingTxid, confirmationHash: $confirmationHash, confirmationHeight: $confirmationHeight, amountSatoshis: $amountSatoshis)';
  }
}

/// @nodoc
abstract mixin class $PendingSweepBalance_AwaitingThresholdConfirmationsCopyWith<
    $Res> implements $PendingSweepBalanceCopyWith<$Res> {
  factory $PendingSweepBalance_AwaitingThresholdConfirmationsCopyWith(
          PendingSweepBalance_AwaitingThresholdConfirmations value,
          $Res Function(PendingSweepBalance_AwaitingThresholdConfirmations)
              _then) =
      _$PendingSweepBalance_AwaitingThresholdConfirmationsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ChannelId? channelId,
      Txid latestSpendingTxid,
      String confirmationHash,
      int confirmationHeight,
      BigInt amountSatoshis});
}

/// @nodoc
class _$PendingSweepBalance_AwaitingThresholdConfirmationsCopyWithImpl<$Res>
    implements
        $PendingSweepBalance_AwaitingThresholdConfirmationsCopyWith<$Res> {
  _$PendingSweepBalance_AwaitingThresholdConfirmationsCopyWithImpl(
      this._self, this._then);

  final PendingSweepBalance_AwaitingThresholdConfirmations _self;
  final $Res Function(PendingSweepBalance_AwaitingThresholdConfirmations) _then;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = freezed,
    Object? latestSpendingTxid = null,
    Object? confirmationHash = null,
    Object? confirmationHeight = null,
    Object? amountSatoshis = null,
  }) {
    return _then(PendingSweepBalance_AwaitingThresholdConfirmations(
      channelId: freezed == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId?,
      latestSpendingTxid: null == latestSpendingTxid
          ? _self.latestSpendingTxid
          : latestSpendingTxid // ignore: cast_nullable_to_non_nullable
              as Txid,
      confirmationHash: null == confirmationHash
          ? _self.confirmationHash
          : confirmationHash // ignore: cast_nullable_to_non_nullable
              as String,
      confirmationHeight: null == confirmationHeight
          ? _self.confirmationHeight
          : confirmationHeight // ignore: cast_nullable_to_non_nullable
              as int,
      amountSatoshis: null == amountSatoshis
          ? _self.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

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
