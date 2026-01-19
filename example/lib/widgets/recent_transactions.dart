import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import '../screens/transaction_detail_screen.dart';
import '../screens/transaction_history_screen.dart';
import '../providers/wallet_provider.dart';

class RecentTransactions extends ConsumerWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletProvider);
    final transactions = walletState.ldkPayments;

    if (transactions.isEmpty) {
      return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const TransactionHistoryScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'View All',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'No transactions yet',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Your transaction history will appear here',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const TransactionHistoryScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'View All',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...transactions.take(5).map(
                (transaction) => _buildTransactionTile(context, transaction)),
          ],
        ),
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
            builder: (context) => TransactionDetailScreen(
              payment: transaction,
            ),
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
              child: Icon(
                statusIcon,
                color: statusColor,
                size: 20,
              ),
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
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: Colors.grey[400],
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKindTag(ldk.PaymentKind kind) {
    // PaymentKind is RustOpaque in LDK Node 0.5.0, can't determine exact type
    return Chip(
      label: const Text('Lightning',
          style: TextStyle(color: Colors.white, fontSize: 11)),
      backgroundColor: Colors.blue,
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
    );
  }

  Color _getStatusColor(ldk.PaymentStatus status) {
    switch (status) {
      case ldk.PaymentStatus.succeeded:
        return Colors.green;
      case ldk.PaymentStatus.pending:
        return Colors.orange;
      case ldk.PaymentStatus.failed:
        return Colors.red;
    }
  }

  IconData _getStatusIcon(ldk.PaymentStatus status) {
    switch (status) {
      case ldk.PaymentStatus.succeeded:
        return Icons.check_circle;
      case ldk.PaymentStatus.pending:
        return Icons.pending;
      case ldk.PaymentStatus.failed:
        return Icons.error;
    }
  }

  String _getStatusText(ldk.PaymentStatus status) {
    switch (status) {
      case ldk.PaymentStatus.succeeded:
        return 'Completed';
      case ldk.PaymentStatus.pending:
        return 'Pending';
      case ldk.PaymentStatus.failed:
        return 'Failed';
    }
  }

  String _getPaymentTypeText(ldk.PaymentKind kind) {
    // PaymentKind is RustOpaque in LDK Node 0.5.0, can't determine exact type
    return 'Lightning';
  }
}
