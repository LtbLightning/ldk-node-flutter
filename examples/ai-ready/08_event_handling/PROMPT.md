# AI Prompt: Event Handling & Notifications

## Say This to Your AI Assistant:

"Create a background event handler that:
1. Listens for incoming payments and shows a notification
2. Tracks channel state changes (opened, closed, pending)
3. Shows payment success/failure alerts
4. Keeps an event log for debugging

Use ldk_node's event APIs to react to Lightning network events in real-time."

---

## Expected AI Actions:

1. **Create an event listener loop:**
   ```dart
   Future<void> startEventListener(ldk.Node node) async {
     while (true) {
       try {
         // Wait for next event (blocks until available)
         final event = await node.nextEventAsync();
         
         // Handle the event
         await handleEvent(event);
         
         // IMPORTANT: Always confirm event was handled
         await node.eventHandled();
       } catch (e) {
         print('Event error: $e');
       }
     }
   }
   ```

2. **Handle different event types:**
   ```dart
   Future<void> handleEvent(ldk.Event event) async {
     switch (event) {
       case ldk.Event_PaymentReceived(:final amountMsat, :final paymentHash):
         print('💰 Received ${amountMsat ~/ 1000} sats!');
         showNotification('Payment received', '${amountMsat ~/ 1000} sats');
         
       case ldk.Event_PaymentSuccessful(:final paymentId):
         print('✅ Payment sent successfully: $paymentId');
         
       case ldk.Event_PaymentFailed(:final paymentId, :final reason):
         print('❌ Payment failed: $reason');
         showAlert('Payment failed', reason.toString());
         
       case ldk.Event_ChannelPending(:final channelId, :final counterpartyNodeId):
         print('⏳ Channel pending with ${counterpartyNodeId.hex}');
         
       case ldk.Event_ChannelReady(:final channelId, :final counterpartyNodeId):
         print('🟢 Channel ready: ${channelId.data}');
         
       case ldk.Event_ChannelClosed(:final channelId, :final reason):
         print('🔴 Channel closed: $reason');
     }
   }
   ```

3. **Non-blocking event check:**
   ```dart
   // Check for event without blocking
   final event = await node.nextEvent();
   if (event != null) {
     await handleEvent(event);
     await node.eventHandled();
   }
   ```

4. **Run in isolate for background processing:**
   ```dart
   // In a separate isolate to not block UI
   void eventIsolate(SendPort sendPort) async {
     // Initialize node in isolate...
     
     while (true) {
       final event = await node.nextEventAsync();
       sendPort.send(event); // Send to main isolate
       await node.eventHandled();
     }
   }
   ```

5. **Store events for history:**
   ```dart
   class EventLog {
     final List<EventEntry> _events = [];
     
     void log(ldk.Event event) {
       _events.add(EventEntry(
         timestamp: DateTime.now(),
         type: event.runtimeType.toString(),
         details: event.toString(),
       ));
     }
     
     List<EventEntry> get recent => _events.reversed.take(50).toList();
   }
   ```

---

## If AI Gets Stuck:

- **Events not firing**: Make sure `node.start()` was called
- **Duplicate events**: Must call `await node.eventHandled()` after processing
- **Blocking UI**: Run event loop in a separate isolate or use `nextEvent()` (non-blocking)
- **Missing events**: They queue up until `eventHandled()` is called

---

## Key APIs Used:

| Operation | API Call |
|-----------|----------|
| Wait for event | `await node.nextEventAsync()` |
| Check event (non-blocking) | `await node.nextEvent()` |
| Confirm handled | `await node.eventHandled()` |

---

## All Event Types:

```dart
// Payment Events
ldk.Event_PaymentSuccessful    // Outgoing payment succeeded
ldk.Event_PaymentFailed        // Outgoing payment failed
ldk.Event_PaymentReceived      // Incoming payment received
ldk.Event_PaymentClaimable     // Payment claimable (HODL invoice)

// Channel Events
ldk.Event_ChannelPending       // Channel funding tx broadcast
ldk.Event_ChannelReady         // Channel confirmed and usable
ldk.Event_ChannelClosed        // Channel closed (any reason)
```

---

## Event Properties:

```dart
// PaymentReceived
case ldk.Event_PaymentReceived(
  :final paymentId,       // PaymentId
  :final paymentHash,     // PaymentHash
  :final amountMsat,      // BigInt - amount in millisats
  :final paymentKind,     // PaymentKind (Bolt11, Spontaneous, etc)
):
  print('Payment ID: ${paymentId.field0}');
  print('Hash: ${paymentHash.data}');
  print('Amount: ${amountMsat ~/ 1000} sats');

// PaymentFailed
case ldk.Event_PaymentFailed(
  :final paymentId,
  :final paymentHash,
  :final reason,          // PaymentFailureReason enum
):
  switch (reason) {
    case ldk.PaymentFailureReason.recipientRejected:
      print('Recipient rejected payment');
    case ldk.PaymentFailureReason.userAbandoned:
      print('User cancelled');
    case ldk.PaymentFailureReason.retriesExhausted:
      print('No route found after retries');
    case ldk.PaymentFailureReason.paymentExpired:
      print('Invoice expired');
    case ldk.PaymentFailureReason.routeNotFound:
      print('No route to destination');
    case ldk.PaymentFailureReason.unexpectedError:
      print('Unknown error');
  }

// ChannelClosed
case ldk.Event_ChannelClosed(
  :final channelId,
  :final userChannelId,
  :final counterpartyNodeId,
  :final reason,          // ClosureReason
):
  switch (reason) {
    case ldk.ClosureReason_CounterpartyInitiatedCooperativeClosure():
      print('Peer initiated cooperative close');
    case ldk.ClosureReason_LocallyInitiatedCooperativeClosure():
      print('We initiated cooperative close');
    case ldk.ClosureReason_CommitmentTxConfirmed():
      print('Force closed');
    case ldk.ClosureReason_CounterpartyForceClosed(:final peerMsg):
      print('Peer force closed: $peerMsg');
    case ldk.ClosureReason_HolderForceClosed():
      print('We force closed');
  }
```

---

## Best Practices:

1. **Always handle events** - Unhandled events queue up and consume memory
2. **Keep handlers fast** - Don't do heavy work in the event loop
3. **Use isolates** - For production apps, run event loop in background
4. **Log everything** - Events are your debugging trail
5. **Persist important events** - Store payment/channel events in local DB

---

## Example: Payment Notification Service

```dart
class PaymentNotificationService {
  final ldk.Node _node;
  bool _running = false;
  
  PaymentNotificationService(this._node);
  
  void start() {
    if (_running) return;
    _running = true;
    _listen();
  }
  
  void stop() => _running = false;
  
  Future<void> _listen() async {
    while (_running) {
      final event = await _node.nextEventAsync();
      
      if (event is ldk.Event_PaymentReceived) {
        final sats = event.amountMsat ~/ BigInt.from(1000);
        await LocalNotifications.show(
          title: 'Payment Received!',
          body: 'You received $sats sats',
        );
      }
      
      await _node.eventHandled();
    }
  }
}
```

---

## Reference:

- Package: https://pub.dev/packages/ldk_node
- GitHub: https://github.com/LtbLightning/ldk-node-flutter
