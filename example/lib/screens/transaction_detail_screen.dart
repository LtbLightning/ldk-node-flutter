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
            if (payment.kind.maybeMap(
              bolt11: (bolt11) => bolt11.preimage != null,
              bolt11Jit: (bolt11Jit) => bolt11Jit.preimage != null,
              spontaneous: (spontaneous) => spontaneous.preimage != null,
              bolt12Offer: (bolt12Offer) => bolt12Offer.preimage != null,
              bolt12Refund: (bolt12Refund) => bolt12Refund.preimage != null,
              orElse: () => false,
            )) ...[
              const SizedBox(height: 8),
              _buildInfoRow('Preimage', _formatPreimage()),
            ],
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
    return payment.kind.map(
      onchain: (_) => 'On-chain',
      bolt11: (_) => 'BOLT 11 Invoice',
      bolt11Jit: (_) => 'BOLT 11 JIT Channel',
      spontaneous: (_) => 'Spontaneous (Keysend)',
      bolt12Offer: (_) => 'BOLT 12 Offer',
      bolt12Refund: (_) => 'BOLT 12 Refund',
    );
  }

  String _formatPaymentId() {
    final bytes = payment.id.field0;
    return bytes
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join('')
        .toUpperCase();
  }

  String _formatPaymentHash() {
    return payment.kind.map(
      onchain: (_) => 'N/A',
      bolt11: (bolt11) => _formatHash(bolt11.hash.data),
      bolt11Jit: (bolt11Jit) => _formatHash(bolt11Jit.hash.data),
      spontaneous: (spontaneous) => _formatHash(spontaneous.hash.data),
      bolt12Offer: (bolt12Offer) => bolt12Offer.hash != null
          ? _formatHash(bolt12Offer.hash!.data)
          : 'N/A',
      bolt12Refund: (bolt12Refund) => bolt12Refund.hash != null
          ? _formatHash(bolt12Refund.hash!.data)
          : 'N/A',
    );
  }

  String _formatPreimage() {
    return payment.kind.map(
      onchain: (_) => 'N/A',
      bolt11: (bolt11) =>
          bolt11.preimage != null ? _formatHash(bolt11.preimage!.data) : 'N/A',
      bolt11Jit: (bolt11Jit) => bolt11Jit.preimage != null
          ? _formatHash(bolt11Jit.preimage!.data)
          : 'N/A',
      spontaneous: (spontaneous) => spontaneous.preimage != null
          ? _formatHash(spontaneous.preimage!.data)
          : 'N/A',
      bolt12Offer: (bolt12Offer) => bolt12Offer.preimage != null
          ? _formatHash(bolt12Offer.preimage!.data)
          : 'N/A',
      bolt12Refund: (bolt12Refund) => bolt12Refund.preimage != null
          ? _formatHash(bolt12Refund.preimage!.data)
          : 'N/A',
    );
  }

  String _formatHash(List<int> data) {
    return data
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join('')
        .toUpperCase();
  }
}
