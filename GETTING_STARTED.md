# Getting Started with ldk_node

Complete step-by-step guide to get your first Bitcoin/Lightning app running.

## Prerequisites

- Flutter 3.0+ installed
- Basic Dart/Flutter knowledge
- A code editor (VS Code, Android Studio, or IntelliJ)

## 5-Minute Quick Start

### 1. Create Flutter Project

```bash
flutter create my_bitcoin_app
cd my_bitcoin_app
```

### 2. Add Dependencies

Edit `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  ldk_node: ^0.7.0
  path_provider: ^2.1.5
  flutter_secure_storage: ^9.0.0  # For secure mnemonic storage
```

Install:
```bash
flutter pub get
```

### 3. Create Lightning Service

Create `lib/services/lightning_service.dart`:

```dart
import 'package:ldk_node/ldk_node.dart';
import 'package:path_provider/path_provider.dart';

class LightningService {
  late Node _node;
  
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    final storagePath = '${dir.path}/ldk_node';
    
    _node = await Builder.testnet()
        .setStorageDirPath(storagePath)
        .setEntropyBip39Mnemonic(
          mnemonic: await Mnemonic.generate(),
        )
        .build();
    
    await _node.start();
    await _node.syncWallets();
  }
  
  Future<String> createInvoice(int amountSats) async {
    final bolt11 = await _node.bolt11Payment();
    final invoice = await bolt11.receiveUnsafe(
      amountMsat: BigInt.from(amountSats * 1000),
      description: 'Payment',
      expirySecs: 3600,
    );
    return invoice.signedRawInvoice;
  }
  
  Future<void> dispose() async {
    await _node.stop();
  }
}
```

### 4. Use in App

Create `lib/main.dart`:

```dart
import 'package:flutter/material.dart';
import 'services/lightning_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Wallet',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LightningService _service;
  String _invoice = '';
  
  @override
  void initState() {
    super.initState();
    _initService();
  }
  
  Future<void> _initService() async {
    _service = LightningService();
    await _service.initialize();
  }
  
  Future<void> _createInvoice() async {
    try {
      final invoice = await _service.createInvoice(1000); // 1000 sats
      setState(() {
        _invoice = invoice;
      });
    } catch (e) {
      print('Error: $e');
    }
  }
  
  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bitcoin Wallet')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _createInvoice,
              child: const Text('Create Invoice'),
            ),
            SizedBox(height: 20),
            if (_invoice.isNotEmpty)
              SelectableText(_invoice)
          ],
        ),
      ),
    );
  }
}
```

### 5. Run It

```bash
flutter run
```

**Success!** ✅ You have a working Bitcoin wallet.

---

## Step-by-Step Learning Path

### Level 1: Basics (30 minutes)

**Goal**: Understand the core concepts

1. **Read**: [Core Concepts](#core-concepts-explained) section
2. **Watch**: LDK Node basics (5 min search for tutorials)
3. **Do**: Complete the Quick Start above

**Checkpoint**: Can you explain what a Lightning node is?

---

### Level 2: Wallets (1 hour)

**Goal**: Create a functional wallet

1. **Create on-chain wallet**:
   ```dart
   final onChain = await node.onChainPayment();
   final address = await onChain.newAddress();
   ```

2. **Check balance**:
   ```dart
   final balances = await node.listBalances();
   ```

3. **Fund wallet**:
   - Visit [Bitcoin Testnet Faucet](https://testnet-faucet.mempool.space)
   - Send to your address
   - Wait for confirmation
   - Check balance updates

**Checkpoint**: Can you generate an address and check the balance?

---

### Level 3: Lightning Invoices (1-2 hours)

**Goal**: Send and receive Lightning payments

1. **Receive payment**:
   - Create invoice
   - Share with friend/test app
   - Wait for payment
   - Handle event

2. **Send payment**:
   - Get invoice from friend
   - Send payment
   - Confirm success

3. **Handle errors**:
   - Try paying expired invoice
   - Try paying without channel
   - Understand error messages

**Checkpoint**: Can you create and pay a Lightning invoice?

---

### Level 4: Channels (2 hours)

**Goal**: Open Lightning channels

1. **Fund on-chain wallet** (see Level 2)

2. **Open channel**:
   ```dart
   await node.openChannel(
     nodeId: 'recipient_node_id',
     address: 'recipient_address',
     channelAmountSats: BigInt.from(100000),
   );
   ```

3. **Wait for confirmation**: Channels take time to confirm

4. **Send payment**: Now you have channel capacity

**Checkpoint**: Can you open a channel and send payment?

---

### Level 5: Advanced (3+ hours)

**Goal**: Production-ready app

Topics:
1. LSP integration for automatic channels
2. BOLT12 offers for recurring payments
3. Event handling in background
4. Security best practices
5. Backup and restore
6. Fee rate management

**Checkpoint**: Can you build all above features?

---

## Core Concepts Explained

### What is Bitcoin?

- Decentralized currency
- Payments recorded on "blockchain"
- Slow but secure (~10 min confirmation)
- "On-chain" payments

### What is Lightning Network?

- Layer 2 protocol on Bitcoin
- Fast payments (~seconds)
- Instant confirmation
- Lower fees
- "Off-chain" payments
- Needs payment channels

### What is a Payment Channel?

- Two people lock Bitcoin together
- Can send back-and-forth instantly
- Settlement on blockchain when done
- "Channel opening" = creating the lock
- "Channel closing" = settling on blockchain

### What is LDK Node?

- Software that manages channels
- Runs on your phone
- Non-custodial (you control keys)
- Handles payments automatically
- Syncs with blockchain periodically

### Key Terms

| Term | Meaning |
|------|---------|
| **Node** | Your Lightning software running locally |
| **Channel** | Connection between two nodes for payments |
| **BOLT11** | Type of Lightning invoice (single-use) |
| **BOLT12** | Type of offer (reusable) |
| **Keysend** | Send without invoice |
| **Mnemonic** | Seed phrase for wallet recovery |
| **Testnet** | Practice Bitcoin (not real) |
| **Mainnet** | Real Bitcoin (real money) |
| **Sats** | Smallest Bitcoin unit (1 BTC = 100M sats) |
| **msat** | Millisat (1 sat = 1000 msat) |

---

## Common Questions

### Q: Is this for real money?

**A**: No, start on **testnet** for free practice Bitcoin.

### Q: How do I get test Bitcoin?

**A**: Use a [Bitcoin Testnet Faucet](https://testnet-faucet.mempool.space)

### Q: How long do channels take?

**A**: Channel opening takes 1-6 blocks (~10-60 min on Bitcoin testnet)

### Q: Can I restore my wallet?

**A**: Yes! Save your mnemonic and use it to restore later

### Q: What if I lose my phone?

**A**: Your Bitcoin is safe with your mnemonic (seed phrase)

### Q: How much fee do I pay?

**A**: Varies. Lightning is usually <1 sat. On-chain depends on network.

### Q: Is this secure?

**A**: Yes, if you follow security practices (see DOCUMENTATION.md)

### Q: Can I use mainnet?

**A**: Only after testing thoroughly on testnet! Real money involved.

---

## Common Errors & Solutions

### Error: "NodeNotRunning"

**Cause**: Forgot `await node.start()`

**Solution**:
```dart
await node.start();  // Add this!
```

### Error: "Balance shows 0"

**Cause**: Didn't sync wallets

**Solution**:
```dart
await node.syncWallets();  // Add this!
```

### Error: "No route path"

**Cause**: Need to open a channel first

**Solution**:
```dart
// Step 1: Fund wallet with on-chain Bitcoin
// Step 2: Open channel with someone
// Step 3: Then send Lightning payment
```

### Error: "Invoice expired"

**Cause**: Invoice was too old

**Solution**:
```dart
// Create new invoice - they have 1 hour expiry
```

### Error: "Mnemonic not found"

**Cause**: App was reinstalled/reset

**Solution**:
```dart
// Restore from saved mnemonic (use flutter_secure_storage)
```

---

## Next Steps

### After Quick Start

1. ✅ Run the basic example
2. ✅ Create on-chain wallet
3. ✅ Create Lightning invoice
4. ✅ Understand the concepts

### Build Your App

1. Design UI for your use case
2. Integrate Lightning features gradually
3. Test thoroughly on testnet
4. Add security practices
5. Move to mutinynet for LSP
6. Only then consider mainnet

### Deep Dive Resources

- [Full DOCUMENTATION.md](./DOCUMENTATION.md) - Complete API guide
- [AGENTS.md](./AGENTS.md) - Architecture and patterns
- [Examples](./examples/ai-ready/) - Complete working examples
- [LDK Docs](https://docs.rs/lightning/) - Rust LDK reference
- [BDK Docs](https://docs.rs/bdk/) - Bitcoin wallet reference

---

## Useful Links

**Learning**:
- [Bitcoin Explained](https://en.bitcoin.it/wiki/Main_Page)
- [Lightning Network](https://lightning.network)
- [LDK](https://lightningdevkit.org)
- [BDK](https://bitcoindevkit.org)

**Testing**:
- [Bitcoin Testnet Faucet](https://testnet-faucet.mempool.space)
- [Mutinynet Faucet](https://faucet.mutinynet.com)
- [Block Explorer Testnet](https://testnet.mempool.space)
- [Mutinynet Explorer](https://mutinynet.lightningdevkit.org)

**Tools**:
- [Mutiny Wallet](https://app.mutinywallet.com) - Test with real app
- [Amboss](https://amboss.space) - Node explorer
- [1ML](https://1ml.com) - Lightning network stats

---

## Getting Help

### Stuck?

1. Check [Common Errors](#common-errors--solutions) above
2. Read [DOCUMENTATION.md](./DOCUMENTATION.md)
3. Search [GitHub Issues](https://github.com/LtbLightning/ldk_node_flutter/issues)
4. Open new issue with:
   - What you're trying to do
   - Error message
   - Your code
   - What you've tried

### Want to Contribute?

See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

---

## Congratulations! 🎉

You've learned the basics of building Bitcoin and Lightning apps with Flutter!

**Next**: Pick a project and build it. Start small, test on testnet, then grow.

**Questions?** Open an issue or check the full documentation.

**Happy building!** ⚡🔥
