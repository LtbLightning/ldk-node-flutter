import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'package:path_provider/path_provider.dart';
import '../models/wallet_state.dart';
import 'dart:io';

class WalletNotifier extends StateNotifier<WalletState> {
  String? _mnemonic;
  WalletNotifier() : super(const WalletState());

  Future<void> initializeNode({
    required String nodeName,
    required String mnemonic,
    required int port,
  }) async {
    try {
      state = state.copyWith(status: WalletStatus.initializing);
      _mnemonic = mnemonic;

      final directory = await getApplicationDocumentsDirectory();
      final nodeStorageDir = "${directory.path}/ldk_cache/$nodeName";
      debugPrint('LDK node storage dir: $nodeStorageDir');

      // Ensure the directory exists
      final dir = Directory(nodeStorageDir);
      if (!await dir.exists()) {
        await dir.create(recursive: true);
        debugPrint('Created node storage directory: $nodeStorageDir');
      }

      final builder = ldk.Builder()
          .setEntropyBip39Mnemonic(mnemonic: ldk.Mnemonic(seedPhrase: mnemonic))
          .setStorageDirPath(nodeStorageDir)
          .setNetwork(ldk.Network.signet)
          .setChainSourceEsplora(
              esploraServerUrl: 'https://mutinynet.com/api/')
          .setListeningAddresses(
              [ldk.SocketAddress.hostname(addr: '0.0.0.0', port: port)])
          .setLiquiditySourceLsps2(
            address: ldk.SocketAddress.hostname(
                addr: '192.243.215.101', port: 27110),
            publicKey: ldk.PublicKey(
                hex:
                    '02764a0e09f2e8ec67708f11d853191e8ba4a7f06db1330fd0250ab3de10590a8e'),
            token: null,
          )
          .setGossipSourceRgs('https://mutinynet.ltbl.io/snapshot');

      final node = await builder.build();
      await node.start();
      final nodeId = await node.nodeId();

      // Fetch wallet address
      String? walletAddress;
      try {
        final onChainPayment = await node.onChainPayment();
        final address = await onChainPayment.newAddress();
        walletAddress = address.s;
      } catch (e) {
        debugPrint('Error fetching wallet address: $e');
      }

      state = state.copyWith(
        status: WalletStatus.ready,
        node: node,
        nodeId: nodeId,
        isConnected: true,
        mnemonic: mnemonic,
        walletAddress: walletAddress,
      );

      // Start background sync
      _startBackgroundSync();
    } catch (e, st) {
      debugPrint("LDK node initialization error: $e\n$st");
      state = state.copyWith(
        status: WalletStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> syncWallets() async {
    if (state.node == null) return;

    try {
      state = state.copyWith(status: WalletStatus.syncing);

      await state.node!.syncWallets();
      await _updateBalances();
      await _updateChannels();
      await updatePayments();

      state = state.copyWith(status: WalletStatus.ready);
    } catch (e) {
      state = state.copyWith(
        status: WalletStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> _updateBalances() async {
    if (state.node == null) return;

    try {
      final balances = await state.node!.listBalances();
      state = state.copyWith(balances: balances);
    } catch (e) {
      debugPrint('Error updating balances: $e');
    }
  }

  Future<void> _updateChannels() async {
    if (state.node == null) return;

    try {
      final channels = await state.node!.listChannels();
      state = state.copyWith(channels: channels);
    } catch (e) {
      debugPrint('Error updating channels: $e');
    }
  }

  Future<void> updatePayments() async {
    if (state.node == null) return;

    try {
      final payments = await state.node!.listPayments();
      final paymentDetails = payments
          .map((payment) => PaymentDetails(
                id: payment.id.toString(),
                amountMsat: payment.amountMsat ?? BigInt.zero,
                status: _mapPaymentStatus(payment.status),
                timestamp: DateTime.fromMillisecondsSinceEpoch(
                  (payment.latestUpdateTimestamp * BigInt.from(1000)).toInt(),
                ),
                description: _extractDescription(payment.kind),
                invoice: null, // LDK doesn't provide invoice in payment details
                isIncoming: payment.direction == ldk.PaymentDirection.inbound,
              ))
          .toList();

      state = state.copyWith(
        payments: paymentDetails,
        ldkPayments: payments,
      );
    } catch (e) {
      debugPrint('Error updating payments: $e');
    }
  }

  String? _extractDescription(ldk.PaymentKind kind) {
    // PaymentKind is a RustOpaque type, so we can't extract description
    // In LDK Node 0.5.0, payment description is not accessible from PaymentKind
    return null;
  }

  PaymentStatus _mapPaymentStatus(ldk.PaymentStatus status) {
    switch (status) {
      case ldk.PaymentStatus.pending:
        return PaymentStatus.pending;
      case ldk.PaymentStatus.succeeded:
        return PaymentStatus.successful;
      case ldk.PaymentStatus.failed:
        return PaymentStatus.failed;
    }
  }

  Future<String> generateNewAddress() async {
    if (state.node == null) throw Exception('Node not initialized');

    try {
      final onChainPayment = await state.node!.onChainPayment();
      final address = await onChainPayment.newAddress();
      return address.s;
    } catch (e) {
      throw Exception('Failed to generate address: $e');
    }
  }

  Future<String> createInvoice({
    required BigInt amountMsat,
    required String description,
    int expirySecs = 3600,
  }) async {
    if (state.node == null) throw Exception('Node not initialized');

    try {
      final bolt11Handler = await state.node!.bolt11Payment();
      final invoice = await bolt11Handler.receive(
        amountMsat: amountMsat,
        description: description,
        expirySecs: expirySecs,
      );
      return invoice.signedRawInvoice;
    } catch (e) {
      throw Exception('Failed to create invoice: $e');
    }
  }

  Future<String> payInvoice(String invoiceString) async {
    if (state.node == null) throw Exception('Node not initialized');

    try {
      final bolt11Handler = await state.node!.bolt11Payment();
      final invoice = ldk.Bolt11Invoice(signedRawInvoice: invoiceString);
      final paymentId = await bolt11Handler.send(invoice: invoice);

      // Update payments list
      await updatePayments();

      return paymentId.toString();
    } catch (e) {
      throw Exception('Failed to pay invoice: $e');
    }
  }

  Future<void> openChannel({
    required String nodeId,
    required String address,
    required int port,
    required BigInt amountSats,
    BigInt? pushMsat,
  }) async {
    if (state.node == null) throw Exception('Node not initialized');

    try {
      final socketAddress =
          ldk.SocketAddress.hostname(addr: address, port: port);
      final publicKey = ldk.PublicKey(hex: nodeId);

      await state.node!.openChannel(
        socketAddress: socketAddress,
        nodeId: publicKey,
        channelAmountSats: amountSats,
        pushToCounterpartyMsat: pushMsat,
      );

      // Update channels list
      await _updateChannels();
    } catch (e) {
      throw Exception('Failed to open channel: $e');
    }
  }

  Future<void> closeChannel({
    required String userChannelId,
    required String counterpartyNodeId,
  }) async {
    if (state.node == null) throw Exception('Node not initialized');

    try {
      // Convert string to Uint8List for UserChannelId
      final channelIdBytes = Uint8List.fromList(userChannelId.codeUnits);
      final channelId = ldk.UserChannelId(data: channelIdBytes);
      final nodeId = ldk.PublicKey(hex: counterpartyNodeId);

      await state.node!.closeChannel(
        userChannelId: channelId,
        counterpartyNodeId: nodeId,
      );

      // Update channels list
      await _updateChannels();
    } catch (e) {
      throw Exception('Failed to close channel: $e');
    }
  }

  void _startBackgroundSync() {
    Timer.periodic(const Duration(minutes: 5), (timer) {
      if (state.status == WalletStatus.ready) {
        syncWallets();
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> handleEvents() async {
    if (state.node == null) return;

    try {
      final event = await state.node!.nextEvent();
      if (event != null) {
        // Handle different event types
        // Since Event is RustOpaque in LDK Node 0.5.0, we can't use pattern matching
        // We'll just update payments and channels for all events to be safe
        debugPrint("Received event: ${event.runtimeType}");
        updatePayments();
        _updateBalances();
        _updateChannels();

        await state.node!.eventHandled();
      }
    } catch (e) {
      debugPrint('Error handling events: $e');
    }
  }

  Future<void> stop() async {
    if (state.node != null) {
      await state.node!.stop();
    }
    state = state.copyWith(
      status: WalletStatus.disconnected,
      isConnected: false,
    );
  }

  void clearError() {
    state = state.copyWith(
      status: WalletStatus.ready,
      errorMessage: null,
    );
  }

  Future<String> getMnemonic() async {
    if (_mnemonic != null) {
      return _mnemonic!;
    }
    if (state.mnemonic != null) {
      return state.mnemonic!;
    }
    return 'Mnemonic not available.';
  }

  Future<String> sendToAddress(
      {required String address, required BigInt amountSats}) async {
    if (state.node == null) throw Exception('Node not initialized');
    try {
      final onChainPayment = await state.node!.onChainPayment();
      final txid = await onChainPayment.sendToAddress(
          address: ldk.Address(s: address), amountSats: amountSats);
      return txid.hash;
    } catch (e) {
      throw Exception('Failed to send: $e');
    }
  }

  Future<void> refreshWalletAddress() async {
    if (state.node == null) return;
    try {
      final onChainPayment = await state.node!.onChainPayment();
      final address = await onChainPayment.newAddress();
      state = state.copyWith(walletAddress: address.s);
    } catch (e) {
      debugPrint('Error refreshing wallet address: $e');
    }
  }
}

final walletProvider =
    StateNotifierProvider<WalletNotifier, WalletState>((ref) {
  return WalletNotifier();
});
