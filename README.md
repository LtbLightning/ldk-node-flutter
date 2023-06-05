## LDK_Node

A Flutter library for [LDK Node](https://github.com/lightningdevkit/ldk-node), a ready-to-go Lightning node library built using [LDK](https://lightningdevkit.org) and [BDK](https://bitcoindevkit.org).

LDK Node is a non-custodial Lightning node. Its central goal is to provide a small, simple, and straightforward interface that enables users to easily set up and run a Lightning node with an integrated on-chain wallet. While minimalism is at its core, LDK Node aims to be sufficiently modular and configurable to be useful for a variety of use cases.

The primary abstraction of the library is the Node, which can be retrieved by setting up and configuring a Builder to your liking and calling build(). Node can then be controlled via commands such as start, stop, connectOpen_channel, sendPayment, etc.:

This release covers the same API from LDK Node 0.1.0 Rust. It has support for sourcing chain data via an Esplora server, filesystem persistence, gossip sourcing via the Lightning peer-to-peer network, and configurable entropy sources for the integrated LDK and BDK-based wallets.

Please note: This release is considered experimental, and should not be run in production
### How to use ldk_node

To use the `ldk_node` package in your project, add it as a dependency in your project's pubspec.yaml:

```dart
dependencies:
  ldk_node: ^0.1.1
```
or add from pub.dev using `pub add` command

```
  flutter pub add ldk_node
```

### Examples

### Build, Start & Sync the local node

```dart
import 'package:ldk_node/ldk_node.dart';

// ....

// Path to a directory where the application may place data that is user-generated
final path = "${directory.path}alice's_node";

// Your preferred `Esplora` url
final esploraUrl = https://blockstream.info/testnet/api;

// configuration options for the node
final config = Config( storageDirPath: path,
                       esploraServerUrl: esploraUrl,
                       network: Network.Testnet,
                       listeningAddress: SocketAddr(ip:"0.0.0.0", port:80) );
Builder builder = Builder.fromConfig(config);
final node = await builder.build();

// Starting the node
await node.start();

// Syncing the node
await node.syncWallets();

```
