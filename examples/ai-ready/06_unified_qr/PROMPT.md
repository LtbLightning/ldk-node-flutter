# AI Prompt: Unified QR Codes (BIP21)

## Say This to Your AI Assistant:

"Create a receive screen with a unified QR code that:
1. Generates a single QR code that supports multiple payment methods
2. Works with on-chain Bitcoin, BOLT11 Lightning, and BOLT12 offers
3. Payer can choose their preferred payment method
4. Handle whatever payment type the payer uses

Use ldk_node's unifiedQrPayment API for BIP21 unified URIs."

---

## Expected AI Actions:

1. **Get the unified QR payment handler:**
   ```dart
   final unifiedQr = await node.unifiedQrPayment();
   ```

2. **Generate a unified payment URI:**
   ```dart
   final qrData = await unifiedQr.receiveUnsafe(
     amountSats: BigInt.from(10000), // 10k satoshis
     message: 'Payment for order #123',
     expirySec: 3600,
   );
   
   // qrData contains a BIP21 URI like:
   // bitcoin:bc1q...?amount=0.0001&lightning=lnbc...&lno=lno1...
   print(qrData);
   ```

3. **Display as QR code:**
   ```dart
   QrImageView(
     data: qrData,
     size: 250,
   )
   ```

4. **Handle incoming payment (detect type automatically):**
   ```dart
   final event = await node.nextEventAsync();
   
   // On-chain payment received
   if (event is ldk.Event_PaymentReceived) {
     if (event.paymentKind is ldk.PaymentKind_Onchain) {
       print('On-chain payment received!');
     }
   }
   
   // Lightning payment received (BOLT11 or BOLT12)
   if (event is ldk.Event_PaymentReceived) {
     final kind = event.paymentKind;
     if (kind is ldk.PaymentKind_Bolt11) {
       print('BOLT11 Lightning payment!');
     } else if (kind is ldk.PaymentKind_Bolt12Offer) {
       print('BOLT12 offer payment!');
     }
   }
   
   await node.eventHandled();
   ```

5. **Send to a unified URI:**
   ```dart
   // Parse what's in the QR code
   final result = await unifiedQr.sendUnsafe(uriStr: scannedUri);
   
   // Result tells you which payment method was used
   if (result is ldk.QrPaymentResult_Onchain) {
     print('Sent on-chain: ${result.txid}');
   } else if (result is ldk.QrPaymentResult_Bolt11) {
     print('Sent via BOLT11: ${result.paymentId}');
   } else if (result is ldk.QrPaymentResult_Bolt12) {
     print('Sent via BOLT12: ${result.paymentId}');
   }
   ```

---

## If AI Gets Stuck:

- **URI format**: BIP21 URIs start with `bitcoin:` followed by an address and query params
- **Lightning not included**: If no Lightning channels, URI will only have on-chain
- **Parsing fails**: Make sure the full URI is captured from QR scan
- **Amount mismatch**: `amountSats` is in satoshis (not millisatoshis like Lightning APIs)

---

## Key APIs Used:

| Operation | API Call |
|-----------|----------|
| Get handler | `await node.unifiedQrPayment()` |
| Generate unified QR | `await unifiedQr.receiveUnsafe(amountSats: amt, message: msg, expirySec: exp)` |
| Pay unified URI | `await unifiedQr.sendUnsafe(uriStr: uri)` |

---

## BIP21 URI Format:

```
bitcoin:<address>?amount=<btc>&lightning=<bolt11>&lno=<bolt12offer>

Example:
bitcoin:bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh?amount=0.0001&lightning=lnbc100n1p3...&lno=lno1qgsyxj...
```

The payer's wallet automatically picks the best option:
1. If they have Lightning channels → uses BOLT11/BOLT12
2. If no Lightning → falls back to on-chain

---

## Payment Kind Types:

```dart
final payment = await node.payment(paymentId: id);
final kind = payment?.kind;

// Check payment type
if (kind is ldk.PaymentKind_Onchain) {
  print('On-chain payment');
}
if (kind is ldk.PaymentKind_Bolt11) {
  print('BOLT11 invoice payment');
  print('Preimage: ${kind.preimage}');
  print('Secret: ${kind.secret}');
}
if (kind is ldk.PaymentKind_Bolt11Jit) {
  print('JIT channel payment');
}
if (kind is ldk.PaymentKind_Bolt12Offer) {
  print('BOLT12 offer payment');
  print('Offer ID: ${kind.offerId}');
}
if (kind is ldk.PaymentKind_Spontaneous) {
  print('Keysend payment');
}
```

---

## Benefits of Unified QR:

1. **One QR for everything** - Payer doesn't need to know payment details
2. **Automatic fallback** - Works even if payer doesn't have Lightning
3. **Better UX** - Receiver creates one code, payer's wallet handles the rest
4. **Privacy options** - Can include BOLT12 for better privacy

---

## Reference:

- Package: https://pub.dev/packages/ldk_node
- GitHub: https://github.com/LtbLightning/ldk-node-flutter
- BIP21 Spec: https://github.com/bitcoin/bips/blob/master/bip-0021.mediawiki
