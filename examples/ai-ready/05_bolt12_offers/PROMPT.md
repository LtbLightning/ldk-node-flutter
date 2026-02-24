# AI Prompt: BOLT12 Offers (Modern Lightning)

## Say This to Your AI Assistant:

"Create a BOLT12 offers screen that:
1. Creates a reusable payment offer (like a static QR code)
2. Displays the offer as a QR code that can be paid multiple times
3. Can pay someone else's BOLT12 offer
4. Shows the offer string that starts with 'lno1...'

Use ldk_node's bolt12Payment API. BOLT12 is the newer Lightning payment protocol."

---

## Expected AI Actions:

1. **Get the BOLT12 payment handler:**
   ```dart
   final bolt12 = await node.bolt12Payment();
   ```

2. **Create a reusable offer to receive payments:**
   ```dart
   // Fixed amount offer
   final offer = await bolt12.receiveUnsafe(
     amountMsat: BigInt.from(100000), // 100 sats in millisatoshis
     description: 'Buy me a coffee',
   );
   // offer.s contains the offer string (starts with lno1...)
   
   // Variable amount offer (payer chooses amount)
   final flexOffer = await bolt12.receiveVariableAmountUnsafe(
     description: 'Tip jar - pay what you want',
   );
   ```

3. **Pay a BOLT12 offer:**
   ```dart
   // Pay offer with its specified amount
   final paymentId = await bolt12.sendUnsafe(
     offer: ldk.Offer(s: offerString),
   );
   
   // Pay offer with custom amount (for variable offers)
   final paymentId = await bolt12.sendUsingAmountUnsafe(
     offer: ldk.Offer(s: offerString),
     amountMsat: BigInt.from(50000),
   );
   ```

4. **Create a refund request:**
   ```dart
   // Request a refund (you're asking to receive money)
   final refund = await bolt12.initiateRefundUnsafe(
     amountMsat: BigInt.from(10000),
     expirySecs: 3600,
   );
   // Give refund.s to the payer
   ```

5. **With custom route parameters:**
   ```dart
   final routeParams = ldk.RouteParametersConfig(
     maxTotalCltvExpiryDelta: 1008,
     maxPathCount: 3,
     maxChannelSaturationPowerOfHalf: 2,
   );
   
   final paymentId = await bolt12.sendUnsafe(
     offer: ldk.Offer(s: offerString),
     routeParams: routeParams,
   );
   ```

---

## If AI Gets Stuck:

- **"Offer creation failed"**: BOLT12 requires the node to have channels or network presence
- **Amounts in millisatoshis**: Remember 1 sat = 1000 msat
- **Offer vs Invoice**: Offers are reusable (like a payment link), invoices are single-use
- **Channel required**: Need an active Lightning channel for BOLT12 to work
- **Network requirements**: For public offers, node needs to be reachable

---

## Key APIs Used:

| Operation | API Call |
|-----------|----------|
| Get BOLT12 handler | `await node.bolt12Payment()` |
| Create offer | `await bolt12.receiveUnsafe(amountMsat: amt, description: desc)` |
| Create variable offer | `await bolt12.receiveVariableAmountUnsafe(description: desc)` |
| Pay offer | `await bolt12.sendUnsafe(offer: offer)` |
| Pay with amount | `await bolt12.sendUsingAmountUnsafe(offer: offer, amountMsat: amt)` |

---

## BOLT12 vs BOLT11 Comparison:

| Feature | BOLT11 Invoice | BOLT12 Offer |
|---------|---------------|--------------|
| Reusable | No (single payment) | Yes (multiple payments) |
| Expiry | Has expiry | No expiry |
| Privacy | Reveals node ID | Can be blinded |
| Prefix | `lnbc1...` / `lntb1...` | `lno1...` |
| Use case | One-time payment | Tip jar, subscriptions |

---

## Offer Properties:

```dart
final offer = await bolt12.receive(...);

// The encoded offer string
print(offer.s); // lno1qgsyxjtl...

// Display as QR code (can be scanned multiple times!)
QrImageView(
  data: offer.s,
  size: 200,
)
```

---

## Advanced: Sending Parameters:

```dart
// Customize how payments are sent
final sendingParams = ldk.SendingParameters(
  maxTotalRoutingFeeMsat: const ldk.MaxTotalRoutingFeeLimit_FeeCap(
    amountMsat: BigInt.from(1000),
  ),
  maxTotalCltvExpiryDelta: 1008,
  maxPathCount: 10,
);

// Use with BOLT11
await bolt11.sendUnsafe(
  invoice: invoice,
  sendingParameters: sendingParams,
);
```

---

## Reference:

- Package: https://pub.dev/packages/ldk_node
- GitHub: https://github.com/LtbLightning/ldk-node-flutter
- BOLT12 Spec: https://github.com/lightning/bolts/blob/master/12-offer-encoding.md
