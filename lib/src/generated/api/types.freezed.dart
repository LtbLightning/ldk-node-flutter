// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

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
mixin _$ClosureReason {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosureReasonCopyWith<$Res> {
  factory $ClosureReasonCopyWith(
          ClosureReason value, $Res Function(ClosureReason) then) =
      _$ClosureReasonCopyWithImpl<$Res, ClosureReason>;
}

/// @nodoc
class _$ClosureReasonCopyWithImpl<$Res, $Val extends ClosureReason>
    implements $ClosureReasonCopyWith<$Res> {
  _$ClosureReasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ClosureReason_PeerFeerateTooLowImplCopyWith<$Res> {
  factory _$$ClosureReason_PeerFeerateTooLowImplCopyWith(
          _$ClosureReason_PeerFeerateTooLowImpl value,
          $Res Function(_$ClosureReason_PeerFeerateTooLowImpl) then) =
      __$$ClosureReason_PeerFeerateTooLowImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int peerFeerateSatPerKw, int requiredFeerateSatPerKw});
}

/// @nodoc
class __$$ClosureReason_PeerFeerateTooLowImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_PeerFeerateTooLowImpl>
    implements _$$ClosureReason_PeerFeerateTooLowImplCopyWith<$Res> {
  __$$ClosureReason_PeerFeerateTooLowImplCopyWithImpl(
      _$ClosureReason_PeerFeerateTooLowImpl _value,
      $Res Function(_$ClosureReason_PeerFeerateTooLowImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? peerFeerateSatPerKw = null,
    Object? requiredFeerateSatPerKw = null,
  }) {
    return _then(_$ClosureReason_PeerFeerateTooLowImpl(
      peerFeerateSatPerKw: null == peerFeerateSatPerKw
          ? _value.peerFeerateSatPerKw
          : peerFeerateSatPerKw // ignore: cast_nullable_to_non_nullable
              as int,
      requiredFeerateSatPerKw: null == requiredFeerateSatPerKw
          ? _value.requiredFeerateSatPerKw
          : requiredFeerateSatPerKw // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ClosureReason_PeerFeerateTooLowImpl
    extends ClosureReason_PeerFeerateTooLow {
  const _$ClosureReason_PeerFeerateTooLowImpl(
      {required this.peerFeerateSatPerKw,
      required this.requiredFeerateSatPerKw})
      : super._();

  @override
  final int peerFeerateSatPerKw;
  @override
  final int requiredFeerateSatPerKw;

  @override
  String toString() {
    return 'ClosureReason.peerFeerateTooLow(peerFeerateSatPerKw: $peerFeerateSatPerKw, requiredFeerateSatPerKw: $requiredFeerateSatPerKw)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_PeerFeerateTooLowImpl &&
            (identical(other.peerFeerateSatPerKw, peerFeerateSatPerKw) ||
                other.peerFeerateSatPerKw == peerFeerateSatPerKw) &&
            (identical(
                    other.requiredFeerateSatPerKw, requiredFeerateSatPerKw) ||
                other.requiredFeerateSatPerKw == requiredFeerateSatPerKw));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, peerFeerateSatPerKw, requiredFeerateSatPerKw);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosureReason_PeerFeerateTooLowImplCopyWith<
          _$ClosureReason_PeerFeerateTooLowImpl>
      get copyWith => __$$ClosureReason_PeerFeerateTooLowImplCopyWithImpl<
          _$ClosureReason_PeerFeerateTooLowImpl>(this, _$identity);

  @override
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
    return peerFeerateTooLow(peerFeerateSatPerKw, requiredFeerateSatPerKw);
  }

  @override
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
    return peerFeerateTooLow?.call(
        peerFeerateSatPerKw, requiredFeerateSatPerKw);
  }

  @override
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
    if (peerFeerateTooLow != null) {
      return peerFeerateTooLow(peerFeerateSatPerKw, requiredFeerateSatPerKw);
    }
    return orElse();
  }

  @override
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
    return peerFeerateTooLow(this);
  }

  @override
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
    return peerFeerateTooLow?.call(this);
  }

  @override
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
    if (peerFeerateTooLow != null) {
      return peerFeerateTooLow(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_PeerFeerateTooLow extends ClosureReason {
  const factory ClosureReason_PeerFeerateTooLow(
          {required final int peerFeerateSatPerKw,
          required final int requiredFeerateSatPerKw}) =
      _$ClosureReason_PeerFeerateTooLowImpl;
  const ClosureReason_PeerFeerateTooLow._() : super._();

  int get peerFeerateSatPerKw;
  int get requiredFeerateSatPerKw;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClosureReason_PeerFeerateTooLowImplCopyWith<
          _$ClosureReason_PeerFeerateTooLowImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosureReason_CounterpartyForceClosedImplCopyWith<$Res> {
  factory _$$ClosureReason_CounterpartyForceClosedImplCopyWith(
          _$ClosureReason_CounterpartyForceClosedImpl value,
          $Res Function(_$ClosureReason_CounterpartyForceClosedImpl) then) =
      __$$ClosureReason_CounterpartyForceClosedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String peerMsg});
}

/// @nodoc
class __$$ClosureReason_CounterpartyForceClosedImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_CounterpartyForceClosedImpl>
    implements _$$ClosureReason_CounterpartyForceClosedImplCopyWith<$Res> {
  __$$ClosureReason_CounterpartyForceClosedImplCopyWithImpl(
      _$ClosureReason_CounterpartyForceClosedImpl _value,
      $Res Function(_$ClosureReason_CounterpartyForceClosedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? peerMsg = null,
  }) {
    return _then(_$ClosureReason_CounterpartyForceClosedImpl(
      peerMsg: null == peerMsg
          ? _value.peerMsg
          : peerMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ClosureReason_CounterpartyForceClosedImpl
    extends ClosureReason_CounterpartyForceClosed {
  const _$ClosureReason_CounterpartyForceClosedImpl({required this.peerMsg})
      : super._();

  /// The error which the peer sent us.
  ///
  /// Be careful about printing the peer_msg, a well-crafted message could exploit
  /// a security vulnerability in the terminal emulator or the logging subsystem.
  /// To be safe, use `Display` on `UntrustedString`
  ///
  /// [`UntrustedString`]: crate::util::string::UntrustedString
  @override
  final String peerMsg;

  @override
  String toString() {
    return 'ClosureReason.counterpartyForceClosed(peerMsg: $peerMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_CounterpartyForceClosedImpl &&
            (identical(other.peerMsg, peerMsg) || other.peerMsg == peerMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, peerMsg);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosureReason_CounterpartyForceClosedImplCopyWith<
          _$ClosureReason_CounterpartyForceClosedImpl>
      get copyWith => __$$ClosureReason_CounterpartyForceClosedImplCopyWithImpl<
          _$ClosureReason_CounterpartyForceClosedImpl>(this, _$identity);

  @override
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
    return counterpartyForceClosed(peerMsg);
  }

  @override
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
    return counterpartyForceClosed?.call(peerMsg);
  }

  @override
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
    if (counterpartyForceClosed != null) {
      return counterpartyForceClosed(peerMsg);
    }
    return orElse();
  }

  @override
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
    return counterpartyForceClosed(this);
  }

  @override
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
    return counterpartyForceClosed?.call(this);
  }

  @override
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
    if (counterpartyForceClosed != null) {
      return counterpartyForceClosed(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_CounterpartyForceClosed extends ClosureReason {
  const factory ClosureReason_CounterpartyForceClosed(
          {required final String peerMsg}) =
      _$ClosureReason_CounterpartyForceClosedImpl;
  const ClosureReason_CounterpartyForceClosed._() : super._();

  /// The error which the peer sent us.
  ///
  /// Be careful about printing the peer_msg, a well-crafted message could exploit
  /// a security vulnerability in the terminal emulator or the logging subsystem.
  /// To be safe, use `Display` on `UntrustedString`
  ///
  /// [`UntrustedString`]: crate::util::string::UntrustedString
  String get peerMsg;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClosureReason_CounterpartyForceClosedImplCopyWith<
          _$ClosureReason_CounterpartyForceClosedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosureReason_HolderForceClosedImplCopyWith<$Res> {
  factory _$$ClosureReason_HolderForceClosedImplCopyWith(
          _$ClosureReason_HolderForceClosedImpl value,
          $Res Function(_$ClosureReason_HolderForceClosedImpl) then) =
      __$$ClosureReason_HolderForceClosedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool? broadcastedLatestTxn});
}

/// @nodoc
class __$$ClosureReason_HolderForceClosedImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_HolderForceClosedImpl>
    implements _$$ClosureReason_HolderForceClosedImplCopyWith<$Res> {
  __$$ClosureReason_HolderForceClosedImplCopyWithImpl(
      _$ClosureReason_HolderForceClosedImpl _value,
      $Res Function(_$ClosureReason_HolderForceClosedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? broadcastedLatestTxn = freezed,
  }) {
    return _then(_$ClosureReason_HolderForceClosedImpl(
      broadcastedLatestTxn: freezed == broadcastedLatestTxn
          ? _value.broadcastedLatestTxn
          : broadcastedLatestTxn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ClosureReason_HolderForceClosedImpl
    extends ClosureReason_HolderForceClosed {
  const _$ClosureReason_HolderForceClosedImpl({this.broadcastedLatestTxn})
      : super._();

  @override
  final bool? broadcastedLatestTxn;

  @override
  String toString() {
    return 'ClosureReason.holderForceClosed(broadcastedLatestTxn: $broadcastedLatestTxn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_HolderForceClosedImpl &&
            (identical(other.broadcastedLatestTxn, broadcastedLatestTxn) ||
                other.broadcastedLatestTxn == broadcastedLatestTxn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, broadcastedLatestTxn);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosureReason_HolderForceClosedImplCopyWith<
          _$ClosureReason_HolderForceClosedImpl>
      get copyWith => __$$ClosureReason_HolderForceClosedImplCopyWithImpl<
          _$ClosureReason_HolderForceClosedImpl>(this, _$identity);

  @override
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
    return holderForceClosed(broadcastedLatestTxn);
  }

  @override
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
    return holderForceClosed?.call(broadcastedLatestTxn);
  }

  @override
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
    if (holderForceClosed != null) {
      return holderForceClosed(broadcastedLatestTxn);
    }
    return orElse();
  }

  @override
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
    return holderForceClosed(this);
  }

  @override
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
    return holderForceClosed?.call(this);
  }

  @override
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
    if (holderForceClosed != null) {
      return holderForceClosed(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_HolderForceClosed extends ClosureReason {
  const factory ClosureReason_HolderForceClosed(
          {final bool? broadcastedLatestTxn}) =
      _$ClosureReason_HolderForceClosedImpl;
  const ClosureReason_HolderForceClosed._() : super._();

  bool? get broadcastedLatestTxn;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClosureReason_HolderForceClosedImplCopyWith<
          _$ClosureReason_HolderForceClosedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosureReason_LegacyCooperativeClosureImplCopyWith<$Res> {
  factory _$$ClosureReason_LegacyCooperativeClosureImplCopyWith(
          _$ClosureReason_LegacyCooperativeClosureImpl value,
          $Res Function(_$ClosureReason_LegacyCooperativeClosureImpl) then) =
      __$$ClosureReason_LegacyCooperativeClosureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosureReason_LegacyCooperativeClosureImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_LegacyCooperativeClosureImpl>
    implements _$$ClosureReason_LegacyCooperativeClosureImplCopyWith<$Res> {
  __$$ClosureReason_LegacyCooperativeClosureImplCopyWithImpl(
      _$ClosureReason_LegacyCooperativeClosureImpl _value,
      $Res Function(_$ClosureReason_LegacyCooperativeClosureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosureReason_LegacyCooperativeClosureImpl
    extends ClosureReason_LegacyCooperativeClosure {
  const _$ClosureReason_LegacyCooperativeClosureImpl() : super._();

  @override
  String toString() {
    return 'ClosureReason.legacyCooperativeClosure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_LegacyCooperativeClosureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return legacyCooperativeClosure();
  }

  @override
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
    return legacyCooperativeClosure?.call();
  }

  @override
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
    if (legacyCooperativeClosure != null) {
      return legacyCooperativeClosure();
    }
    return orElse();
  }

  @override
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
    return legacyCooperativeClosure(this);
  }

  @override
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
    return legacyCooperativeClosure?.call(this);
  }

  @override
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
    if (legacyCooperativeClosure != null) {
      return legacyCooperativeClosure(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_LegacyCooperativeClosure extends ClosureReason {
  const factory ClosureReason_LegacyCooperativeClosure() =
      _$ClosureReason_LegacyCooperativeClosureImpl;
  const ClosureReason_LegacyCooperativeClosure._() : super._();
}

/// @nodoc
abstract class _$$ClosureReason_CounterpartyInitiatedCooperativeClosureImplCopyWith<
    $Res> {
  factory _$$ClosureReason_CounterpartyInitiatedCooperativeClosureImplCopyWith(
          _$ClosureReason_CounterpartyInitiatedCooperativeClosureImpl value,
          $Res Function(
                  _$ClosureReason_CounterpartyInitiatedCooperativeClosureImpl)
              then) =
      __$$ClosureReason_CounterpartyInitiatedCooperativeClosureImplCopyWithImpl<
          $Res>;
}

/// @nodoc
class __$$ClosureReason_CounterpartyInitiatedCooperativeClosureImplCopyWithImpl<
        $Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_CounterpartyInitiatedCooperativeClosureImpl>
    implements
        _$$ClosureReason_CounterpartyInitiatedCooperativeClosureImplCopyWith<
            $Res> {
  __$$ClosureReason_CounterpartyInitiatedCooperativeClosureImplCopyWithImpl(
      _$ClosureReason_CounterpartyInitiatedCooperativeClosureImpl _value,
      $Res Function(_$ClosureReason_CounterpartyInitiatedCooperativeClosureImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosureReason_CounterpartyInitiatedCooperativeClosureImpl
    extends ClosureReason_CounterpartyInitiatedCooperativeClosure {
  const _$ClosureReason_CounterpartyInitiatedCooperativeClosureImpl()
      : super._();

  @override
  String toString() {
    return 'ClosureReason.counterpartyInitiatedCooperativeClosure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is _$ClosureReason_CounterpartyInitiatedCooperativeClosureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return counterpartyInitiatedCooperativeClosure();
  }

  @override
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
    return counterpartyInitiatedCooperativeClosure?.call();
  }

  @override
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
    if (counterpartyInitiatedCooperativeClosure != null) {
      return counterpartyInitiatedCooperativeClosure();
    }
    return orElse();
  }

  @override
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
    return counterpartyInitiatedCooperativeClosure(this);
  }

  @override
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
    return counterpartyInitiatedCooperativeClosure?.call(this);
  }

  @override
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
    if (counterpartyInitiatedCooperativeClosure != null) {
      return counterpartyInitiatedCooperativeClosure(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_CounterpartyInitiatedCooperativeClosure
    extends ClosureReason {
  const factory ClosureReason_CounterpartyInitiatedCooperativeClosure() =
      _$ClosureReason_CounterpartyInitiatedCooperativeClosureImpl;
  const ClosureReason_CounterpartyInitiatedCooperativeClosure._() : super._();
}

/// @nodoc
abstract class _$$ClosureReason_LocallyInitiatedCooperativeClosureImplCopyWith<
    $Res> {
  factory _$$ClosureReason_LocallyInitiatedCooperativeClosureImplCopyWith(
          _$ClosureReason_LocallyInitiatedCooperativeClosureImpl value,
          $Res Function(_$ClosureReason_LocallyInitiatedCooperativeClosureImpl)
              then) =
      __$$ClosureReason_LocallyInitiatedCooperativeClosureImplCopyWithImpl<
          $Res>;
}

/// @nodoc
class __$$ClosureReason_LocallyInitiatedCooperativeClosureImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_LocallyInitiatedCooperativeClosureImpl>
    implements
        _$$ClosureReason_LocallyInitiatedCooperativeClosureImplCopyWith<$Res> {
  __$$ClosureReason_LocallyInitiatedCooperativeClosureImplCopyWithImpl(
      _$ClosureReason_LocallyInitiatedCooperativeClosureImpl _value,
      $Res Function(_$ClosureReason_LocallyInitiatedCooperativeClosureImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosureReason_LocallyInitiatedCooperativeClosureImpl
    extends ClosureReason_LocallyInitiatedCooperativeClosure {
  const _$ClosureReason_LocallyInitiatedCooperativeClosureImpl() : super._();

  @override
  String toString() {
    return 'ClosureReason.locallyInitiatedCooperativeClosure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_LocallyInitiatedCooperativeClosureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return locallyInitiatedCooperativeClosure();
  }

  @override
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
    return locallyInitiatedCooperativeClosure?.call();
  }

  @override
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
    if (locallyInitiatedCooperativeClosure != null) {
      return locallyInitiatedCooperativeClosure();
    }
    return orElse();
  }

  @override
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
    return locallyInitiatedCooperativeClosure(this);
  }

  @override
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
    return locallyInitiatedCooperativeClosure?.call(this);
  }

  @override
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
    if (locallyInitiatedCooperativeClosure != null) {
      return locallyInitiatedCooperativeClosure(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_LocallyInitiatedCooperativeClosure
    extends ClosureReason {
  const factory ClosureReason_LocallyInitiatedCooperativeClosure() =
      _$ClosureReason_LocallyInitiatedCooperativeClosureImpl;
  const ClosureReason_LocallyInitiatedCooperativeClosure._() : super._();
}

/// @nodoc
abstract class _$$ClosureReason_CommitmentTxConfirmedImplCopyWith<$Res> {
  factory _$$ClosureReason_CommitmentTxConfirmedImplCopyWith(
          _$ClosureReason_CommitmentTxConfirmedImpl value,
          $Res Function(_$ClosureReason_CommitmentTxConfirmedImpl) then) =
      __$$ClosureReason_CommitmentTxConfirmedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosureReason_CommitmentTxConfirmedImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_CommitmentTxConfirmedImpl>
    implements _$$ClosureReason_CommitmentTxConfirmedImplCopyWith<$Res> {
  __$$ClosureReason_CommitmentTxConfirmedImplCopyWithImpl(
      _$ClosureReason_CommitmentTxConfirmedImpl _value,
      $Res Function(_$ClosureReason_CommitmentTxConfirmedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosureReason_CommitmentTxConfirmedImpl
    extends ClosureReason_CommitmentTxConfirmed {
  const _$ClosureReason_CommitmentTxConfirmedImpl() : super._();

  @override
  String toString() {
    return 'ClosureReason.commitmentTxConfirmed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_CommitmentTxConfirmedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return commitmentTxConfirmed();
  }

  @override
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
    return commitmentTxConfirmed?.call();
  }

  @override
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
    if (commitmentTxConfirmed != null) {
      return commitmentTxConfirmed();
    }
    return orElse();
  }

  @override
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
    return commitmentTxConfirmed(this);
  }

  @override
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
    return commitmentTxConfirmed?.call(this);
  }

  @override
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
    if (commitmentTxConfirmed != null) {
      return commitmentTxConfirmed(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_CommitmentTxConfirmed extends ClosureReason {
  const factory ClosureReason_CommitmentTxConfirmed() =
      _$ClosureReason_CommitmentTxConfirmedImpl;
  const ClosureReason_CommitmentTxConfirmed._() : super._();
}

/// @nodoc
abstract class _$$ClosureReason_FundingTimedOutImplCopyWith<$Res> {
  factory _$$ClosureReason_FundingTimedOutImplCopyWith(
          _$ClosureReason_FundingTimedOutImpl value,
          $Res Function(_$ClosureReason_FundingTimedOutImpl) then) =
      __$$ClosureReason_FundingTimedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosureReason_FundingTimedOutImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_FundingTimedOutImpl>
    implements _$$ClosureReason_FundingTimedOutImplCopyWith<$Res> {
  __$$ClosureReason_FundingTimedOutImplCopyWithImpl(
      _$ClosureReason_FundingTimedOutImpl _value,
      $Res Function(_$ClosureReason_FundingTimedOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosureReason_FundingTimedOutImpl
    extends ClosureReason_FundingTimedOut {
  const _$ClosureReason_FundingTimedOutImpl() : super._();

  @override
  String toString() {
    return 'ClosureReason.fundingTimedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_FundingTimedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return fundingTimedOut();
  }

  @override
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
    return fundingTimedOut?.call();
  }

  @override
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
    if (fundingTimedOut != null) {
      return fundingTimedOut();
    }
    return orElse();
  }

  @override
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
    return fundingTimedOut(this);
  }

  @override
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
    return fundingTimedOut?.call(this);
  }

  @override
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
    if (fundingTimedOut != null) {
      return fundingTimedOut(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_FundingTimedOut extends ClosureReason {
  const factory ClosureReason_FundingTimedOut() =
      _$ClosureReason_FundingTimedOutImpl;
  const ClosureReason_FundingTimedOut._() : super._();
}

/// @nodoc
abstract class _$$ClosureReason_ProcessingErrorImplCopyWith<$Res> {
  factory _$$ClosureReason_ProcessingErrorImplCopyWith(
          _$ClosureReason_ProcessingErrorImpl value,
          $Res Function(_$ClosureReason_ProcessingErrorImpl) then) =
      __$$ClosureReason_ProcessingErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$ClosureReason_ProcessingErrorImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_ProcessingErrorImpl>
    implements _$$ClosureReason_ProcessingErrorImplCopyWith<$Res> {
  __$$ClosureReason_ProcessingErrorImplCopyWithImpl(
      _$ClosureReason_ProcessingErrorImpl _value,
      $Res Function(_$ClosureReason_ProcessingErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$ClosureReason_ProcessingErrorImpl(
      err: null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ClosureReason_ProcessingErrorImpl
    extends ClosureReason_ProcessingError {
  const _$ClosureReason_ProcessingErrorImpl({required this.err}) : super._();

  /// A developer-readable error message which we generated.
  @override
  final String err;

  @override
  String toString() {
    return 'ClosureReason.processingError(err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_ProcessingErrorImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosureReason_ProcessingErrorImplCopyWith<
          _$ClosureReason_ProcessingErrorImpl>
      get copyWith => __$$ClosureReason_ProcessingErrorImplCopyWithImpl<
          _$ClosureReason_ProcessingErrorImpl>(this, _$identity);

  @override
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
    return processingError(err);
  }

  @override
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
    return processingError?.call(err);
  }

  @override
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
    if (processingError != null) {
      return processingError(err);
    }
    return orElse();
  }

  @override
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
    return processingError(this);
  }

  @override
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
    return processingError?.call(this);
  }

  @override
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
    if (processingError != null) {
      return processingError(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_ProcessingError extends ClosureReason {
  const factory ClosureReason_ProcessingError({required final String err}) =
      _$ClosureReason_ProcessingErrorImpl;
  const ClosureReason_ProcessingError._() : super._();

  /// A developer-readable error message which we generated.
  String get err;

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClosureReason_ProcessingErrorImplCopyWith<
          _$ClosureReason_ProcessingErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosureReason_DisconnectedPeerImplCopyWith<$Res> {
  factory _$$ClosureReason_DisconnectedPeerImplCopyWith(
          _$ClosureReason_DisconnectedPeerImpl value,
          $Res Function(_$ClosureReason_DisconnectedPeerImpl) then) =
      __$$ClosureReason_DisconnectedPeerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosureReason_DisconnectedPeerImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_DisconnectedPeerImpl>
    implements _$$ClosureReason_DisconnectedPeerImplCopyWith<$Res> {
  __$$ClosureReason_DisconnectedPeerImplCopyWithImpl(
      _$ClosureReason_DisconnectedPeerImpl _value,
      $Res Function(_$ClosureReason_DisconnectedPeerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosureReason_DisconnectedPeerImpl
    extends ClosureReason_DisconnectedPeer {
  const _$ClosureReason_DisconnectedPeerImpl() : super._();

  @override
  String toString() {
    return 'ClosureReason.disconnectedPeer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_DisconnectedPeerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return disconnectedPeer();
  }

  @override
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
    return disconnectedPeer?.call();
  }

  @override
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
    if (disconnectedPeer != null) {
      return disconnectedPeer();
    }
    return orElse();
  }

  @override
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
    return disconnectedPeer(this);
  }

  @override
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
    return disconnectedPeer?.call(this);
  }

  @override
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
    if (disconnectedPeer != null) {
      return disconnectedPeer(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_DisconnectedPeer extends ClosureReason {
  const factory ClosureReason_DisconnectedPeer() =
      _$ClosureReason_DisconnectedPeerImpl;
  const ClosureReason_DisconnectedPeer._() : super._();
}

/// @nodoc
abstract class _$$ClosureReason_OutdatedChannelManagerImplCopyWith<$Res> {
  factory _$$ClosureReason_OutdatedChannelManagerImplCopyWith(
          _$ClosureReason_OutdatedChannelManagerImpl value,
          $Res Function(_$ClosureReason_OutdatedChannelManagerImpl) then) =
      __$$ClosureReason_OutdatedChannelManagerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosureReason_OutdatedChannelManagerImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_OutdatedChannelManagerImpl>
    implements _$$ClosureReason_OutdatedChannelManagerImplCopyWith<$Res> {
  __$$ClosureReason_OutdatedChannelManagerImplCopyWithImpl(
      _$ClosureReason_OutdatedChannelManagerImpl _value,
      $Res Function(_$ClosureReason_OutdatedChannelManagerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosureReason_OutdatedChannelManagerImpl
    extends ClosureReason_OutdatedChannelManager {
  const _$ClosureReason_OutdatedChannelManagerImpl() : super._();

  @override
  String toString() {
    return 'ClosureReason.outdatedChannelManager()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_OutdatedChannelManagerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return outdatedChannelManager();
  }

  @override
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
    return outdatedChannelManager?.call();
  }

  @override
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
    if (outdatedChannelManager != null) {
      return outdatedChannelManager();
    }
    return orElse();
  }

  @override
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
    return outdatedChannelManager(this);
  }

  @override
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
    return outdatedChannelManager?.call(this);
  }

  @override
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
    if (outdatedChannelManager != null) {
      return outdatedChannelManager(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_OutdatedChannelManager extends ClosureReason {
  const factory ClosureReason_OutdatedChannelManager() =
      _$ClosureReason_OutdatedChannelManagerImpl;
  const ClosureReason_OutdatedChannelManager._() : super._();
}

/// @nodoc
abstract class _$$ClosureReason_CounterpartyCoopClosedUnfundedChannelImplCopyWith<
    $Res> {
  factory _$$ClosureReason_CounterpartyCoopClosedUnfundedChannelImplCopyWith(
          _$ClosureReason_CounterpartyCoopClosedUnfundedChannelImpl value,
          $Res Function(
                  _$ClosureReason_CounterpartyCoopClosedUnfundedChannelImpl)
              then) =
      __$$ClosureReason_CounterpartyCoopClosedUnfundedChannelImplCopyWithImpl<
          $Res>;
}

/// @nodoc
class __$$ClosureReason_CounterpartyCoopClosedUnfundedChannelImplCopyWithImpl<
        $Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_CounterpartyCoopClosedUnfundedChannelImpl>
    implements
        _$$ClosureReason_CounterpartyCoopClosedUnfundedChannelImplCopyWith<
            $Res> {
  __$$ClosureReason_CounterpartyCoopClosedUnfundedChannelImplCopyWithImpl(
      _$ClosureReason_CounterpartyCoopClosedUnfundedChannelImpl _value,
      $Res Function(_$ClosureReason_CounterpartyCoopClosedUnfundedChannelImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosureReason_CounterpartyCoopClosedUnfundedChannelImpl
    extends ClosureReason_CounterpartyCoopClosedUnfundedChannel {
  const _$ClosureReason_CounterpartyCoopClosedUnfundedChannelImpl() : super._();

  @override
  String toString() {
    return 'ClosureReason.counterpartyCoopClosedUnfundedChannel()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_CounterpartyCoopClosedUnfundedChannelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return counterpartyCoopClosedUnfundedChannel();
  }

  @override
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
    return counterpartyCoopClosedUnfundedChannel?.call();
  }

  @override
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
    if (counterpartyCoopClosedUnfundedChannel != null) {
      return counterpartyCoopClosedUnfundedChannel();
    }
    return orElse();
  }

  @override
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
    return counterpartyCoopClosedUnfundedChannel(this);
  }

  @override
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
    return counterpartyCoopClosedUnfundedChannel?.call(this);
  }

  @override
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
    if (counterpartyCoopClosedUnfundedChannel != null) {
      return counterpartyCoopClosedUnfundedChannel(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_CounterpartyCoopClosedUnfundedChannel
    extends ClosureReason {
  const factory ClosureReason_CounterpartyCoopClosedUnfundedChannel() =
      _$ClosureReason_CounterpartyCoopClosedUnfundedChannelImpl;
  const ClosureReason_CounterpartyCoopClosedUnfundedChannel._() : super._();
}

/// @nodoc
abstract class _$$ClosureReason_FundingBatchClosureImplCopyWith<$Res> {
  factory _$$ClosureReason_FundingBatchClosureImplCopyWith(
          _$ClosureReason_FundingBatchClosureImpl value,
          $Res Function(_$ClosureReason_FundingBatchClosureImpl) then) =
      __$$ClosureReason_FundingBatchClosureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosureReason_FundingBatchClosureImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res,
        _$ClosureReason_FundingBatchClosureImpl>
    implements _$$ClosureReason_FundingBatchClosureImplCopyWith<$Res> {
  __$$ClosureReason_FundingBatchClosureImplCopyWithImpl(
      _$ClosureReason_FundingBatchClosureImpl _value,
      $Res Function(_$ClosureReason_FundingBatchClosureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosureReason_FundingBatchClosureImpl
    extends ClosureReason_FundingBatchClosure {
  const _$ClosureReason_FundingBatchClosureImpl() : super._();

  @override
  String toString() {
    return 'ClosureReason.fundingBatchClosure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_FundingBatchClosureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return fundingBatchClosure();
  }

  @override
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
    return fundingBatchClosure?.call();
  }

  @override
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
    if (fundingBatchClosure != null) {
      return fundingBatchClosure();
    }
    return orElse();
  }

  @override
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
    return fundingBatchClosure(this);
  }

  @override
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
    return fundingBatchClosure?.call(this);
  }

  @override
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
    if (fundingBatchClosure != null) {
      return fundingBatchClosure(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_FundingBatchClosure extends ClosureReason {
  const factory ClosureReason_FundingBatchClosure() =
      _$ClosureReason_FundingBatchClosureImpl;
  const ClosureReason_FundingBatchClosure._() : super._();
}

/// @nodoc
abstract class _$$ClosureReason_HTLCsTimedOutImplCopyWith<$Res> {
  factory _$$ClosureReason_HTLCsTimedOutImplCopyWith(
          _$ClosureReason_HTLCsTimedOutImpl value,
          $Res Function(_$ClosureReason_HTLCsTimedOutImpl) then) =
      __$$ClosureReason_HTLCsTimedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosureReason_HTLCsTimedOutImplCopyWithImpl<$Res>
    extends _$ClosureReasonCopyWithImpl<$Res, _$ClosureReason_HTLCsTimedOutImpl>
    implements _$$ClosureReason_HTLCsTimedOutImplCopyWith<$Res> {
  __$$ClosureReason_HTLCsTimedOutImplCopyWithImpl(
      _$ClosureReason_HTLCsTimedOutImpl _value,
      $Res Function(_$ClosureReason_HTLCsTimedOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosureReason
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClosureReason_HTLCsTimedOutImpl extends ClosureReason_HTLCsTimedOut {
  const _$ClosureReason_HTLCsTimedOutImpl() : super._();

  @override
  String toString() {
    return 'ClosureReason.htlCsTimedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureReason_HTLCsTimedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return htlCsTimedOut();
  }

  @override
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
    return htlCsTimedOut?.call();
  }

  @override
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
    if (htlCsTimedOut != null) {
      return htlCsTimedOut();
    }
    return orElse();
  }

  @override
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
    return htlCsTimedOut(this);
  }

  @override
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
    return htlCsTimedOut?.call(this);
  }

  @override
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
    if (htlCsTimedOut != null) {
      return htlCsTimedOut(this);
    }
    return orElse();
  }
}

abstract class ClosureReason_HTLCsTimedOut extends ClosureReason {
  const factory ClosureReason_HTLCsTimedOut() =
      _$ClosureReason_HTLCsTimedOutImpl;
  const ClosureReason_HTLCsTimedOut._() : super._();
}

/// @nodoc
mixin _$EntropySourceConfig {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String field0) seedFile,
    required TResult Function(U8Array64 field0) seedBytes,
    required TResult Function(FfiMnemonic mnemonic, String? passphrase)
        bip39Mnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(U8Array64 field0)? seedBytes,
    TResult? Function(FfiMnemonic mnemonic, String? passphrase)? bip39Mnemonic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(U8Array64 field0)? seedBytes,
    TResult Function(FfiMnemonic mnemonic, String? passphrase)? bip39Mnemonic,
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
    required TResult Function(U8Array64 field0) seedBytes,
    required TResult Function(FfiMnemonic mnemonic, String? passphrase)
        bip39Mnemonic,
  }) {
    return seedFile(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(U8Array64 field0)? seedBytes,
    TResult? Function(FfiMnemonic mnemonic, String? passphrase)? bip39Mnemonic,
  }) {
    return seedFile?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(U8Array64 field0)? seedBytes,
    TResult Function(FfiMnemonic mnemonic, String? passphrase)? bip39Mnemonic,
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
  $Res call({U8Array64 field0});
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
              as U8Array64,
    ));
  }
}

/// @nodoc

class _$EntropySourceConfig_SeedBytesImpl
    extends EntropySourceConfig_SeedBytes {
  const _$EntropySourceConfig_SeedBytesImpl(this.field0) : super._();

  @override
  final U8Array64 field0;

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
    required TResult Function(U8Array64 field0) seedBytes,
    required TResult Function(FfiMnemonic mnemonic, String? passphrase)
        bip39Mnemonic,
  }) {
    return seedBytes(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(U8Array64 field0)? seedBytes,
    TResult? Function(FfiMnemonic mnemonic, String? passphrase)? bip39Mnemonic,
  }) {
    return seedBytes?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(U8Array64 field0)? seedBytes,
    TResult Function(FfiMnemonic mnemonic, String? passphrase)? bip39Mnemonic,
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
  const factory EntropySourceConfig_SeedBytes(final U8Array64 field0) =
      _$EntropySourceConfig_SeedBytesImpl;
  const EntropySourceConfig_SeedBytes._() : super._();

  U8Array64 get field0;

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
  $Res call({FfiMnemonic mnemonic, String? passphrase});
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
    Object? mnemonic = null,
    Object? passphrase = freezed,
  }) {
    return _then(_$EntropySourceConfig_Bip39MnemonicImpl(
      mnemonic: null == mnemonic
          ? _value.mnemonic
          : mnemonic // ignore: cast_nullable_to_non_nullable
              as FfiMnemonic,
      passphrase: freezed == passphrase
          ? _value.passphrase
          : passphrase // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EntropySourceConfig_Bip39MnemonicImpl
    extends EntropySourceConfig_Bip39Mnemonic {
  const _$EntropySourceConfig_Bip39MnemonicImpl(
      {required this.mnemonic, this.passphrase})
      : super._();

  @override
  final FfiMnemonic mnemonic;
  @override
  final String? passphrase;

  @override
  String toString() {
    return 'EntropySourceConfig.bip39Mnemonic(mnemonic: $mnemonic, passphrase: $passphrase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntropySourceConfig_Bip39MnemonicImpl &&
            (identical(other.mnemonic, mnemonic) ||
                other.mnemonic == mnemonic) &&
            (identical(other.passphrase, passphrase) ||
                other.passphrase == passphrase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mnemonic, passphrase);

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
    required TResult Function(U8Array64 field0) seedBytes,
    required TResult Function(FfiMnemonic mnemonic, String? passphrase)
        bip39Mnemonic,
  }) {
    return bip39Mnemonic(mnemonic, passphrase);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String field0)? seedFile,
    TResult? Function(U8Array64 field0)? seedBytes,
    TResult? Function(FfiMnemonic mnemonic, String? passphrase)? bip39Mnemonic,
  }) {
    return bip39Mnemonic?.call(mnemonic, passphrase);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String field0)? seedFile,
    TResult Function(U8Array64 field0)? seedBytes,
    TResult Function(FfiMnemonic mnemonic, String? passphrase)? bip39Mnemonic,
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
  const factory EntropySourceConfig_Bip39Mnemonic(
      {required final FfiMnemonic mnemonic,
      final String? passphrase}) = _$EntropySourceConfig_Bip39MnemonicImpl;
  const EntropySourceConfig_Bip39Mnemonic._() : super._();

  FfiMnemonic get mnemonic;
  String? get passphrase;

  /// Create a copy of EntropySourceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntropySourceConfig_Bip39MnemonicImplCopyWith<
          _$EntropySourceConfig_Bip39MnemonicImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Event {
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
            PublicKey? counterpartyNodeId)
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
  }) =>
      throw _privateConstructorUsedError;
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
            PublicKey? counterpartyNodeId)?
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
  }) =>
      throw _privateConstructorUsedError;
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
            PublicKey? counterpartyNodeId)?
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
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$Event_PaymentClaimableImplCopyWith<$Res> {
  factory _$$Event_PaymentClaimableImplCopyWith(
          _$Event_PaymentClaimableImpl value,
          $Res Function(_$Event_PaymentClaimableImpl) then) =
      __$$Event_PaymentClaimableImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PaymentId paymentId,
      PaymentHash paymentHash,
      BigInt claimableAmountMsat,
      int? claimDeadline,
      List<CustomTlvRecord> customRecords});
}

/// @nodoc
class __$$Event_PaymentClaimableImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_PaymentClaimableImpl>
    implements _$$Event_PaymentClaimableImplCopyWith<$Res> {
  __$$Event_PaymentClaimableImplCopyWithImpl(
      _$Event_PaymentClaimableImpl _value,
      $Res Function(_$Event_PaymentClaimableImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? paymentHash = null,
    Object? claimableAmountMsat = null,
    Object? claimDeadline = freezed,
    Object? customRecords = null,
  }) {
    return _then(_$Event_PaymentClaimableImpl(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId,
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      claimableAmountMsat: null == claimableAmountMsat
          ? _value.claimableAmountMsat
          : claimableAmountMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
      claimDeadline: freezed == claimDeadline
          ? _value.claimDeadline
          : claimDeadline // ignore: cast_nullable_to_non_nullable
              as int?,
      customRecords: null == customRecords
          ? _value._customRecords
          : customRecords // ignore: cast_nullable_to_non_nullable
              as List<CustomTlvRecord>,
    ));
  }
}

/// @nodoc

class _$Event_PaymentClaimableImpl extends Event_PaymentClaimable {
  const _$Event_PaymentClaimableImpl(
      {required this.paymentId,
      required this.paymentHash,
      required this.claimableAmountMsat,
      this.claimDeadline,
      required final List<CustomTlvRecord> customRecords})
      : _customRecords = customRecords,
        super._();

  /// A local identifier used to track the payment.
  @override
  final PaymentId paymentId;

  /// The hash of the payment.
  @override
  final PaymentHash paymentHash;

  /// The value, in thousandths of a satoshi, that is claimable.
  @override
  final BigInt claimableAmountMsat;

  /// The block height at which this payment will be failed back and will no longer be
  /// eligible for claiming.
  @override
  final int? claimDeadline;

  /// Custom TLV records attached to the payment
  final List<CustomTlvRecord> _customRecords;

  /// Custom TLV records attached to the payment
  @override
  List<CustomTlvRecord> get customRecords {
    if (_customRecords is EqualUnmodifiableListView) return _customRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customRecords);
  }

  @override
  String toString() {
    return 'Event.paymentClaimable(paymentId: $paymentId, paymentHash: $paymentHash, claimableAmountMsat: $claimableAmountMsat, claimDeadline: $claimDeadline, customRecords: $customRecords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_PaymentClaimableImpl &&
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

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_PaymentClaimableImplCopyWith<_$Event_PaymentClaimableImpl>
      get copyWith => __$$Event_PaymentClaimableImplCopyWithImpl<
          _$Event_PaymentClaimableImpl>(this, _$identity);

  @override
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
            PublicKey? counterpartyNodeId)
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
  }) {
    return paymentClaimable(paymentId, paymentHash, claimableAmountMsat,
        claimDeadline, customRecords);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
  }) {
    return paymentClaimable?.call(paymentId, paymentHash, claimableAmountMsat,
        claimDeadline, customRecords);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
    required TResult orElse(),
  }) {
    if (paymentClaimable != null) {
      return paymentClaimable(paymentId, paymentHash, claimableAmountMsat,
          claimDeadline, customRecords);
    }
    return orElse();
  }

  @override
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
  }) {
    return paymentClaimable(this);
  }

  @override
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
  }) {
    return paymentClaimable?.call(this);
  }

  @override
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
    required TResult orElse(),
  }) {
    if (paymentClaimable != null) {
      return paymentClaimable(this);
    }
    return orElse();
  }
}

abstract class Event_PaymentClaimable extends Event {
  const factory Event_PaymentClaimable(
          {required final PaymentId paymentId,
          required final PaymentHash paymentHash,
          required final BigInt claimableAmountMsat,
          final int? claimDeadline,
          required final List<CustomTlvRecord> customRecords}) =
      _$Event_PaymentClaimableImpl;
  const Event_PaymentClaimable._() : super._();

  /// A local identifier used to track the payment.
  PaymentId get paymentId;

  /// The hash of the payment.
  PaymentHash get paymentHash;

  /// The value, in thousandths of a satoshi, that is claimable.
  BigInt get claimableAmountMsat;

  /// The block height at which this payment will be failed back and will no longer be
  /// eligible for claiming.
  int? get claimDeadline;

  /// Custom TLV records attached to the payment
  List<CustomTlvRecord> get customRecords;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Event_PaymentClaimableImplCopyWith<_$Event_PaymentClaimableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_PaymentSuccessfulImplCopyWith<$Res> {
  factory _$$Event_PaymentSuccessfulImplCopyWith(
          _$Event_PaymentSuccessfulImpl value,
          $Res Function(_$Event_PaymentSuccessfulImpl) then) =
      __$$Event_PaymentSuccessfulImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PaymentId? paymentId,
      PaymentHash paymentHash,
      BigInt? feePaidMsat,
      PaymentPreimage? preimage});
}

/// @nodoc
class __$$Event_PaymentSuccessfulImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_PaymentSuccessfulImpl>
    implements _$$Event_PaymentSuccessfulImplCopyWith<$Res> {
  __$$Event_PaymentSuccessfulImplCopyWithImpl(
      _$Event_PaymentSuccessfulImpl _value,
      $Res Function(_$Event_PaymentSuccessfulImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = freezed,
    Object? paymentHash = null,
    Object? feePaidMsat = freezed,
    Object? preimage = freezed,
  }) {
    return _then(_$Event_PaymentSuccessfulImpl(
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId?,
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      feePaidMsat: freezed == feePaidMsat
          ? _value.feePaidMsat
          : feePaidMsat // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      preimage: freezed == preimage
          ? _value.preimage
          : preimage // ignore: cast_nullable_to_non_nullable
              as PaymentPreimage?,
    ));
  }
}

/// @nodoc

class _$Event_PaymentSuccessfulImpl extends Event_PaymentSuccessful {
  const _$Event_PaymentSuccessfulImpl(
      {this.paymentId,
      required this.paymentHash,
      this.feePaidMsat,
      this.preimage})
      : super._();

  /// A local identifier used to track the payment.
  ///
  /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
  @override
  final PaymentId? paymentId;

  /// The hash of the payment.
  @override
  final PaymentHash paymentHash;

  /// The total fee which was spent at intermediate hops in this payment.
  @override
  final BigInt? feePaidMsat;

  /// The preimage of the payment hash, which can be used to claim the payment.
  @override
  final PaymentPreimage? preimage;

  @override
  String toString() {
    return 'Event.paymentSuccessful(paymentId: $paymentId, paymentHash: $paymentHash, feePaidMsat: $feePaidMsat, preimage: $preimage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_PaymentSuccessfulImpl &&
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

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_PaymentSuccessfulImplCopyWith<_$Event_PaymentSuccessfulImpl>
      get copyWith => __$$Event_PaymentSuccessfulImplCopyWithImpl<
          _$Event_PaymentSuccessfulImpl>(this, _$identity);

  @override
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
            PublicKey? counterpartyNodeId)
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
  }) {
    return paymentSuccessful(paymentId, paymentHash, feePaidMsat, preimage);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
  }) {
    return paymentSuccessful?.call(
        paymentId, paymentHash, feePaidMsat, preimage);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
    required TResult orElse(),
  }) {
    if (paymentSuccessful != null) {
      return paymentSuccessful(paymentId, paymentHash, feePaidMsat, preimage);
    }
    return orElse();
  }

  @override
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
  }) {
    return paymentSuccessful(this);
  }

  @override
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
  }) {
    return paymentSuccessful?.call(this);
  }

  @override
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
    required TResult orElse(),
  }) {
    if (paymentSuccessful != null) {
      return paymentSuccessful(this);
    }
    return orElse();
  }
}

abstract class Event_PaymentSuccessful extends Event {
  const factory Event_PaymentSuccessful(
      {final PaymentId? paymentId,
      required final PaymentHash paymentHash,
      final BigInt? feePaidMsat,
      final PaymentPreimage? preimage}) = _$Event_PaymentSuccessfulImpl;
  const Event_PaymentSuccessful._() : super._();

  /// A local identifier used to track the payment.
  ///
  /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
  PaymentId? get paymentId;

  /// The hash of the payment.
  PaymentHash get paymentHash;

  /// The total fee which was spent at intermediate hops in this payment.
  BigInt? get feePaidMsat;

  /// The preimage of the payment hash, which can be used to claim the payment.
  PaymentPreimage? get preimage;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Event_PaymentSuccessfulImplCopyWith<_$Event_PaymentSuccessfulImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_PaymentFailedImplCopyWith<$Res> {
  factory _$$Event_PaymentFailedImplCopyWith(_$Event_PaymentFailedImpl value,
          $Res Function(_$Event_PaymentFailedImpl) then) =
      __$$Event_PaymentFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PaymentId? paymentId,
      PaymentHash? paymentHash,
      PaymentFailureReason? reason});
}

/// @nodoc
class __$$Event_PaymentFailedImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_PaymentFailedImpl>
    implements _$$Event_PaymentFailedImplCopyWith<$Res> {
  __$$Event_PaymentFailedImplCopyWithImpl(_$Event_PaymentFailedImpl _value,
      $Res Function(_$Event_PaymentFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = freezed,
    Object? paymentHash = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$Event_PaymentFailedImpl(
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId?,
      paymentHash: freezed == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as PaymentFailureReason?,
    ));
  }
}

/// @nodoc

class _$Event_PaymentFailedImpl extends Event_PaymentFailed {
  const _$Event_PaymentFailedImpl(
      {this.paymentId, this.paymentHash, this.reason})
      : super._();

  /// A local identifier used to track the payment.
  ///
  /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
  @override
  final PaymentId? paymentId;

  /// The hash of the payment.
  @override
  final PaymentHash? paymentHash;

  /// The reason why the payment failed.
  ///
  /// This will be `None` for events serialized by LDK Node v0.2.1 and prior.
  @override
  final PaymentFailureReason? reason;

  @override
  String toString() {
    return 'Event.paymentFailed(paymentId: $paymentId, paymentHash: $paymentHash, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_PaymentFailedImpl &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.paymentHash, paymentHash) ||
                other.paymentHash == paymentHash) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentId, paymentHash, reason);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_PaymentFailedImplCopyWith<_$Event_PaymentFailedImpl> get copyWith =>
      __$$Event_PaymentFailedImplCopyWithImpl<_$Event_PaymentFailedImpl>(
          this, _$identity);

  @override
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
            PublicKey? counterpartyNodeId)
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
  }) {
    return paymentFailed(paymentId, paymentHash, reason);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
  }) {
    return paymentFailed?.call(paymentId, paymentHash, reason);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
    required TResult orElse(),
  }) {
    if (paymentFailed != null) {
      return paymentFailed(paymentId, paymentHash, reason);
    }
    return orElse();
  }

  @override
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
  }) {
    return paymentFailed(this);
  }

  @override
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
  }) {
    return paymentFailed?.call(this);
  }

  @override
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
    required TResult orElse(),
  }) {
    if (paymentFailed != null) {
      return paymentFailed(this);
    }
    return orElse();
  }
}

abstract class Event_PaymentFailed extends Event {
  const factory Event_PaymentFailed(
      {final PaymentId? paymentId,
      final PaymentHash? paymentHash,
      final PaymentFailureReason? reason}) = _$Event_PaymentFailedImpl;
  const Event_PaymentFailed._() : super._();

  /// A local identifier used to track the payment.
  ///
  /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
  PaymentId? get paymentId;

  /// The hash of the payment.
  PaymentHash? get paymentHash;

  /// The reason why the payment failed.
  ///
  /// This will be `None` for events serialized by LDK Node v0.2.1 and prior.
  PaymentFailureReason? get reason;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Event_PaymentFailedImplCopyWith<_$Event_PaymentFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_PaymentReceivedImplCopyWith<$Res> {
  factory _$$Event_PaymentReceivedImplCopyWith(
          _$Event_PaymentReceivedImpl value,
          $Res Function(_$Event_PaymentReceivedImpl) then) =
      __$$Event_PaymentReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PaymentId? paymentId,
      PaymentHash paymentHash,
      BigInt amountMsat,
      List<CustomTlvRecord> customRecords});
}

/// @nodoc
class __$$Event_PaymentReceivedImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_PaymentReceivedImpl>
    implements _$$Event_PaymentReceivedImplCopyWith<$Res> {
  __$$Event_PaymentReceivedImplCopyWithImpl(_$Event_PaymentReceivedImpl _value,
      $Res Function(_$Event_PaymentReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = freezed,
    Object? paymentHash = null,
    Object? amountMsat = null,
    Object? customRecords = null,
  }) {
    return _then(_$Event_PaymentReceivedImpl(
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as PaymentId?,
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      amountMsat: null == amountMsat
          ? _value.amountMsat
          : amountMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
      customRecords: null == customRecords
          ? _value._customRecords
          : customRecords // ignore: cast_nullable_to_non_nullable
              as List<CustomTlvRecord>,
    ));
  }
}

/// @nodoc

class _$Event_PaymentReceivedImpl extends Event_PaymentReceived {
  const _$Event_PaymentReceivedImpl(
      {this.paymentId,
      required this.paymentHash,
      required this.amountMsat,
      required final List<CustomTlvRecord> customRecords})
      : _customRecords = customRecords,
        super._();

  /// A local identifier used to track the payment.
  ///
  /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
  @override
  final PaymentId? paymentId;

  /// The hash of the payment.
  @override
  final PaymentHash paymentHash;

  /// The value, in thousandths of a satoshi, that has been received.
  @override
  final BigInt amountMsat;

  /// Custom TLV records received on the payment
  final List<CustomTlvRecord> _customRecords;

  /// Custom TLV records received on the payment
  @override
  List<CustomTlvRecord> get customRecords {
    if (_customRecords is EqualUnmodifiableListView) return _customRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customRecords);
  }

  @override
  String toString() {
    return 'Event.paymentReceived(paymentId: $paymentId, paymentHash: $paymentHash, amountMsat: $amountMsat, customRecords: $customRecords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_PaymentReceivedImpl &&
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

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_PaymentReceivedImplCopyWith<_$Event_PaymentReceivedImpl>
      get copyWith => __$$Event_PaymentReceivedImplCopyWithImpl<
          _$Event_PaymentReceivedImpl>(this, _$identity);

  @override
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
            PublicKey? counterpartyNodeId)
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
  }) {
    return paymentReceived(paymentId, paymentHash, amountMsat, customRecords);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
  }) {
    return paymentReceived?.call(
        paymentId, paymentHash, amountMsat, customRecords);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
    required TResult orElse(),
  }) {
    if (paymentReceived != null) {
      return paymentReceived(paymentId, paymentHash, amountMsat, customRecords);
    }
    return orElse();
  }

  @override
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
  }) {
    return paymentReceived(this);
  }

  @override
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
  }) {
    return paymentReceived?.call(this);
  }

  @override
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
    required TResult orElse(),
  }) {
    if (paymentReceived != null) {
      return paymentReceived(this);
    }
    return orElse();
  }
}

abstract class Event_PaymentReceived extends Event {
  const factory Event_PaymentReceived(
          {final PaymentId? paymentId,
          required final PaymentHash paymentHash,
          required final BigInt amountMsat,
          required final List<CustomTlvRecord> customRecords}) =
      _$Event_PaymentReceivedImpl;
  const Event_PaymentReceived._() : super._();

  /// A local identifier used to track the payment.
  ///
  /// Will only be `None` for events serialized with LDK Node v0.2.1 or prior.
  PaymentId? get paymentId;

  /// The hash of the payment.
  PaymentHash get paymentHash;

  /// The value, in thousandths of a satoshi, that has been received.
  BigInt get amountMsat;

  /// Custom TLV records received on the payment
  List<CustomTlvRecord> get customRecords;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Event_PaymentReceivedImplCopyWith<_$Event_PaymentReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_ChannelPendingImplCopyWith<$Res> {
  factory _$$Event_ChannelPendingImplCopyWith(_$Event_ChannelPendingImpl value,
          $Res Function(_$Event_ChannelPendingImpl) then) =
      __$$Event_ChannelPendingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ChannelId channelId,
      UserChannelId userChannelId,
      ChannelId formerTemporaryChannelId,
      PublicKey counterpartyNodeId,
      OutPoint fundingTxo});
}

/// @nodoc
class __$$Event_ChannelPendingImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_ChannelPendingImpl>
    implements _$$Event_ChannelPendingImplCopyWith<$Res> {
  __$$Event_ChannelPendingImplCopyWithImpl(_$Event_ChannelPendingImpl _value,
      $Res Function(_$Event_ChannelPendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
    Object? formerTemporaryChannelId = null,
    Object? counterpartyNodeId = null,
    Object? fundingTxo = null,
  }) {
    return _then(_$Event_ChannelPendingImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      userChannelId: null == userChannelId
          ? _value.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId,
      formerTemporaryChannelId: null == formerTemporaryChannelId
          ? _value.formerTemporaryChannelId
          : formerTemporaryChannelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
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

class _$Event_ChannelPendingImpl extends Event_ChannelPending {
  const _$Event_ChannelPendingImpl(
      {required this.channelId,
      required this.userChannelId,
      required this.formerTemporaryChannelId,
      required this.counterpartyNodeId,
      required this.fundingTxo})
      : super._();

  /// The `channelId` of the channel.
  @override
  final ChannelId channelId;

  /// The `userChannelId` of the channel.
  @override
  final UserChannelId userChannelId;

  /// The `temporaryChannelId` this channel used to be known by during channel establishment.
  @override
  final ChannelId formerTemporaryChannelId;

  /// The `nodeId` of the channel counterparty.
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_ChannelPendingImpl &&
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

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_ChannelPendingImplCopyWith<_$Event_ChannelPendingImpl>
      get copyWith =>
          __$$Event_ChannelPendingImplCopyWithImpl<_$Event_ChannelPendingImpl>(
              this, _$identity);

  @override
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
            PublicKey? counterpartyNodeId)
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
  }) {
    return channelPending(channelId, userChannelId, formerTemporaryChannelId,
        counterpartyNodeId, fundingTxo);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
  }) {
    return channelPending?.call(channelId, userChannelId,
        formerTemporaryChannelId, counterpartyNodeId, fundingTxo);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
    required TResult Function(Event_PaymentClaimable value) paymentClaimable,
    required TResult Function(Event_PaymentSuccessful value) paymentSuccessful,
    required TResult Function(Event_PaymentFailed value) paymentFailed,
    required TResult Function(Event_PaymentReceived value) paymentReceived,
    required TResult Function(Event_ChannelPending value) channelPending,
    required TResult Function(Event_ChannelReady value) channelReady,
    required TResult Function(Event_ChannelClosed value) channelClosed,
    required TResult Function(Event_PaymentForwarded value) paymentForwarded,
  }) {
    return channelPending(this);
  }

  @override
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
  }) {
    return channelPending?.call(this);
  }

  @override
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
    required TResult orElse(),
  }) {
    if (channelPending != null) {
      return channelPending(this);
    }
    return orElse();
  }
}

abstract class Event_ChannelPending extends Event {
  const factory Event_ChannelPending(
      {required final ChannelId channelId,
      required final UserChannelId userChannelId,
      required final ChannelId formerTemporaryChannelId,
      required final PublicKey counterpartyNodeId,
      required final OutPoint fundingTxo}) = _$Event_ChannelPendingImpl;
  const Event_ChannelPending._() : super._();

  /// The `channelId` of the channel.
  ChannelId get channelId;

  /// The `userChannelId` of the channel.
  UserChannelId get userChannelId;

  /// The `temporaryChannelId` this channel used to be known by during channel establishment.
  ChannelId get formerTemporaryChannelId;

  /// The `nodeId` of the channel counterparty.
  PublicKey get counterpartyNodeId;

  /// The outpoint of the channel's funding transaction.
  OutPoint get fundingTxo;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Event_ChannelPendingImplCopyWith<_$Event_ChannelPendingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_ChannelReadyImplCopyWith<$Res> {
  factory _$$Event_ChannelReadyImplCopyWith(_$Event_ChannelReadyImpl value,
          $Res Function(_$Event_ChannelReadyImpl) then) =
      __$$Event_ChannelReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ChannelId channelId,
      UserChannelId userChannelId,
      PublicKey? counterpartyNodeId});
}

/// @nodoc
class __$$Event_ChannelReadyImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_ChannelReadyImpl>
    implements _$$Event_ChannelReadyImplCopyWith<$Res> {
  __$$Event_ChannelReadyImplCopyWithImpl(_$Event_ChannelReadyImpl _value,
      $Res Function(_$Event_ChannelReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
    Object? counterpartyNodeId = freezed,
  }) {
    return _then(_$Event_ChannelReadyImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      userChannelId: null == userChannelId
          ? _value.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId,
      counterpartyNodeId: freezed == counterpartyNodeId
          ? _value.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey?,
    ));
  }
}

/// @nodoc

class _$Event_ChannelReadyImpl extends Event_ChannelReady {
  const _$Event_ChannelReadyImpl(
      {required this.channelId,
      required this.userChannelId,
      this.counterpartyNodeId})
      : super._();

  /// The `channelId` of the channel.
  @override
  final ChannelId channelId;

  /// The `userChannelId` of the channel.
  @override
  final UserChannelId userChannelId;

  /// The `nodeId` of the channel counterparty.
  ///
  /// This will be `None` for events serialized by LDK Node v0.1.0 and prior.
  @override
  final PublicKey? counterpartyNodeId;

  @override
  String toString() {
    return 'Event.channelReady(channelId: $channelId, userChannelId: $userChannelId, counterpartyNodeId: $counterpartyNodeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_ChannelReadyImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.userChannelId, userChannelId) ||
                other.userChannelId == userChannelId) &&
            (identical(other.counterpartyNodeId, counterpartyNodeId) ||
                other.counterpartyNodeId == counterpartyNodeId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, channelId, userChannelId, counterpartyNodeId);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_ChannelReadyImplCopyWith<_$Event_ChannelReadyImpl> get copyWith =>
      __$$Event_ChannelReadyImplCopyWithImpl<_$Event_ChannelReadyImpl>(
          this, _$identity);

  @override
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
            PublicKey? counterpartyNodeId)
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
  }) {
    return channelReady(channelId, userChannelId, counterpartyNodeId);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
  }) {
    return channelReady?.call(channelId, userChannelId, counterpartyNodeId);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
    required TResult orElse(),
  }) {
    if (channelReady != null) {
      return channelReady(channelId, userChannelId, counterpartyNodeId);
    }
    return orElse();
  }

  @override
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
  }) {
    return channelReady(this);
  }

  @override
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
  }) {
    return channelReady?.call(this);
  }

  @override
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
    required TResult orElse(),
  }) {
    if (channelReady != null) {
      return channelReady(this);
    }
    return orElse();
  }
}

abstract class Event_ChannelReady extends Event {
  const factory Event_ChannelReady(
      {required final ChannelId channelId,
      required final UserChannelId userChannelId,
      final PublicKey? counterpartyNodeId}) = _$Event_ChannelReadyImpl;
  const Event_ChannelReady._() : super._();

  /// The `channelId` of the channel.
  ChannelId get channelId;

  /// The `userChannelId` of the channel.
  UserChannelId get userChannelId;

  /// The `nodeId` of the channel counterparty.
  ///
  /// This will be `None` for events serialized by LDK Node v0.1.0 and prior.
  PublicKey? get counterpartyNodeId;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Event_ChannelReadyImplCopyWith<_$Event_ChannelReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_ChannelClosedImplCopyWith<$Res> {
  factory _$$Event_ChannelClosedImplCopyWith(_$Event_ChannelClosedImpl value,
          $Res Function(_$Event_ChannelClosedImpl) then) =
      __$$Event_ChannelClosedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ChannelId channelId,
      UserChannelId userChannelId,
      PublicKey? counterpartyNodeId,
      ClosureReason? reason});

  $ClosureReasonCopyWith<$Res>? get reason;
}

/// @nodoc
class __$$Event_ChannelClosedImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_ChannelClosedImpl>
    implements _$$Event_ChannelClosedImplCopyWith<$Res> {
  __$$Event_ChannelClosedImplCopyWithImpl(_$Event_ChannelClosedImpl _value,
      $Res Function(_$Event_ChannelClosedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? userChannelId = null,
    Object? counterpartyNodeId = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$Event_ChannelClosedImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      userChannelId: null == userChannelId
          ? _value.userChannelId
          : userChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId,
      counterpartyNodeId: freezed == counterpartyNodeId
          ? _value.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as ClosureReason?,
    ));
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClosureReasonCopyWith<$Res>? get reason {
    if (_value.reason == null) {
      return null;
    }

    return $ClosureReasonCopyWith<$Res>(_value.reason!, (value) {
      return _then(_value.copyWith(reason: value));
    });
  }
}

/// @nodoc

class _$Event_ChannelClosedImpl extends Event_ChannelClosed {
  const _$Event_ChannelClosedImpl(
      {required this.channelId,
      required this.userChannelId,
      this.counterpartyNodeId,
      this.reason})
      : super._();

  /// The `channelId` of the channel.
  @override
  final ChannelId channelId;

  /// The `userChannelId` of the channel.
  @override
  final UserChannelId userChannelId;

  /// The `nodeId` of the channel counterparty.
  ///
  /// This will be `None` for events serialized by LDK Node v0.1.0 and prior.
  @override
  final PublicKey? counterpartyNodeId;

  /// This will be `None` for events serialized by LDK Node v0.2.1 and prior.
  @override
  final ClosureReason? reason;

  @override
  String toString() {
    return 'Event.channelClosed(channelId: $channelId, userChannelId: $userChannelId, counterpartyNodeId: $counterpartyNodeId, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_ChannelClosedImpl &&
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

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_ChannelClosedImplCopyWith<_$Event_ChannelClosedImpl> get copyWith =>
      __$$Event_ChannelClosedImplCopyWithImpl<_$Event_ChannelClosedImpl>(
          this, _$identity);

  @override
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
            PublicKey? counterpartyNodeId)
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
  }) {
    return channelClosed(channelId, userChannelId, counterpartyNodeId, reason);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
  }) {
    return channelClosed?.call(
        channelId, userChannelId, counterpartyNodeId, reason);
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
    required TResult orElse(),
  }) {
    if (channelClosed != null) {
      return channelClosed(
          channelId, userChannelId, counterpartyNodeId, reason);
    }
    return orElse();
  }

  @override
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
  }) {
    return channelClosed(this);
  }

  @override
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
  }) {
    return channelClosed?.call(this);
  }

  @override
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
    required TResult orElse(),
  }) {
    if (channelClosed != null) {
      return channelClosed(this);
    }
    return orElse();
  }
}

abstract class Event_ChannelClosed extends Event {
  const factory Event_ChannelClosed(
      {required final ChannelId channelId,
      required final UserChannelId userChannelId,
      final PublicKey? counterpartyNodeId,
      final ClosureReason? reason}) = _$Event_ChannelClosedImpl;
  const Event_ChannelClosed._() : super._();

  /// The `channelId` of the channel.
  ChannelId get channelId;

  /// The `userChannelId` of the channel.
  UserChannelId get userChannelId;

  /// The `nodeId` of the channel counterparty.
  ///
  /// This will be `None` for events serialized by LDK Node v0.1.0 and prior.
  PublicKey? get counterpartyNodeId;

  /// This will be `None` for events serialized by LDK Node v0.2.1 and prior.
  ClosureReason? get reason;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Event_ChannelClosedImplCopyWith<_$Event_ChannelClosedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Event_PaymentForwardedImplCopyWith<$Res> {
  factory _$$Event_PaymentForwardedImplCopyWith(
          _$Event_PaymentForwardedImpl value,
          $Res Function(_$Event_PaymentForwardedImpl) then) =
      __$$Event_PaymentForwardedImplCopyWithImpl<$Res>;
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
class __$$Event_PaymentForwardedImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$Event_PaymentForwardedImpl>
    implements _$$Event_PaymentForwardedImplCopyWith<$Res> {
  __$$Event_PaymentForwardedImplCopyWithImpl(
      _$Event_PaymentForwardedImpl _value,
      $Res Function(_$Event_PaymentForwardedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
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
    return _then(_$Event_PaymentForwardedImpl(
      prevChannelId: null == prevChannelId
          ? _value.prevChannelId
          : prevChannelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      nextChannelId: null == nextChannelId
          ? _value.nextChannelId
          : nextChannelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      prevUserChannelId: freezed == prevUserChannelId
          ? _value.prevUserChannelId
          : prevUserChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId?,
      nextUserChannelId: freezed == nextUserChannelId
          ? _value.nextUserChannelId
          : nextUserChannelId // ignore: cast_nullable_to_non_nullable
              as UserChannelId?,
      prevNodeId: freezed == prevNodeId
          ? _value.prevNodeId
          : prevNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey?,
      nextNodeId: freezed == nextNodeId
          ? _value.nextNodeId
          : nextNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey?,
      totalFeeEarnedMsat: freezed == totalFeeEarnedMsat
          ? _value.totalFeeEarnedMsat
          : totalFeeEarnedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      skimmedFeeMsat: freezed == skimmedFeeMsat
          ? _value.skimmedFeeMsat
          : skimmedFeeMsat // ignore: cast_nullable_to_non_nullable
              as BigInt?,
      claimFromOnchainTx: null == claimFromOnchainTx
          ? _value.claimFromOnchainTx
          : claimFromOnchainTx // ignore: cast_nullable_to_non_nullable
              as bool,
      outboundAmountForwardedMsat: freezed == outboundAmountForwardedMsat
          ? _value.outboundAmountForwardedMsat
          : outboundAmountForwardedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt?,
    ));
  }
}

/// @nodoc

class _$Event_PaymentForwardedImpl extends Event_PaymentForwarded {
  const _$Event_PaymentForwardedImpl(
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
  @override
  final ChannelId prevChannelId;

  /// The channel id of the outgoing channel between the next node and us.
  @override
  final ChannelId nextChannelId;

  /// The `user_channel_id` of the incoming channel between the previous node and us.
  @override
  final UserChannelId? prevUserChannelId;

  /// The `user_channel_id` of the outgoing channel between the next node and us.
  @override
  final UserChannelId? nextUserChannelId;

  /// The node id of the previous node.
  ///
  /// This is only null for HTLCs received prior to LDK Node v0.5 or for events serialized by
  /// versions prior to v0.5.
  @override
  final PublicKey? prevNodeId;

  /// The node id of the next node.
  ///
  /// This is only null for HTLCs received prior to LDK Node v0.5 or for events serialized by
  /// versions prior to v0.5.
  @override
  final PublicKey? nextNodeId;

  /// The total fee, in milli-satoshis, which was earned as a result of the payment.
  @override
  final BigInt? totalFeeEarnedMsat;

  /// The share of the total fee, in milli-satoshis, which was withheld in addition to the
  /// forwarding fee.
  @override
  final BigInt? skimmedFeeMsat;

  /// If this is `true`, the forwarded HTLC was claimed by our counterparty via an on-chain
  /// transaction.
  @override
  final bool claimFromOnchainTx;

  /// The final amount forwarded, in milli-satoshis, after the fee is deducted.
  @override
  final BigInt? outboundAmountForwardedMsat;

  @override
  String toString() {
    return 'Event.paymentForwarded(prevChannelId: $prevChannelId, nextChannelId: $nextChannelId, prevUserChannelId: $prevUserChannelId, nextUserChannelId: $nextUserChannelId, prevNodeId: $prevNodeId, nextNodeId: $nextNodeId, totalFeeEarnedMsat: $totalFeeEarnedMsat, skimmedFeeMsat: $skimmedFeeMsat, claimFromOnchainTx: $claimFromOnchainTx, outboundAmountForwardedMsat: $outboundAmountForwardedMsat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Event_PaymentForwardedImpl &&
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

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Event_PaymentForwardedImplCopyWith<_$Event_PaymentForwardedImpl>
      get copyWith => __$$Event_PaymentForwardedImplCopyWithImpl<
          _$Event_PaymentForwardedImpl>(this, _$identity);

  @override
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
            PublicKey? counterpartyNodeId)
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
  }) {
    return paymentForwarded(
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
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
  }) {
    return paymentForwarded?.call(
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
  }

  @override
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
            PublicKey? counterpartyNodeId)?
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
    required TResult orElse(),
  }) {
    if (paymentForwarded != null) {
      return paymentForwarded(
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
    }
    return orElse();
  }

  @override
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
  }) {
    return paymentForwarded(this);
  }

  @override
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
  }) {
    return paymentForwarded?.call(this);
  }

  @override
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
    required TResult orElse(),
  }) {
    if (paymentForwarded != null) {
      return paymentForwarded(this);
    }
    return orElse();
  }
}

abstract class Event_PaymentForwarded extends Event {
  const factory Event_PaymentForwarded(
          {required final ChannelId prevChannelId,
          required final ChannelId nextChannelId,
          final UserChannelId? prevUserChannelId,
          final UserChannelId? nextUserChannelId,
          final PublicKey? prevNodeId,
          final PublicKey? nextNodeId,
          final BigInt? totalFeeEarnedMsat,
          final BigInt? skimmedFeeMsat,
          required final bool claimFromOnchainTx,
          final BigInt? outboundAmountForwardedMsat}) =
      _$Event_PaymentForwardedImpl;
  const Event_PaymentForwarded._() : super._();

  /// The channel id of the incoming channel between the previous node and us.
  ChannelId get prevChannelId;

  /// The channel id of the outgoing channel between the next node and us.
  ChannelId get nextChannelId;

  /// The `user_channel_id` of the incoming channel between the previous node and us.
  UserChannelId? get prevUserChannelId;

  /// The `user_channel_id` of the outgoing channel between the next node and us.
  UserChannelId? get nextUserChannelId;

  /// The node id of the previous node.
  ///
  /// This is only null for HTLCs received prior to LDK Node v0.5 or for events serialized by
  /// versions prior to v0.5.
  PublicKey? get prevNodeId;

  /// The node id of the next node.
  ///
  /// This is only null for HTLCs received prior to LDK Node v0.5 or for events serialized by
  /// versions prior to v0.5.
  PublicKey? get nextNodeId;

  /// The total fee, in milli-satoshis, which was earned as a result of the payment.
  BigInt? get totalFeeEarnedMsat;

  /// The share of the total fee, in milli-satoshis, which was withheld in addition to the
  /// forwarding fee.
  BigInt? get skimmedFeeMsat;

  /// If this is `true`, the forwarded HTLC was claimed by our counterparty via an on-chain
  /// transaction.
  bool get claimFromOnchainTx;

  /// The final amount forwarded, in milli-satoshis, after the fee is deducted.
  BigInt? get outboundAmountForwardedMsat;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Event_PaymentForwardedImplCopyWith<_$Event_PaymentForwardedImpl>
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

/// @nodoc
mixin _$LightningBalance {
  /// The identifier of the channel this balance belongs to.
  ChannelId get channelId => throw _privateConstructorUsedError;

  /// The identifier of our channel counterparty.
  PublicKey get counterpartyNodeId => throw _privateConstructorUsedError;

  /// The amount available to claim, in satoshis, excluding the on-chain fees which will be
  /// required to do so.
  BigInt get amountSatoshis => throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightningBalanceCopyWith<LightningBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightningBalanceCopyWith<$Res> {
  factory $LightningBalanceCopyWith(
          LightningBalance value, $Res Function(LightningBalance) then) =
      _$LightningBalanceCopyWithImpl<$Res, LightningBalance>;
  @useResult
  $Res call(
      {ChannelId channelId,
      PublicKey counterpartyNodeId,
      BigInt amountSatoshis});
}

/// @nodoc
class _$LightningBalanceCopyWithImpl<$Res, $Val extends LightningBalance>
    implements $LightningBalanceCopyWith<$Res> {
  _$LightningBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _value.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LightningBalance_ClaimableOnChannelCloseImplCopyWith<$Res>
    implements $LightningBalanceCopyWith<$Res> {
  factory _$$LightningBalance_ClaimableOnChannelCloseImplCopyWith(
          _$LightningBalance_ClaimableOnChannelCloseImpl value,
          $Res Function(_$LightningBalance_ClaimableOnChannelCloseImpl) then) =
      __$$LightningBalance_ClaimableOnChannelCloseImplCopyWithImpl<$Res>;
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
class __$$LightningBalance_ClaimableOnChannelCloseImplCopyWithImpl<$Res>
    extends _$LightningBalanceCopyWithImpl<$Res,
        _$LightningBalance_ClaimableOnChannelCloseImpl>
    implements _$$LightningBalance_ClaimableOnChannelCloseImplCopyWith<$Res> {
  __$$LightningBalance_ClaimableOnChannelCloseImplCopyWithImpl(
      _$LightningBalance_ClaimableOnChannelCloseImpl _value,
      $Res Function(_$LightningBalance_ClaimableOnChannelCloseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
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
    return _then(_$LightningBalance_ClaimableOnChannelCloseImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _value.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      transactionFeeSatoshis: null == transactionFeeSatoshis
          ? _value.transactionFeeSatoshis
          : transactionFeeSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      outboundPaymentHtlcRoundedMsat: null == outboundPaymentHtlcRoundedMsat
          ? _value.outboundPaymentHtlcRoundedMsat
          : outboundPaymentHtlcRoundedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
      outboundForwardedHtlcRoundedMsat: null == outboundForwardedHtlcRoundedMsat
          ? _value.outboundForwardedHtlcRoundedMsat
          : outboundForwardedHtlcRoundedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
      inboundClaimingHtlcRoundedMsat: null == inboundClaimingHtlcRoundedMsat
          ? _value.inboundClaimingHtlcRoundedMsat
          : inboundClaimingHtlcRoundedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
      inboundHtlcRoundedMsat: null == inboundHtlcRoundedMsat
          ? _value.inboundHtlcRoundedMsat
          : inboundHtlcRoundedMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$LightningBalance_ClaimableOnChannelCloseImpl
    extends LightningBalance_ClaimableOnChannelClose {
  const _$LightningBalance_ClaimableOnChannelCloseImpl(
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
  @override
  final BigInt transactionFeeSatoshis;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are outbound
  /// from us and are related to a payment which was sent by us. This is the sum of the
  /// millisatoshis part of all HTLCs which are otherwise represented by
  /// This amount (rounded up to a whole satoshi value) will not be included in `amountSatoshis`.
  @override
  final BigInt outboundPaymentHtlcRoundedMsat;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are outbound
  /// from us and are related to a forwarded HTLC. This is the sum of the millisatoshis part
  /// of all HTLCs which are otherwise represented by
  /// This amount (rounded up to a whole satoshi value) will not be included in `amountSatoshis`.
  @override
  final BigInt outboundForwardedHtlcRoundedMsat;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are inbound
  /// to us and for which we know the preimage. This is the sum of the millisatoshis part of
  /// all HTLCs which would be represented by `lightningBalance.ContentiousClaimable` on
  /// channel close, but whose current value is included in `amountSatoshis`, as well as any
  /// dust HTLCs which would otherwise be represented the same.
  ///
  /// This amount (rounded up to a whole satoshi value) will not be included in `amountSatoshis`.
  @override
  final BigInt inboundClaimingHtlcRoundedMsat;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are inbound
  /// to us and for which we do not know the preimage. This is the sum of the millisatoshis
  /// part of all HTLCs which would be represented by
  /// `lightningBalance.MaybePreimageClaimableHTLC` on channel close, as well as any dust
  /// HTLCs which would otherwise be represented the same.
  ///
  /// This amount (rounded up to a whole satoshi value) will not be included in the
  /// counterparty's `amountSatoshis`.
  @override
  final BigInt inboundHtlcRoundedMsat;

  @override
  String toString() {
    return 'LightningBalance.claimableOnChannelClose(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis, transactionFeeSatoshis: $transactionFeeSatoshis, outboundPaymentHtlcRoundedMsat: $outboundPaymentHtlcRoundedMsat, outboundForwardedHtlcRoundedMsat: $outboundForwardedHtlcRoundedMsat, inboundClaimingHtlcRoundedMsat: $inboundClaimingHtlcRoundedMsat, inboundHtlcRoundedMsat: $inboundHtlcRoundedMsat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightningBalance_ClaimableOnChannelCloseImpl &&
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

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightningBalance_ClaimableOnChannelCloseImplCopyWith<
          _$LightningBalance_ClaimableOnChannelCloseImpl>
      get copyWith =>
          __$$LightningBalance_ClaimableOnChannelCloseImplCopyWithImpl<
              _$LightningBalance_ClaimableOnChannelCloseImpl>(this, _$identity);

  @override
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
    return claimableOnChannelClose(
        channelId,
        counterpartyNodeId,
        amountSatoshis,
        transactionFeeSatoshis,
        outboundPaymentHtlcRoundedMsat,
        outboundForwardedHtlcRoundedMsat,
        inboundClaimingHtlcRoundedMsat,
        inboundHtlcRoundedMsat);
  }

  @override
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
    return claimableOnChannelClose?.call(
        channelId,
        counterpartyNodeId,
        amountSatoshis,
        transactionFeeSatoshis,
        outboundPaymentHtlcRoundedMsat,
        outboundForwardedHtlcRoundedMsat,
        inboundClaimingHtlcRoundedMsat,
        inboundHtlcRoundedMsat);
  }

  @override
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
    if (claimableOnChannelClose != null) {
      return claimableOnChannelClose(
          channelId,
          counterpartyNodeId,
          amountSatoshis,
          transactionFeeSatoshis,
          outboundPaymentHtlcRoundedMsat,
          outboundForwardedHtlcRoundedMsat,
          inboundClaimingHtlcRoundedMsat,
          inboundHtlcRoundedMsat);
    }
    return orElse();
  }

  @override
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
    return claimableOnChannelClose(this);
  }

  @override
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
    return claimableOnChannelClose?.call(this);
  }

  @override
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
    if (claimableOnChannelClose != null) {
      return claimableOnChannelClose(this);
    }
    return orElse();
  }
}

abstract class LightningBalance_ClaimableOnChannelClose
    extends LightningBalance {
  const factory LightningBalance_ClaimableOnChannelClose(
          {required final ChannelId channelId,
          required final PublicKey counterpartyNodeId,
          required final BigInt amountSatoshis,
          required final BigInt transactionFeeSatoshis,
          required final BigInt outboundPaymentHtlcRoundedMsat,
          required final BigInt outboundForwardedHtlcRoundedMsat,
          required final BigInt inboundClaimingHtlcRoundedMsat,
          required final BigInt inboundHtlcRoundedMsat}) =
      _$LightningBalance_ClaimableOnChannelCloseImpl;
  const LightningBalance_ClaimableOnChannelClose._() : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  ChannelId get channelId;

  /// The identifier of our channel counterparty.
  @override
  PublicKey get counterpartyNodeId;

  /// The amount available to claim, in satoshis, excluding the on-chain fees which will be
  /// required to do so.
  @override
  BigInt get amountSatoshis;

  /// The transaction fee we pay for the closing commitment transaction. This amount is not
  /// included in the `amount_satoshis` value.
  ///
  /// Note that if this channel is inbound (and thus our counterparty pays the commitment
  /// transaction fee) this value will be zero. For channels created prior to LDK Node 0.4
  /// the channel is always treated as outbound (and thus this value is never zero).
  BigInt get transactionFeeSatoshis;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are outbound
  /// from us and are related to a payment which was sent by us. This is the sum of the
  /// millisatoshis part of all HTLCs which are otherwise represented by
  /// This amount (rounded up to a whole satoshi value) will not be included in `amountSatoshis`.
  BigInt get outboundPaymentHtlcRoundedMsat;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are outbound
  /// from us and are related to a forwarded HTLC. This is the sum of the millisatoshis part
  /// of all HTLCs which are otherwise represented by
  /// This amount (rounded up to a whole satoshi value) will not be included in `amountSatoshis`.
  BigInt get outboundForwardedHtlcRoundedMsat;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are inbound
  /// to us and for which we know the preimage. This is the sum of the millisatoshis part of
  /// all HTLCs which would be represented by `lightningBalance.ContentiousClaimable` on
  /// channel close, but whose current value is included in `amountSatoshis`, as well as any
  /// dust HTLCs which would otherwise be represented the same.
  ///
  /// This amount (rounded up to a whole satoshi value) will not be included in `amountSatoshis`.
  BigInt get inboundClaimingHtlcRoundedMsat;

  /// The amount of millisatoshis which has been burned to fees from HTLCs which are inbound
  /// to us and for which we do not know the preimage. This is the sum of the millisatoshis
  /// part of all HTLCs which would be represented by
  /// `lightningBalance.MaybePreimageClaimableHTLC` on channel close, as well as any dust
  /// HTLCs which would otherwise be represented the same.
  ///
  /// This amount (rounded up to a whole satoshi value) will not be included in the
  /// counterparty's `amountSatoshis`.
  BigInt get inboundHtlcRoundedMsat;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightningBalance_ClaimableOnChannelCloseImplCopyWith<
          _$LightningBalance_ClaimableOnChannelCloseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LightningBalance_ClaimableAwaitingConfirmationsImplCopyWith<
    $Res> implements $LightningBalanceCopyWith<$Res> {
  factory _$$LightningBalance_ClaimableAwaitingConfirmationsImplCopyWith(
          _$LightningBalance_ClaimableAwaitingConfirmationsImpl value,
          $Res Function(_$LightningBalance_ClaimableAwaitingConfirmationsImpl)
              then) =
      __$$LightningBalance_ClaimableAwaitingConfirmationsImplCopyWithImpl<$Res>;
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
class __$$LightningBalance_ClaimableAwaitingConfirmationsImplCopyWithImpl<$Res>
    extends _$LightningBalanceCopyWithImpl<$Res,
        _$LightningBalance_ClaimableAwaitingConfirmationsImpl>
    implements
        _$$LightningBalance_ClaimableAwaitingConfirmationsImplCopyWith<$Res> {
  __$$LightningBalance_ClaimableAwaitingConfirmationsImplCopyWithImpl(
      _$LightningBalance_ClaimableAwaitingConfirmationsImpl _value,
      $Res Function(_$LightningBalance_ClaimableAwaitingConfirmationsImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
    Object? confirmationHeight = null,
    Object? source = null,
  }) {
    return _then(_$LightningBalance_ClaimableAwaitingConfirmationsImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _value.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      confirmationHeight: null == confirmationHeight
          ? _value.confirmationHeight
          : confirmationHeight // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as BalanceSource,
    ));
  }
}

/// @nodoc

class _$LightningBalance_ClaimableAwaitingConfirmationsImpl
    extends LightningBalance_ClaimableAwaitingConfirmations {
  const _$LightningBalance_ClaimableAwaitingConfirmationsImpl(
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
  @override
  final int confirmationHeight;

  /// Whether this balance is a result of cooperative close, a force-close, or an HTLC.
  @override
  final BalanceSource source;

  @override
  String toString() {
    return 'LightningBalance.claimableAwaitingConfirmations(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis, confirmationHeight: $confirmationHeight, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightningBalance_ClaimableAwaitingConfirmationsImpl &&
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

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightningBalance_ClaimableAwaitingConfirmationsImplCopyWith<
          _$LightningBalance_ClaimableAwaitingConfirmationsImpl>
      get copyWith =>
          __$$LightningBalance_ClaimableAwaitingConfirmationsImplCopyWithImpl<
                  _$LightningBalance_ClaimableAwaitingConfirmationsImpl>(
              this, _$identity);

  @override
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
    return claimableAwaitingConfirmations(channelId, counterpartyNodeId,
        amountSatoshis, confirmationHeight, source);
  }

  @override
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
    return claimableAwaitingConfirmations?.call(channelId, counterpartyNodeId,
        amountSatoshis, confirmationHeight, source);
  }

  @override
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
    if (claimableAwaitingConfirmations != null) {
      return claimableAwaitingConfirmations(channelId, counterpartyNodeId,
          amountSatoshis, confirmationHeight, source);
    }
    return orElse();
  }

  @override
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
    return claimableAwaitingConfirmations(this);
  }

  @override
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
    return claimableAwaitingConfirmations?.call(this);
  }

  @override
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
    if (claimableAwaitingConfirmations != null) {
      return claimableAwaitingConfirmations(this);
    }
    return orElse();
  }
}

abstract class LightningBalance_ClaimableAwaitingConfirmations
    extends LightningBalance {
  const factory LightningBalance_ClaimableAwaitingConfirmations(
          {required final ChannelId channelId,
          required final PublicKey counterpartyNodeId,
          required final BigInt amountSatoshis,
          required final int confirmationHeight,
          required final BalanceSource source}) =
      _$LightningBalance_ClaimableAwaitingConfirmationsImpl;
  const LightningBalance_ClaimableAwaitingConfirmations._() : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  ChannelId get channelId;

  /// The identifier of our channel counterparty.
  @override
  PublicKey get counterpartyNodeId;

  /// The amount available to claim, in satoshis, possibly excluding the on-chain fees which
  /// were spent in broadcasting the transaction.
  @override
  BigInt get amountSatoshis;

  /// The height at which an `event.SpendableOutputs` event will be generated for this
  /// amount.
  ///
  int get confirmationHeight;

  /// Whether this balance is a result of cooperative close, a force-close, or an HTLC.
  BalanceSource get source;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightningBalance_ClaimableAwaitingConfirmationsImplCopyWith<
          _$LightningBalance_ClaimableAwaitingConfirmationsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LightningBalance_ContentiousClaimableImplCopyWith<$Res>
    implements $LightningBalanceCopyWith<$Res> {
  factory _$$LightningBalance_ContentiousClaimableImplCopyWith(
          _$LightningBalance_ContentiousClaimableImpl value,
          $Res Function(_$LightningBalance_ContentiousClaimableImpl) then) =
      __$$LightningBalance_ContentiousClaimableImplCopyWithImpl<$Res>;
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
class __$$LightningBalance_ContentiousClaimableImplCopyWithImpl<$Res>
    extends _$LightningBalanceCopyWithImpl<$Res,
        _$LightningBalance_ContentiousClaimableImpl>
    implements _$$LightningBalance_ContentiousClaimableImplCopyWith<$Res> {
  __$$LightningBalance_ContentiousClaimableImplCopyWithImpl(
      _$LightningBalance_ContentiousClaimableImpl _value,
      $Res Function(_$LightningBalance_ContentiousClaimableImpl) _then)
      : super(_value, _then);

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
    Object? timeoutHeight = null,
    Object? paymentHash = null,
    Object? paymentPreimage = null,
  }) {
    return _then(_$LightningBalance_ContentiousClaimableImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _value.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      timeoutHeight: null == timeoutHeight
          ? _value.timeoutHeight
          : timeoutHeight // ignore: cast_nullable_to_non_nullable
              as int,
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      paymentPreimage: null == paymentPreimage
          ? _value.paymentPreimage
          : paymentPreimage // ignore: cast_nullable_to_non_nullable
              as PaymentPreimage,
    ));
  }
}

/// @nodoc

class _$LightningBalance_ContentiousClaimableImpl
    extends LightningBalance_ContentiousClaimable {
  const _$LightningBalance_ContentiousClaimableImpl(
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
  @override
  final int timeoutHeight;

  /// The payment hash that locks this HTLC.
  @override
  final PaymentHash paymentHash;

  /// The preimage that can be used to claim this HTLC.
  @override
  final PaymentPreimage paymentPreimage;

  @override
  String toString() {
    return 'LightningBalance.contentiousClaimable(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis, timeoutHeight: $timeoutHeight, paymentHash: $paymentHash, paymentPreimage: $paymentPreimage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightningBalance_ContentiousClaimableImpl &&
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

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightningBalance_ContentiousClaimableImplCopyWith<
          _$LightningBalance_ContentiousClaimableImpl>
      get copyWith => __$$LightningBalance_ContentiousClaimableImplCopyWithImpl<
          _$LightningBalance_ContentiousClaimableImpl>(this, _$identity);

  @override
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
    return contentiousClaimable(channelId, counterpartyNodeId, amountSatoshis,
        timeoutHeight, paymentHash, paymentPreimage);
  }

  @override
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
    return contentiousClaimable?.call(channelId, counterpartyNodeId,
        amountSatoshis, timeoutHeight, paymentHash, paymentPreimage);
  }

  @override
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
    if (contentiousClaimable != null) {
      return contentiousClaimable(channelId, counterpartyNodeId, amountSatoshis,
          timeoutHeight, paymentHash, paymentPreimage);
    }
    return orElse();
  }

  @override
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
    return contentiousClaimable(this);
  }

  @override
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
    return contentiousClaimable?.call(this);
  }

  @override
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
    if (contentiousClaimable != null) {
      return contentiousClaimable(this);
    }
    return orElse();
  }
}

abstract class LightningBalance_ContentiousClaimable extends LightningBalance {
  const factory LightningBalance_ContentiousClaimable(
          {required final ChannelId channelId,
          required final PublicKey counterpartyNodeId,
          required final BigInt amountSatoshis,
          required final int timeoutHeight,
          required final PaymentHash paymentHash,
          required final PaymentPreimage paymentPreimage}) =
      _$LightningBalance_ContentiousClaimableImpl;
  const LightningBalance_ContentiousClaimable._() : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  ChannelId get channelId;

  /// The identifier of our channel counterparty.
  @override
  PublicKey get counterpartyNodeId;

  /// The amount available to claim, in satoshis, excluding the on-chain fees which will be
  /// required to do so.
  @override
  BigInt get amountSatoshis;

  /// The height at which the counterparty may be able to claim the balance if we have not
  /// done so.
  int get timeoutHeight;

  /// The payment hash that locks this HTLC.
  PaymentHash get paymentHash;

  /// The preimage that can be used to claim this HTLC.
  PaymentPreimage get paymentPreimage;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightningBalance_ContentiousClaimableImplCopyWith<
          _$LightningBalance_ContentiousClaimableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LightningBalance_MaybeTimeoutClaimableHTLCImplCopyWith<$Res>
    implements $LightningBalanceCopyWith<$Res> {
  factory _$$LightningBalance_MaybeTimeoutClaimableHTLCImplCopyWith(
          _$LightningBalance_MaybeTimeoutClaimableHTLCImpl value,
          $Res Function(_$LightningBalance_MaybeTimeoutClaimableHTLCImpl)
              then) =
      __$$LightningBalance_MaybeTimeoutClaimableHTLCImplCopyWithImpl<$Res>;
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
class __$$LightningBalance_MaybeTimeoutClaimableHTLCImplCopyWithImpl<$Res>
    extends _$LightningBalanceCopyWithImpl<$Res,
        _$LightningBalance_MaybeTimeoutClaimableHTLCImpl>
    implements _$$LightningBalance_MaybeTimeoutClaimableHTLCImplCopyWith<$Res> {
  __$$LightningBalance_MaybeTimeoutClaimableHTLCImplCopyWithImpl(
      _$LightningBalance_MaybeTimeoutClaimableHTLCImpl _value,
      $Res Function(_$LightningBalance_MaybeTimeoutClaimableHTLCImpl) _then)
      : super(_value, _then);

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
    Object? claimableHeight = null,
    Object? paymentHash = null,
    Object? outboundPayment = null,
  }) {
    return _then(_$LightningBalance_MaybeTimeoutClaimableHTLCImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _value.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      claimableHeight: null == claimableHeight
          ? _value.claimableHeight
          : claimableHeight // ignore: cast_nullable_to_non_nullable
              as int,
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
      outboundPayment: null == outboundPayment
          ? _value.outboundPayment
          : outboundPayment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LightningBalance_MaybeTimeoutClaimableHTLCImpl
    extends LightningBalance_MaybeTimeoutClaimableHTLC {
  const _$LightningBalance_MaybeTimeoutClaimableHTLCImpl(
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
  @override
  final int claimableHeight;

  /// The payment hash whose preimage our counterparty needs to claim this HTLC.
  @override
  final PaymentHash paymentHash;

  ///
  @override
  final bool outboundPayment;

  @override
  String toString() {
    return 'LightningBalance.maybeTimeoutClaimableHtlc(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis, claimableHeight: $claimableHeight, paymentHash: $paymentHash, outboundPayment: $outboundPayment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightningBalance_MaybeTimeoutClaimableHTLCImpl &&
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

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightningBalance_MaybeTimeoutClaimableHTLCImplCopyWith<
          _$LightningBalance_MaybeTimeoutClaimableHTLCImpl>
      get copyWith =>
          __$$LightningBalance_MaybeTimeoutClaimableHTLCImplCopyWithImpl<
                  _$LightningBalance_MaybeTimeoutClaimableHTLCImpl>(
              this, _$identity);

  @override
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
    return maybeTimeoutClaimableHtlc(channelId, counterpartyNodeId,
        amountSatoshis, claimableHeight, paymentHash, outboundPayment);
  }

  @override
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
    return maybeTimeoutClaimableHtlc?.call(channelId, counterpartyNodeId,
        amountSatoshis, claimableHeight, paymentHash, outboundPayment);
  }

  @override
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
    if (maybeTimeoutClaimableHtlc != null) {
      return maybeTimeoutClaimableHtlc(channelId, counterpartyNodeId,
          amountSatoshis, claimableHeight, paymentHash, outboundPayment);
    }
    return orElse();
  }

  @override
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
    return maybeTimeoutClaimableHtlc(this);
  }

  @override
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
    return maybeTimeoutClaimableHtlc?.call(this);
  }

  @override
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
    if (maybeTimeoutClaimableHtlc != null) {
      return maybeTimeoutClaimableHtlc(this);
    }
    return orElse();
  }
}

abstract class LightningBalance_MaybeTimeoutClaimableHTLC
    extends LightningBalance {
  const factory LightningBalance_MaybeTimeoutClaimableHTLC(
          {required final ChannelId channelId,
          required final PublicKey counterpartyNodeId,
          required final BigInt amountSatoshis,
          required final int claimableHeight,
          required final PaymentHash paymentHash,
          required final bool outboundPayment}) =
      _$LightningBalance_MaybeTimeoutClaimableHTLCImpl;
  const LightningBalance_MaybeTimeoutClaimableHTLC._() : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  ChannelId get channelId;

  /// The identifier of our channel counterparty.
  @override
  PublicKey get counterpartyNodeId;

  /// The amount potentially available to claim, in satoshis, excluding the on-chain fees
  /// which will be required to do so.
  @override
  BigInt get amountSatoshis;

  /// The height at which we will be able to claim the balance if our counterparty has not
  /// done so.
  int get claimableHeight;

  /// The payment hash whose preimage our counterparty needs to claim this HTLC.
  PaymentHash get paymentHash;

  ///
  bool get outboundPayment;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightningBalance_MaybeTimeoutClaimableHTLCImplCopyWith<
          _$LightningBalance_MaybeTimeoutClaimableHTLCImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LightningBalance_MaybePreimageClaimableHTLCImplCopyWith<$Res>
    implements $LightningBalanceCopyWith<$Res> {
  factory _$$LightningBalance_MaybePreimageClaimableHTLCImplCopyWith(
          _$LightningBalance_MaybePreimageClaimableHTLCImpl value,
          $Res Function(_$LightningBalance_MaybePreimageClaimableHTLCImpl)
              then) =
      __$$LightningBalance_MaybePreimageClaimableHTLCImplCopyWithImpl<$Res>;
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
class __$$LightningBalance_MaybePreimageClaimableHTLCImplCopyWithImpl<$Res>
    extends _$LightningBalanceCopyWithImpl<$Res,
        _$LightningBalance_MaybePreimageClaimableHTLCImpl>
    implements
        _$$LightningBalance_MaybePreimageClaimableHTLCImplCopyWith<$Res> {
  __$$LightningBalance_MaybePreimageClaimableHTLCImplCopyWithImpl(
      _$LightningBalance_MaybePreimageClaimableHTLCImpl _value,
      $Res Function(_$LightningBalance_MaybePreimageClaimableHTLCImpl) _then)
      : super(_value, _then);

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
    Object? expiryHeight = null,
    Object? paymentHash = null,
  }) {
    return _then(_$LightningBalance_MaybePreimageClaimableHTLCImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _value.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
      expiryHeight: null == expiryHeight
          ? _value.expiryHeight
          : expiryHeight // ignore: cast_nullable_to_non_nullable
              as int,
      paymentHash: null == paymentHash
          ? _value.paymentHash
          : paymentHash // ignore: cast_nullable_to_non_nullable
              as PaymentHash,
    ));
  }
}

/// @nodoc

class _$LightningBalance_MaybePreimageClaimableHTLCImpl
    extends LightningBalance_MaybePreimageClaimableHTLC {
  const _$LightningBalance_MaybePreimageClaimableHTLCImpl(
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
  @override
  final int expiryHeight;

  /// The payment hash whose preimage we need to claim this HTLC.
  @override
  final PaymentHash paymentHash;

  @override
  String toString() {
    return 'LightningBalance.maybePreimageClaimableHtlc(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis, expiryHeight: $expiryHeight, paymentHash: $paymentHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightningBalance_MaybePreimageClaimableHTLCImpl &&
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

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightningBalance_MaybePreimageClaimableHTLCImplCopyWith<
          _$LightningBalance_MaybePreimageClaimableHTLCImpl>
      get copyWith =>
          __$$LightningBalance_MaybePreimageClaimableHTLCImplCopyWithImpl<
                  _$LightningBalance_MaybePreimageClaimableHTLCImpl>(
              this, _$identity);

  @override
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
    return maybePreimageClaimableHtlc(channelId, counterpartyNodeId,
        amountSatoshis, expiryHeight, paymentHash);
  }

  @override
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
    return maybePreimageClaimableHtlc?.call(channelId, counterpartyNodeId,
        amountSatoshis, expiryHeight, paymentHash);
  }

  @override
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
    if (maybePreimageClaimableHtlc != null) {
      return maybePreimageClaimableHtlc(channelId, counterpartyNodeId,
          amountSatoshis, expiryHeight, paymentHash);
    }
    return orElse();
  }

  @override
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
    return maybePreimageClaimableHtlc(this);
  }

  @override
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
    return maybePreimageClaimableHtlc?.call(this);
  }

  @override
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
    if (maybePreimageClaimableHtlc != null) {
      return maybePreimageClaimableHtlc(this);
    }
    return orElse();
  }
}

abstract class LightningBalance_MaybePreimageClaimableHTLC
    extends LightningBalance {
  const factory LightningBalance_MaybePreimageClaimableHTLC(
          {required final ChannelId channelId,
          required final PublicKey counterpartyNodeId,
          required final BigInt amountSatoshis,
          required final int expiryHeight,
          required final PaymentHash paymentHash}) =
      _$LightningBalance_MaybePreimageClaimableHTLCImpl;
  const LightningBalance_MaybePreimageClaimableHTLC._() : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  ChannelId get channelId;

  /// The identifier of our channel counterparty.
  @override
  PublicKey get counterpartyNodeId;

  /// The amount potentially available to claim, in satoshis, excluding the on-chain fees
  /// which will be required to do so.
  @override
  BigInt get amountSatoshis;

  /// The height at which our counterparty will be able to claim the balance if we have not
  /// yet received the preimage and claimed it ourselves.
  int get expiryHeight;

  /// The payment hash whose preimage we need to claim this HTLC.
  PaymentHash get paymentHash;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightningBalance_MaybePreimageClaimableHTLCImplCopyWith<
          _$LightningBalance_MaybePreimageClaimableHTLCImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LightningBalance_CounterpartyRevokedOutputClaimableImplCopyWith<
    $Res> implements $LightningBalanceCopyWith<$Res> {
  factory _$$LightningBalance_CounterpartyRevokedOutputClaimableImplCopyWith(
          _$LightningBalance_CounterpartyRevokedOutputClaimableImpl value,
          $Res Function(
                  _$LightningBalance_CounterpartyRevokedOutputClaimableImpl)
              then) =
      __$$LightningBalance_CounterpartyRevokedOutputClaimableImplCopyWithImpl<
          $Res>;
  @override
  @useResult
  $Res call(
      {ChannelId channelId,
      PublicKey counterpartyNodeId,
      BigInt amountSatoshis});
}

/// @nodoc
class __$$LightningBalance_CounterpartyRevokedOutputClaimableImplCopyWithImpl<
        $Res>
    extends _$LightningBalanceCopyWithImpl<$Res,
        _$LightningBalance_CounterpartyRevokedOutputClaimableImpl>
    implements
        _$$LightningBalance_CounterpartyRevokedOutputClaimableImplCopyWith<
            $Res> {
  __$$LightningBalance_CounterpartyRevokedOutputClaimableImplCopyWithImpl(
      _$LightningBalance_CounterpartyRevokedOutputClaimableImpl _value,
      $Res Function(_$LightningBalance_CounterpartyRevokedOutputClaimableImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? counterpartyNodeId = null,
    Object? amountSatoshis = null,
  }) {
    return _then(_$LightningBalance_CounterpartyRevokedOutputClaimableImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId,
      counterpartyNodeId: null == counterpartyNodeId
          ? _value.counterpartyNodeId
          : counterpartyNodeId // ignore: cast_nullable_to_non_nullable
              as PublicKey,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$LightningBalance_CounterpartyRevokedOutputClaimableImpl
    extends LightningBalance_CounterpartyRevokedOutputClaimable {
  const _$LightningBalance_CounterpartyRevokedOutputClaimableImpl(
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

  @override
  String toString() {
    return 'LightningBalance.counterpartyRevokedOutputClaimable(channelId: $channelId, counterpartyNodeId: $counterpartyNodeId, amountSatoshis: $amountSatoshis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is _$LightningBalance_CounterpartyRevokedOutputClaimableImpl &&
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

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightningBalance_CounterpartyRevokedOutputClaimableImplCopyWith<
          _$LightningBalance_CounterpartyRevokedOutputClaimableImpl>
      get copyWith =>
          __$$LightningBalance_CounterpartyRevokedOutputClaimableImplCopyWithImpl<
                  _$LightningBalance_CounterpartyRevokedOutputClaimableImpl>(
              this, _$identity);

  @override
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
    return counterpartyRevokedOutputClaimable(
        channelId, counterpartyNodeId, amountSatoshis);
  }

  @override
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
    return counterpartyRevokedOutputClaimable?.call(
        channelId, counterpartyNodeId, amountSatoshis);
  }

  @override
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
    if (counterpartyRevokedOutputClaimable != null) {
      return counterpartyRevokedOutputClaimable(
          channelId, counterpartyNodeId, amountSatoshis);
    }
    return orElse();
  }

  @override
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
    return counterpartyRevokedOutputClaimable(this);
  }

  @override
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
    return counterpartyRevokedOutputClaimable?.call(this);
  }

  @override
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
    if (counterpartyRevokedOutputClaimable != null) {
      return counterpartyRevokedOutputClaimable(this);
    }
    return orElse();
  }
}

abstract class LightningBalance_CounterpartyRevokedOutputClaimable
    extends LightningBalance {
  const factory LightningBalance_CounterpartyRevokedOutputClaimable(
          {required final ChannelId channelId,
          required final PublicKey counterpartyNodeId,
          required final BigInt amountSatoshis}) =
      _$LightningBalance_CounterpartyRevokedOutputClaimableImpl;
  const LightningBalance_CounterpartyRevokedOutputClaimable._() : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  ChannelId get channelId;

  /// The identifier of our channel counterparty.
  @override
  PublicKey get counterpartyNodeId;

  /// The amount, in satoshis, of the output which we can claim.
  @override
  BigInt get amountSatoshis;

  /// Create a copy of LightningBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightningBalance_CounterpartyRevokedOutputClaimableImplCopyWith<
          _$LightningBalance_CounterpartyRevokedOutputClaimableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaxDustHTLCExposure {
  BigInt get field0 => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BigInt field0) fixedLimitMsat,
    required TResult Function(BigInt field0) feeRateMultiplier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BigInt field0)? fixedLimitMsat,
    TResult? Function(BigInt field0)? feeRateMultiplier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BigInt field0)? fixedLimitMsat,
    TResult Function(BigInt field0)? feeRateMultiplier,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MaxDustHTLCExposure_FixedLimitMsat value)
        fixedLimitMsat,
    required TResult Function(MaxDustHTLCExposure_FeeRateMultiplier value)
        feeRateMultiplier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MaxDustHTLCExposure_FixedLimitMsat value)? fixedLimitMsat,
    TResult? Function(MaxDustHTLCExposure_FeeRateMultiplier value)?
        feeRateMultiplier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MaxDustHTLCExposure_FixedLimitMsat value)? fixedLimitMsat,
    TResult Function(MaxDustHTLCExposure_FeeRateMultiplier value)?
        feeRateMultiplier,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaxDustHTLCExposureCopyWith<MaxDustHTLCExposure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaxDustHTLCExposureCopyWith<$Res> {
  factory $MaxDustHTLCExposureCopyWith(
          MaxDustHTLCExposure value, $Res Function(MaxDustHTLCExposure) then) =
      _$MaxDustHTLCExposureCopyWithImpl<$Res, MaxDustHTLCExposure>;
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class _$MaxDustHTLCExposureCopyWithImpl<$Res, $Val extends MaxDustHTLCExposure>
    implements $MaxDustHTLCExposureCopyWith<$Res> {
  _$MaxDustHTLCExposureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_value.copyWith(
      field0: null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaxDustHTLCExposure_FixedLimitMsatImplCopyWith<$Res>
    implements $MaxDustHTLCExposureCopyWith<$Res> {
  factory _$$MaxDustHTLCExposure_FixedLimitMsatImplCopyWith(
          _$MaxDustHTLCExposure_FixedLimitMsatImpl value,
          $Res Function(_$MaxDustHTLCExposure_FixedLimitMsatImpl) then) =
      __$$MaxDustHTLCExposure_FixedLimitMsatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class __$$MaxDustHTLCExposure_FixedLimitMsatImplCopyWithImpl<$Res>
    extends _$MaxDustHTLCExposureCopyWithImpl<$Res,
        _$MaxDustHTLCExposure_FixedLimitMsatImpl>
    implements _$$MaxDustHTLCExposure_FixedLimitMsatImplCopyWith<$Res> {
  __$$MaxDustHTLCExposure_FixedLimitMsatImplCopyWithImpl(
      _$MaxDustHTLCExposure_FixedLimitMsatImpl _value,
      $Res Function(_$MaxDustHTLCExposure_FixedLimitMsatImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$MaxDustHTLCExposure_FixedLimitMsatImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$MaxDustHTLCExposure_FixedLimitMsatImpl
    extends MaxDustHTLCExposure_FixedLimitMsat {
  const _$MaxDustHTLCExposure_FixedLimitMsatImpl(this.field0) : super._();

  @override
  final BigInt field0;

  @override
  String toString() {
    return 'MaxDustHTLCExposure.fixedLimitMsat(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaxDustHTLCExposure_FixedLimitMsatImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaxDustHTLCExposure_FixedLimitMsatImplCopyWith<
          _$MaxDustHTLCExposure_FixedLimitMsatImpl>
      get copyWith => __$$MaxDustHTLCExposure_FixedLimitMsatImplCopyWithImpl<
          _$MaxDustHTLCExposure_FixedLimitMsatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BigInt field0) fixedLimitMsat,
    required TResult Function(BigInt field0) feeRateMultiplier,
  }) {
    return fixedLimitMsat(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BigInt field0)? fixedLimitMsat,
    TResult? Function(BigInt field0)? feeRateMultiplier,
  }) {
    return fixedLimitMsat?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BigInt field0)? fixedLimitMsat,
    TResult Function(BigInt field0)? feeRateMultiplier,
    required TResult orElse(),
  }) {
    if (fixedLimitMsat != null) {
      return fixedLimitMsat(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MaxDustHTLCExposure_FixedLimitMsat value)
        fixedLimitMsat,
    required TResult Function(MaxDustHTLCExposure_FeeRateMultiplier value)
        feeRateMultiplier,
  }) {
    return fixedLimitMsat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MaxDustHTLCExposure_FixedLimitMsat value)? fixedLimitMsat,
    TResult? Function(MaxDustHTLCExposure_FeeRateMultiplier value)?
        feeRateMultiplier,
  }) {
    return fixedLimitMsat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MaxDustHTLCExposure_FixedLimitMsat value)? fixedLimitMsat,
    TResult Function(MaxDustHTLCExposure_FeeRateMultiplier value)?
        feeRateMultiplier,
    required TResult orElse(),
  }) {
    if (fixedLimitMsat != null) {
      return fixedLimitMsat(this);
    }
    return orElse();
  }
}

abstract class MaxDustHTLCExposure_FixedLimitMsat extends MaxDustHTLCExposure {
  const factory MaxDustHTLCExposure_FixedLimitMsat(final BigInt field0) =
      _$MaxDustHTLCExposure_FixedLimitMsatImpl;
  const MaxDustHTLCExposure_FixedLimitMsat._() : super._();

  @override
  BigInt get field0;

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaxDustHTLCExposure_FixedLimitMsatImplCopyWith<
          _$MaxDustHTLCExposure_FixedLimitMsatImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MaxDustHTLCExposure_FeeRateMultiplierImplCopyWith<$Res>
    implements $MaxDustHTLCExposureCopyWith<$Res> {
  factory _$$MaxDustHTLCExposure_FeeRateMultiplierImplCopyWith(
          _$MaxDustHTLCExposure_FeeRateMultiplierImpl value,
          $Res Function(_$MaxDustHTLCExposure_FeeRateMultiplierImpl) then) =
      __$$MaxDustHTLCExposure_FeeRateMultiplierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BigInt field0});
}

/// @nodoc
class __$$MaxDustHTLCExposure_FeeRateMultiplierImplCopyWithImpl<$Res>
    extends _$MaxDustHTLCExposureCopyWithImpl<$Res,
        _$MaxDustHTLCExposure_FeeRateMultiplierImpl>
    implements _$$MaxDustHTLCExposure_FeeRateMultiplierImplCopyWith<$Res> {
  __$$MaxDustHTLCExposure_FeeRateMultiplierImplCopyWithImpl(
      _$MaxDustHTLCExposure_FeeRateMultiplierImpl _value,
      $Res Function(_$MaxDustHTLCExposure_FeeRateMultiplierImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$MaxDustHTLCExposure_FeeRateMultiplierImpl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$MaxDustHTLCExposure_FeeRateMultiplierImpl
    extends MaxDustHTLCExposure_FeeRateMultiplier {
  const _$MaxDustHTLCExposure_FeeRateMultiplierImpl(this.field0) : super._();

  @override
  final BigInt field0;

  @override
  String toString() {
    return 'MaxDustHTLCExposure.feeRateMultiplier(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaxDustHTLCExposure_FeeRateMultiplierImpl &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaxDustHTLCExposure_FeeRateMultiplierImplCopyWith<
          _$MaxDustHTLCExposure_FeeRateMultiplierImpl>
      get copyWith => __$$MaxDustHTLCExposure_FeeRateMultiplierImplCopyWithImpl<
          _$MaxDustHTLCExposure_FeeRateMultiplierImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BigInt field0) fixedLimitMsat,
    required TResult Function(BigInt field0) feeRateMultiplier,
  }) {
    return feeRateMultiplier(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BigInt field0)? fixedLimitMsat,
    TResult? Function(BigInt field0)? feeRateMultiplier,
  }) {
    return feeRateMultiplier?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BigInt field0)? fixedLimitMsat,
    TResult Function(BigInt field0)? feeRateMultiplier,
    required TResult orElse(),
  }) {
    if (feeRateMultiplier != null) {
      return feeRateMultiplier(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MaxDustHTLCExposure_FixedLimitMsat value)
        fixedLimitMsat,
    required TResult Function(MaxDustHTLCExposure_FeeRateMultiplier value)
        feeRateMultiplier,
  }) {
    return feeRateMultiplier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MaxDustHTLCExposure_FixedLimitMsat value)? fixedLimitMsat,
    TResult? Function(MaxDustHTLCExposure_FeeRateMultiplier value)?
        feeRateMultiplier,
  }) {
    return feeRateMultiplier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MaxDustHTLCExposure_FixedLimitMsat value)? fixedLimitMsat,
    TResult Function(MaxDustHTLCExposure_FeeRateMultiplier value)?
        feeRateMultiplier,
    required TResult orElse(),
  }) {
    if (feeRateMultiplier != null) {
      return feeRateMultiplier(this);
    }
    return orElse();
  }
}

abstract class MaxDustHTLCExposure_FeeRateMultiplier
    extends MaxDustHTLCExposure {
  const factory MaxDustHTLCExposure_FeeRateMultiplier(final BigInt field0) =
      _$MaxDustHTLCExposure_FeeRateMultiplierImpl;
  const MaxDustHTLCExposure_FeeRateMultiplier._() : super._();

  @override
  BigInt get field0;

  /// Create a copy of MaxDustHTLCExposure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaxDustHTLCExposure_FeeRateMultiplierImplCopyWith<
          _$MaxDustHTLCExposure_FeeRateMultiplierImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaxTotalRoutingFeeLimit {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noFeeCap,
    required TResult Function(BigInt amountMsat) feeCap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noFeeCap,
    TResult? Function(BigInt amountMsat)? feeCap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noFeeCap,
    TResult Function(BigInt amountMsat)? feeCap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MaxTotalRoutingFeeLimit_NoFeeCap value) noFeeCap,
    required TResult Function(MaxTotalRoutingFeeLimit_FeeCap value) feeCap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MaxTotalRoutingFeeLimit_NoFeeCap value)? noFeeCap,
    TResult? Function(MaxTotalRoutingFeeLimit_FeeCap value)? feeCap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MaxTotalRoutingFeeLimit_NoFeeCap value)? noFeeCap,
    TResult Function(MaxTotalRoutingFeeLimit_FeeCap value)? feeCap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaxTotalRoutingFeeLimitCopyWith<$Res> {
  factory $MaxTotalRoutingFeeLimitCopyWith(MaxTotalRoutingFeeLimit value,
          $Res Function(MaxTotalRoutingFeeLimit) then) =
      _$MaxTotalRoutingFeeLimitCopyWithImpl<$Res, MaxTotalRoutingFeeLimit>;
}

/// @nodoc
class _$MaxTotalRoutingFeeLimitCopyWithImpl<$Res,
        $Val extends MaxTotalRoutingFeeLimit>
    implements $MaxTotalRoutingFeeLimitCopyWith<$Res> {
  _$MaxTotalRoutingFeeLimitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaxTotalRoutingFeeLimit
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MaxTotalRoutingFeeLimit_NoFeeCapImplCopyWith<$Res> {
  factory _$$MaxTotalRoutingFeeLimit_NoFeeCapImplCopyWith(
          _$MaxTotalRoutingFeeLimit_NoFeeCapImpl value,
          $Res Function(_$MaxTotalRoutingFeeLimit_NoFeeCapImpl) then) =
      __$$MaxTotalRoutingFeeLimit_NoFeeCapImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MaxTotalRoutingFeeLimit_NoFeeCapImplCopyWithImpl<$Res>
    extends _$MaxTotalRoutingFeeLimitCopyWithImpl<$Res,
        _$MaxTotalRoutingFeeLimit_NoFeeCapImpl>
    implements _$$MaxTotalRoutingFeeLimit_NoFeeCapImplCopyWith<$Res> {
  __$$MaxTotalRoutingFeeLimit_NoFeeCapImplCopyWithImpl(
      _$MaxTotalRoutingFeeLimit_NoFeeCapImpl _value,
      $Res Function(_$MaxTotalRoutingFeeLimit_NoFeeCapImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaxTotalRoutingFeeLimit
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MaxTotalRoutingFeeLimit_NoFeeCapImpl
    extends MaxTotalRoutingFeeLimit_NoFeeCap {
  const _$MaxTotalRoutingFeeLimit_NoFeeCapImpl() : super._();

  @override
  String toString() {
    return 'MaxTotalRoutingFeeLimit.noFeeCap()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaxTotalRoutingFeeLimit_NoFeeCapImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noFeeCap,
    required TResult Function(BigInt amountMsat) feeCap,
  }) {
    return noFeeCap();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noFeeCap,
    TResult? Function(BigInt amountMsat)? feeCap,
  }) {
    return noFeeCap?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noFeeCap,
    TResult Function(BigInt amountMsat)? feeCap,
    required TResult orElse(),
  }) {
    if (noFeeCap != null) {
      return noFeeCap();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MaxTotalRoutingFeeLimit_NoFeeCap value) noFeeCap,
    required TResult Function(MaxTotalRoutingFeeLimit_FeeCap value) feeCap,
  }) {
    return noFeeCap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MaxTotalRoutingFeeLimit_NoFeeCap value)? noFeeCap,
    TResult? Function(MaxTotalRoutingFeeLimit_FeeCap value)? feeCap,
  }) {
    return noFeeCap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MaxTotalRoutingFeeLimit_NoFeeCap value)? noFeeCap,
    TResult Function(MaxTotalRoutingFeeLimit_FeeCap value)? feeCap,
    required TResult orElse(),
  }) {
    if (noFeeCap != null) {
      return noFeeCap(this);
    }
    return orElse();
  }
}

abstract class MaxTotalRoutingFeeLimit_NoFeeCap
    extends MaxTotalRoutingFeeLimit {
  const factory MaxTotalRoutingFeeLimit_NoFeeCap() =
      _$MaxTotalRoutingFeeLimit_NoFeeCapImpl;
  const MaxTotalRoutingFeeLimit_NoFeeCap._() : super._();
}

/// @nodoc
abstract class _$$MaxTotalRoutingFeeLimit_FeeCapImplCopyWith<$Res> {
  factory _$$MaxTotalRoutingFeeLimit_FeeCapImplCopyWith(
          _$MaxTotalRoutingFeeLimit_FeeCapImpl value,
          $Res Function(_$MaxTotalRoutingFeeLimit_FeeCapImpl) then) =
      __$$MaxTotalRoutingFeeLimit_FeeCapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BigInt amountMsat});
}

/// @nodoc
class __$$MaxTotalRoutingFeeLimit_FeeCapImplCopyWithImpl<$Res>
    extends _$MaxTotalRoutingFeeLimitCopyWithImpl<$Res,
        _$MaxTotalRoutingFeeLimit_FeeCapImpl>
    implements _$$MaxTotalRoutingFeeLimit_FeeCapImplCopyWith<$Res> {
  __$$MaxTotalRoutingFeeLimit_FeeCapImplCopyWithImpl(
      _$MaxTotalRoutingFeeLimit_FeeCapImpl _value,
      $Res Function(_$MaxTotalRoutingFeeLimit_FeeCapImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaxTotalRoutingFeeLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountMsat = null,
  }) {
    return _then(_$MaxTotalRoutingFeeLimit_FeeCapImpl(
      amountMsat: null == amountMsat
          ? _value.amountMsat
          : amountMsat // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$MaxTotalRoutingFeeLimit_FeeCapImpl
    extends MaxTotalRoutingFeeLimit_FeeCap {
  const _$MaxTotalRoutingFeeLimit_FeeCapImpl({required this.amountMsat})
      : super._();

  @override
  final BigInt amountMsat;

  @override
  String toString() {
    return 'MaxTotalRoutingFeeLimit.feeCap(amountMsat: $amountMsat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaxTotalRoutingFeeLimit_FeeCapImpl &&
            (identical(other.amountMsat, amountMsat) ||
                other.amountMsat == amountMsat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amountMsat);

  /// Create a copy of MaxTotalRoutingFeeLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaxTotalRoutingFeeLimit_FeeCapImplCopyWith<
          _$MaxTotalRoutingFeeLimit_FeeCapImpl>
      get copyWith => __$$MaxTotalRoutingFeeLimit_FeeCapImplCopyWithImpl<
          _$MaxTotalRoutingFeeLimit_FeeCapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noFeeCap,
    required TResult Function(BigInt amountMsat) feeCap,
  }) {
    return feeCap(amountMsat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noFeeCap,
    TResult? Function(BigInt amountMsat)? feeCap,
  }) {
    return feeCap?.call(amountMsat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noFeeCap,
    TResult Function(BigInt amountMsat)? feeCap,
    required TResult orElse(),
  }) {
    if (feeCap != null) {
      return feeCap(amountMsat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MaxTotalRoutingFeeLimit_NoFeeCap value) noFeeCap,
    required TResult Function(MaxTotalRoutingFeeLimit_FeeCap value) feeCap,
  }) {
    return feeCap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MaxTotalRoutingFeeLimit_NoFeeCap value)? noFeeCap,
    TResult? Function(MaxTotalRoutingFeeLimit_FeeCap value)? feeCap,
  }) {
    return feeCap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MaxTotalRoutingFeeLimit_NoFeeCap value)? noFeeCap,
    TResult Function(MaxTotalRoutingFeeLimit_FeeCap value)? feeCap,
    required TResult orElse(),
  }) {
    if (feeCap != null) {
      return feeCap(this);
    }
    return orElse();
  }
}

abstract class MaxTotalRoutingFeeLimit_FeeCap extends MaxTotalRoutingFeeLimit {
  const factory MaxTotalRoutingFeeLimit_FeeCap(
          {required final BigInt amountMsat}) =
      _$MaxTotalRoutingFeeLimit_FeeCapImpl;
  const MaxTotalRoutingFeeLimit_FeeCap._() : super._();

  BigInt get amountMsat;

  /// Create a copy of MaxTotalRoutingFeeLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaxTotalRoutingFeeLimit_FeeCapImplCopyWith<
          _$MaxTotalRoutingFeeLimit_FeeCapImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PendingSweepBalance {
  /// The identifier of the channel this balance belongs to.
  ChannelId? get channelId => throw _privateConstructorUsedError;

  /// The amount, in satoshis, of the output being swept.
  BigInt get amountSatoshis => throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PendingSweepBalance_PendingBroadcast value)?
        pendingBroadcast,
    TResult? Function(PendingSweepBalance_BroadcastAwaitingConfirmation value)?
        broadcastAwaitingConfirmation,
    TResult? Function(PendingSweepBalance_AwaitingThresholdConfirmations value)?
        awaitingThresholdConfirmations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PendingSweepBalance_PendingBroadcast value)?
        pendingBroadcast,
    TResult Function(PendingSweepBalance_BroadcastAwaitingConfirmation value)?
        broadcastAwaitingConfirmation,
    TResult Function(PendingSweepBalance_AwaitingThresholdConfirmations value)?
        awaitingThresholdConfirmations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingSweepBalanceCopyWith<PendingSweepBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingSweepBalanceCopyWith<$Res> {
  factory $PendingSweepBalanceCopyWith(
          PendingSweepBalance value, $Res Function(PendingSweepBalance) then) =
      _$PendingSweepBalanceCopyWithImpl<$Res, PendingSweepBalance>;
  @useResult
  $Res call({ChannelId? channelId, BigInt amountSatoshis});
}

/// @nodoc
class _$PendingSweepBalanceCopyWithImpl<$Res, $Val extends PendingSweepBalance>
    implements $PendingSweepBalanceCopyWith<$Res> {
  _$PendingSweepBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = freezed,
    Object? amountSatoshis = null,
  }) {
    return _then(_value.copyWith(
      channelId: freezed == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId?,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingSweepBalance_PendingBroadcastImplCopyWith<$Res>
    implements $PendingSweepBalanceCopyWith<$Res> {
  factory _$$PendingSweepBalance_PendingBroadcastImplCopyWith(
          _$PendingSweepBalance_PendingBroadcastImpl value,
          $Res Function(_$PendingSweepBalance_PendingBroadcastImpl) then) =
      __$$PendingSweepBalance_PendingBroadcastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChannelId? channelId, BigInt amountSatoshis});
}

/// @nodoc
class __$$PendingSweepBalance_PendingBroadcastImplCopyWithImpl<$Res>
    extends _$PendingSweepBalanceCopyWithImpl<$Res,
        _$PendingSweepBalance_PendingBroadcastImpl>
    implements _$$PendingSweepBalance_PendingBroadcastImplCopyWith<$Res> {
  __$$PendingSweepBalance_PendingBroadcastImplCopyWithImpl(
      _$PendingSweepBalance_PendingBroadcastImpl _value,
      $Res Function(_$PendingSweepBalance_PendingBroadcastImpl) _then)
      : super(_value, _then);

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = freezed,
    Object? amountSatoshis = null,
  }) {
    return _then(_$PendingSweepBalance_PendingBroadcastImpl(
      channelId: freezed == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId?,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$PendingSweepBalance_PendingBroadcastImpl
    extends PendingSweepBalance_PendingBroadcast {
  const _$PendingSweepBalance_PendingBroadcastImpl(
      {this.channelId, required this.amountSatoshis})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId? channelId;

  /// The amount, in satoshis, of the output being swept.
  @override
  final BigInt amountSatoshis;

  @override
  String toString() {
    return 'PendingSweepBalance.pendingBroadcast(channelId: $channelId, amountSatoshis: $amountSatoshis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingSweepBalance_PendingBroadcastImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.amountSatoshis, amountSatoshis) ||
                other.amountSatoshis == amountSatoshis));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, amountSatoshis);

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingSweepBalance_PendingBroadcastImplCopyWith<
          _$PendingSweepBalance_PendingBroadcastImpl>
      get copyWith => __$$PendingSweepBalance_PendingBroadcastImplCopyWithImpl<
          _$PendingSweepBalance_PendingBroadcastImpl>(this, _$identity);

  @override
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
    return pendingBroadcast(channelId, amountSatoshis);
  }

  @override
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
    return pendingBroadcast?.call(channelId, amountSatoshis);
  }

  @override
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
    if (pendingBroadcast != null) {
      return pendingBroadcast(channelId, amountSatoshis);
    }
    return orElse();
  }

  @override
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
    return pendingBroadcast(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PendingSweepBalance_PendingBroadcast value)?
        pendingBroadcast,
    TResult? Function(PendingSweepBalance_BroadcastAwaitingConfirmation value)?
        broadcastAwaitingConfirmation,
    TResult? Function(PendingSweepBalance_AwaitingThresholdConfirmations value)?
        awaitingThresholdConfirmations,
  }) {
    return pendingBroadcast?.call(this);
  }

  @override
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
    if (pendingBroadcast != null) {
      return pendingBroadcast(this);
    }
    return orElse();
  }
}

abstract class PendingSweepBalance_PendingBroadcast
    extends PendingSweepBalance {
  const factory PendingSweepBalance_PendingBroadcast(
          {final ChannelId? channelId, required final BigInt amountSatoshis}) =
      _$PendingSweepBalance_PendingBroadcastImpl;
  const PendingSweepBalance_PendingBroadcast._() : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  ChannelId? get channelId;

  /// The amount, in satoshis, of the output being swept.
  @override
  BigInt get amountSatoshis;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingSweepBalance_PendingBroadcastImplCopyWith<
          _$PendingSweepBalance_PendingBroadcastImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PendingSweepBalance_BroadcastAwaitingConfirmationImplCopyWith<
    $Res> implements $PendingSweepBalanceCopyWith<$Res> {
  factory _$$PendingSweepBalance_BroadcastAwaitingConfirmationImplCopyWith(
          _$PendingSweepBalance_BroadcastAwaitingConfirmationImpl value,
          $Res Function(_$PendingSweepBalance_BroadcastAwaitingConfirmationImpl)
              then) =
      __$$PendingSweepBalance_BroadcastAwaitingConfirmationImplCopyWithImpl<
          $Res>;
  @override
  @useResult
  $Res call(
      {ChannelId? channelId,
      int latestBroadcastHeight,
      Txid latestSpendingTxid,
      BigInt amountSatoshis});
}

/// @nodoc
class __$$PendingSweepBalance_BroadcastAwaitingConfirmationImplCopyWithImpl<
        $Res>
    extends _$PendingSweepBalanceCopyWithImpl<$Res,
        _$PendingSweepBalance_BroadcastAwaitingConfirmationImpl>
    implements
        _$$PendingSweepBalance_BroadcastAwaitingConfirmationImplCopyWith<$Res> {
  __$$PendingSweepBalance_BroadcastAwaitingConfirmationImplCopyWithImpl(
      _$PendingSweepBalance_BroadcastAwaitingConfirmationImpl _value,
      $Res Function(_$PendingSweepBalance_BroadcastAwaitingConfirmationImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = freezed,
    Object? latestBroadcastHeight = null,
    Object? latestSpendingTxid = null,
    Object? amountSatoshis = null,
  }) {
    return _then(_$PendingSweepBalance_BroadcastAwaitingConfirmationImpl(
      channelId: freezed == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId?,
      latestBroadcastHeight: null == latestBroadcastHeight
          ? _value.latestBroadcastHeight
          : latestBroadcastHeight // ignore: cast_nullable_to_non_nullable
              as int,
      latestSpendingTxid: null == latestSpendingTxid
          ? _value.latestSpendingTxid
          : latestSpendingTxid // ignore: cast_nullable_to_non_nullable
              as Txid,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$PendingSweepBalance_BroadcastAwaitingConfirmationImpl
    extends PendingSweepBalance_BroadcastAwaitingConfirmation {
  const _$PendingSweepBalance_BroadcastAwaitingConfirmationImpl(
      {this.channelId,
      required this.latestBroadcastHeight,
      required this.latestSpendingTxid,
      required this.amountSatoshis})
      : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  final ChannelId? channelId;

  /// The best height when we last broadcast a transaction spending the output being swept.
  @override
  final int latestBroadcastHeight;

  /// The identifier of the transaction spending the swept output we last broadcast.
  @override
  final Txid latestSpendingTxid;

  /// The amount, in satoshis, of the output being swept.
  @override
  final BigInt amountSatoshis;

  @override
  String toString() {
    return 'PendingSweepBalance.broadcastAwaitingConfirmation(channelId: $channelId, latestBroadcastHeight: $latestBroadcastHeight, latestSpendingTxid: $latestSpendingTxid, amountSatoshis: $amountSatoshis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingSweepBalance_BroadcastAwaitingConfirmationImpl &&
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

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingSweepBalance_BroadcastAwaitingConfirmationImplCopyWith<
          _$PendingSweepBalance_BroadcastAwaitingConfirmationImpl>
      get copyWith =>
          __$$PendingSweepBalance_BroadcastAwaitingConfirmationImplCopyWithImpl<
                  _$PendingSweepBalance_BroadcastAwaitingConfirmationImpl>(
              this, _$identity);

  @override
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
    return broadcastAwaitingConfirmation(
        channelId, latestBroadcastHeight, latestSpendingTxid, amountSatoshis);
  }

  @override
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
    return broadcastAwaitingConfirmation?.call(
        channelId, latestBroadcastHeight, latestSpendingTxid, amountSatoshis);
  }

  @override
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
    if (broadcastAwaitingConfirmation != null) {
      return broadcastAwaitingConfirmation(
          channelId, latestBroadcastHeight, latestSpendingTxid, amountSatoshis);
    }
    return orElse();
  }

  @override
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
    return broadcastAwaitingConfirmation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PendingSweepBalance_PendingBroadcast value)?
        pendingBroadcast,
    TResult? Function(PendingSweepBalance_BroadcastAwaitingConfirmation value)?
        broadcastAwaitingConfirmation,
    TResult? Function(PendingSweepBalance_AwaitingThresholdConfirmations value)?
        awaitingThresholdConfirmations,
  }) {
    return broadcastAwaitingConfirmation?.call(this);
  }

  @override
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
    if (broadcastAwaitingConfirmation != null) {
      return broadcastAwaitingConfirmation(this);
    }
    return orElse();
  }
}

abstract class PendingSweepBalance_BroadcastAwaitingConfirmation
    extends PendingSweepBalance {
  const factory PendingSweepBalance_BroadcastAwaitingConfirmation(
          {final ChannelId? channelId,
          required final int latestBroadcastHeight,
          required final Txid latestSpendingTxid,
          required final BigInt amountSatoshis}) =
      _$PendingSweepBalance_BroadcastAwaitingConfirmationImpl;
  const PendingSweepBalance_BroadcastAwaitingConfirmation._() : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  ChannelId? get channelId;

  /// The best height when we last broadcast a transaction spending the output being swept.
  int get latestBroadcastHeight;

  /// The identifier of the transaction spending the swept output we last broadcast.
  Txid get latestSpendingTxid;

  /// The amount, in satoshis, of the output being swept.
  @override
  BigInt get amountSatoshis;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingSweepBalance_BroadcastAwaitingConfirmationImplCopyWith<
          _$PendingSweepBalance_BroadcastAwaitingConfirmationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PendingSweepBalance_AwaitingThresholdConfirmationsImplCopyWith<
    $Res> implements $PendingSweepBalanceCopyWith<$Res> {
  factory _$$PendingSweepBalance_AwaitingThresholdConfirmationsImplCopyWith(
          _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl value,
          $Res Function(
                  _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl)
              then) =
      __$$PendingSweepBalance_AwaitingThresholdConfirmationsImplCopyWithImpl<
          $Res>;
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
class __$$PendingSweepBalance_AwaitingThresholdConfirmationsImplCopyWithImpl<
        $Res>
    extends _$PendingSweepBalanceCopyWithImpl<$Res,
        _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl>
    implements
        _$$PendingSweepBalance_AwaitingThresholdConfirmationsImplCopyWith<
            $Res> {
  __$$PendingSweepBalance_AwaitingThresholdConfirmationsImplCopyWithImpl(
      _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl _value,
      $Res Function(_$PendingSweepBalance_AwaitingThresholdConfirmationsImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = freezed,
    Object? latestSpendingTxid = null,
    Object? confirmationHash = null,
    Object? confirmationHeight = null,
    Object? amountSatoshis = null,
  }) {
    return _then(_$PendingSweepBalance_AwaitingThresholdConfirmationsImpl(
      channelId: freezed == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as ChannelId?,
      latestSpendingTxid: null == latestSpendingTxid
          ? _value.latestSpendingTxid
          : latestSpendingTxid // ignore: cast_nullable_to_non_nullable
              as Txid,
      confirmationHash: null == confirmationHash
          ? _value.confirmationHash
          : confirmationHash // ignore: cast_nullable_to_non_nullable
              as String,
      confirmationHeight: null == confirmationHeight
          ? _value.confirmationHeight
          : confirmationHeight // ignore: cast_nullable_to_non_nullable
              as int,
      amountSatoshis: null == amountSatoshis
          ? _value.amountSatoshis
          : amountSatoshis // ignore: cast_nullable_to_non_nullable
              as BigInt,
    ));
  }
}

/// @nodoc

class _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl
    extends PendingSweepBalance_AwaitingThresholdConfirmations {
  const _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl(
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
  @override
  final Txid latestSpendingTxid;

  /// The hash of the block in which the spending transaction was confirmed.
  @override
  final String confirmationHash;

  /// The height at which the spending transaction was confirmed.
  @override
  final int confirmationHeight;

  /// The amount, in satoshis, of the output being swept.
  @override
  final BigInt amountSatoshis;

  @override
  String toString() {
    return 'PendingSweepBalance.awaitingThresholdConfirmations(channelId: $channelId, latestSpendingTxid: $latestSpendingTxid, confirmationHash: $confirmationHash, confirmationHeight: $confirmationHeight, amountSatoshis: $amountSatoshis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl &&
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

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingSweepBalance_AwaitingThresholdConfirmationsImplCopyWith<
          _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl>
      get copyWith =>
          __$$PendingSweepBalance_AwaitingThresholdConfirmationsImplCopyWithImpl<
                  _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl>(
              this, _$identity);

  @override
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
    return awaitingThresholdConfirmations(channelId, latestSpendingTxid,
        confirmationHash, confirmationHeight, amountSatoshis);
  }

  @override
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
    return awaitingThresholdConfirmations?.call(channelId, latestSpendingTxid,
        confirmationHash, confirmationHeight, amountSatoshis);
  }

  @override
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
    if (awaitingThresholdConfirmations != null) {
      return awaitingThresholdConfirmations(channelId, latestSpendingTxid,
          confirmationHash, confirmationHeight, amountSatoshis);
    }
    return orElse();
  }

  @override
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
    return awaitingThresholdConfirmations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PendingSweepBalance_PendingBroadcast value)?
        pendingBroadcast,
    TResult? Function(PendingSweepBalance_BroadcastAwaitingConfirmation value)?
        broadcastAwaitingConfirmation,
    TResult? Function(PendingSweepBalance_AwaitingThresholdConfirmations value)?
        awaitingThresholdConfirmations,
  }) {
    return awaitingThresholdConfirmations?.call(this);
  }

  @override
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
    if (awaitingThresholdConfirmations != null) {
      return awaitingThresholdConfirmations(this);
    }
    return orElse();
  }
}

abstract class PendingSweepBalance_AwaitingThresholdConfirmations
    extends PendingSweepBalance {
  const factory PendingSweepBalance_AwaitingThresholdConfirmations(
          {final ChannelId? channelId,
          required final Txid latestSpendingTxid,
          required final String confirmationHash,
          required final int confirmationHeight,
          required final BigInt amountSatoshis}) =
      _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl;
  const PendingSweepBalance_AwaitingThresholdConfirmations._() : super._();

  /// The identifier of the channel this balance belongs to.
  @override
  ChannelId? get channelId;

  /// The identifier of the confirmed transaction spending the swept output.
  Txid get latestSpendingTxid;

  /// The hash of the block in which the spending transaction was confirmed.
  String get confirmationHash;

  /// The height at which the spending transaction was confirmed.
  int get confirmationHeight;

  /// The amount, in satoshis, of the output being swept.
  @override
  BigInt get amountSatoshis;

  /// Create a copy of PendingSweepBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingSweepBalance_AwaitingThresholdConfirmationsImplCopyWith<
          _$PendingSweepBalance_AwaitingThresholdConfirmationsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SocketAddress {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(U8Array4 addr, int port) tcpIpV4,
    required TResult Function(U8Array16 addr, int port) tcpIpV6,
    required TResult Function(U8Array12 field0) onionV2,
    required TResult Function(
            U8Array32 ed25519Pubkey, int checksum, int version, int port)
        onionV3,
    required TResult Function(String addr, int port) hostname,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(U8Array4 addr, int port)? tcpIpV4,
    TResult? Function(U8Array16 addr, int port)? tcpIpV6,
    TResult? Function(U8Array12 field0)? onionV2,
    TResult? Function(
            U8Array32 ed25519Pubkey, int checksum, int version, int port)?
        onionV3,
    TResult? Function(String addr, int port)? hostname,
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocketAddress_TcpIpV4 value) tcpIpV4,
    required TResult Function(SocketAddress_TcpIpV6 value) tcpIpV6,
    required TResult Function(SocketAddress_OnionV2 value) onionV2,
    required TResult Function(SocketAddress_OnionV3 value) onionV3,
    required TResult Function(SocketAddress_Hostname value) hostname,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult? Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult? Function(SocketAddress_OnionV2 value)? onionV2,
    TResult? Function(SocketAddress_OnionV3 value)? onionV3,
    TResult? Function(SocketAddress_Hostname value)? hostname,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult Function(SocketAddress_OnionV2 value)? onionV2,
    TResult Function(SocketAddress_OnionV3 value)? onionV3,
    TResult Function(SocketAddress_Hostname value)? hostname,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketAddressCopyWith<$Res> {
  factory $SocketAddressCopyWith(
          SocketAddress value, $Res Function(SocketAddress) then) =
      _$SocketAddressCopyWithImpl<$Res, SocketAddress>;
}

/// @nodoc
class _$SocketAddressCopyWithImpl<$Res, $Val extends SocketAddress>
    implements $SocketAddressCopyWith<$Res> {
  _$SocketAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SocketAddress_TcpIpV4ImplCopyWith<$Res> {
  factory _$$SocketAddress_TcpIpV4ImplCopyWith(
          _$SocketAddress_TcpIpV4Impl value,
          $Res Function(_$SocketAddress_TcpIpV4Impl) then) =
      __$$SocketAddress_TcpIpV4ImplCopyWithImpl<$Res>;
  @useResult
  $Res call({U8Array4 addr, int port});
}

/// @nodoc
class __$$SocketAddress_TcpIpV4ImplCopyWithImpl<$Res>
    extends _$SocketAddressCopyWithImpl<$Res, _$SocketAddress_TcpIpV4Impl>
    implements _$$SocketAddress_TcpIpV4ImplCopyWith<$Res> {
  __$$SocketAddress_TcpIpV4ImplCopyWithImpl(_$SocketAddress_TcpIpV4Impl _value,
      $Res Function(_$SocketAddress_TcpIpV4Impl) _then)
      : super(_value, _then);

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addr = null,
    Object? port = null,
  }) {
    return _then(_$SocketAddress_TcpIpV4Impl(
      addr: null == addr
          ? _value.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as U8Array4,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SocketAddress_TcpIpV4Impl extends SocketAddress_TcpIpV4 {
  const _$SocketAddress_TcpIpV4Impl({required this.addr, required this.port})
      : super._();

  @override
  final U8Array4 addr;
  @override
  final int port;

  @override
  String toString() {
    return 'SocketAddress.tcpIpV4(addr: $addr, port: $port)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketAddress_TcpIpV4Impl &&
            const DeepCollectionEquality().equals(other.addr, addr) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(addr), port);

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketAddress_TcpIpV4ImplCopyWith<_$SocketAddress_TcpIpV4Impl>
      get copyWith => __$$SocketAddress_TcpIpV4ImplCopyWithImpl<
          _$SocketAddress_TcpIpV4Impl>(this, _$identity);

  @override
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
    return tcpIpV4(addr, port);
  }

  @override
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
    return tcpIpV4?.call(addr, port);
  }

  @override
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
    if (tcpIpV4 != null) {
      return tcpIpV4(addr, port);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocketAddress_TcpIpV4 value) tcpIpV4,
    required TResult Function(SocketAddress_TcpIpV6 value) tcpIpV6,
    required TResult Function(SocketAddress_OnionV2 value) onionV2,
    required TResult Function(SocketAddress_OnionV3 value) onionV3,
    required TResult Function(SocketAddress_Hostname value) hostname,
  }) {
    return tcpIpV4(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult? Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult? Function(SocketAddress_OnionV2 value)? onionV2,
    TResult? Function(SocketAddress_OnionV3 value)? onionV3,
    TResult? Function(SocketAddress_Hostname value)? hostname,
  }) {
    return tcpIpV4?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult Function(SocketAddress_OnionV2 value)? onionV2,
    TResult Function(SocketAddress_OnionV3 value)? onionV3,
    TResult Function(SocketAddress_Hostname value)? hostname,
    required TResult orElse(),
  }) {
    if (tcpIpV4 != null) {
      return tcpIpV4(this);
    }
    return orElse();
  }
}

abstract class SocketAddress_TcpIpV4 extends SocketAddress {
  const factory SocketAddress_TcpIpV4(
      {required final U8Array4 addr,
      required final int port}) = _$SocketAddress_TcpIpV4Impl;
  const SocketAddress_TcpIpV4._() : super._();

  U8Array4 get addr;
  int get port;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketAddress_TcpIpV4ImplCopyWith<_$SocketAddress_TcpIpV4Impl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocketAddress_TcpIpV6ImplCopyWith<$Res> {
  factory _$$SocketAddress_TcpIpV6ImplCopyWith(
          _$SocketAddress_TcpIpV6Impl value,
          $Res Function(_$SocketAddress_TcpIpV6Impl) then) =
      __$$SocketAddress_TcpIpV6ImplCopyWithImpl<$Res>;
  @useResult
  $Res call({U8Array16 addr, int port});
}

/// @nodoc
class __$$SocketAddress_TcpIpV6ImplCopyWithImpl<$Res>
    extends _$SocketAddressCopyWithImpl<$Res, _$SocketAddress_TcpIpV6Impl>
    implements _$$SocketAddress_TcpIpV6ImplCopyWith<$Res> {
  __$$SocketAddress_TcpIpV6ImplCopyWithImpl(_$SocketAddress_TcpIpV6Impl _value,
      $Res Function(_$SocketAddress_TcpIpV6Impl) _then)
      : super(_value, _then);

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addr = null,
    Object? port = null,
  }) {
    return _then(_$SocketAddress_TcpIpV6Impl(
      addr: null == addr
          ? _value.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as U8Array16,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SocketAddress_TcpIpV6Impl extends SocketAddress_TcpIpV6 {
  const _$SocketAddress_TcpIpV6Impl({required this.addr, required this.port})
      : super._();

  @override
  final U8Array16 addr;
  @override
  final int port;

  @override
  String toString() {
    return 'SocketAddress.tcpIpV6(addr: $addr, port: $port)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketAddress_TcpIpV6Impl &&
            const DeepCollectionEquality().equals(other.addr, addr) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(addr), port);

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketAddress_TcpIpV6ImplCopyWith<_$SocketAddress_TcpIpV6Impl>
      get copyWith => __$$SocketAddress_TcpIpV6ImplCopyWithImpl<
          _$SocketAddress_TcpIpV6Impl>(this, _$identity);

  @override
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
    return tcpIpV6(addr, port);
  }

  @override
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
    return tcpIpV6?.call(addr, port);
  }

  @override
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
    if (tcpIpV6 != null) {
      return tcpIpV6(addr, port);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocketAddress_TcpIpV4 value) tcpIpV4,
    required TResult Function(SocketAddress_TcpIpV6 value) tcpIpV6,
    required TResult Function(SocketAddress_OnionV2 value) onionV2,
    required TResult Function(SocketAddress_OnionV3 value) onionV3,
    required TResult Function(SocketAddress_Hostname value) hostname,
  }) {
    return tcpIpV6(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult? Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult? Function(SocketAddress_OnionV2 value)? onionV2,
    TResult? Function(SocketAddress_OnionV3 value)? onionV3,
    TResult? Function(SocketAddress_Hostname value)? hostname,
  }) {
    return tcpIpV6?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult Function(SocketAddress_OnionV2 value)? onionV2,
    TResult Function(SocketAddress_OnionV3 value)? onionV3,
    TResult Function(SocketAddress_Hostname value)? hostname,
    required TResult orElse(),
  }) {
    if (tcpIpV6 != null) {
      return tcpIpV6(this);
    }
    return orElse();
  }
}

abstract class SocketAddress_TcpIpV6 extends SocketAddress {
  const factory SocketAddress_TcpIpV6(
      {required final U8Array16 addr,
      required final int port}) = _$SocketAddress_TcpIpV6Impl;
  const SocketAddress_TcpIpV6._() : super._();

  U8Array16 get addr;
  int get port;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketAddress_TcpIpV6ImplCopyWith<_$SocketAddress_TcpIpV6Impl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocketAddress_OnionV2ImplCopyWith<$Res> {
  factory _$$SocketAddress_OnionV2ImplCopyWith(
          _$SocketAddress_OnionV2Impl value,
          $Res Function(_$SocketAddress_OnionV2Impl) then) =
      __$$SocketAddress_OnionV2ImplCopyWithImpl<$Res>;
  @useResult
  $Res call({U8Array12 field0});
}

/// @nodoc
class __$$SocketAddress_OnionV2ImplCopyWithImpl<$Res>
    extends _$SocketAddressCopyWithImpl<$Res, _$SocketAddress_OnionV2Impl>
    implements _$$SocketAddress_OnionV2ImplCopyWith<$Res> {
  __$$SocketAddress_OnionV2ImplCopyWithImpl(_$SocketAddress_OnionV2Impl _value,
      $Res Function(_$SocketAddress_OnionV2Impl) _then)
      : super(_value, _then);

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$SocketAddress_OnionV2Impl(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as U8Array12,
    ));
  }
}

/// @nodoc

class _$SocketAddress_OnionV2Impl extends SocketAddress_OnionV2 {
  const _$SocketAddress_OnionV2Impl(this.field0) : super._();

  @override
  final U8Array12 field0;

  @override
  String toString() {
    return 'SocketAddress.onionV2(field0: $field0)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketAddress_OnionV2Impl &&
            const DeepCollectionEquality().equals(other.field0, field0));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(field0));

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketAddress_OnionV2ImplCopyWith<_$SocketAddress_OnionV2Impl>
      get copyWith => __$$SocketAddress_OnionV2ImplCopyWithImpl<
          _$SocketAddress_OnionV2Impl>(this, _$identity);

  @override
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
    return onionV2(field0);
  }

  @override
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
    return onionV2?.call(field0);
  }

  @override
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
    if (onionV2 != null) {
      return onionV2(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocketAddress_TcpIpV4 value) tcpIpV4,
    required TResult Function(SocketAddress_TcpIpV6 value) tcpIpV6,
    required TResult Function(SocketAddress_OnionV2 value) onionV2,
    required TResult Function(SocketAddress_OnionV3 value) onionV3,
    required TResult Function(SocketAddress_Hostname value) hostname,
  }) {
    return onionV2(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult? Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult? Function(SocketAddress_OnionV2 value)? onionV2,
    TResult? Function(SocketAddress_OnionV3 value)? onionV3,
    TResult? Function(SocketAddress_Hostname value)? hostname,
  }) {
    return onionV2?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult Function(SocketAddress_OnionV2 value)? onionV2,
    TResult Function(SocketAddress_OnionV3 value)? onionV3,
    TResult Function(SocketAddress_Hostname value)? hostname,
    required TResult orElse(),
  }) {
    if (onionV2 != null) {
      return onionV2(this);
    }
    return orElse();
  }
}

abstract class SocketAddress_OnionV2 extends SocketAddress {
  const factory SocketAddress_OnionV2(final U8Array12 field0) =
      _$SocketAddress_OnionV2Impl;
  const SocketAddress_OnionV2._() : super._();

  U8Array12 get field0;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketAddress_OnionV2ImplCopyWith<_$SocketAddress_OnionV2Impl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocketAddress_OnionV3ImplCopyWith<$Res> {
  factory _$$SocketAddress_OnionV3ImplCopyWith(
          _$SocketAddress_OnionV3Impl value,
          $Res Function(_$SocketAddress_OnionV3Impl) then) =
      __$$SocketAddress_OnionV3ImplCopyWithImpl<$Res>;
  @useResult
  $Res call({U8Array32 ed25519Pubkey, int checksum, int version, int port});
}

/// @nodoc
class __$$SocketAddress_OnionV3ImplCopyWithImpl<$Res>
    extends _$SocketAddressCopyWithImpl<$Res, _$SocketAddress_OnionV3Impl>
    implements _$$SocketAddress_OnionV3ImplCopyWith<$Res> {
  __$$SocketAddress_OnionV3ImplCopyWithImpl(_$SocketAddress_OnionV3Impl _value,
      $Res Function(_$SocketAddress_OnionV3Impl) _then)
      : super(_value, _then);

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ed25519Pubkey = null,
    Object? checksum = null,
    Object? version = null,
    Object? port = null,
  }) {
    return _then(_$SocketAddress_OnionV3Impl(
      ed25519Pubkey: null == ed25519Pubkey
          ? _value.ed25519Pubkey
          : ed25519Pubkey // ignore: cast_nullable_to_non_nullable
              as U8Array32,
      checksum: null == checksum
          ? _value.checksum
          : checksum // ignore: cast_nullable_to_non_nullable
              as int,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SocketAddress_OnionV3Impl extends SocketAddress_OnionV3 {
  const _$SocketAddress_OnionV3Impl(
      {required this.ed25519Pubkey,
      required this.checksum,
      required this.version,
      required this.port})
      : super._();

  @override
  final U8Array32 ed25519Pubkey;
  @override
  final int checksum;
  @override
  final int version;
  @override
  final int port;

  @override
  String toString() {
    return 'SocketAddress.onionV3(ed25519Pubkey: $ed25519Pubkey, checksum: $checksum, version: $version, port: $port)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketAddress_OnionV3Impl &&
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

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketAddress_OnionV3ImplCopyWith<_$SocketAddress_OnionV3Impl>
      get copyWith => __$$SocketAddress_OnionV3ImplCopyWithImpl<
          _$SocketAddress_OnionV3Impl>(this, _$identity);

  @override
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
    return onionV3(ed25519Pubkey, checksum, version, port);
  }

  @override
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
    return onionV3?.call(ed25519Pubkey, checksum, version, port);
  }

  @override
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
    if (onionV3 != null) {
      return onionV3(ed25519Pubkey, checksum, version, port);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocketAddress_TcpIpV4 value) tcpIpV4,
    required TResult Function(SocketAddress_TcpIpV6 value) tcpIpV6,
    required TResult Function(SocketAddress_OnionV2 value) onionV2,
    required TResult Function(SocketAddress_OnionV3 value) onionV3,
    required TResult Function(SocketAddress_Hostname value) hostname,
  }) {
    return onionV3(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult? Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult? Function(SocketAddress_OnionV2 value)? onionV2,
    TResult? Function(SocketAddress_OnionV3 value)? onionV3,
    TResult? Function(SocketAddress_Hostname value)? hostname,
  }) {
    return onionV3?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult Function(SocketAddress_OnionV2 value)? onionV2,
    TResult Function(SocketAddress_OnionV3 value)? onionV3,
    TResult Function(SocketAddress_Hostname value)? hostname,
    required TResult orElse(),
  }) {
    if (onionV3 != null) {
      return onionV3(this);
    }
    return orElse();
  }
}

abstract class SocketAddress_OnionV3 extends SocketAddress {
  const factory SocketAddress_OnionV3(
      {required final U8Array32 ed25519Pubkey,
      required final int checksum,
      required final int version,
      required final int port}) = _$SocketAddress_OnionV3Impl;
  const SocketAddress_OnionV3._() : super._();

  U8Array32 get ed25519Pubkey;
  int get checksum;
  int get version;
  int get port;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketAddress_OnionV3ImplCopyWith<_$SocketAddress_OnionV3Impl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocketAddress_HostnameImplCopyWith<$Res> {
  factory _$$SocketAddress_HostnameImplCopyWith(
          _$SocketAddress_HostnameImpl value,
          $Res Function(_$SocketAddress_HostnameImpl) then) =
      __$$SocketAddress_HostnameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String addr, int port});
}

/// @nodoc
class __$$SocketAddress_HostnameImplCopyWithImpl<$Res>
    extends _$SocketAddressCopyWithImpl<$Res, _$SocketAddress_HostnameImpl>
    implements _$$SocketAddress_HostnameImplCopyWith<$Res> {
  __$$SocketAddress_HostnameImplCopyWithImpl(
      _$SocketAddress_HostnameImpl _value,
      $Res Function(_$SocketAddress_HostnameImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addr = null,
    Object? port = null,
  }) {
    return _then(_$SocketAddress_HostnameImpl(
      addr: null == addr
          ? _value.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SocketAddress_HostnameImpl extends SocketAddress_Hostname {
  const _$SocketAddress_HostnameImpl({required this.addr, required this.port})
      : super._();

  @override
  final String addr;
  @override
  final int port;

  @override
  String toString() {
    return 'SocketAddress.hostname(addr: $addr, port: $port)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketAddress_HostnameImpl &&
            (identical(other.addr, addr) || other.addr == addr) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addr, port);

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketAddress_HostnameImplCopyWith<_$SocketAddress_HostnameImpl>
      get copyWith => __$$SocketAddress_HostnameImplCopyWithImpl<
          _$SocketAddress_HostnameImpl>(this, _$identity);

  @override
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
    return hostname(addr, port);
  }

  @override
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
    return hostname?.call(addr, port);
  }

  @override
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
    if (hostname != null) {
      return hostname(addr, port);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocketAddress_TcpIpV4 value) tcpIpV4,
    required TResult Function(SocketAddress_TcpIpV6 value) tcpIpV6,
    required TResult Function(SocketAddress_OnionV2 value) onionV2,
    required TResult Function(SocketAddress_OnionV3 value) onionV3,
    required TResult Function(SocketAddress_Hostname value) hostname,
  }) {
    return hostname(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult? Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult? Function(SocketAddress_OnionV2 value)? onionV2,
    TResult? Function(SocketAddress_OnionV3 value)? onionV3,
    TResult? Function(SocketAddress_Hostname value)? hostname,
  }) {
    return hostname?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocketAddress_TcpIpV4 value)? tcpIpV4,
    TResult Function(SocketAddress_TcpIpV6 value)? tcpIpV6,
    TResult Function(SocketAddress_OnionV2 value)? onionV2,
    TResult Function(SocketAddress_OnionV3 value)? onionV3,
    TResult Function(SocketAddress_Hostname value)? hostname,
    required TResult orElse(),
  }) {
    if (hostname != null) {
      return hostname(this);
    }
    return orElse();
  }
}

abstract class SocketAddress_Hostname extends SocketAddress {
  const factory SocketAddress_Hostname(
      {required final String addr,
      required final int port}) = _$SocketAddress_HostnameImpl;
  const SocketAddress_Hostname._() : super._();

  String get addr;
  int get port;

  /// Create a copy of SocketAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketAddress_HostnameImplCopyWith<_$SocketAddress_HostnameImpl>
      get copyWith => throw _privateConstructorUsedError;
}
