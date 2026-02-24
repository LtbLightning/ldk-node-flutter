# AI Prompt: Spontaneous Payments (Keysend)

## Say This to Your AI Assistant:

"Create a keysend payment feature that:
1. Send sats directly to a node's public key (no invoice needed)
2. Allow attaching a custom message/data to the payment
3. Show a form to enter node pubkey and amount
4. Display sent keysend payments in history

Use ldk_node's spontaneousPayment API for keysend payments."

---

## Expected AI Actions:

1. **Get the spontaneous payment handler:**
   ```dart
   final spontaneous = await node.spontaneousPayment();
   ```

2. **Send a keysend payment:**
   ```dart
   // Basic keysend - just pubkey and amount
   final paymentId = await spontaneous.sendUnsafe(
     nodeId: ldk.PublicKey(hex: '02abc123...'),
     amountMsat: BigInt.from(10000), // 10 sats in millisatoshis
   );
   ```

3. **Send with custom TLV data (message):**
   ```dart
   // Keysend with attached data using custom TLV records
   final customTlvs = [
     ldk.CustomTlvRecord(
       typeNum: BigInt.from(34349334), // Custom TLV type for message
       value: utf8.encode('Hello from Flutter!'),
     ),
   ];
   
   final paymentId = await spontaneous.sendWithCustomTlvsUnsafe(
     nodeId: ldk.PublicKey(hex: '02abc123...'),
     amountMsat: BigInt.from(10000),
     customTlvs: customTlvs,
   );
   ```

4. **Send with known preimage (advanced):**
   ```dart
   // Create a specific preimage (32 bytes)
   final preimage = ldk.PaymentPreimageExtensions.fromBytes([
     1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
     17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32
   ]);
   
   final paymentId = await spontaneous.sendWithPreimageUnsafe(
     nodeId: ldk.PublicKey(hex: '02abc123...'),
     amountMsat: BigInt.from(10000),
     preimage: preimage,
   );
   ```

5. **Check keysend in payment history:**
   ```dart
   final payments = await node.listPayments();
   for (final payment in payments) {
     if (payment.kind is ldk.PaymentKind_Spontaneous) {
       print('Keysend payment!');
       print('Amount: ${payment.amountMsat} msat');
       print('To: ${payment.kind.nodeId}');
     }
   }
   ```

---

## If AI Gets Stuck:

- **"No route found"**: Target node must be reachable through the Lightning network
- **Amount in millisatoshis**: Use `BigInt.from(sats * 1000)` to convert
- **Invalid pubkey**: Must be 33 bytes hex (66 characters starting with 02 or 03)
- **Custom TLV type**: Use type >= 65536 for custom records (odd numbers preferred)

---

## Key APIs Used:

| Operation | API Call |
|-----------|----------|
| Get handler | `await node.spontaneousPayment()` |
| Basic keysend | `await spontaneous.sendUnsafe(nodeId: pubkey, amountMsat: amt)` |
| Keysend with TLVs | `await spontaneous.sendWithCustomTlvsUnsafe(...)` |
| Keysend with preimage | `await spontaneous.sendWithPreimageUnsafe(...)` |

---

## Keysend vs Invoice Comparison:

| Feature | Invoice (BOLT11) | Keysend |
|---------|-----------------|---------|
| Requires invoice | Yes | No |
| Receiver must be online to create | Yes | No |
| Proof of payment | Preimage from receiver | Sender creates preimage |
| Attach data | Limited | Custom TLV records |
| Privacy | Receiver knows sender via route | Same |

---

## Custom TLV Records:

TLV (Type-Length-Value) records allow attaching arbitrary data to payments.

```dart
// Common TLV types:
// 34349334 - Keysend message (Whatsat/Sphinx)
// 7629169 - Podcast index (Podcasting 2.0)
// 133773310 - Boost/stream sats

final tlvs = [
  // Text message
  ldk.CustomTlvRecord(
    typeNum: BigInt.from(34349334),
    value: utf8.encode('Payment for services'),
  ),
  
  // Numeric data
  ldk.CustomTlvRecord(
    typeNum: BigInt.from(7629169),
    value: [0, 0, 0, 42], // 4 byte integer
  ),
];

await spontaneous.sendWithCustomTlvsUnsafe(
  nodeId: nodeId,
  amountMsat: amountMsat,
  customTlvs: tlvs,
);
```

---

## Receiving Keysend:

Your node automatically receives keysend payments - no invoice creation needed!

```dart
final event = await node.nextEventAsync();

if (event is ldk.Event_PaymentReceived) {
  if (event.paymentKind is ldk.PaymentKind_Spontaneous) {
    print('Received keysend: ${event.amountMsat} msat');
    // Check for custom TLVs in the payment
  }
}

await node.eventHandled();
```

---

## Use Cases for Keysend:

1. **Tipping** - Send sats to content creator's node without asking for invoice
2. **Streaming sats** - Continuous micropayments while consuming content  
3. **Messaging** - Attach messages to payments (value-for-value)
4. **Donations** - One-click donations to known node pubkeys
5. **Podcasting 2.0** - Boostagrams and streaming payments

---

## Reference:

- Package: https://pub.dev/packages/ldk_node
- GitHub: https://github.com/LtbLightning/ldk-node-flutter
- Keysend spec: https://github.com/lightning/blips/blob/master/blip-0003.md
