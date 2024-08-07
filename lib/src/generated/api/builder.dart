// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../lib.dart';
import '../utils/error.dart';
import 'node.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'types.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `clone`, `fmt`, `from`, `try_from`

// Rust type: RustOpaqueNom<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<NodeBuilder>>
abstract class NodeBuilder implements RustOpaqueInterface {
  Builder get builder;

  void set builder(Builder builder);

  Future<LdkNode> build();

  Future<LdkNode> buildWithFsStore();

  static Future<NodeBuilder> createBuilder(
          {required Config config,
          ChainDataSourceConfig? chainDataSourceConfig,
          EntropySourceConfig? entropySourceConfig,
          GossipSourceConfig? gossipSourceConfig,
          LiquiditySourceConfig? liquiditySourceConfig}) =>
      core.instance.api.crateApiBuilderNodeBuilderCreateBuilder(
          config: config,
          chainDataSourceConfig: chainDataSourceConfig,
          entropySourceConfig: entropySourceConfig,
          gossipSourceConfig: gossipSourceConfig,
          liquiditySourceConfig: liquiditySourceConfig);
}

// Rust type: RustOpaqueNom<ldk_node :: Builder>
abstract class Builder implements RustOpaqueInterface {}

class LdkMnemonic {
  final String seedPhrase;

  const LdkMnemonic({
    required this.seedPhrase,
  });

  static Future<LdkMnemonic> generate() =>
      core.instance.api.crateApiBuilderLdkMnemonicGenerate();

  @override
  int get hashCode => seedPhrase.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LdkMnemonic &&
          runtimeType == other.runtimeType &&
          seedPhrase == other.seedPhrase;
}
