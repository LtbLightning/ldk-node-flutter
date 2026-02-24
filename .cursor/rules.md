# Cursor Rules for ldk_node

## Project Type
Flutter package for Lightning Network integration using LDK and BDK.

## Code Style
- Dart 3.0+ with null safety
- Follow Flutter/Dart style guide
- Use async/await for all node operations
- Use BigInt for all amount values (millisats, sats)

## When generating code involving this package:

### 1. Always import both:
```dart
import 'package:ldk_node/ldk_node.dart';
import 'package:path_provider/path_provider.dart';
```

### 2. Initialize in this order:
```dart
// 1. Get storage directory
final dir = await getApplicationDocumentsDirectory();

// 2. Generate or load mnemonic (ASYNC!)
final mnemonic = await Mnemonic.generate();
// OR: Mnemonic(seedPhrase: 'existing words...')

// 3. Build node with chained methods
final node = await Builder.testnet()
    .setStorageDirPath('${dir.path}/ldk_node')
    .setEntropyBip39Mnemonic(mnemonic: mnemonic)
    .build();

// 4. Start node (REQUIRED)
await node.start();

// 5. Sync wallets (REQUIRED for balances)
await node.syncWallets();
```

### 3. Use testnet by default:
```dart
Builder.testnet()  // Testnet with Esplora + RGS preconfigured
Builder.mutinynet() // Signet with LSPS2 liquidity
```

### 4. Payment handlers are ASYNC getters:
```dart
// ✅ CORRECT - use await
final bolt11 = await node.bolt11Payment();
final bolt12 = await node.bolt12Payment();
final onChain = await node.onChainPayment();
final spontaneous = await node.spontaneousPayment();

// ❌ WRONG - property access doesn't exist
node.bolt11Payment.receive(...)
```

### 5. Method names have "Unsafe" suffix:
```dart
await bolt11.receiveUnsafe(...)
await bolt11.sendUnsafe(...)
await bolt12.receiveUnsafe(...)
await onChain.sendToAddress(...)
```

### 6. Convert amounts with BigInt:
```dart
// Sats to millisats
amountMsat: BigInt.from(sats * 1000)

// Display millisats as sats
final sats = amountMsat ~/ BigInt.from(1000);
```

### 7. Bolt11Invoice constructor:
```dart
// ✅ CORRECT
Bolt11Invoice(signedRawInvoice: 'lnbc...')

// ❌ WRONG
Bolt11Invoice('lnbc...')
```

### 8. Handle errors with specific exceptions:
```dart
try {
  final bolt11 = await node.bolt11Payment();
  await bolt11.sendUnsafe(invoice: invoice);
} on NodeException catch (e) {
  print('Node error: ${e.code} - ${e.errorMessage}');
} on PaymentException catch (e) {
  print('Payment error: ${e.code} - ${e.errorMessage}');
} on ChannelException catch (e) {
  print('Channel error: ${e.code} - ${e.errorMessage}');
} on LdkFfiException catch (e) {
  print('LDK error: ${e.code} - ${e.errorMessage}');
}
```

### 9. Event handling requires acknowledgment:
```dart
final event = await node.nextEventAsync();
// ... handle event ...
await node.eventHandled(); // MUST call this!
```

### 10. Always stop node on dispose:
```dart
await node.stop();
```

## Common Patterns

### Receive Lightning Payment
```dart
final bolt11 = await node.bolt11Payment();
final invoice = await bolt11.receiveUnsafe(
  amountMsat: BigInt.from(10000 * 1000), // 10,000 sats
  description: 'Payment for service',
  expirySecs: 3600,
);
return invoice.signedRawInvoice;
```

### Send Lightning Payment
```dart
final bolt11 = await node.bolt11Payment();
await bolt11.sendUnsafe(
  invoice: Bolt11Invoice(signedRawInvoice: invoiceString),
);
```

### Get Balances
```dart
final balances = await node.listBalances();
print('On-chain: ${balances.spendableOnchainBalanceSats} sats');
print('Lightning: ${balances.totalLightningBalanceSats} sats');
```

### Generate On-Chain Address
```dart
final onChain = await node.onChainPayment();
final address = await onChain.newAddress();
return address.s;
```

## File Organization (Example App)
- Services: `/lib/services/` - Lightning service wrapper
- Models: `/lib/models/` - App-specific data models
- Screens: `/lib/screens/` - UI screens
- Widgets: `/lib/widgets/` - Reusable widgets
- Providers: `/lib/providers/` - State management

## Don't Forget
- `Mnemonic.generate()` is async - use `await`
- Store mnemonics securely with `flutter_secure_storage`
- Never use mainnet without explicit user request
- Call `node.stop()` when disposing
- Call `node.eventHandled()` after processing each event
