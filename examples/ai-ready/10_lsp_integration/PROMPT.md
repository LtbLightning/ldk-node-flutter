# AI Prompt: LSP Integration (LSPS2)

## Say This to Your AI Assistant:

"Set up the wallet to work with a Lightning Service Provider (LSP):
1. Configure the node to use an LSP for inbound liquidity
2. Receive payments without opening channels manually
3. Use JIT (Just-In-Time) channels that open on first payment
4. Connect to Mutinynet's LSP for testing

Use ldk_node's liquidity source configuration for LSPS2."

---

## Expected AI Actions:

1. **Use the pre-configured Mutinynet builder:**
   ```dart
   // Easiest way - Mutinynet comes with LSP pre-configured
   final builder = ldk.Builder.mutinynet();
   builder.setStorageDirPath(storagePath);
   
   final node = await builder.build();
   await node.start();
   
   // Now you can receive payments even without channels!
   ```

2. **Or configure LSP manually:**
   ```dart
   final builder = ldk.Builder()
     .setNetwork(ldk.Network.signet)
     .setChainSourceEsplora(esploraServerUrl: 'https://mutinynet.ltbl.io/api')
     .setGossipSourceRgs('https://mutinynet.ltbl.io/snapshot')
     .setLiquiditySourceLsps2(
       address: ldk.SocketAddress.hostname(
         addr: 'lsp.mutinynet.ltbl.io',
         port: 9735,
       ),
       publicKey: ldk.PublicKey(
         hex: '0371d6fd7d75de2d0372d03ea00e8bacdacb50c27d0eaea0a76a0622eff1f5ef2b',
       ),
       token: null, // Some LSPs require auth tokens
     );
   
   final node = await builder.build();
   await node.start();
   ```

3. **Receive payment (LSP handles channel):**
   ```dart
   // Create invoice - LSP will open channel when paid
   final bolt11 = await node.bolt11Payment();
   final invoice = await bolt11.receiveUnsafe(
     amountMsat: BigInt.from(100000), // 100 sats
     description: 'Test payment',
     expirySecs: 3600,
   );
   
   print('Invoice: ${invoice.signedRawInvoice}');
   // When someone pays this, LSP opens a JIT channel to you
   ```

4. **Handle JIT channel events:**
   ```dart
   final event = await node.nextEventAsync();
   
   // JIT channel created when you receive first payment
   if (event is ldk.Event_ChannelPending) {
     print('LSP opening channel to you!');
   }
   
   if (event is ldk.Event_PaymentReceived) {
     if (event.paymentKind is ldk.PaymentKind_Bolt11Jit) {
       print('Received JIT payment: ${event.amountMsat} msat');
       print('LSP fees were deducted from this amount');
     }
   }
   
   await node.eventHandled();
   ```

5. **Check channel status with LSP:**
   ```dart
   final channels = await node.listChannels();
   final lspChannels = channels.where((c) => 
     c.counterpartyNodeId.hex == '0371d6fd7d75de2d...' // LSP pubkey
   ).toList();
   
   for (final channel in lspChannels) {
     print('LSP Channel capacity: ${channel.channelValueSats} sats');
     print('Inbound (can receive): ${channel.inboundCapacityMsat ~/ 1000} sats');
     print('Outbound (can send): ${channel.outboundCapacityMsat ~/ 1000} sats');
   }
   ```

---

## If AI Gets Stuck:

- **LSP not connecting**: Check network config matches (signet for Mutinynet)
- **Invoice fails**: LSP might have limits on minimum/maximum amounts
- **Payment not received**: JIT has setup time, wait a few seconds
- **High fees**: JIT channels have opening fees deducted from first payment

---

## Key APIs Used:

| Operation | API Call |
|-----------|----------|
| Mutinynet preset | `ldk.Builder.mutinynet()` |
| Configure LSP | `builder.setLiquiditySourceLsps2(...)` |
| Set network | `builder.setNetwork(ldk.Network.signet)` |
| Create invoice | `await bolt11.receive(...)` |

---

## Default Service Configurations:

```dart
// Available preset networks
ldk.Builder()         // Mainnet (manual config needed)
ldk.Builder.testnet() // Bitcoin testnet with Esplora + RGS
ldk.Builder.mutinynet() // Signet with Esplora + RGS + LSP

// Mutinynet defaults (for reference):
class DefaultServicesMutinynet {
  static const esploraServerUrl = 'https://mutinynet.ltbl.io/api';
  static const rgsServerUrl = 'https://mutinynet.ltbl.io/snapshot';
  static const lsps2SourceAddress = 'lsp.mutinynet.ltbl.io';
  static const lsps2SourcePort = 9735;
  static const lsps2SourcePublicKey = '0371d6fd7d75de2d0372d03ea00e8bacdacb50c27d0eaea0a76a0622eff1f5ef2b';
}
```

---

## LSPS2 (JIT Channels) Explained:

**Problem**: New users can't receive Lightning payments without inbound liquidity.

**Solution**: LSP opens a channel TO you when someone pays your invoice.

**How it works**:
1. You create an invoice
2. Someone pays it
3. LSP intercepts the payment
4. LSP opens a channel to you
5. LSP forwards the payment through the new channel
6. You receive funds (minus LSP's fee)

```
Payer → LSP → [New Channel Created] → Your Node
```

---

## LSP Fee Structure:

JIT channels typically charge:
- **Opening fee**: % of first payment (covers on-chain tx)
- **Proportional fee**: Small % per routed payment
- **Base fee**: Fixed sat amount per payment

```dart
// Check fee limits in config
final config = await node.config();
if (config.liquiditySourceConfig != null) {
  // LSP is configured
  // Fees are automatically handled by the LSP
}
```

---

## Testing Flow:

1. **Get Mutinynet coins**:
   - Faucet: https://faucet.mutinynet.com/
   - Request signet coins to your on-chain address

2. **Wait for confirmation** (Mutinynet is fast - ~30 seconds)

3. **Create invoice and share** (no channel needed!)

4. **Pay from another wallet** (or request from faucet if supported)

5. **JIT channel opens automatically**

---

## Trusted 0-conf Peers:

```dart
// LSP is automatically trusted for 0-conf channels
// This means you can use the channel immediately without waiting
// for confirmations (LSP takes the risk)

final config = ldk.Config(
  // ... other config
  trustedPeers0Conf: [
    ldk.PublicKey(hex: '0371d6fd7d75de2d...'), // LSP pubkey
  ],
);
```

---

## Reference:

- Package: https://pub.dev/packages/ldk_node
- GitHub: https://github.com/LtbLightning/ldk-node-flutter
- LSPS2 Spec: https://github.com/BitcoinAndLightningLayerSpecs/lsp/blob/main/LSPS2/README.md
- Mutinynet: https://mutinynet.com/
