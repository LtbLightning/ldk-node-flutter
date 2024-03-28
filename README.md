## LDK_Node

<p>
  <a href="https://github.com/LtbLightning/ldk-node-flutter/blob/HEAD/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="LDK Node is released under the MIT license." />
  </a>
  <a href="https://pub.dev/documentation/ldk_node/latest/">
    <img src="https://img.shields.io/badge/docs-red.svg" alt="Docs" />
  </a>
  <a href="https://pub.dev/packages/ldk_node">
    <img src="https://img.shields.io/pub/v/ldk_node?color=blueviolet" alt="Current pub package version." />
  </a>
    <a href="https://github.com/LtbLightning/ldk-node-flutter/issues">
    <img src="https://img.shields.io/github/issues/LtbLightning/ldk-node-flutter.svg" alt="Issues" />
  </a>
  <a href="https://github.com/LtbLightning/ldk-node-flutter/stargazers">
    <img src="https://img.shields.io/github/stars/LtbLightning/ldk-node-flutter.svg" alt="Stars" />
  </a>
  <a href="https://github.com/LtbLightning/ldk-node-flutter/forks">
    <img src="https://img.shields.io/github/forks/LtbLightning/ldk-node-flutter.svg?color=brightgreen" alt="Forks" />
  </a>
  <a href="https://github.com/LtbLightning/ldk-node-flutter-demo">
    <img src="https://img.shields.io/badge/Demo App-orange" alt="Demo App" />
  </a>
</p>

A Flutter library for [LDK Node](https://github.com/lightningdevkit/ldk-node), a ready-to-go Lightning node library built using [LDK](https://lightningdevkit.org) and [BDK](https://bitcoindevkit.org).

LDK Node is a non-custodial Lightning node. Its central goal is to provide a small, simple, and straightforward interface that enables users to easily set up and run a Lightning node with an integrated on-chain wallet. While minimalism is at its core, LDK Node aims to be sufficiently modular and configurable to be useful for a variety of use cases.

The primary abstraction of the library is the Node, which can be retrieved by setting up and configuring a Builder to your liking and calling build(). Node can then be controlled via commands such as start, stop, connectOpenChannel, sendPayment, etc.:

This release covers the same API from LDK Node 0.1.0 Rust. It has support for sourcing chain data via an Esplora server, filesystem persistence, gossip sourcing via the Lightning peer-to-peer network, and configurable entropy sources for the integrated LDK and BDK-based wallets.

Please note: This release is considered experimental, and should not be run in production
### How to use ldk_node

To use the `ldk_node` package in your project, add it as a dependency in your project's pubspec.yaml:


```dart
dependencies:
  ldk_node: ^0.2.2-dev
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
final path = "${directory.path}/alice's_node";

// Your preferred `Esplora` url
final esploraUrl = "https://mempool.space/testnet/api";

// configuration options for the node
final config   = Config(
                        probingLiquidityLimitMultiplier: 3,
                        trustedPeers0Conf: [],
                        storageDirPath: path,
                        network: Network.Testnet,
                        listeningAddresses: [
                         SocketAddress.hostname(addr: "0.0.0.0", port: 3003)
                        ],
                        onchainWalletSyncIntervalSecs: 60,
                        walletSyncIntervalSecs: 20,
                        feeRateCacheUpdateIntervalSecs: 600,
                        logLevel: ldk.LogLevel.Debug,
                        defaultCltvExpiryDelta: 144
                     );
Builder builder = Builder.fromConfig(config);
    final node  = await builder
                                .setEntropyBip39Mnemonic( 
                                     mnemonic: ldk.Mnemonic(
                                                   'certain sense kiss guide crumble hint transfer crime much stereo warm coral'))
                                .setEsploraServer(esploraUrl)
                                .build();

// Starting the node
await node.start();

// Syncing the node
await node.syncWallets();

```

### References:
- Setting up a local Esplora instance for testing:
https://bitcoin.stackexchange.com/questions/116937/how-do-i-setup-an-esplora-instance-for-local-testing/116938#116938

