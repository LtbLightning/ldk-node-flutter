## LDK_Node

A Flutter library for [LDK Node](https://github.com/lightningdevkit/ldk-node), a ready-to-go Lightning node library built using [LDK](https://lightningdevkit.org) and [BDK](https://bitcoindevkit.org).


### How to use ldk_node

To use the `ldk_node` package in your project, add it as a dependency in your project's pubspec.yaml:

```dart
dependencies:
  ldk_node: ^0.1.0
```
or run this command

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
