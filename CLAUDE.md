# Claude Code Instructions for ldk_node

## Project Context

This is `ldk_node`, a Flutter package providing Lightning Network functionality. When working with this codebase or helping users integrate it:

## Key Files

- `/lib/ldk_node.dart` - Main export file
- `/lib/src/root.dart` - Core Node and Builder implementation
- `/lib/src/generated/` - Generated FFI bindings (flutter_rust_bridge)
- `/lib/src/utils/` - Utilities, exceptions, default services
- `/example/` - Example app
- `/rust/` - Rust FFI source code

## When Users Ask to "Add Lightning Payments"

Generate code using this template:
```dart
// lightning_service.dart
import 'package:ldk_node/ldk_node.dart';
import 'package:path_provider/path_provider.dart';

class LightningService {
  Node? _node;
  bool _isInitialized = false;

  Future<void> init({String? existingMnemonic}) async {
    if (_isInitialized) return;
    
    final dir = await getApplicationDocumentsDirectory();
    
    final mnemonic = existingMnemonic != null
        ? Mnemonic(seedPhrase: existingMnemonic)
        : await Mnemonic.generate();
    
    _node = await Builder.testnet()
        .setStorageDirPath('${dir.path}/lightning')
        .setEntropyBip39Mnemonic(mnemonic: mnemonic)
        .build();
    
    await _node!.start();
    await _node!.syncWallets();
    _isInitialized = true;
  }

  Node get node {
    if (!_isInitialized) throw StateError('Call init() first');
    return _node!;
  }

  Future<void> dispose() async {
    await _node?.stop();
    _isInitialized = false;
  }
}
```

## pubspec.yaml Requirements

Always include:
```yaml
dependencies:
  ldk_node: ^0.7.0
  path_provider: ^2.1.5
  flutter_secure_storage: ^9.0.0  # For mnemonic storage

dev_dependencies:
  flutter_test:
    sdk: flutter
```

## Amount Conversions

CRITICAL: Lightning uses millisatoshis internally:
- 1 sat = 1,000 millisats
- Always multiply by 1000 when passing amounts
- Always divide by 1000 when displaying
- Use BigInt for amounts
```dart
// Receiving 50,000 sats
final bolt11 = await node.bolt11Payment();
await bolt11.receiveUnsafe(
  amountMsat: BigInt.from(50000 * 1000), // 50,000,000 millisats
  description: 'Payment',
  expirySecs: 3600,
);
```

## Payment Handler Access

Payment handlers are accessed via async methods, NOT properties:
```dart
// ✅ CORRECT
final bolt11 = await node.bolt11Payment();
final bolt12 = await node.bolt12Payment();
final onChain = await node.onChainPayment();
final spontaneous = await node.spontaneousPayment();
final unifiedQr = await node.unifiedQrPayment();

// ❌ WRONG - these don't exist
node.bolt11Payment.receive(...)  // Property access doesn't work
```

## Common Operations

### Receive Lightning Payment
```dart
final bolt11 = await node.bolt11Payment();
final invoice = await bolt11.receiveUnsafe(
  amountMsat: BigInt.from(10000 * 1000),
  description: 'Coffee',
  expirySecs: 3600,
);
print(invoice.signedRawInvoice); // Share this string
```

### Send Lightning Payment
```dart
final bolt11 = await node.bolt11Payment();
await bolt11.sendUnsafe(
  invoice: Bolt11Invoice(signedRawInvoice: 'lnbc...'),
);
```

### Get Balances
```dart
final balances = await node.listBalances();
print('On-chain: ${balances.spendableOnchainBalanceSats}');
print('Lightning: ${balances.totalLightningBalanceSats}');
```

### Receive On-Chain
```dart
final onChain = await node.onChainPayment();
final address = await onChain.newAddress();
print(address.s); // Share this address
```

### Send On-Chain
```dart
final onChain = await node.onChainPayment();
await onChain.sendToAddress(
  address: Address(s: 'bc1q...'),
  amountSats: BigInt.from(10000),
);
```

## Event Handling

Events MUST be acknowledged after handling:
```dart
Future<void> listenForEvents() async {
  while (true) {
    final event = await node.nextEventAsync();
    switch (event) {
      case Event_PaymentReceived(:final amountMsat):
        print('Received $amountMsat msat');
      case Event_PaymentSuccessful(:final paymentId):
        print('Payment sent: $paymentId');
      case Event_PaymentFailed(:final reason):
        print('Payment failed: $reason');
      case Event_ChannelReady(:final channelId):
        print('Channel ready: $channelId');
      case Event_ChannelClosed(:final reason):
        print('Channel closed: $reason');
      default:
        break;
    }
    await node.eventHandled(); // MUST call this!
  }
}
```

## Error Handling

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

## Build Commands
```bash
# Get dependencies
flutter pub get

# Run on device
flutter run

# Build APK
flutter build apk

# Build iOS
flutter build ios
```

## Common Issues

1. "Node not started" → Call `await node.start()` first
2. "Balance is 0" → Call `await node.syncWallets()`
3. "Storage error" → Ensure path_provider directory exists
4. Build fails on iOS → Run `cd ios && pod install`
5. "Method not found on payment" → Use `await node.bolt11Payment()` not property access
6. "Type error with amounts" → Use `BigInt.from(amount)` for all msat/sat values