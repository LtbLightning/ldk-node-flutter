import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class BalanceCard extends StatelessWidget {
  final BigInt onChainBalance;
  final BigInt lightningBalance;
  final String? walletAddress;

  const BalanceCard({
    super.key,
    required this.onChainBalance,
    required this.lightningBalance,
    this.walletAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Balance',
            style: GoogleFonts.nunito(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${onChainBalance + lightningBalance} sats',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w900,
              fontSize: 32,
              color: const Color(0xFF1A73E8),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.account_balance_wallet,
                  color: Colors.amber[700], size: 20),
              const SizedBox(width: 8),
              Text(
                'On-chain: $onChainBalance sats',
                style: GoogleFonts.nunito(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Icon(Icons.flash_on, color: Colors.blue[700], size: 20),
              const SizedBox(width: 8),
              Text(
                'Lightning: $lightningBalance sats',
                style: GoogleFonts.nunito(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          if (walletAddress != null && walletAddress!.isNotEmpty) ...[
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.link, color: Color(0xFF1A73E8), size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: SelectableText(
                    walletAddress!,
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      color: Colors.grey[800],
                    ),
                    maxLines: 1,
                    scrollPhysics: const BouncingScrollPhysics(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  tooltip: 'Copy address',
                  onPressed: () async {
                    await Clipboard.setData(
                        ClipboardData(text: walletAddress!));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Address copied!')),
                    );
                  },
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
