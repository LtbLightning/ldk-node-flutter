import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldk_node/src/generated/third_party/shared.dart';
import '../providers/wallet_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'invoice_display_screen.dart';
import '../config/node_config.dart';

class LightningScreen extends ConsumerStatefulWidget {
  const LightningScreen({super.key});

  @override
  ConsumerState<LightningScreen> createState() => _LightningScreenState();
}

class _LightningScreenState extends ConsumerState<LightningScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _showOpenChannelDialog() {
    final nodeIdController = TextEditingController();
    final hostController = TextEditingController();
    final portController = TextEditingController();

    // Initialize port controller with async value
    NodeConfig.getPort().then((port) {
      if (mounted) {
        portController.text = port.toString();
      }
    });
    final amountController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool isLoading = false;
    String? errorMsg;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Open Lightning Channel'),
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nodeIdController,
                      decoration: const InputDecoration(
                          labelText: 'Node ID (public key)'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: hostController,
                      decoration:
                          const InputDecoration(labelText: 'Host (IP/domain)'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: portController,
                      decoration: const InputDecoration(labelText: 'Port'),
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: amountController,
                      decoration:
                          const InputDecoration(labelText: 'Amount (sats)'),
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    if (errorMsg != null) ...[
                      const SizedBox(height: 8),
                      Text(errorMsg!,
                          style: const TextStyle(color: Colors.red)),
                    ]
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed:
                      isLoading ? null : () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (!formKey.currentState!.validate()) return;
                          setState(() {
                            isLoading = true;
                            errorMsg = null;
                          });
                          try {
                            await ref.read(walletProvider.notifier).openChannel(
                                  nodeId: nodeIdController.text.trim(),
                                  address: hostController.text.trim(),
                                  port: int.parse(portController.text.trim()),
                                  amountSats: BigInt.parse(
                                      amountController.text.trim()),
                                );
                            if (context.mounted) {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Channel opening initiated!')),
                              );
                            }
                          } catch (e) {
                            setState(() {
                              errorMsg = e.toString();
                              isLoading = false;
                            });
                          }
                        },
                  child: isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('Open'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showCreateInvoiceDialog() {
    final amountController = TextEditingController();
    final descController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool isLoading = false;
    String? errorMsg;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Create Lightning Invoice'),
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: amountController,
                      decoration:
                          const InputDecoration(labelText: 'Amount (sats)'),
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: descController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                    if (errorMsg != null) ...[
                      const SizedBox(height: 8),
                      Text(errorMsg!,
                          style: const TextStyle(color: Colors.red)),
                    ]
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed:
                      isLoading ? null : () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (!formKey.currentState!.validate()) return;
                          setState(() {
                            isLoading = true;
                            errorMsg = null;
                          });
                          try {
                            final inv = await ref
                                .read(walletProvider.notifier)
                                .createInvoice(
                                  amountMsat: BigInt.parse(
                                          amountController.text.trim()) *
                                      BigInt.from(1000),
                                  description: descController.text.trim(),
                                );
                            debugPrint('Generated invoice: ' + inv);
                            if (context.mounted) {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      InvoiceDisplayScreen(invoice: inv),
                                ),
                              );
                            }
                          } catch (e) {
                            setState(() {
                              errorMsg = e.toString();
                              isLoading = false;
                            });
                          }
                        },
                  child: isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('Create'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showPayInvoiceDialog() {
    final invoiceController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool isLoading = false;
    String? errorMsg;
    String? paymentResult;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Pay Lightning Invoice'),
              content: paymentResult == null
                  ? Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: invoiceController,
                            decoration: const InputDecoration(
                                labelText: 'Paste BOLT11 Invoice'),
                            minLines: 1,
                            maxLines: 3,
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Required' : null,
                          ),
                          if (errorMsg != null) ...[
                            const SizedBox(height: 8),
                            Text(errorMsg!,
                                style: const TextStyle(color: Colors.red)),
                          ]
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 48),
                          const SizedBox(height: 16),
                          Text('Payment sent!',
                              style: GoogleFonts.nunito(
                                  fontSize: 18, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),
                          SelectableText(paymentResult!,
                              style: GoogleFonts.nunito(fontSize: 14)),
                        ],
                      ),
                    ),
              actions: [
                TextButton(
                  onPressed:
                      isLoading ? null : () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
                if (paymentResult == null)
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            if (!formKey.currentState!.validate()) return;
                            setState(() {
                              isLoading = true;
                              errorMsg = null;
                            });
                            try {
                              final result = await ref
                                  .read(walletProvider.notifier)
                                  .payInvoice(invoiceController.text.trim());
                              setState(() {
                                paymentResult = 'Payment ID: $result';
                                isLoading = false;
                              });
                            } catch (e) {
                              setState(() {
                                errorMsg = e.toString();
                                isLoading = false;
                              });
                            }
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : const Text('Pay'),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  void _showNodeInfoDialog() async {
    final walletState = ref.read(walletProvider);
    final nodeId = walletState.nodeId?.hex ?? 'Unavailable';
    String host = 'Unavailable';
    String port = 'Unavailable';
    if (walletState.node != null) {
      final addresses = await walletState.node!.listeningAddresses();
      if (addresses != null && addresses.isNotEmpty) {
        final addr = addresses.first;
      //   final addressInfo = addr.map(
      //     tcpIpV4: (tcpV4) => {
      //       'host': tcpV4.addr.join('.'),
      //       'port': tcpV4.port.toString(),
      //     },
      //     tcpIpV6: (tcpV6) => {
      //       'host': tcpV6.addr.join(':'),
      //       'port': tcpV6.port.toString(),
      //     },
      //     onionV2: (onion) => {
      //       'host': 'Onion V2',
      //       'port': 'N/A',
      //     },
      //     onionV3: (onion) => {
      //       'host': 'Onion V3',
      //       'port': onion.port.toString(),
      //     },
      //     hostname: (hostAddr) => {
      //       'host': hostAddr.addr,
      //       'port': hostAddr.port.toString(),
      //     },
      //   );
      //   host = addressInfo['host']!;
      //   port = addressInfo['port']!;
      // }
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('My Node Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Node ID:',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w700)),
            SelectableText(nodeId, style: GoogleFonts.nunito(fontSize: 14)),
            const SizedBox(height: 12),
            Text('Host:',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w700)),
            SelectableText(host, style: GoogleFonts.nunito(fontSize: 14)),
            const SizedBox(height: 12),
            Text('Port:',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w700)),
            SelectableText(port, style: GoogleFonts.nunito(fontSize: 14)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final walletState = ref.watch(walletProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lightning'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Channels'),
            Tab(text: 'Payments'),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.info_outline),
                label: const Text('Show My Node Info'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A73E8),
                  foregroundColor: Colors.white,
                  textStyle:
                      GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _showNodeInfoDialog,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Channels Tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Channels',
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('Open Channel'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A73E8),
                          foregroundColor: Colors.white,
                          textStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: _showOpenChannelDialog,
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: walletState.channels.isEmpty
                            ? Center(
                                child: Text('No channels yet.',
                                    style: GoogleFonts.nunito(fontSize: 16)),
                              )
                            : ListView.builder(
                                itemCount: walletState.channels.length,
                                itemBuilder: (context, idx) {
                                  final c = walletState.channels[idx];
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ListTile(
                                      leading: Icon(
                                        c.isUsable
                                            ? Icons.check_circle
                                            : Icons.pending,
                                        color: c.isUsable
                                            ? Colors.green
                                            : Colors.orange,
                                      ),
                                      title: Text('Channel ${idx + 1}',
                                          style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(
                                          'Capacity: ${(c.outboundCapacityMsat / BigInt.from(1000)).toInt()} sats'),
                                      onTap: () {
                                        // TODO: Show channel details/close option
                                      },
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                // Payments Tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Payments',
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.qr_code),
                              label: const Text('Create Invoice'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF43A047),
                                foregroundColor: Colors.white,
                                textStyle: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: _showCreateInvoiceDialog,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.send),
                              label: const Text('Pay Invoice'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1A73E8),
                                foregroundColor: Colors.white,
                                textStyle: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: _showPayInvoiceDialog,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: walletState.payments.isEmpty
                            ? Center(
                                child: Text('No Lightning payments yet.',
                                    style: GoogleFonts.nunito(fontSize: 16)),
                              )
                            : ListView.builder(
                                itemCount: walletState.payments.length,
                                itemBuilder: (context, idx) {
                                  final p = walletState.payments[idx];
                                  // Only show Lightning payments (not on-chain)
                                  if (p.description == null &&
                                      p.invoice == null)
                                    return const SizedBox.shrink();
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: ListTile(
                                      leading: Icon(
                                        p.isIncoming
                                            ? Icons.call_received
                                            : Icons.call_made,
                                        color: p.isIncoming
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      title: Text('${p.formattedAmount}',
                                          style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(
                                          'Status: ${p.status.name}\nTime: ${p.timestamp}'),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
