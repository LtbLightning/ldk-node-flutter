// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extensions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChainDataSourceConfig {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serverUrl, EsploraSyncConfig? syncConfig)
        esplora,
    required TResult Function(String serverUrl, ElectrumSyncConfig? syncConfig)
        electrum,
    required TResult Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)
        bitcoindRpc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String serverUrl, EsploraSyncConfig? syncConfig)? esplora,
    TResult? Function(String serverUrl, ElectrumSyncConfig? syncConfig)?
        electrum,
    TResult? Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRpc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serverUrl, EsploraSyncConfig? syncConfig)? esplora,
    TResult Function(String serverUrl, ElectrumSyncConfig? syncConfig)?
        electrum,
    TResult Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRpc,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChainDataSourceConfig_Esplora value) esplora,
    required TResult Function(ChainDataSourceConfig_Electrum value) electrum,
    required TResult Function(ChainDataSourceConfig_BitcoindRpc value)
        bitcoindRpc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChainDataSourceConfig_Esplora value)? esplora,
    TResult? Function(ChainDataSourceConfig_Electrum value)? electrum,
    TResult? Function(ChainDataSourceConfig_BitcoindRpc value)? bitcoindRpc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChainDataSourceConfig_Esplora value)? esplora,
    TResult Function(ChainDataSourceConfig_Electrum value)? electrum,
    TResult Function(ChainDataSourceConfig_BitcoindRpc value)? bitcoindRpc,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainDataSourceConfigCopyWith<$Res> {
  factory $ChainDataSourceConfigCopyWith(ChainDataSourceConfig value,
          $Res Function(ChainDataSourceConfig) then) =
      _$ChainDataSourceConfigCopyWithImpl<$Res, ChainDataSourceConfig>;
}

/// @nodoc
class _$ChainDataSourceConfigCopyWithImpl<$Res,
        $Val extends ChainDataSourceConfig>
    implements $ChainDataSourceConfigCopyWith<$Res> {
  _$ChainDataSourceConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ChainDataSourceConfig_EsploraImplCopyWith<$Res> {
  factory _$$ChainDataSourceConfig_EsploraImplCopyWith(
          _$ChainDataSourceConfig_EsploraImpl value,
          $Res Function(_$ChainDataSourceConfig_EsploraImpl) then) =
      __$$ChainDataSourceConfig_EsploraImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serverUrl, EsploraSyncConfig? syncConfig});
}

/// @nodoc
class __$$ChainDataSourceConfig_EsploraImplCopyWithImpl<$Res>
    extends _$ChainDataSourceConfigCopyWithImpl<$Res,
        _$ChainDataSourceConfig_EsploraImpl>
    implements _$$ChainDataSourceConfig_EsploraImplCopyWith<$Res> {
  __$$ChainDataSourceConfig_EsploraImplCopyWithImpl(
      _$ChainDataSourceConfig_EsploraImpl _value,
      $Res Function(_$ChainDataSourceConfig_EsploraImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverUrl = null,
    Object? syncConfig = freezed,
  }) {
    return _then(_$ChainDataSourceConfig_EsploraImpl(
      serverUrl: null == serverUrl
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      syncConfig: freezed == syncConfig
          ? _value.syncConfig
          : syncConfig // ignore: cast_nullable_to_non_nullable
              as EsploraSyncConfig?,
    ));
  }
}

/// @nodoc

class _$ChainDataSourceConfig_EsploraImpl
    extends ChainDataSourceConfig_Esplora {
  const _$ChainDataSourceConfig_EsploraImpl(
      {required this.serverUrl, this.syncConfig})
      : super._();

  @override
  final String serverUrl;
  @override
  final EsploraSyncConfig? syncConfig;

  @override
  String toString() {
    return 'ChainDataSourceConfig.esplora(serverUrl: $serverUrl, syncConfig: $syncConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainDataSourceConfig_EsploraImpl &&
            (identical(other.serverUrl, serverUrl) ||
                other.serverUrl == serverUrl) &&
            (identical(other.syncConfig, syncConfig) ||
                other.syncConfig == syncConfig));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serverUrl, syncConfig);

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainDataSourceConfig_EsploraImplCopyWith<
          _$ChainDataSourceConfig_EsploraImpl>
      get copyWith => __$$ChainDataSourceConfig_EsploraImplCopyWithImpl<
          _$ChainDataSourceConfig_EsploraImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serverUrl, EsploraSyncConfig? syncConfig)
        esplora,
    required TResult Function(String serverUrl, ElectrumSyncConfig? syncConfig)
        electrum,
    required TResult Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)
        bitcoindRpc,
  }) {
    return esplora(serverUrl, syncConfig);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String serverUrl, EsploraSyncConfig? syncConfig)? esplora,
    TResult? Function(String serverUrl, ElectrumSyncConfig? syncConfig)?
        electrum,
    TResult? Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRpc,
  }) {
    return esplora?.call(serverUrl, syncConfig);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serverUrl, EsploraSyncConfig? syncConfig)? esplora,
    TResult Function(String serverUrl, ElectrumSyncConfig? syncConfig)?
        electrum,
    TResult Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRpc,
    required TResult orElse(),
  }) {
    if (esplora != null) {
      return esplora(serverUrl, syncConfig);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChainDataSourceConfig_Esplora value) esplora,
    required TResult Function(ChainDataSourceConfig_Electrum value) electrum,
    required TResult Function(ChainDataSourceConfig_BitcoindRpc value)
        bitcoindRpc,
  }) {
    return esplora(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChainDataSourceConfig_Esplora value)? esplora,
    TResult? Function(ChainDataSourceConfig_Electrum value)? electrum,
    TResult? Function(ChainDataSourceConfig_BitcoindRpc value)? bitcoindRpc,
  }) {
    return esplora?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChainDataSourceConfig_Esplora value)? esplora,
    TResult Function(ChainDataSourceConfig_Electrum value)? electrum,
    TResult Function(ChainDataSourceConfig_BitcoindRpc value)? bitcoindRpc,
    required TResult orElse(),
  }) {
    if (esplora != null) {
      return esplora(this);
    }
    return orElse();
  }
}

abstract class ChainDataSourceConfig_Esplora extends ChainDataSourceConfig {
  const factory ChainDataSourceConfig_Esplora(
          {required final String serverUrl,
          final EsploraSyncConfig? syncConfig}) =
      _$ChainDataSourceConfig_EsploraImpl;
  const ChainDataSourceConfig_Esplora._() : super._();

  String get serverUrl;
  EsploraSyncConfig? get syncConfig;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChainDataSourceConfig_EsploraImplCopyWith<
          _$ChainDataSourceConfig_EsploraImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChainDataSourceConfig_ElectrumImplCopyWith<$Res> {
  factory _$$ChainDataSourceConfig_ElectrumImplCopyWith(
          _$ChainDataSourceConfig_ElectrumImpl value,
          $Res Function(_$ChainDataSourceConfig_ElectrumImpl) then) =
      __$$ChainDataSourceConfig_ElectrumImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serverUrl, ElectrumSyncConfig? syncConfig});
}

/// @nodoc
class __$$ChainDataSourceConfig_ElectrumImplCopyWithImpl<$Res>
    extends _$ChainDataSourceConfigCopyWithImpl<$Res,
        _$ChainDataSourceConfig_ElectrumImpl>
    implements _$$ChainDataSourceConfig_ElectrumImplCopyWith<$Res> {
  __$$ChainDataSourceConfig_ElectrumImplCopyWithImpl(
      _$ChainDataSourceConfig_ElectrumImpl _value,
      $Res Function(_$ChainDataSourceConfig_ElectrumImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverUrl = null,
    Object? syncConfig = freezed,
  }) {
    return _then(_$ChainDataSourceConfig_ElectrumImpl(
      serverUrl: null == serverUrl
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      syncConfig: freezed == syncConfig
          ? _value.syncConfig
          : syncConfig // ignore: cast_nullable_to_non_nullable
              as ElectrumSyncConfig?,
    ));
  }
}

/// @nodoc

class _$ChainDataSourceConfig_ElectrumImpl
    extends ChainDataSourceConfig_Electrum {
  const _$ChainDataSourceConfig_ElectrumImpl(
      {required this.serverUrl, this.syncConfig})
      : super._();

  @override
  final String serverUrl;
  @override
  final ElectrumSyncConfig? syncConfig;

  @override
  String toString() {
    return 'ChainDataSourceConfig.electrum(serverUrl: $serverUrl, syncConfig: $syncConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainDataSourceConfig_ElectrumImpl &&
            (identical(other.serverUrl, serverUrl) ||
                other.serverUrl == serverUrl) &&
            (identical(other.syncConfig, syncConfig) ||
                other.syncConfig == syncConfig));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serverUrl, syncConfig);

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainDataSourceConfig_ElectrumImplCopyWith<
          _$ChainDataSourceConfig_ElectrumImpl>
      get copyWith => __$$ChainDataSourceConfig_ElectrumImplCopyWithImpl<
          _$ChainDataSourceConfig_ElectrumImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serverUrl, EsploraSyncConfig? syncConfig)
        esplora,
    required TResult Function(String serverUrl, ElectrumSyncConfig? syncConfig)
        electrum,
    required TResult Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)
        bitcoindRpc,
  }) {
    return electrum(serverUrl, syncConfig);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String serverUrl, EsploraSyncConfig? syncConfig)? esplora,
    TResult? Function(String serverUrl, ElectrumSyncConfig? syncConfig)?
        electrum,
    TResult? Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRpc,
  }) {
    return electrum?.call(serverUrl, syncConfig);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serverUrl, EsploraSyncConfig? syncConfig)? esplora,
    TResult Function(String serverUrl, ElectrumSyncConfig? syncConfig)?
        electrum,
    TResult Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRpc,
    required TResult orElse(),
  }) {
    if (electrum != null) {
      return electrum(serverUrl, syncConfig);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChainDataSourceConfig_Esplora value) esplora,
    required TResult Function(ChainDataSourceConfig_Electrum value) electrum,
    required TResult Function(ChainDataSourceConfig_BitcoindRpc value)
        bitcoindRpc,
  }) {
    return electrum(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChainDataSourceConfig_Esplora value)? esplora,
    TResult? Function(ChainDataSourceConfig_Electrum value)? electrum,
    TResult? Function(ChainDataSourceConfig_BitcoindRpc value)? bitcoindRpc,
  }) {
    return electrum?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChainDataSourceConfig_Esplora value)? esplora,
    TResult Function(ChainDataSourceConfig_Electrum value)? electrum,
    TResult Function(ChainDataSourceConfig_BitcoindRpc value)? bitcoindRpc,
    required TResult orElse(),
  }) {
    if (electrum != null) {
      return electrum(this);
    }
    return orElse();
  }
}

abstract class ChainDataSourceConfig_Electrum extends ChainDataSourceConfig {
  const factory ChainDataSourceConfig_Electrum(
          {required final String serverUrl,
          final ElectrumSyncConfig? syncConfig}) =
      _$ChainDataSourceConfig_ElectrumImpl;
  const ChainDataSourceConfig_Electrum._() : super._();

  String get serverUrl;
  ElectrumSyncConfig? get syncConfig;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChainDataSourceConfig_ElectrumImplCopyWith<
          _$ChainDataSourceConfig_ElectrumImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChainDataSourceConfig_BitcoindRpcImplCopyWith<$Res> {
  factory _$$ChainDataSourceConfig_BitcoindRpcImplCopyWith(
          _$ChainDataSourceConfig_BitcoindRpcImpl value,
          $Res Function(_$ChainDataSourceConfig_BitcoindRpcImpl) then) =
      __$$ChainDataSourceConfig_BitcoindRpcImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String rpcHost, int rpcPort, String rpcUser, String rpcPassword});
}

/// @nodoc
class __$$ChainDataSourceConfig_BitcoindRpcImplCopyWithImpl<$Res>
    extends _$ChainDataSourceConfigCopyWithImpl<$Res,
        _$ChainDataSourceConfig_BitcoindRpcImpl>
    implements _$$ChainDataSourceConfig_BitcoindRpcImplCopyWith<$Res> {
  __$$ChainDataSourceConfig_BitcoindRpcImplCopyWithImpl(
      _$ChainDataSourceConfig_BitcoindRpcImpl _value,
      $Res Function(_$ChainDataSourceConfig_BitcoindRpcImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rpcHost = null,
    Object? rpcPort = null,
    Object? rpcUser = null,
    Object? rpcPassword = null,
  }) {
    return _then(_$ChainDataSourceConfig_BitcoindRpcImpl(
      rpcHost: null == rpcHost
          ? _value.rpcHost
          : rpcHost // ignore: cast_nullable_to_non_nullable
              as String,
      rpcPort: null == rpcPort
          ? _value.rpcPort
          : rpcPort // ignore: cast_nullable_to_non_nullable
              as int,
      rpcUser: null == rpcUser
          ? _value.rpcUser
          : rpcUser // ignore: cast_nullable_to_non_nullable
              as String,
      rpcPassword: null == rpcPassword
          ? _value.rpcPassword
          : rpcPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChainDataSourceConfig_BitcoindRpcImpl
    extends ChainDataSourceConfig_BitcoindRpc {
  const _$ChainDataSourceConfig_BitcoindRpcImpl(
      {required this.rpcHost,
      required this.rpcPort,
      required this.rpcUser,
      required this.rpcPassword})
      : super._();

  @override
  final String rpcHost;
  @override
  final int rpcPort;
  @override
  final String rpcUser;
  @override
  final String rpcPassword;

  @override
  String toString() {
    return 'ChainDataSourceConfig.bitcoindRpc(rpcHost: $rpcHost, rpcPort: $rpcPort, rpcUser: $rpcUser, rpcPassword: $rpcPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainDataSourceConfig_BitcoindRpcImpl &&
            (identical(other.rpcHost, rpcHost) || other.rpcHost == rpcHost) &&
            (identical(other.rpcPort, rpcPort) || other.rpcPort == rpcPort) &&
            (identical(other.rpcUser, rpcUser) || other.rpcUser == rpcUser) &&
            (identical(other.rpcPassword, rpcPassword) ||
                other.rpcPassword == rpcPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, rpcHost, rpcPort, rpcUser, rpcPassword);

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainDataSourceConfig_BitcoindRpcImplCopyWith<
          _$ChainDataSourceConfig_BitcoindRpcImpl>
      get copyWith => __$$ChainDataSourceConfig_BitcoindRpcImplCopyWithImpl<
          _$ChainDataSourceConfig_BitcoindRpcImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serverUrl, EsploraSyncConfig? syncConfig)
        esplora,
    required TResult Function(String serverUrl, ElectrumSyncConfig? syncConfig)
        electrum,
    required TResult Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)
        bitcoindRpc,
  }) {
    return bitcoindRpc(rpcHost, rpcPort, rpcUser, rpcPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String serverUrl, EsploraSyncConfig? syncConfig)? esplora,
    TResult? Function(String serverUrl, ElectrumSyncConfig? syncConfig)?
        electrum,
    TResult? Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRpc,
  }) {
    return bitcoindRpc?.call(rpcHost, rpcPort, rpcUser, rpcPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serverUrl, EsploraSyncConfig? syncConfig)? esplora,
    TResult Function(String serverUrl, ElectrumSyncConfig? syncConfig)?
        electrum,
    TResult Function(
            String rpcHost, int rpcPort, String rpcUser, String rpcPassword)?
        bitcoindRpc,
    required TResult orElse(),
  }) {
    if (bitcoindRpc != null) {
      return bitcoindRpc(rpcHost, rpcPort, rpcUser, rpcPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChainDataSourceConfig_Esplora value) esplora,
    required TResult Function(ChainDataSourceConfig_Electrum value) electrum,
    required TResult Function(ChainDataSourceConfig_BitcoindRpc value)
        bitcoindRpc,
  }) {
    return bitcoindRpc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChainDataSourceConfig_Esplora value)? esplora,
    TResult? Function(ChainDataSourceConfig_Electrum value)? electrum,
    TResult? Function(ChainDataSourceConfig_BitcoindRpc value)? bitcoindRpc,
  }) {
    return bitcoindRpc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChainDataSourceConfig_Esplora value)? esplora,
    TResult Function(ChainDataSourceConfig_Electrum value)? electrum,
    TResult Function(ChainDataSourceConfig_BitcoindRpc value)? bitcoindRpc,
    required TResult orElse(),
  }) {
    if (bitcoindRpc != null) {
      return bitcoindRpc(this);
    }
    return orElse();
  }
}

abstract class ChainDataSourceConfig_BitcoindRpc extends ChainDataSourceConfig {
  const factory ChainDataSourceConfig_BitcoindRpc(
          {required final String rpcHost,
          required final int rpcPort,
          required final String rpcUser,
          required final String rpcPassword}) =
      _$ChainDataSourceConfig_BitcoindRpcImpl;
  const ChainDataSourceConfig_BitcoindRpc._() : super._();

  String get rpcHost;
  int get rpcPort;
  String get rpcUser;
  String get rpcPassword;

  /// Create a copy of ChainDataSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChainDataSourceConfig_BitcoindRpcImplCopyWith<
          _$ChainDataSourceConfig_BitcoindRpcImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EntropySourceConfig {
  Object get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) seedFile,
    required TResult Function(Uint8List field0) seedBytes,
    required TResult Function(Mnemonic field0, String? field1) bip39Mnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(Uint8List field0)? seedBytes,
    TResult? Function(Mnemonic field0, String? field1)? bip39Mnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(Uint8List field0)? seedBytes,
    TResult Function(Mnemonic field0, String? field1)? bip39Mnemonic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EntropySourceConfig_SeedFile value) seedFile,
    required TResult Function(EntropySourceConfig_SeedBytes value) seedBytes,
    required TResult Function(EntropySourceConfig_Bip39Mnemonic value)
        bip39Mnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntropySourceConfig_SeedFile value)? seedFile,
    TResult? Function(EntropySourceConfig_SeedBytes value)? seedBytes,
    TResult? Function(EntropySourceConfig_Bip39Mnemonic value)? bip39Mnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntropySourceConfig_SeedFile value)? seedFile,
    TResult Function(EntropySourceConfig_SeedBytes value)? seedBytes,
    TResult Function(EntropySourceConfig_Bip39Mnemonic value)? bip39Mnemonic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntropySourceConfigCopyWith<$Res> {
  factory $EntropySourceConfigCopyWith(
          EntropySourceConfig value, $Res Function(EntropySourceConfig) then) =
      _$EntropySourceConfigCopyWithImpl<$Res, EntropySourceConfig>;
}

/// @nodoc
class _$EntropySourceConfigCopyWithImpl<$Res, $Val extends EntropySourceConfig>
    implements $EntropySourceConfigCopyWith<$Res> {
  _$EntropySourceConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EntropySourceConfig_SeedFileImplCopyWith<$Res> {
  factory _$$EntropySourceConfig_SeedFileImplCopyWith(
          _$EntropySourceConfig_SeedFileImpl value,
          $Res Function(_$EntropySourceConfig_SeedFileImpl) then) =
      __$$EntropySourceConfig_SeedFileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$EntropySourceConfig_SeedFileImplCopyWithImpl<$Res>
    extends _$EntropySourceConfigCopyWithImpl<$Res,
        _$EntropySourceConfig_SeedFileImpl>
    implements _$$EntropySourceConfig_SeedFileImplCopyWith<$Res> {
  __$$EntropySourceConfig_SeedFileImplCopyWithImpl(
      _$EntropySourceConfig_SeedFileImpl _value,
      $Res Function(_$EntropySourceConfig_SeedFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$EntropySourceConfig_SeedFileImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EntropySourceConfig_SeedFileImpl extends EntropySourceConfig_SeedFile {
  const _$EntropySourceConfig_SeedFileImpl(this.field0) : super._();

  @override
  final String field0;

  @override
  String toString() {
    return 'EntropySourceConfig.seedFile(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntropySourceConfig_SeedFileImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntropySourceConfig_SeedFileImplCopyWith<
          _$EntropySourceConfig_SeedFileImpl>
      get copyWith => __$$EntropySourceConfig_SeedFileImplCopyWithImpl<
          _$EntropySourceConfig_SeedFileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) seedFile,
    required TResult Function(Uint8List field0) seedBytes,
    required TResult Function(Mnemonic field0, String? field1) bip39Mnemonic,
  }) {
    return seedFile(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(Uint8List field0)? seedBytes,
    TResult? Function(Mnemonic field0, String? field1)? bip39Mnemonic,
  }) {
    return seedFile?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(Uint8List field0)? seedBytes,
    TResult Function(Mnemonic field0, String? field1)? bip39Mnemonic,
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
    required TResult Function(EntropySourceConfig_SeedFile value) seedFile,
    required TResult Function(EntropySourceConfig_SeedBytes value) seedBytes,
    required TResult Function(EntropySourceConfig_Bip39Mnemonic value)
        bip39Mnemonic,
  }) {
    return seedFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntropySourceConfig_SeedFile value)? seedFile,
    TResult? Function(EntropySourceConfig_SeedBytes value)? seedBytes,
    TResult? Function(EntropySourceConfig_Bip39Mnemonic value)? bip39Mnemonic,
  }) {
    return seedFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntropySourceConfig_SeedFile value)? seedFile,
    TResult Function(EntropySourceConfig_SeedBytes value)? seedBytes,
    TResult Function(EntropySourceConfig_Bip39Mnemonic value)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    if (seedFile != null) {
      return seedFile(this);
    }
    return orElse();
  }
}

abstract class EntropySourceConfig_SeedFile extends EntropySourceConfig {
  const factory EntropySourceConfig_SeedFile(final String field0) =
      _$EntropySourceConfig_SeedFileImpl;
  const EntropySourceConfig_SeedFile._() : super._();

  @override
  String get field0;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntropySourceConfig_SeedFileImplCopyWith<
          _$EntropySourceConfig_SeedFileImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EntropySourceConfig_SeedBytesImplCopyWith<$Res> {
  factory _$$EntropySourceConfig_SeedBytesImplCopyWith(
          _$EntropySourceConfig_SeedBytesImpl value,
          $Res Function(_$EntropySourceConfig_SeedBytesImpl) then) =
      __$$EntropySourceConfig_SeedBytesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List field0});
}

/// @nodoc
class __$$EntropySourceConfig_SeedBytesImplCopyWithImpl<$Res>
    extends _$EntropySourceConfigCopyWithImpl<$Res,
        _$EntropySourceConfig_SeedBytesImpl>
    implements _$$EntropySourceConfig_SeedBytesImplCopyWith<$Res> {
  __$$EntropySourceConfig_SeedBytesImplCopyWithImpl(
      _$EntropySourceConfig_SeedBytesImpl _value,
      $Res Function(_$EntropySourceConfig_SeedBytesImpl) _then)
      : super(_value, _then);

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$EntropySourceConfig_SeedBytesImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$EntropySourceConfig_SeedBytesImpl
    extends EntropySourceConfig_SeedBytes {
  const _$EntropySourceConfig_SeedBytesImpl(this.field0) : super._();

  @override
  final Uint8List field0;

  @override
  String toString() {
    return 'EntropySourceConfig.seedBytes(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntropySourceConfig_SeedBytesImpl &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntropySourceConfig_SeedBytesImplCopyWith<
          _$EntropySourceConfig_SeedBytesImpl>
      get copyWith => __$$EntropySourceConfig_SeedBytesImplCopyWithImpl<
          _$EntropySourceConfig_SeedBytesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) seedFile,
    required TResult Function(Uint8List field0) seedBytes,
    required TResult Function(Mnemonic field0, String? field1) bip39Mnemonic,
  }) {
    return seedBytes(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(Uint8List field0)? seedBytes,
    TResult? Function(Mnemonic field0, String? field1)? bip39Mnemonic,
  }) {
    return seedBytes?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(Uint8List field0)? seedBytes,
    TResult Function(Mnemonic field0, String? field1)? bip39Mnemonic,
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
    required TResult Function(EntropySourceConfig_SeedFile value) seedFile,
    required TResult Function(EntropySourceConfig_SeedBytes value) seedBytes,
    required TResult Function(EntropySourceConfig_Bip39Mnemonic value)
        bip39Mnemonic,
  }) {
    return seedBytes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntropySourceConfig_SeedFile value)? seedFile,
    TResult? Function(EntropySourceConfig_SeedBytes value)? seedBytes,
    TResult? Function(EntropySourceConfig_Bip39Mnemonic value)? bip39Mnemonic,
  }) {
    return seedBytes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntropySourceConfig_SeedFile value)? seedFile,
    TResult Function(EntropySourceConfig_SeedBytes value)? seedBytes,
    TResult Function(EntropySourceConfig_Bip39Mnemonic value)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    if (seedBytes != null) {
      return seedBytes(this);
    }
    return orElse();
  }
}

abstract class EntropySourceConfig_SeedBytes extends EntropySourceConfig {
  const factory EntropySourceConfig_SeedBytes(final Uint8List field0) =
      _$EntropySourceConfig_SeedBytesImpl;
  const EntropySourceConfig_SeedBytes._() : super._();

  @override
  Uint8List get field0;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntropySourceConfig_SeedBytesImplCopyWith<
          _$EntropySourceConfig_SeedBytesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EntropySourceConfig_Bip39MnemonicImplCopyWith<$Res> {
  factory _$$EntropySourceConfig_Bip39MnemonicImplCopyWith(
          _$EntropySourceConfig_Bip39MnemonicImpl value,
          $Res Function(_$EntropySourceConfig_Bip39MnemonicImpl) then) =
      __$$EntropySourceConfig_Bip39MnemonicImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Mnemonic field0, String? field1});
}

/// @nodoc
class __$$EntropySourceConfig_Bip39MnemonicImplCopyWithImpl<$Res>
    extends _$EntropySourceConfigCopyWithImpl<$Res,
        _$EntropySourceConfig_Bip39MnemonicImpl>
    implements _$$EntropySourceConfig_Bip39MnemonicImplCopyWith<$Res> {
  __$$EntropySourceConfig_Bip39MnemonicImplCopyWithImpl(
      _$EntropySourceConfig_Bip39MnemonicImpl _value,
      $Res Function(_$EntropySourceConfig_Bip39MnemonicImpl) _then)
      : super(_value, _then);

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
    Object? field1 = freezed,
  }) {
    return _then(_$EntropySourceConfig_Bip39MnemonicImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as Mnemonic,
      freezed == field1
          ? _value.field1
          : field1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EntropySourceConfig_Bip39MnemonicImpl
    extends EntropySourceConfig_Bip39Mnemonic {
  const _$EntropySourceConfig_Bip39MnemonicImpl(this.field0, [this.field1])
      : super._();

  @override
  final Mnemonic field0;
  @override
  final String? field1;

  @override
  String toString() {
    return 'EntropySourceConfig.bip39Mnemonic(field0: $field0, field1: $field1)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntropySourceConfig_Bip39MnemonicImpl &&
            (identical(other.field0, field0) || other.field0 == field0) &&
            (identical(other.field1, field1) || other.field1 == field1));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0, field1);

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntropySourceConfig_Bip39MnemonicImplCopyWith<
          _$EntropySourceConfig_Bip39MnemonicImpl>
      get copyWith => __$$EntropySourceConfig_Bip39MnemonicImplCopyWithImpl<
          _$EntropySourceConfig_Bip39MnemonicImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) seedFile,
    required TResult Function(Uint8List field0) seedBytes,
    required TResult Function(Mnemonic field0, String? field1) bip39Mnemonic,
  }) {
    return bip39Mnemonic(field0, field1);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(Uint8List field0)? seedBytes,
    TResult? Function(Mnemonic field0, String? field1)? bip39Mnemonic,
  }) {
    return bip39Mnemonic?.call(field0, field1);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(Uint8List field0)? seedBytes,
    TResult Function(Mnemonic field0, String? field1)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    if (bip39Mnemonic != null) {
      return bip39Mnemonic(field0, field1);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EntropySourceConfig_SeedFile value) seedFile,
    required TResult Function(EntropySourceConfig_SeedBytes value) seedBytes,
    required TResult Function(EntropySourceConfig_Bip39Mnemonic value)
        bip39Mnemonic,
  }) {
    return bip39Mnemonic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EntropySourceConfig_SeedFile value)? seedFile,
    TResult? Function(EntropySourceConfig_SeedBytes value)? seedBytes,
    TResult? Function(EntropySourceConfig_Bip39Mnemonic value)? bip39Mnemonic,
  }) {
    return bip39Mnemonic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EntropySourceConfig_SeedFile value)? seedFile,
    TResult Function(EntropySourceConfig_SeedBytes value)? seedBytes,
    TResult Function(EntropySourceConfig_Bip39Mnemonic value)? bip39Mnemonic,
    required TResult orElse(),
  }) {
    if (bip39Mnemonic != null) {
      return bip39Mnemonic(this);
    }
    return orElse();
  }
}

abstract class EntropySourceConfig_Bip39Mnemonic extends EntropySourceConfig {
  const factory EntropySourceConfig_Bip39Mnemonic(final Mnemonic field0,
      [final String? field1]) = _$EntropySourceConfig_Bip39MnemonicImpl;
  const EntropySourceConfig_Bip39Mnemonic._() : super._();

  @override
  Mnemonic get field0;
  String? get field1;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntropySourceConfig_Bip39MnemonicImplCopyWith<
          _$EntropySourceConfig_Bip39MnemonicImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GossipSourceConfig {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() p2PNetwork,
    required TResult Function(String field0) rapidGossipSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? p2PNetwork,
    TResult? Function(String field0)? rapidGossipSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? p2PNetwork,
    TResult Function(String field0)? rapidGossipSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GossipSourceConfig_P2PNetwork value) p2PNetwork,
    required TResult Function(GossipSourceConfig_RapidGossipSync value)
        rapidGossipSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GossipSourceConfig_P2PNetwork value)? p2PNetwork,
    TResult? Function(GossipSourceConfig_RapidGossipSync value)?
        rapidGossipSync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GossipSourceConfig_P2PNetwork value)? p2PNetwork,
    TResult Function(GossipSourceConfig_RapidGossipSync value)? rapidGossipSync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GossipSourceConfigCopyWith<$Res> {
  factory $GossipSourceConfigCopyWith(
          GossipSourceConfig value, $Res Function(GossipSourceConfig) then) =
      _$GossipSourceConfigCopyWithImpl<$Res, GossipSourceConfig>;
}

/// @nodoc
class _$GossipSourceConfigCopyWithImpl<$Res, $Val extends GossipSourceConfig>
    implements $GossipSourceConfigCopyWith<$Res> {
  _$GossipSourceConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GossipSourceConfig
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GossipSourceConfig_P2PNetworkImplCopyWith<$Res> {
  factory _$$GossipSourceConfig_P2PNetworkImplCopyWith(
          _$GossipSourceConfig_P2PNetworkImpl value,
          $Res Function(_$GossipSourceConfig_P2PNetworkImpl) then) =
      __$$GossipSourceConfig_P2PNetworkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GossipSourceConfig_P2PNetworkImplCopyWithImpl<$Res>
    extends _$GossipSourceConfigCopyWithImpl<$Res,
        _$GossipSourceConfig_P2PNetworkImpl>
    implements _$$GossipSourceConfig_P2PNetworkImplCopyWith<$Res> {
  __$$GossipSourceConfig_P2PNetworkImplCopyWithImpl(
      _$GossipSourceConfig_P2PNetworkImpl _value,
      $Res Function(_$GossipSourceConfig_P2PNetworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of GossipSourceConfig
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GossipSourceConfig_P2PNetworkImpl
    extends GossipSourceConfig_P2PNetwork {
  const _$GossipSourceConfig_P2PNetworkImpl() : super._();

  @override
  String toString() {
    return 'GossipSourceConfig.p2PNetwork()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GossipSourceConfig_P2PNetworkImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() p2PNetwork,
    required TResult Function(String field0) rapidGossipSync,
  }) {
    return p2PNetwork();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? p2PNetwork,
    TResult? Function(String field0)? rapidGossipSync,
  }) {
    return p2PNetwork?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? p2PNetwork,
    TResult Function(String field0)? rapidGossipSync,
    required TResult orElse(),
  }) {
    if (p2PNetwork != null) {
      return p2PNetwork();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GossipSourceConfig_P2PNetwork value) p2PNetwork,
    required TResult Function(GossipSourceConfig_RapidGossipSync value)
        rapidGossipSync,
  }) {
    return p2PNetwork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GossipSourceConfig_P2PNetwork value)? p2PNetwork,
    TResult? Function(GossipSourceConfig_RapidGossipSync value)?
        rapidGossipSync,
  }) {
    return p2PNetwork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GossipSourceConfig_P2PNetwork value)? p2PNetwork,
    TResult Function(GossipSourceConfig_RapidGossipSync value)? rapidGossipSync,
    required TResult orElse(),
  }) {
    if (p2PNetwork != null) {
      return p2PNetwork(this);
    }
    return orElse();
  }
}

abstract class GossipSourceConfig_P2PNetwork extends GossipSourceConfig {
  const factory GossipSourceConfig_P2PNetwork() =
      _$GossipSourceConfig_P2PNetworkImpl;
  const GossipSourceConfig_P2PNetwork._() : super._();
}

/// @nodoc
abstract class _$$GossipSourceConfig_RapidGossipSyncImplCopyWith<$Res> {
  factory _$$GossipSourceConfig_RapidGossipSyncImplCopyWith(
          _$GossipSourceConfig_RapidGossipSyncImpl value,
          $Res Function(_$GossipSourceConfig_RapidGossipSyncImpl) then) =
      __$$GossipSourceConfig_RapidGossipSyncImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String field0});
}

/// @nodoc
class __$$GossipSourceConfig_RapidGossipSyncImplCopyWithImpl<$Res>
    extends _$GossipSourceConfigCopyWithImpl<$Res,
        _$GossipSourceConfig_RapidGossipSyncImpl>
    implements _$$GossipSourceConfig_RapidGossipSyncImplCopyWith<$Res> {
  __$$GossipSourceConfig_RapidGossipSyncImplCopyWithImpl(
      _$GossipSourceConfig_RapidGossipSyncImpl _value,
      $Res Function(_$GossipSourceConfig_RapidGossipSyncImpl) _then)
      : super(_value, _then);

  /// Create a copy of GossipSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$GossipSourceConfig_RapidGossipSyncImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GossipSourceConfig_RapidGossipSyncImpl
    extends GossipSourceConfig_RapidGossipSync {
  const _$GossipSourceConfig_RapidGossipSyncImpl(this.field0) : super._();

  @override
  final String field0;

  @override
  String toString() {
    return 'GossipSourceConfig.rapidGossipSync(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GossipSourceConfig_RapidGossipSyncImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of GossipSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GossipSourceConfig_RapidGossipSyncImplCopyWith<
          _$GossipSourceConfig_RapidGossipSyncImpl>
      get copyWith => __$$GossipSourceConfig_RapidGossipSyncImplCopyWithImpl<
          _$GossipSourceConfig_RapidGossipSyncImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() p2PNetwork,
    required TResult Function(String field0) rapidGossipSync,
  }) {
    return rapidGossipSync(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? p2PNetwork,
    TResult? Function(String field0)? rapidGossipSync,
  }) {
    return rapidGossipSync?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? p2PNetwork,
    TResult Function(String field0)? rapidGossipSync,
    required TResult orElse(),
  }) {
    if (rapidGossipSync != null) {
      return rapidGossipSync(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GossipSourceConfig_P2PNetwork value) p2PNetwork,
    required TResult Function(GossipSourceConfig_RapidGossipSync value)
        rapidGossipSync,
  }) {
    return rapidGossipSync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GossipSourceConfig_P2PNetwork value)? p2PNetwork,
    TResult? Function(GossipSourceConfig_RapidGossipSync value)?
        rapidGossipSync,
  }) {
    return rapidGossipSync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GossipSourceConfig_P2PNetwork value)? p2PNetwork,
    TResult Function(GossipSourceConfig_RapidGossipSync value)? rapidGossipSync,
    required TResult orElse(),
  }) {
    if (rapidGossipSync != null) {
      return rapidGossipSync(this);
    }
    return orElse();
  }
}

abstract class GossipSourceConfig_RapidGossipSync extends GossipSourceConfig {
  const factory GossipSourceConfig_RapidGossipSync(final String field0) =
      _$GossipSourceConfig_RapidGossipSyncImpl;
  const GossipSourceConfig_RapidGossipSync._() : super._();

  String get field0;

  /// Create a copy of GossipSourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GossipSourceConfig_RapidGossipSyncImplCopyWith<
          _$GossipSourceConfig_RapidGossipSyncImpl>
      get copyWith => throw _privateConstructorUsedError;
}
