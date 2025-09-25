import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/wallet_provider.dart';
import 'package:flutter/services.dart';

class OnChainScreen extends ConsumerStatefulWidget {
  const OnChainScreen({super.key});

  @override
  ConsumerState<OnChainScreen> createState() => _OnChainScreenState();
}

class _OnChainScreenState extends ConsumerState<OnChainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _receiveAddress;
  bool _isLoadingAddress = false;
  final _sendAddressController = TextEditingController();
  final _sendAmountController = TextEditingController();
  bool _isSending = false;
  String? _sendResult;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchAddress();
  }

  Future<void> _fetchAddress() async {
    setState(() {
      _isLoadingAddress = true;
    });
    try {
      final addr = await ref.read(walletProvider.notifier).generateNewAddress();
      setState(() {
        _receiveAddress = addr;
      });
    } catch (e) {
      setState(() {
        _receiveAddress = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoadingAddress = false;
      });
    }
  }

  Future<void> _send() async {
    setState(() {
      _isSending = true;
      _sendResult = null;
    });
    try {
      final address = _sendAddressController.text.trim();
      final amount = BigInt.parse(_sendAmountController.text.trim());
      final txid = await ref
          .read(walletProvider.notifier)
          .sendToAddress(address: address, amountSats: amount);
      setState(() {
        _sendResult = 'Sent! TXID: $txid';
      });
      await _refreshPayments();
    } catch (e) {
      setState(() {
        _sendResult = 'Error: $e';
      });
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  Future<void> _refreshPayments() async {
    await ref.read(walletProvider.notifier).updatePayments();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final payments = ref
        .watch(walletProvider)
        .payments
        .where((p) =>
            p.status != null &&
            p.status != null &&
            p.status.toString().contains('onchain'))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('On-chain'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Receive'),
            Tab(text: 'Send'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Receive Tab
          Center(
            child: _isLoadingAddress
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: SelectableText(
                                  _receiveAddress ?? '',
                                  style: GoogleFonts.nunito(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.copy, size: 20),
                                tooltip: 'Copy',
                                onPressed: _receiveAddress == null ||
                                        _receiveAddress!.isEmpty
                                    ? null
                                    : () async {
                                        await Clipboard.setData(ClipboardData(
                                            text: _receiveAddress!));
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Address copied!')),
                                          );
                                        }
                                      },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchAddress,
                        child: const Text('Generate New Address'),
                      ),
                    ],
                  ),
          ),
          // Send Tab
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _sendAddressController,
                  decoration:
                      const InputDecoration(labelText: 'Recipient Address'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _sendAmountController,
                  decoration: const InputDecoration(labelText: 'Amount (sats)'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24),
                _isSending
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _send,
                        child: const Text('Send'),
                      ),
                if (_sendResult != null) ...[
                  const SizedBox(height: 16),
                  Text(_sendResult!, style: GoogleFonts.nunito(fontSize: 16)),
                ]
              ],
            ),
          ),
          // History Tab
          RefreshIndicator(
            onRefresh: _refreshPayments,
            child: payments.isEmpty
                ? ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Center(
                          child: Text('No on-chain transactions yet.',
                              style: GoogleFonts.nunito(fontSize: 16)),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: payments.length,
                    itemBuilder: (context, idx) {
                      final p = payments[idx];
                      return ListTile(
                        title: Text('${p.formattedAmount}'),
                        subtitle: Text(
                            'Status: ${p.status.name}\nTime: ${p.timestamp}'),
                        trailing: p.isIncoming
                            ? const Icon(Icons.call_received,
                                color: Colors.green)
                            : const Icon(Icons.call_made, color: Colors.red),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
