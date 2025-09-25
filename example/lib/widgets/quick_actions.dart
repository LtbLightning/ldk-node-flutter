import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickActions extends StatelessWidget {
  final VoidCallback onGenerateAddress;
  final VoidCallback onCreateInvoice;
  final VoidCallback onPayInvoice;
  final VoidCallback onSyncWallets;

  const QuickActions({
    super.key,
    required this.onGenerateAddress,
    required this.onCreateInvoice,
    required this.onPayInvoice,
    required this.onSyncWallets,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ActionButton(
          icon: Icons.add_circle_outline,
          label: 'New Address',
          onTap: onGenerateAddress,
        ),
        _ActionButton(
          icon: Icons.receipt_long,
          label: 'Invoice',
          onTap: onCreateInvoice,
        ),
        _ActionButton(
          icon: Icons.send,
          label: 'Pay',
          onTap: onPayInvoice,
        ),
        _ActionButton(
          icon: Icons.sync,
          label: 'Sync',
          onTap: onSyncWallets,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1A73E8), size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.nunito(
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
