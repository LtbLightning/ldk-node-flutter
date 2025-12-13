import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../providers/wallet_provider.dart';
import '../models/wallet_state.dart';
import '../widgets/balance_card.dart';
import '../widgets/quick_actions.dart';
import '../widgets/recent_transactions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'dart:io';
import 'onchain_screen.dart';
import 'lightning_screen.dart';
import '../config/node_config.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize the wallet on startup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeWallet();
    });
  }

  Future<void> _initializeWallet() async {
    final config = await NodeConfig.getNodeConfig();
    await ref.read(walletProvider.notifier).initializeNode(
          nodeName: config['name'],
          mnemonic: config['mnemonic'],
          port: config['port'],
        );
  }

  @override
  Widget build(BuildContext context) {
    final walletState = ref.watch(walletProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor: const Color(0xFF1A73E8),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/settings');
                  },
                  icon: const Icon(Icons.settings, color: Colors.white),
                  tooltip: 'Settings',
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: FutureBuilder<String>(
                  future: NodeConfig.getDisplayName(),
                  builder: (context, snapshot) {
                    final nodeName = snapshot.data ?? 'Loading...';
                    return Text(
                      'Cypherpunk Lightning Wallet ($nodeName)',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    );
                  },
                ),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF1A73E8), Color(0xFF0D47A1)],
                    ),
                  ),
                ),
              ),
            ),

            // Main Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status Indicator
                    _buildStatusIndicator(walletState),

                    const SizedBox(height: 24),

                    // Balance Card
                    BalanceCard(
                      onChainBalance:
                          walletState.balances?.spendableOnchainBalanceSats ??
                              BigInt.zero,
                      lightningBalance:
                          walletState.balances?.totalLightningBalanceSats ??
                              BigInt.zero,
                      walletAddress: walletState.walletAddress,
                    ),

                    if (walletState.status == WalletStatus.ready &&
                        walletState.walletAddress != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.refresh, size: 20),
                            tooltip: 'Generate new address',
                            onPressed: () async {
                              await ref
                                  .read(walletProvider.notifier)
                                  .refreshWalletAddress();
                            },
                          ),
                          const SizedBox(width: 4),
                          Text('New address',
                              style: GoogleFonts.nunito(fontSize: 13)),
                        ],
                      ),
                    ],

                    const SizedBox(height: 24),

                    ElevatedButton.icon(
                      icon: const Icon(Icons.account_balance_wallet),
                      label: const Text('On-chain'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1A73E8),
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                        textStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600, fontSize: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const OnChainScreen()),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton.icon(
                      icon: const Icon(Icons.flash_on),
                      label: const Text('Lightning'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFC107),
                        foregroundColor: Colors.black,
                        minimumSize: const Size.fromHeight(48),
                        textStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600, fontSize: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const LightningScreen()),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Recent Transactions
                    const RecentTransactions(),

                    const SizedBox(height: 24),

                    // Channels Section
                    _buildChannelsSection(walletState),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _handleEvents,
        backgroundColor: const Color(0xFF1A73E8),
        icon: const Icon(Icons.refresh, color: Colors.white),
        label: Text(
          'Sync',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(WalletState walletState) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (walletState.status) {
      case WalletStatus.initializing:
        statusColor = Colors.orange;
        statusText = 'Initializing...';
        statusIcon = Icons.hourglass_empty;
        break;
      case WalletStatus.ready:
        statusColor = Colors.green;
        statusText = 'Connected';
        statusIcon = Icons.check_circle;
        break;
      case WalletStatus.syncing:
        statusColor = Colors.blue;
        statusText = 'Syncing...';
        statusIcon = Icons.sync;
        break;
      case WalletStatus.error:
        statusColor = Colors.red;
        statusText = 'Error';
        statusIcon = Icons.error;
        break;
      case WalletStatus.disconnected:
        statusColor = Colors.grey;
        statusText = 'Disconnected';
        statusIcon = Icons.wifi_off;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(statusIcon, color: statusColor, size: 20),
              const SizedBox(width: 12),
              Text(
                statusText,
                style: GoogleFonts.nunito(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              if (walletState.nodeId != null)
                Text(
                  'ID: ${walletState.nodeId!.hex.substring(0, 8)}...',
                  style: GoogleFonts.nunito(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
        if (walletState.status == WalletStatus.error &&
            walletState.errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Text(
              walletState.errorMessage!,
              style: GoogleFonts.nunito(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildChannelsSection(WalletState walletState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Channels',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 12),
        if (walletState.channels.isEmpty)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(
                  Icons.account_tree_outlined,
                  size: 48,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'No channels yet',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Open a channel to start making Lightning payments',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: walletState.channels.length,
            itemBuilder: (context, index) {
              final channel = walletState.channels[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: channel.isUsable ? Colors.green : Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Channel ${index + 1}',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Capacity: ${(channel.outboundCapacityMsat / BigInt.from(1000)).toInt()} sats',
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      channel.isUsable ? Icons.check_circle : Icons.pending,
                      color: channel.isUsable ? Colors.green : Colors.orange,
                      size: 20,
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }

  Future<void> _handleEvents() async {
    await ref.read(walletProvider.notifier).handleEvents();
  }
}
