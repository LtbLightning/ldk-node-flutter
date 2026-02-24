# AI Prompt: Send & Receive On-Chain Bitcoin

## Say This to Your AI Assistant:

"Extend the basic wallet to add:
1. A 'Receive' button that shows a QR code of the Bitcoin address
2. A 'Send' button that opens a form to enter address and amount
3. Send Bitcoin on-chain to any address
4. Show a transaction list of sent/received payments

Use ldk_node for the Bitcoin operations and qr_flutter for QR codes."

---

## Expected AI Actions:

1. **Add QR code dependency:**
   ```yaml
   dependencies:
     qr_flutter: ^4.1.0
   ```

2. **Create receive screen with QR:**
   ```dart
   final onChainPayment = await node.onChainPayment();
   final address = await onChainPayment.newAddress();
   
   // Display QR code
   QrImageView(
     data: address.s,
     size: 200,
   )
   ```

3. **Implement send functionality:**
   ```dart
   final onChainPayment = await node.onChainPayment();
   final txid = await onChainPayment.sendToAddress(
     address: ldk.Address(s: recipientAddress),
     amountSats: BigInt.from(amountInSatoshis),
   );
   // txid.s contains the transaction ID
   ```

4. **Send all funds (sweep):**
   ```dart
   final txid = await onChainPayment.sendAllToAddress(
     address: ldk.Address(s: recipientAddress),
   );
   ```

5. **List payment history:**
   ```dart
   final payments = await node.listPayments();
   for (final payment in payments) {
     print('Amount: ${payment.amountMsat}');
     print('Direction: ${payment.direction}'); // inbound or outbound
     print('Status: ${payment.status}');
   }
   ```

---

## If AI Gets Stuck:

- **Send fails with "insufficient funds"**: Check `balances.spendableOnchainBalanceSats` first, and remember to account for fees
- **Amount format**: Use `BigInt.from(satoshis)` - amounts are in satoshis, not BTC
- **Address validation**: The `ldk.Address(s: string)` constructor accepts bech32 addresses
- **Transaction not showing**: Call `await node.syncWallets()` to refresh

---

## Key APIs Used:

| Operation | API Call |
|-----------|----------|
| Get on-chain handler | `await node.onChainPayment()` |
| Generate address | `await onChainPayment.newAddress()` |
| Send to address | `await onChainPayment.sendToAddress(address: addr, amountSats: amount)` |
| Send all funds | `await onChainPayment.sendAllToAddress(address: addr)` |
| List payments | `await node.listPayments()` |
| Get balance details | `await node.listBalances()` |

---

## Balance Details Available:

```dart
final balances = await node.listBalances();
balances.totalOnchainBalanceSats;      // Total on-chain
balances.spendableOnchainBalanceSats;  // Available to spend
balances.totalLightningBalanceSats;    // Total in Lightning channels
balances.lightningBalances;             // List of channel balances
balances.pendingSweepBalanceSats;      // Funds being swept
```

---

## Reference:

- Package: https://pub.dev/packages/ldk_node
- GitHub: https://github.com/LtbLightning/ldk-node-flutter
