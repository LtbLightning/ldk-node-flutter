import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ldk.Node aliceNode;
  late ldk.Node bobNode;
  ldk.PublicKey? aliceNodeId;
  ldk.PublicKey? bobNodeId;
  int aliceBalance = 0;
  String displayText = "";
  ldk.SocketAddress? bobAddr;
  ldk.Bolt11Invoice? invoice;
  ldk.UserChannelId? userChannelId;

  String esploraUrl = "https://mutinynet.ltbl.io/api";
  /*
  // For local esplora server

  String esploraUrl = Platform.isAndroid
      ?
      //10.0.2.2 to access the AVD
      'http://10.0.2.2:30000'
      : 'http://127.0.0.1:30000';*/

  @override
  void initState() {
    initAliceNode();
    super.initState();
  }

  Future<ldk.Builder> createBuilder(
      String path, ldk.SocketAddress address, String mnemonic) async {
    final directory = await getApplicationDocumentsDirectory();
    final nodeStorageDir = "${directory.path}/ldk_cache/$path";
    print(nodeStorageDir);
    // For a node on the mutiny network with default config and service
    ldk.Builder builder = ldk.Builder.mutinynet()
        .setEntropyBip39Mnemonic(mnemonic: ldk.Mnemonic(seedPhrase: mnemonic))
        .setEsploraServer(esploraUrl)
        .setStorageDirPath(nodeStorageDir)
        .setListeningAddresses([address]);
    return builder;
  }

  Future initAliceNode() async {
    aliceNode = await (await createBuilder(
            'alice_mutinynet',
            ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3003),
            "cart super leaf clinic pistol plug replace close super tooth wealth usage"))
        .build();
    await startNode(aliceNode);
    final res = await aliceNode.nodeId();
    setState(() {
      aliceNodeId = res;
      displayText = "${aliceNodeId?.hex} started successfully";
    });
  }

  initBobNode() async {
    bobNode = await (await createBuilder(
            'bob_mutinynet',
            ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3004),
            "puppy interest whip tonight dad never sudden response push zone pig patch"))
        .build();
    await startNode(bobNode);
    final res = await bobNode.nodeId();
    setState(() {
      bobNodeId = res;
      displayText = "${bobNodeId!.hex} started successfully";
    });
  }

  startNode(ldk.Node node) async {
    try {
      node.start();
    } on ldk.NodeException catch (e) {
      print(e.toString());
    }
  }

  totalOnchainBalanceSats() async {
    final alice = await aliceNode.listBalances();
    final bob = await bobNode.listBalances();
    if (kDebugMode) {
      print("alice's balance: ${alice.totalOnchainBalanceSats}");
      print("alice's spendable balance: ${alice.spendableOnchainBalanceSats}");
      print("bob's balance: ${bob.totalOnchainBalanceSats}");
      print("bob's spendable balance: ${bob.spendableOnchainBalanceSats}");
    }
    setState(() {
      aliceBalance = alice.spendableOnchainBalanceSats.toInt();
    });
  }

  syncWallets() async {
    await aliceNode.syncWallets();
    await bobNode.syncWallets();
    setState(() {
      displayText = "aliceNode & bobNode: Sync Completed";
    });
  }

  listChannels() async {
    final res = await aliceNode.listChannels();
    if (kDebugMode) {
      if (res.isNotEmpty) {
        print("======Channels========");
        for (var e in res) {
          print("nodeId: ${aliceNodeId!.hex}");
          print("userChannelId: ${e.userChannelId.data}");
          print("confirmations required: ${e.confirmationsRequired}");
          print("isChannelReady: ${e.isChannelReady}");
          print("isUsable: ${e.isUsable}");
          print("outboundCapacityMsat: ${e.outboundCapacityMsat}");
        }
      }
    }
  }

  listPaymentsWithFilter(bool printPayments) async {
    final res = await aliceNode.listPaymentsWithFilter(
        paymentDirection: ldk.PaymentDirection.outbound);
    if (res.isNotEmpty) {
      if (printPayments) {
        if (kDebugMode) {
          print("======Payments========");
          for (var e in res) {
            print("amountMsat: ${e.amountMsat}");
            print("paymentId: ${e.id.field0}");
            print("status: ${e.status.name}");
          }
        }
      }
      return res.last;
    } else {
      return null;
    }
  }

  removeLastPayment() async {
    final lastPayment = await listPaymentsWithFilter(false);
    if (lastPayment != null) {
      final _ = await aliceNode.removePayment(paymentId: lastPayment.id);
      setState(() {
        displayText = "${lastPayment.hash.internal} removed";
      });
    }
  }

  Future<List<String>> newOnchainAddress() async {
    final alice = await (await aliceNode.onChainPayment()).newAddress();
    final bob = await (await bobNode.onChainPayment()).newAddress();
    if (kDebugMode) {
      print("alice's address: ${alice.s}");
      print("bob's address: ${bob.s}");
    }
    setState(() {
      displayText = alice.s;
    });
    return [alice.s, bob.s];
  }

  listeningAddress() async {
    final alice = await aliceNode.listeningAddresses();
    final bob = await bobNode.listeningAddresses();

    setState(() {
      bobAddr = bob!.first;
    });
    if (kDebugMode) {
      print("alice's listeningAddress : ${alice!.first.toString()}");
      print("bob's listeningAddress: ${bob!.first.toString()}");
    }
  }

  closeChannel() async {
    await aliceNode.closeChannel(
        userChannelId: userChannelId!,
        counterpartyNodeId: ldk.PublicKey(
          hex:
              '02465ed5be53d04fde66c9418ff14a5f2267723810176c9212b722e542dc1afb1b',
        ));
  }

  connectOpenChannel() async {
    final funding_amount_sat = 80000;
    final push_msat = (funding_amount_sat / 2) * 1000;
    userChannelId = await aliceNode.connectOpenChannel(
        channelAmountSats: BigInt.from(funding_amount_sat),
        announceChannel: true,
        socketAddress: ldk.SocketAddress.hostname(
          addr: '45.79.52.207',
          port: 9735,
        ),
        pushToCounterpartyMsat: BigInt.from(push_msat),
        nodeId: ldk.PublicKey(
          hex:
              '02465ed5be53d04fde66c9418ff14a5f2267723810176c9212b722e542dc1afb1b',
        ));
  }

  receiveAndSendPayments() async {
    final bobBolt11Handler = await bobNode.bolt11Payment();
    final aliceBolt11Handler = await aliceNode.bolt11Payment();
    // Bob doesn't have a channel yet, so he can't receive normal payments,
    //  but he can receive payments via JIT channels through an LSP configured
    //  in its node.
    invoice = await bobBolt11Handler.receiveViaJitChannel(
        amountMsat: BigInt.from(25000 * 1000),
        description: 'asdf',
        expirySecs: 9217);
    print(invoice!.signedRawInvoice);
    setState(() {
      displayText = invoice!.signedRawInvoice;
    });
    final paymentId = await aliceBolt11Handler.send(invoice: invoice!);
    final res = await aliceNode.payment(paymentId: paymentId);
    setState(() {
      displayText =
          "Payment status: ${res?.status.name}\n PaymentId: ${res?.id.field0}";
    });
  }

  stop() async {
    await bobNode.stop();
    await aliceNode.stop();
  }

  Future handleEvent(ldk.Node node) async {
    final res = await node.nextEvent();
    res?.map(paymentSuccessful: (e) {
      if (kDebugMode) {
        print("paymentSuccessful: ${e.paymentHash.data}");
      }
    }, paymentFailed: (e) {
      if (kDebugMode) {
        print("paymentFailed: ${e.paymentHash.data}");
      }
    }, paymentReceived: (e) {
      if (kDebugMode) {
        print("paymentReceived: ${e.paymentHash.data}");
      }
    }, channelReady: (e) {
      if (kDebugMode) {
        print(
            "channelReady: ${e.channelId.data}, userChannelId: ${e.userChannelId.data}");
      }
    }, channelClosed: (e) {
      if (kDebugMode) {
        print(
            "channelClosed: ${e.channelId.data}, userChannelId: ${e.userChannelId.data}");
      }
    }, channelPending: (e) {
      if (kDebugMode) {
        print(
            "channelClosed: ${e.channelId.data}, userChannelId: ${e.userChannelId.data}");
      }
    }, paymentClaimable: (e) {
      if (kDebugMode) {
        print(
            "paymentId: ${e.paymentId.field0.toString()}, claimableAmountMsat: ${e.claimableAmountMsat}, userChannelId: ${e.claimDeadline}");
      }
    });
    await node.eventHandled();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight * 1.8),
            child: Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
              color: Colors.blue,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Node',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            height: 2.5,
                            color: Colors.white)),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Response:",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            displayText,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        aliceBalance.toString(),
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                            color: Colors.blue),
                      ),
                      Text(
                        " sats",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () async {
                        await initBobNode();
                      },
                      child: Text(
                        "Initialize Bob's node",
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await syncWallets();
                      },
                      child: Text(
                        "Sync Alice's & Bob's node",
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await listChannels();
                      },
                      child: Text(
                        'List Channels',
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await totalOnchainBalanceSats();
                      },
                      child: Text(
                        'Get total Onchain BalanceSats',
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await newOnchainAddress();
                      },
                      child: Text(
                        'Get new Onchain Address for Alice and Bob',
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await listeningAddress();
                      },
                      child: Text(
                        'Get node listening addresses',
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await connectOpenChannel();
                      },
                      child: Text(
                        'Connect Open Channel',
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await handleEvent(aliceNode);
                        await handleEvent(bobNode);
                      },
                      child: Text('Handle event',
                          style: GoogleFonts.nunito(
                              color: Colors.indigoAccent,
                              fontSize: 12,
                              height: 1.5,
                              fontWeight: FontWeight.w800))),
                  TextButton(
                      onPressed: () async {
                        await receiveAndSendPayments();
                      },
                      child: Text(
                        'Send & Receive Invoice Payment',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await listPaymentsWithFilter(true);
                      },
                      child: Text(
                        'List Payments',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await listPaymentsWithFilter(true);
                      },
                      child: Text(
                        'Remove the last payment',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await closeChannel();
                      },
                      child: Text(
                        'Close channel',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await stop();
                      },
                      child: Text(
                        'Stop nodes',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  const SizedBox(height: 25),
                  Text(
                    aliceNodeId == null
                        ? "Node not initialized"
                        : "@Id_:${aliceNodeId!.hex}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                        color: Colors.black.withOpacity(.3),
                        fontSize: 12,
                        height: 2,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
