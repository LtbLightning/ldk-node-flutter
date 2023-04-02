## Ldk_Node

A Flutter library for **[Lightning Development Kit](https://lightningdevkit.org/)**

### How to Use

From Github (copy and paste the following code to pubsepc.yaml):

```bash
ldk_node:
    git:
      url: https://github.com/LtbLightning/ldk-node-flutter.git
      ref: main
```

### Examples

### Build, Start & Sync the local node

```dart
import 'package:ldk_node/ldk_node.dart';

// ....

// Path to a directory where the application may place data that is user-generated
final path = "${directory.path}alice's_node";

// Please replace this url with your local `Esplora` url

final esploraUrl = https://blockstream.info/testnet/api;

final config = Config( storageDirPath: path,
                       esploraServerUrl: esploraUrl,
                       network: Network.Testnet,
                       listeningAddress: SocketAddr(io:"0.0.0.0", port:80) );
Builder builder = Builder.fromConfig(config);
final node = await builder.build();

//Starting the node
await node.start();

//Syncing the node
await node.syncWallets();

```
