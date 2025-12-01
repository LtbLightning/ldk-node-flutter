import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/wallet_provider.dart';
import 'transaction_detail_screen.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;

class TransactionHistoryScreen extends ConsumerWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletProvider);
    final transactions = walletState.ldkPayments;

    return Scaffold(
      appBar: AppBar(
        title: Text('All Transactions',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
        backgroundColor: const Color(0xFF1A73E8),
        foregroundColor: Colors.white,
      ),
      body: transactions.isEmpty
          ? Center(
              child: Text(
                'No transactions yet',
                style:
                    GoogleFonts.nunito(fontSize: 16, color: Colors.grey[600]),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: transactions.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, idx) {
                final transaction = transactions[idx];
                return _buildTransactionTile(context, transaction);
              },
            ),
    );
  }

  Widget _buildTransactionTile(
      BuildContext context, ldk.PaymentDetails transaction) {
    final amountSats = transaction.amountMsat != null
        ? (transaction.amountMsat! / BigInt.from(1000)).toInt()
        : 0;
    final isInbound = transaction.direction == ldk.PaymentDirection.inbound;
    final statusColor = _getStatusColor(transaction.status);
    final statusIcon = _getStatusIcon(transaction.status);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionDetailScreen(payment: transaction),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(statusIcon, color: statusColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            isInbound ? 'Received' : 'Sent',
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildKindTag(transaction.kind),
                        ],
                      ),
                      Text(
                        '${isInbound ? '+' : '-'}$amountSats sats',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: isInbound ? Colors.green : Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _getPaymentTypeText(transaction.kind),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        _getStatusText(transaction.status),
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKindTag(ldk.PaymentKind kind) {
    return kind.when(
      onchain: () => Chip(
        label: const Text('On-chain',
            style: TextStyle(color: Colors.white, fontSize: 11)),
        backgroundColor: Colors.green,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
      ),
      bolt11: (hash, preimage, secret) => Chip(
        label: const Text('Lightning',
            style: TextStyle(color: Colors.white, fontSize: 11)),
        backgroundColor: Colors.blue,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
      ),
      bolt11Jit: (hash, preimage, secret, lspFeeLimits) => Chip(
        label: const Text('Lightning',
            style: TextStyle(color: Colors.white, fontSize: 11)),
        backgroundColor: Colors.blue,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
      ),
      spontaneous: (hash, preimage) => Chip(
        label: const Text('Lightning',
            style: TextStyle(color: Colors.white, fontSize: 11)),
        backgroundColor: Colors.blue,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
      ),
      bolt12Offer: (hash, preimage, secret, offerId, payerNote, quantity) =>
          Chip(
        label: const Text('Lightning',
            style: TextStyle(color: Colors.white, fontSize: 11)),
        backgroundColor: Colors.blue,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
      ),
      bolt12Refund: (hash, preimage, secret, payerNote, quantity) => Chip(
        label: const Text('Lightning',
            style: TextStyle(color: Colors.white, fontSize: 11)),
        backgroundColor: Colors.blue,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
      ),
    );
  }

  String _getPaymentTypeText(ldk.PaymentKind kind) {
    return kind.when(
      onchain: () => 'On-chain',
      bolt11: (hash, preimage, secret) => 'BOLT 11 Invoice',
      bolt11Jit: (hash, preimage, secret, lspFeeLimits) =>
          'BOLT 11 JIT Channel',
      spontaneous: (hash, preimage) => 'Spontaneous (Keysend)',
      bolt12Offer: (hash, preimage, secret, offerId, payerNote, quantity) =>
          'BOLT 12 Offer',
      bolt12Refund: (hash, preimage, secret, payerNote, quantity) =>
          'BOLT 12 Refund',
    );
  }

  String _getStatusText(ldk.PaymentStatus status) {
    switch (status) {
      case ldk.PaymentStatus.pending:
        return 'Pending';
      case ldk.PaymentStatus.succeeded:
        return 'Succeeded';
      case ldk.PaymentStatus.failed:
        return 'Failed';
      default:
        return '';
    }
  }

  Color _getStatusColor(ldk.PaymentStatus status) {
    switch (status) {
      case ldk.PaymentStatus.pending:
        return Colors.orange;
      case ldk.PaymentStatus.succeeded:
        return Colors.green;
      case ldk.PaymentStatus.failed:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(ldk.PaymentStatus status) {
    switch (status) {
      case ldk.PaymentStatus.pending:
        return Icons.hourglass_empty;
      case ldk.PaymentStatus.succeeded:
        return Icons.check_circle;
      case ldk.PaymentStatus.failed:
        return Icons.error;
      default:
        return Icons.help;
    }
  }
}
