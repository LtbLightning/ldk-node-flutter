# AI-Ready Examples for ldk_node Flutter

This directory contains AI-optimized prompts that help developers (and AI assistants) build Lightning applications with the `ldk_node` Flutter package.

## 📋 What's Inside

Each folder contains a `PROMPT.md` with:
- **Natural language prompt** to give your AI assistant
- **Expected implementation steps** the AI should follow
- **Code snippets** for key APIs
- **Troubleshooting tips** when things go wrong
- **API reference tables** for quick lookup

## 🚀 Quick Start

1. **Copy the prompt** from any `PROMPT.md` file
2. **Paste it into your AI assistant** (ChatGPT, Claude, Copilot, etc.)
3. **Watch it build** your Lightning feature!

## 📁 Examples

| # | Folder | What You'll Build |
|---|--------|-------------------|
| 01 | [basic_wallet](01_basic_wallet/PROMPT.md) | Minimal testnet wallet - init node, show address, display balance |
| 02 | [send_receive_onchain](02_send_receive_onchain/PROMPT.md) | Send/receive on-chain Bitcoin with QR codes |
| 03 | [lightning_payments](03_lightning_payments/PROMPT.md) | BOLT11 invoices - create, pay, and track Lightning payments |
| 04 | [open_channel](04_open_channel/PROMPT.md) | Channel management - open, close, monitor channels |
| 05 | [bolt12_offers](05_bolt12_offers/PROMPT.md) | Reusable BOLT12 offers for modern Lightning payments |
| 06 | [unified_qr](06_unified_qr/PROMPT.md) | BIP21 unified QR codes (on-chain + Lightning in one) |
| 07 | [spontaneous_payments](07_spontaneous_payments/PROMPT.md) | Keysend payments - send without invoices |
| 08 | [event_handling](08_event_handling/PROMPT.md) | Real-time events - payment notifications, channel updates |
| 09 | [wallet_restore](09_wallet_restore/PROMPT.md) | Backup/restore with BIP39 mnemonic phrases |
| 10 | [lsp_integration](10_lsp_integration/PROMPT.md) | LSP setup for instant receiving (JIT channels) |

## 🎯 Recommended Learning Path

**Beginner:**
1. Start with `01_basic_wallet` - understand node initialization
2. Move to `02_send_receive_onchain` - on-chain transactions
3. Then `09_wallet_restore` - proper backup/restore

**Intermediate:**
4. `04_open_channel` - understand Lightning channels
5. `03_lightning_payments` - BOLT11 invoice payments
6. `08_event_handling` - react to network events

**Advanced:**
7. `05_bolt12_offers` - modern payment protocol
8. `06_unified_qr` - best UX for receiving
9. `07_spontaneous_payments` - keysend/tips
10. `10_lsp_integration` - production-ready receiving

## 💡 Tips for AI Assistants

When working with these prompts:

1. **Always initialize first**: Call `await node.start()` before any operations
2. **Sync before reading**: Call `await node.syncWallets()` before checking balances
3. **Handle events**: Always call `await node.eventHandled()` after processing events
4. **Use BigInt for amounts**: All amounts are `BigInt`, not `int`
5. **Remember msat vs sat**: Lightning uses millisatoshis (1 sat = 1000 msat)

## 📚 Resources

- **Package**: https://pub.dev/packages/ldk_node
- **GitHub**: https://github.com/LtbLightning/ldk-node-flutter
- **Example App**: See `../example/` for a full wallet implementation
- **Integration Tests**: See `../example/integration_test/` for API usage

## 🧪 Testing Networks

| Network | Builder | Best For |
|---------|---------|----------|
| Testnet | `Builder.testnet()` | Testing without real funds |
| Mutinynet | `Builder.mutinynet()` | Fast blocks + LSP included |
| Mainnet | `Builder()` | Production (real Bitcoin!) |

## ⚡ Quick API Reference

```dart
import 'package:ldk_node/ldk_node.dart' as ldk;

// Initialize
final node = await ldk.Builder.testnet().build();
await node.start();
await node.syncWallets();

// On-chain
final onchain = await node.onChainPayment();
final address = await onchain.newAddress();
await onchain.sendToAddress(address: addr, amountSats: BigInt.from(1000));

// Lightning (BOLT11)
final bolt11 = await node.bolt11Payment();
final invoice = await bolt11.receive(amountMsat: BigInt.from(10000), description: 'test', expirySecs: 3600);
await bolt11.send(invoice: inv);

// Balances
final balances = await node.listBalances();
print('On-chain: ${balances.spendableOnchainBalanceSats}');
print('Lightning: ${balances.totalLightningBalanceSats}');

// Cleanup
await node.stop();
```

---

Made with ⚡ for the Lightning Network community
