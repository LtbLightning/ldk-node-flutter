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

API implemented from **`ldk_node`** and available in this flutter library:

### Builder

- `setListeningAddress( String listeningAddress )`,
- `setNetwork( Network netowrk )`
- `setEsploraServerUrl( String esploraServerUrl )`
- `setStorageDirPath( String storageDirPath )`
- `fromConfig( Config config )`
- `build()`

### LdkNode

- `start()`
- `stop()`
- `nodeId()`
- `newFundingAddress()`
- `onChainBalance()`
- `syncWallet()`
- `getNodeInfo()`
- `listeningAddress()`
- `connectOpenChannel( String nodePubKeyAndAddress, int channelAmountSats, bool announceChannel )`
- `closeChannel( String channelId, PublicKey counterpartyNodeId )`
- `getChannelIds()`
- `receivePayment(  String description, int expirySecs,  int? amountInSats )`
- `sendPayment( Invoice invoice )`
- `sendAdjustableValuePayment( Invoice invoice, int amountInSats )`
- `sendSpontaneousPayment( String nodeId, int amountInSats )`
- `eventHandled()`
- `nextEvent()`

### Examples

### Build, Start & Sync the local node

```dart
import 'package:ldk_node/ldk_node.dart';

// ....

// Path to a directory where the application may place data that is user-generated
final path = "${directory.path}alice's_node";

// Please replace this url with your local `Esplora` url
// Testnet url: "https://blockstream.info/testnet/api"

final esploraUrl = Platform.isAndroid ? "http://10.0.2.2:3002" : "http://0.0.0.0:3002";

final config = Config( storageDirPath: path,
                       esploraServerUrl: esploraUrl,
                       network: Network.Regtest,
                       listeningAddress: "0.0.0.0:80" );
NodeBuilder builder = NodeBuilder.fromConfig(config);
final node = await builder.build();

//Starting the node
await node.start();

//Syncing the node
await node.syncWallet();

```
