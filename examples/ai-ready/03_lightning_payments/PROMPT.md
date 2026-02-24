# AI Prompt: Lightning Payments with BOLT11

## Say This to Your AI Assistant:

"Create a Lightning payment screen that can:
1. Generate a BOLT11 invoice to receive payments
2. Display the invoice as a QR code
3. Pay a BOLT11 invoice by scanning or pasting
4. Show payment status (pending, succeeded, failed)

Use ldk_node's bolt11Payment API. This requires an open Lightning channel."

---

## Expected AI Actions:

1. **Get the BOLT11 payment handler:**
   ```dart
   final bolt11 = await node.bolt11Payment();
   ```

2. **Create an invoice to receive:**
   ```dart
   // Fixed amount invoice
   final invoice = await bolt11.receiveUnsafe(
     amountMsat: BigInt.from(10000), // 10 satoshis in millisatoshis
     description: 'Coffee payment',
     expirySecs: 3600,
   );
   // invoice.signedRawInvoice contains the BOLT11 string (starts with lntb/lnbc)
   
   // Variable amount invoice
   final flexInvoice = await bolt11.receiveVariableAmountUnsafe(
     description: 'Tip jar',
     expirySecs: 3600,
   );
   ```

3. **Pay a BOLT11 invoice:**
   ```dart
   // Pay full invoice amount
   final paymentId = await bolt11.sendUnsafe(
     invoice: ldk.Bolt11Invoice(signedRawInvoice: invoiceString),
   );
   
   // Pay with custom amount (for variable amount invoices)
   final paymentId = await bolt11.sendUsingAmountUnsafe(
     invoice: ldk.Bolt11Invoice(signedRawInvoice: invoiceString),
     amountMsat: BigInt.from(50000),
   );
   ```

4. **Check payment status:**
   ```dart
   final payment = await node.payment(paymentId: paymentId);
   if (payment != null) {
     switch (payment.status) {
       case ldk.PaymentStatus.pending:
         print('Payment in progress...');
       case ldk.PaymentStatus.succeeded:
         print('Payment successful!');
       case ldk.PaymentStatus.failed:
         print('Payment failed: ${payment.failureReason}');
     }
   }
   ```

5. **Listen for incoming payments:**
   ```dart
   while (true) {
     final event = await node.nextEventAsync();
     if (event is ldk.Event_PaymentReceived) {
       print('Received ${event.amountMsat} msat!');
       await node.eventHandled();
     }
   }
   ```

---

## If AI Gets Stuck:

- **"No route found" error**: You need an open channel with sufficient capacity first
- **Amount confusion**: Lightning uses **millisatoshis** (1 sat = 1000 msat)
- **Invoice expired**: Default expiry is often short, use `expirySecs` parameter
- **Channel required**: BOLT11 payments need a funded Lightning channel - see channel opening example

---

## Key APIs Used:

| Operation | API Call |
|-----------|----------|
| Get BOLT11 handler | `await node.bolt11Payment()` |
| Create invoice | `await bolt11.receiveUnsafe(amountMsat: amt, description: desc, expirySecs: exp)` |
| Create variable invoice | `await bolt11.receiveVariableAmountUnsafe(description: desc, expirySecs: exp)` |
| Pay invoice | `await bolt11.sendUnsafe(invoice: inv)` |
| Pay with amount | `await bolt11.sendUsingAmountUnsafe(invoice: inv, amountMsat: amt)` |
| Check payment | `await node.payment(paymentId: id)` |
| Get next event | `await node.nextEventAsync()` |
| Confirm event handled | `await node.eventHandled()` |

---

## Payment Events:

```dart
final event = await node.nextEventAsync();

// Incoming payment received
if (event is ldk.Event_PaymentReceived) {
  print('Received: ${event.amountMsat} msat');
  print('Payment hash: ${event.paymentHash}');
}

// Outgoing payment successful
if (event is ldk.Event_PaymentSuccessful) {
  print('Sent: ${event.paymentId}');
}

// Payment failed
if (event is ldk.Event_PaymentFailed) {
  print('Failed: ${event.reason}');
}

// Always confirm handling
await node.eventHandled();
```

---

## Reference:

- Package: https://pub.dev/packages/ldk_node
- GitHub: https://github.com/LtbLightning/ldk-node-flutter
- BOLT11 Spec: https://github.com/lightning/bolts/blob/master/11-payment-encoding.md
