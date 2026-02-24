# AI Prompt: Basic Bitcoin Wallet

## Say This to Your AI Assistant:

"Create a minimal Flutter app that:
1. Initializes an LDK Node on testnet
2. Shows the node's Bitcoin address for funding
3. Displays the current on-chain balance
4. Has a refresh button to sync with the blockchain

Use the ldk_node package. Keep it simple - just one screen with a StatefulWidget."

---

## Expected AI Actions:

1. **Add dependencies to `pubspec.yaml`:**
    ```yaml
    dependencies:
       ldk_node: ^0.7.0
       path_provider: ^2.1.5
    ```

2. **Create a StatefulWidget** with node initialization in `initState()`

3. **Initialize the node using the Builder pattern:**
   ```dart
   import 'package:ldk_node/ldk_node.dart' as ldk;
   
   final mnemonic = await ldk.Mnemonic.generate();
   final builder = ldk.Builder.testnet();
   builder.setStorageDirPath(storagePath);
   builder.setEntropyBip39Mnemonic(mnemonic: mnemonic);
   final node = await builder.build();
   await node.start();
   ```

4. **Sync and get address:**
   ```dart
   await node.syncWallets();
   final onChainPayment = await node.onChainPayment();
   final address = await onChainPayment.newAddress();
   // address.s contains the address string
   ```

5. **Get balance:**
   ```dart
   final balances = await node.listBalances();
   final satoshis = balances.spendableOnchainBalanceSats;
   ```

---

## If AI Gets Stuck:

- **"node is null" errors**: Make sure to call `await node.start()` before any operations
- **Balance shows 0**: Need to call `await node.syncWallets()` first
- **Address generation fails**: Ensure node is started before calling `onChainPayment()`
- **Storage path issues**: Use `path_provider` to get a valid directory:
  ```dart
  final directory = await getApplicationDocumentsDirectory();
  final storagePath = '${directory.path}/ldk_node';
  ```

---

## Key APIs Used:

| Operation | API Call |
|-----------|----------|
| Create builder | `ldk.Builder.testnet()` |
| Set storage | `builder.setStorageDirPath(path)` |
| Build node | `await builder.build()` |
| Start node | `await node.start()` |
| Sync blockchain | `await node.syncWallets()` |
| Get address | `(await node.onChainPayment()).newAddress()` |
| Get balance | `await node.listBalances()` |
| Stop node | `await node.stop()` |

---

## Reference:

- Package: https://pub.dev/packages/ldk_node
- GitHub: https://github.com/LtbLightning/ldk-node-flutter
- Testnet faucet: https://bitcoinfaucet.uo1.net/
