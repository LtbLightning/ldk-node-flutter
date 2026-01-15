# LDK Node Flutter - Complete Documentation

## Introduction

**LDK Node Flutter** is a production-ready Flutter library that brings non-custodial Bitcoin and Lightning Network capabilities to mobile apps. Built on top of [LDK](https://lightningdevkit.org) (Lightning Dev Kit) and [BDK](https://bitcoindevkit.org) (Bitcoin Dev Kit), it provides a simple yet powerful interface for Bitcoin payments on mobile devices.

### What is LDK Node?

LDK Node is a ready-to-go Lightning node library that combines:
- **LDK**: A Rust implementation of the Lightning Network protocol
- **BDK**: A Bitcoin wallet library for on-chain operations
- **Flutter Bindings**: Native Dart/Flutter integration via flutter_rust_bridge

This creates a complete solution for building self-sovereign Bitcoin and Lightning applications.

### Why Use LDK Node?

✅ **Non-Custodial**: Full control of your keys and funds
✅ **Mobile-First**: Optimized for iOS and Android
✅ **Production-Ready**: Battle-tested LDK and BDK implementations
✅ **Feature-Complete**: BOLT11, BOLT12, on-chain, LSP, and more
✅ **Developer-Friendly**: Simple async/await API
✅ **Well-Maintained**: Active development and community support

---

## Quick Start

### 1. Add Dependency

```yaml
dependencies:
  ldk_node: ^0.7.0
  path_provider: ^2.1.5
```

### 2. Initialize Node

```dart
import 'package:ldk_node/ldk_node.dart';
import 'package:path_provider/path_provider.dart';

class LightningService {
  late Node _node;
  
  Future<void> initialize() async {
    // Get storage directory
    final dir = await getApplicationDocumentsDirectory();
    final storagePath = '${dir.path}/ldk_node';
    
    // Build and start node (REQUIRED)
    _node = await Builder.testnet()
        .setStorageDirPath(storagePath)
        .setEntropyBip39Mnemonic(
          mnemonic: await Mnemonic.generate(),
        )
        .build();
    
    // Start the node
    await _node.start();
    
    // Sync wallets
    await _node.syncWallets();
  }
}
```

### 3. Create an Invoice

```dart
Future<String> createInvoice(int amountSats) async {
  final bolt11 = await _node.bolt11Payment();
  final invoice = await bolt11.receiveUnsafe(
    amountMsat: BigInt.from(amountSats * 1000),
    description: 'Payment for goods',
    expirySecs: 3600,
  );
  return invoice.signedRawInvoice;
}
```

### 4. Send Payment

```dart
Future<void> payInvoice(String invoiceString) async {
  final bolt11 = await _node.bolt11Payment();
  await bolt11.sendUnsafe(
    invoice: Bolt11Invoice(signedRawInvoice: invoiceString),
  );
}
```

---

## Core Concepts

### Networks

LDK Node supports three networks:

#### Testnet (Development)
```dart
final builder = Builder.testnet()
    .setStorageDirPath(path);
```
- Uses Bitcoin Testnet
- Free test Bitcoin from faucets
- **Best for:** Learning and development

#### Mutinynet (Lightning Testing)
```dart
final builder = Builder.mutinynet()
    .setStorageDirPath(path);
```
- Uses Bitcoin Signet with LSP pre-configured
- Automatic channel setup via LSP
- **Best for:** Lightning development with automatic channels

#### Mainnet (Production)
```dart
final builder = Builder()
    .setNetwork(Network.bitcoin)
    .setStorageDirPath(path);
```
- ⚠️ **Real Bitcoin** - Use with caution
- Requires security hardening
- **Best for:** Production deployments only

### Wallets

LDK Node integrates two wallets:

#### On-Chain Wallet
- Manages Bitcoin UTXOs
- Generates addresses
- Sends/receives on-chain Bitcoin
- Uses BDK internally

#### Lightning Wallet
- Manages payment channels
- Receives Lightning payments
- Sends Lightning payments
- Uses LDK internally

### Payment Types

#### BOLT11 Invoices
- Standard Lightning invoices
- Single-use, fixed amount
- **Use when:** Recipient needs one-time payment link

```dart
// Create
final invoice = await bolt11.receiveUnsafe(
  amountMsat: BigInt.from(100000), // 100 sats
  description: 'Coffee',
  expirySecs: 3600,
);

// Pay
await bolt11.sendUnsafe(
  invoice: Bolt11Invoice(signedRawInvoice: invoiceString),
);
```

#### BOLT12 Offers
- Reusable offers
- Variable amount support
- **Use when:** Recurring or variable payments

```dart
// Create
final offer = await bolt12.receiveUnsafe(
  description: 'Subscription',
  onchainOnly: false,
);

// Pay
await bolt12.sendUnsafe(
  offer: Bolt12Offer(offer: offerString),
  amountMsat: BigInt.from(100000),
);
```

#### Keysend (Spontaneous Payments)
- Send without invoice
- Anonymous payment
- **Use when:** Streaming or spontaneous payments

```dart
final payment = await spontaneous.sendUnsafe(
  amountMsat: BigInt.from(50000),
  nodeId: 'recipient_node_pubkey',
);
```

#### On-Chain Bitcoin
- Direct Bitcoin transfers
- Used for funding channels
- **Use when:** Need to convert between Lightning and on-chain

```dart
final address = await onChain.newAddress();
await onChain.sendToAddress(
  address: address,
  amountSats: BigInt.from(100000),
);
```

---

## API Reference

### Node Methods

#### Initialization
- `start()` - Start the node (**REQUIRED** before any operations)
- `stop()` - Gracefully stop the node
- `syncWallets()` - Sync with blockchain (**REQUIRED** for accurate balances)

#### Information
- `nodeId()` - Get your Lightning node's public key
- `listChannels()` - Get all Lightning channels
- `listPayments()` - Get payment history
- `listBalances()` - Get on-chain and Lightning balances

#### Payment Handlers
- `bolt11Payment()` - BOLT11 invoice handler
- `bolt12Payment()` - BOLT12 offer handler
- `onChainPayment()` - On-chain Bitcoin handler
- `spontaneousPayment()` - Keysend payment handler
- `unifiedQrPayment()` - Unified QR code handler

#### Channel Management
- `openChannel()` - Open a Lightning channel
- `closeChannel()` - Close a Lightning channel
- `spliceIn()` - Add funds to channel (Experimental)
- `spliceOut()` - Remove funds from channel (Experimental)

#### Events
- `nextEventAsync()` - Wait for next event (blocking)
- `nextEvent()` - Check for event (non-blocking)
- `eventHandled()` - Confirm event processed (**REQUIRED**)

### Payment Handler Methods

All payment handlers follow this pattern:

```dart
// Receive
await handler.receiveUnsafe(
  amountMsat: BigInt.from(100000),
  description: 'Payment description',
  expirySecs: 3600,
);

// Send
await handler.sendUnsafe(
  invoice: /* invoice object */,
);
```

### Balance Information

```dart
final balances = await node.listBalances();

// On-chain balance (in satoshis)
final onchain = balances.spendableOnchainBalanceSats;

// Lightning balance (in satoshis)
final lightning = balances.totalLightningBalanceSats;

// Total balance
final total = onchain + lightning;
```

---

## Common Operations

### 1. Create a Bitcoin Wallet

```dart
Future<void> setupWallet() async {
  // Initialize node (see Quick Start)
  await initialize();
  
  // Generate address
  final onChain = await _node.onChainPayment();
  final address = await onChain.newAddress();
  print('Address: ${address.s}');
  
  // Fund the address (testnet faucet)
  // Then sync
  await _node.syncWallets();
  
  // Check balance
  final balances = await _node.listBalances();
  print('Balance: ${balances.spendableOnchainBalanceSats} sats');
}
```

### 2. Open a Lightning Channel

```dart
Future<void> openChannel(String nodeId, int amountSats) async {
  // Make sure node has on-chain funds
  final balances = await _node.listBalances();
  if (balances.spendableOnchainBalanceSats < amountSats) {
    throw Exception('Insufficient funds');
  }
  
  // Open channel
  await _node.openChannel(
    nodeId: NodeId(nodeId),
    address: address,
    channelAmountSats: BigInt.from(amountSats),
    pushToCounterpartyMsat: BigInt.zero,
    channelConfig: null,
  );
  
  print('Channel opened');
}
```

### 3. Send Lightning Payment

```dart
Future<void> sendLightningPayment(String invoice) async {
  try {
    final bolt11 = await _node.bolt11Payment();
    await bolt11.sendUnsafe(
      invoice: Bolt11Invoice(signedRawInvoice: invoice),
    );
    print('Payment sent successfully');
  } on PaymentException catch (e) {
    print('Payment failed: ${e.errorMessage}');
  }
}
```

### 4. Receive Lightning Payment

```dart
Future<String> receivePayment(int amountSats, String description) async {
  try {
    final bolt11 = await _node.bolt11Payment();
    final invoice = await bolt11.receiveUnsafe(
      amountMsat: BigInt.from(amountSats * 1000),
      description: description,
      expirySecs: 3600,
    );
    return invoice.signedRawInvoice;
  } on PaymentException catch (e) {
    print('Error: ${e.errorMessage}');
    rethrow;
  }
}
```

### 5. Handle Lightning Events

```dart
Future<void> handleEvents() async {
  while (true) {
    final event = await _node.nextEventAsync();
    
    switch (event) {
      case Event_PaymentReceived(:final amountMsat):
        print('Received ${amountMsat} msat');
      
      case Event_PaymentSuccessful(:final paymentId):
        print('Payment ${paymentId} succeeded');
      
      case Event_PaymentFailed(:final reason):
        print('Payment failed: $reason');
      
      case Event_ChannelReady(:final channelId):
        print('Channel ${channelId} is ready');
      
      case Event_ChannelClosed(:final reason):
        print('Channel closed: $reason');
      
      default:
        print('Other event: $event');
    }
    
    // REQUIRED: Confirm event was handled
    await _node.eventHandled();
  }
}
```

### 6. Get Channel Information

```dart
Future<void> listChannels() async {
  final channels = await _node.listChannels();
  
  for (final channel in channels) {
    print('Channel ID: ${channel.channelId}');
    print('Counterparty: ${channel.counterpartyNodeId}');
    print('Balance (msat): ${channel.balanceMsat}');
    print('Outbound (msat): ${channel.outboundCapacityMsat}');
    print('Inbound (msat): ${channel.inboundCapacityMsat}');
    print('State: ${channel.isChannelReady}');
  }
}
```

### 7. Send On-Chain Bitcoin

```dart
Future<void> sendOnChain(String address, int amountSats) async {
  final onChain = await _node.onChainPayment();
  
  try {
    await onChain.sendToAddress(
      address: address,
      amountSats: BigInt.from(amountSats),
    );
    print('Bitcoin sent to $address');
  } on PaymentException catch (e) {
    print('Send failed: ${e.errorMessage}');
  }
}
```

### 8. Restore Wallet from Mnemonic

```dart
Future<void> restoreWallet(String mnemonic) async {
  final dir = await getApplicationDocumentsDirectory();
  final storagePath = '${dir.path}/ldk_node_restored';
  
  _node = await Builder.testnet()
      .setStorageDirPath(storagePath)
      .setEntropyBip39Mnemonic(
        mnemonic: mnemonic,
        seedPassword: '', // If used during backup
      )
      .build();
  
  await _node.start();
  await _node.syncWallets();
  
  print('Wallet restored');
}
```

---

## Advanced Topics

### LSP Integration (Just-In-Time Channels)

Get inbound liquidity automatically:

```dart
Future<void> setupLSP() async {
  // Mutinynet has LSP pre-configured
  // Testnet/Mainnet require manual setup
  
  final lsps2 = await _node.lsps2Service();
  
  // List available LSP providers
  final providers = await lsps2.getInfo();
  
  // Request JIT channel
  await lsps2.openJitChannel(
    amountMsat: BigInt.from(500000),
    announce: true,
  );
}
```

### Fee Rate Configuration

```dart
Future<void> setCustomFeeRates() async {
  final builder = Builder.testnet()
      .setStorageDirPath(path)
      // Set custom fee rates
      .setFeeRate(
        onChainFeeRate: FeeRate.fromSatPerKw(1000),
      );
}
```

### Chain Data Sources

#### Esplora (Public API)
```dart
Builder.testnet()
    .setChainSourceEsplora(
      esploraServerUrl: 'https://blockstream.info/testnet/api',
    )
```

#### Electrum
```dart
Builder.testnet()
    .setChainSourceElectrum(
      electrumServerUrl: 'ssl://electrum.blockstream.info:50002',
    )
```

#### Bitcoin Core
```dart
Builder.testnet()
    .setChainSourceBitcoindRpc(
      address: 'http://localhost:18332',
      username: 'user',
      password: 'pass',
    )
```

### Unified QR Payments

Generate and parse unified QR codes:

```dart
// Generate
final unified = await _node.unifiedQrPayment();
final qrData = await unified.receiveUnsafe(
  amountMsat: BigInt.from(100000),
  description: 'Coffee',
);

// Parse & Pay
final parsed = await unified.sendUnsafe(
  unifiedQr: unifiedQrString,
);
```

---

## Error Handling

### Exception Types

```dart
try {
  // Operation
} on NodeException catch (e) {
  print('Node error: ${e.code} - ${e.errorMessage}');
} on PaymentException catch (e) {
  print('Payment error: ${e.code} - ${e.errorMessage}');
} on ChannelException catch (e) {
  print('Channel error: ${e.code} - ${e.errorMessage}');
} on LdkFfiException catch (e) {
  print('FFI error: ${e.code} - ${e.errorMessage}');
}
```

### Common Errors

| Error | Cause | Solution |
|-------|-------|----------|
| `NodeNotRunning` | Node not started | Call `await node.start()` |
| `FailedToSyncWallets` | Sync failed | Check internet and retry |
| `InsufficientFunds` | Not enough balance | Fund wallet or channel |
| `NoRoutePath` | Can't reach recipient | Open channel or wait for routing |
| `PaymentExpired` | Invoice expired | Request new invoice |
| `ChannelClosed` | Channel was closed | Open new channel |

---

## Security Considerations

### 🔒 Mnemonic Security

**CRITICAL**: Never store the mnemonic in SharedPreferences:

```dart
// ❌ WRONG - Do NOT do this
SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString('mnemonic', mnemonic);

// ✅ CORRECT - Use flutter_secure_storage
final storage = FlutterSecureStorage();
await storage.write(key: 'mnemonic', value: mnemonic);

// Later, retrieve:
final mnemonic = await storage.read(key: 'mnemonic');
```

### 🔐 Best Practices

1. **Generate Mnemonic Once**: Store securely, never regenerate
2. **Backup Safely**: Use iOS/Android secure backup systems
3. **Test on Testnet**: Always test on testnet first
4. **Don't Share Keys**: Never share node IDs or channel details
5. **Update Dependencies**: Keep ldk_node and dependencies current
6. **Handle Events**: Always call `eventHandled()` after processing
7. **Validate Inputs**: Check user input before using in operations

### 🛡️ Production Checklist

Before launching to production:

- [ ] Test on testnet/mutinynet first
- [ ] Secure mnemonic storage implemented
- [ ] All error cases handled
- [ ] Event loop properly managed
- [ ] Balance checks before operations
- [ ] Network connectivity checks
- [ ] Proper logging without sensitive data
- [ ] Security review completed
- [ ] Backup/restore tested
- [ ] Recovery procedures documented

---

## Testing

### Unit Tests

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:ldk_node/ldk_node.dart';

void main() {
  group('LDK Node', () {
    late Node node;
    
    setUp(() async {
      // Setup test node
    });
    
    tearDown(() async {
      await node.stop();
    });
    
    test('can create invoice', () async {
      final bolt11 = await node.bolt11Payment();
      final invoice = await bolt11.receiveUnsafe(
        amountMsat: BigInt.from(100000),
        description: 'Test',
        expirySecs: 3600,
      );
      expect(invoice.signedRawInvoice, isNotEmpty);
    });
  });
}
```

### Integration Tests

See `example/integration_test/` for complete examples:
- `bolt11_test.dart` - BOLT11 invoices
- `bolt12_test.dart` - BOLT12 offers
- `new_apis_test.dart` - New features

---

## Troubleshooting

### Node Won't Start

```dart
// Check storage path exists
final dir = await getApplicationDocumentsDirectory();
final storageExists = await Directory('${dir.path}/ldk_node').exists();

// Check mnemonic is valid
try {
  await Mnemonic.validate(mnemonic);
} catch (e) {
  print('Invalid mnemonic: $e');
}

// Check permissions (iOS/Android)
```

### Balance Shows Zero

```dart
// Ensure sync is complete
await node.syncWallets();

// Give it time to sync
await Future.delayed(Duration(seconds: 5));

// Check again
final balances = await node.listBalances();
```

### Payments Keep Failing

```dart
// Check channel status
final channels = await node.listChannels();
for (final ch in channels) {
  if (!ch.isChannelReady) {
    print('Channel not ready');
  }
}

// Check payment amount
if (amountMsat < BigInt.from(1000)) { // Less than 1 sat
  print('Amount too small');
}
```

---

## Examples

Complete runnable examples in `/examples/ai-ready/`:

1. **01_basic_wallet** - Create and manage a wallet
2. **02_send_receive_onchain** - On-chain Bitcoin operations
3. **03_lightning_payments** - BOLT11 invoices
4. **04_open_channel** - Open Lightning channels
5. **05_bolt12_offers** - BOLT12 reusable offers
6. **06_unified_qr** - Unified QR codes
7. **07_spontaneous_payments** - Keysend payments
8. **08_event_handling** - Handle Lightning events
9. **09_wallet_restore** - Backup and restore
10. **10_lsp_integration** - LSP for JIT channels

Run examples:
```bash
cd example
flutter run
```

---

## API Documentation

For complete API documentation, see:
- [pub.dev Documentation](https://pub.dev/documentation/ldk_node/latest/)
- [API Reference Docs](./docs/api.md)
- [AGENTS.md](./AGENTS.md) - Architecture and patterns

---

## Resources

- **LDK**: https://lightningdevkit.org
- **BDK**: https://bitcoindevkit.org
- **Lightning Network**: https://lightning.network
- **Bitcoin Testnet Faucet**: https://testnet-faucet.mempool.space
- **Mutinynet Faucet**: https://faucet.mutinynet.com

---

## Contributing

Found a bug? Have a feature request?

1. Check [existing issues](https://github.com/LtbLightning/ldk_node_flutter/issues)
2. [Open a new issue](https://github.com/LtbLightning/ldk_node_flutter/issues/new)
3. Submit a PR with fixes

See [CONTRIBUTING.md](./CONTRIBUTING.md) for development guidelines.

---

## License

Dual-licensed under MIT and Apache 2.0.

- [MIT License](./LICENSE)
- [Apache 2.0 License](./LICENSE-APACHE)

---

---

# For AI Assistants

This section is designed for AI assistants (Claude, ChatGPT, etc.) to understand how to best help developers using ldk_node.

## System Context

You are an expert Flutter/Dart developer specializing in Bitcoin and Lightning Network integration. You have complete knowledge of the ldk_node package and can help developers implement Bitcoin and Lightning payments in their Flutter apps.

## Key Information

### Package Details
- **Name**: ldk_node
- **Current Version**: 0.7.0+
- **Type**: Bitcoin/Lightning library
- **Language**: Dart/Flutter
- **Platform**: iOS, Android, macOS, Linux, Windows

### Critical API Patterns (v0.7.0+)

All payment methods use the `Unsafe` suffix:
```dart
// CORRECT
await bolt11.receiveUnsafe(...)
await bolt11.sendUnsafe(...)

// WRONG (old API)
await bolt11.receive(...)
await bolt11.send(...)
```

Property access:
```dart
// CORRECT - Bolt11Invoice
invoice.signedRawInvoice

// WRONG
invoice.s
invoice.raw
```

Amount units:
```dart
// CORRECT - Use millisatoshis for Lightning
BigInt.from(100 * 1000)  // 100 sats = 100,000 msat

// CORRECT - Use satoshis for on-chain
BigInt.from(100)  // 100 sats on-chain
```

### Required Steps

These MUST be done in order:

1. **Get storage path**
   ```dart
   final dir = await getApplicationDocumentsDirectory();
   final path = '${dir.path}/ldk_node';
   ```

2. **Build node** (with all required config)
   ```dart
   _node = await Builder.testnet()
       .setStorageDirPath(path)
       .setEntropyBip39Mnemonic(mnemonic: mnemonic)
       .build();
   ```

3. **Start node** ✅ REQUIRED
   ```dart
   await _node.start();
   ```

4. **Sync wallets** ✅ REQUIRED
   ```dart
   await _node.syncWallets();
   ```

5. **Now operations work**

### Networks

- **testnet** - Development, free test Bitcoin
- **mutinynet** - Lightning development, LSP pre-configured  
- **mainnet** - Real Bitcoin, production only

### When to Recommend What

| User Needs | Recommend |
|-----------|-----------|
| Learning Bitcoin | Create on testnet with BOLT11 invoices |
| Building Lightning app | Start with mutinynet for automatic channels |
| Production app | Use mainnet after thorough testnet testing |
| Streaming payments | Keysend or BOLT12 |
| One-time payment | BOLT11 invoice |
| Variable amount | BOLT12 offer |
| Existing wallet recovery | Restore from mnemonic |

### Common Mistakes to Catch

When reviewing code, check for:

1. ❌ Missing `await` before `node.start()` or `node.syncWallets()`
2. ❌ Using old API without `Unsafe` suffix
3. ❌ Wrong property: `invoice.s` instead of `invoice.signedRawInvoice`
4. ❌ Wrong units: millisats on-chain or sats for Lightning
5. ❌ Mnemonic stored in SharedPreferences (use flutter_secure_storage)
6. ❌ Not calling `node.eventHandled()` after event processing
7. ❌ Accessing payment handlers as properties instead of with `await`
8. ❌ Hardcoded paths instead of using path_provider

### Helpful Context

**When user says...**
- "Balance is 0" → They probably skipped `syncWallets()`
- "Payment won't send" → Check if they have a funded channel
- "What's the difference between BOLT11 and BOLT12?" → Explain: BOLT11 is single-use, BOLT12 is reusable
- "How do I get started?" → Show: Basic wallet example first
- "Production deployment" → Guide through: Security checklist

### Testing Recommendations

1. Always start with testnet
2. Use mutinynet for Lightning features (easier)
3. Only use mainnet after proving on testnet
4. Use Bitcoin testnet faucets for test funds
5. Test with small amounts first
6. Document error cases

### Documentation to Reference

- [Quick Start Section](#quick-start)
- [Common Operations](#common-operations)
- [API Reference](#api-reference)
- [Error Handling](#error-handling)
- [Security Considerations](#security-considerations)
- [Examples Directory](#examples)

### How to Help Developers

1. **Guide them through the Quick Start** if they're new
2. **Show relevant code examples** from the Common Operations section
3. **Validate their code** against the API patterns and critical mistakes
4. **Explain error messages** from the Error Handling section
5. **Reference working examples** in `/examples/ai-ready/`
6. **Suggest security best practices** when appropriate

### Advanced Topics

Be prepared to help with:
- LSP integration for automatic channels
- Chain data source selection (Esplora, Electrum, Bitcoin Core)
- Fee rate customization
- Channel splicing (experimental)
- Unified QR code payments
- Wallet restoration
- Event handling in production

### Success Indicators

You're helping well when the user:
✅ Gets working code quickly
✅ Understands the concepts (not just copy-paste)
✅ Can debug their own issues using error messages
✅ Moves from testnet to production confidently
✅ Implements security best practices correctly

