# AI Prompt: Opening Lightning Channels

## Say This to Your AI Assistant:

"Add a channel management screen that:
1. Shows a list of current Lightning channels with their status
2. Has a form to open a new channel (enter node pubkey, address, amount)
3. Can close a channel cooperatively
4. Shows channel capacity and balance

Use ldk_node's channel APIs. The wallet needs on-chain funds to open channels."

---

## Expected AI Actions:

1. **List existing channels:**
   ```dart
   final channels = await node.listChannels();
   for (final channel in channels) {
     print('Channel ID: ${channel.channelId.data}');
     print('Peer: ${channel.counterpartyNodeId.hex}');
     print('Capacity: ${channel.channelValueSats} sats');
     print('Our balance: ${channel.outboundCapacityMsat / 1000} sats');
     print('Their balance: ${channel.inboundCapacityMsat / 1000} sats');
     print('Ready: ${channel.isChannelReady}');
     print('Usable: ${channel.isUsable}');
   }
   ```

2. **Connect to a peer and open channel:**
   ```dart
   // Parse peer info
   final nodeId = ldk.PublicKey(hex: '02abc123...');
   final address = ldk.SocketAddress.hostname(addr: '127.0.0.1', port: 9735);
   
   // Open a private channel
   final userChannelId = await node.openChannel(
     nodeId: nodeId,
     socketAddress: address,
     channelAmountSats: BigInt.from(100000), // 100k sats
     pushToCounterpartyMsat: BigInt.from(0), // optional: push sats to peer
   );
   
   // Or open a public/announced channel
   final userChannelId = await node.openAnnouncedChannel(
     nodeId: nodeId,
     socketAddress: address,
     channelAmountSats: BigInt.from(100000),
   );
   ```

3. **Close a channel cooperatively:**
   ```dart
   await node.closeChannel(
     userChannelId: channel.userChannelId,
     counterpartyNodeId: channel.counterpartyNodeId,
   );
   ```

4. **Force close (emergency only):**
   ```dart
   await node.forceCloseChannel(
     userChannelId: channel.userChannelId,
     counterpartyNodeId: channel.counterpartyNodeId,
   );
   ```

5. **Connect to peer without opening channel:**
   ```dart
   await node.connect(
     nodeId: nodeId,
     address: address,
     persist: true, // remember peer for reconnection
   );
   ```

---

## If AI Gets Stuck:

- **"Insufficient funds"**: Need on-chain balance for channel + fees. Check `listBalances().spendableOnchainBalanceSats`
- **"Connection failed"**: Verify peer address/port, check if peer is online
- **Channel not usable**: Wait for confirmations (usually 3-6 blocks). Check `channel.confirmations`
- **"Already connected"**: Use `listPeers()` to check existing connections
- **Public channel fails**: Need to set `nodeAlias` and `listeningAddresses` in config

---

## Key APIs Used:

| Operation | API Call |
|-----------|----------|
| List channels | `await node.listChannels()` |
| Open private channel | `await node.openChannel(...)` |
| Open public channel | `await node.openAnnouncedChannel(...)` |
| Close channel | `await node.closeChannel(...)` |
| Force close | `await node.forceCloseChannel(...)` |
| Connect to peer | `await node.connect(...)` |
| Disconnect peer | `await node.disconnect(counterpartyNodeId: id)` |
| List peers | `await node.listPeers()` |

---

## Channel Details Properties:

```dart
final channel = channels.first;

// Identification
channel.channelId          // ChannelId - unique identifier
channel.userChannelId      // UserChannelId - local tracking ID
channel.counterpartyNodeId // PublicKey - peer's node ID

// Capacity & Balance (in millisatoshis for msat, satoshis for sats)
channel.channelValueSats       // Total channel capacity
channel.outboundCapacityMsat   // How much we can send
channel.inboundCapacityMsat    // How much we can receive
channel.balanceMsat            // Our current balance

// Status
channel.isChannelReady    // Funding confirmed, channel operational
channel.isUsable          // Ready for payments
channel.confirmations     // Number of confirmations
channel.isPublic          // Announced to network
```

---

## Channel Events:

```dart
final event = await node.nextEventAsync();

if (event is ldk.Event_ChannelPending) {
  print('Channel pending: ${event.channelId}');
}

if (event is ldk.Event_ChannelReady) {
  print('Channel ready: ${event.channelId}');
}

if (event is ldk.Event_ChannelClosed) {
  print('Channel closed: ${event.channelId}');
  print('Reason: ${event.reason}');
}

await node.eventHandled();
```

---

## Well-Known Testnet Nodes:

```dart
// ACINQ testnet node
final acinqId = ldk.PublicKey(hex: '03933884aaf1d6b108397e5efe5c86bcf2d8ca8d2f700eda99db9214fc2712b134');
final acinqAddr = ldk.SocketAddress.hostname(addr: '34.239.230.56', port: 9735);

// Use mutinynet for easy testing
final builder = ldk.Builder.mutinynet(); // Pre-configured with LSP
```

---

## Reference:

- Package: https://pub.dev/packages/ldk_node
- GitHub: https://github.com/LtbLightning/ldk-node-flutter
- Find nodes: https://1ml.com/testnet/
