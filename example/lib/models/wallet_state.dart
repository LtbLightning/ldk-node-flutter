import 'package:ldk_node/ldk_node.dart' as ldk;

enum WalletStatus {
  initializing,
  ready,
  syncing,
  error,
  disconnected,
}

enum PaymentStatus {
  pending,
  successful,
  failed,
  expired,
}

class WalletState {
  final WalletStatus status;
  final ldk.Node? node;
  final ldk.PublicKey? nodeId;
  final ldk.BalanceDetails? balances;
  final List<ldk.ChannelDetails> channels;
  final List<PaymentDetails> payments;
  final List<ldk.PaymentDetails> ldkPayments;
  final String? errorMessage;
  final bool isConnected;
  final String? mnemonic;
  final String? walletAddress;

  const WalletState({
    this.status = WalletStatus.initializing,
    this.node,
    this.nodeId,
    this.balances,
    this.channels = const [],
    this.payments = const [],
    this.ldkPayments = const [],
    this.errorMessage,
    this.isConnected = false,
    this.mnemonic,
    this.walletAddress,
  });

  WalletState copyWith({
    WalletStatus? status,
    ldk.Node? node,
    ldk.PublicKey? nodeId,
    ldk.BalanceDetails? balances,
    List<ldk.ChannelDetails>? channels,
    List<PaymentDetails>? payments,
    List<ldk.PaymentDetails>? ldkPayments,
    String? errorMessage,
    bool? isConnected,
    String? mnemonic,
    String? walletAddress,
  }) {
    return WalletState(
      status: status ?? this.status,
      node: node ?? this.node,
      nodeId: nodeId ?? this.nodeId,
      balances: balances ?? this.balances,
      channels: channels ?? this.channels,
      payments: payments ?? this.payments,
      ldkPayments: ldkPayments ?? this.ldkPayments,
      errorMessage: errorMessage ?? this.errorMessage,
      isConnected: isConnected ?? this.isConnected,
      mnemonic: mnemonic ?? this.mnemonic,
      walletAddress: walletAddress ?? this.walletAddress,
    );
  }
}

class PaymentDetails {
  final String id;
  final BigInt amountMsat;
  final PaymentStatus status;
  final DateTime timestamp;
  final String? description;
  final String? invoice;
  final bool isIncoming;

  const PaymentDetails({
    required this.id,
    required this.amountMsat,
    required this.status,
    required this.timestamp,
    this.description,
    this.invoice,
    required this.isIncoming,
  });

  String get amountSats => (amountMsat / BigInt.from(1000)).toString();
  String get formattedAmount => '${amountSats} sats';
}

class ChannelDetails {
  final String channelId;
  final ldk.PublicKey counterpartyNodeId;
  final BigInt capacityMsat;
  final BigInt outboundCapacityMsat;
  final bool isReady;
  final bool isUsable;
  final int confirmationsRequired;

  const ChannelDetails({
    required this.channelId,
    required this.counterpartyNodeId,
    required this.capacityMsat,
    required this.outboundCapacityMsat,
    required this.isReady,
    required this.isUsable,
    required this.confirmationsRequired,
  });

  String get capacitySats => (capacityMsat / BigInt.from(1000)).toString();
  String get outboundCapacitySats =>
      (outboundCapacityMsat / BigInt.from(1000)).toString();
}
