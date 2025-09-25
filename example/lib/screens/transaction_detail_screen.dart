import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'package:intl/intl.dart';

class TransactionDetailScreen extends ConsumerWidget {
  final ldk.PaymentDetails payment;

  const TransactionDetailScreen({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction Details',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusCard(),
            const SizedBox(height: 20),
            _buildAmountCard(),
            const SizedBox(height: 20),
            _buildPaymentInfoCard(),
            const SizedBox(height: 20),
            _buildTechnicalDetailsCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (payment.status) {
      case ldk.PaymentStatus.succeeded:
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        statusText = 'Completed';
        break;
      case ldk.PaymentStatus.pending:
        statusColor = Colors.orange;
        statusIcon = Icons.pending;
        statusText = 'Pending';
        break;
      case ldk.PaymentStatus.failed:
        statusColor = Colors.red;
        statusIcon = Icons.error;
        statusText = 'Failed';
        break;
    }

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              statusIcon,
              color: statusColor,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    statusText,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: statusColor,
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

  Widget _buildAmountCard() {
    final amountSats = payment.amountMsat != null
        ? (payment.amountMsat! / BigInt.from(1000)).toInt()
        : 0;

    final directionText =
        payment.direction == ldk.PaymentDirection.inbound ? 'Received' : 'Sent';
    final directionColor = payment.direction == ldk.PaymentDirection.inbound
        ? Colors.green
        : Colors.blue;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amount',
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  payment.direction == ldk.PaymentDirection.inbound
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                  color: directionColor,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  '$directionText',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: directionColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '$amountSats sats',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            if (payment.amountMsat != null) ...[
              const SizedBox(height: 4),
              Text(
                '${payment.amountMsat} msats',
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentInfoCard() {
    final timestamp = DateTime.fromMillisecondsSinceEpoch(
      payment.latestUpdateTimestamp.toInt() * 1000,
    );
    final formattedDate = DateFormat('MMM dd, yyyy').format(timestamp);
    final formattedTime = DateFormat('HH:mm:ss').format(timestamp);

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Information',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Date', formattedDate),
            const SizedBox(height: 8),
            _buildInfoRow('Time', formattedTime),
            const SizedBox(height: 8),
            _buildInfoRow('Type', _getPaymentTypeText()),
            const SizedBox(height: 8),
            _buildInfoRow(
                'Direction',
                payment.direction == ldk.PaymentDirection.inbound
                    ? 'Inbound'
                    : 'Outbound'),
          ],
        ),
      ),
    );
  }

  Widget _buildTechnicalDetailsCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Technical Details',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Payment ID', _formatPaymentId()),
            const SizedBox(height: 8),
            _buildInfoRow('Payment Hash', _formatPaymentHash()),
            // PaymentKind is RustOpaque in LDK Node 0.5.0, can't check preimage existence
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  String _getPaymentTypeText() {
    // PaymentKind is RustOpaque in LDK Node 0.5.0, can't determine exact type
    return 'Lightning Payment';
  }

  String _formatPaymentId() {
    final bytes = payment.id.data;
    return bytes
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join('')
        .toUpperCase();
  }

  String _formatPaymentHash() {
    // PaymentKind is RustOpaque in LDK Node 0.5.0, can't access hash
    return 'N/A';
  }
}
