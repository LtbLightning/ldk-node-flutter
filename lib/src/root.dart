import 'dart:async';

import 'generated/bridge_definitions.dart';
import 'utils/loader.dart';

class Node extends NodeBase {
  Node._({required super.bridge, required super.nodePointer});
  factory Node.create({required NodePointer pointer}) {
    return Node._(bridge: loaderApi, nodePointer: pointer);
  }
}

class Builder extends BuilderBase {
  Builder._({required super.bridge, required super.config});

  /// Creates a new builder instance from an [Config].
  factory Builder.fromConfig({required Config config}) {
    return Builder._(bridge: loaderApi, config: config);
  }
  Future<Node> build() async {
    final res = await loaderApi.buildStaticMethodBuilderBase(builder: this);
    return Node.create(pointer: res.nodePointer);
  }
}
