import 'dart:io';

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

  // Replace this with your local esplora url
  String esploraUrl =
      // "https://testnet-electrs.ltbl.io:3004";
      Platform.isAndroid
          ?
          //10.0.2.2 to access the AVD
          'http://10.0.2.2:30000'
          : 'http://127.0.0.1:30000';

  @override
  void initState() {
    initAliceNode();
    super.initState();
  }

  Future<ldk.Config> initLdkConfig(
      String path, ldk.SocketAddress address) async {
    final directory = await getApplicationDocumentsDirectory();
    final nodePath = "${directory.path}/ldk_cache/$path";
    final config = ldk.Config(
        probingLiquidityLimitMultiplier: 3,
        trustedPeers0Conf: [],
        storageDirPath: nodePath,
        network: ldk.Network.regtest,
        listeningAddresses: [address],
        onchainWalletSyncIntervalSecs: 60,
        walletSyncIntervalSecs: 20,
        feeRateCacheUpdateIntervalSecs: 600,
        logLevel: ldk.LogLevel.debug,
        defaultCltvExpiryDelta: 144);
    return config;
  }

  closeChannel() async {
    await aliceNode.closeChannel(
        userChannelId: userChannelId!, counterpartyNodeId: bobNodeId!);
  }

  Future initAliceNode() async {
    final aliceConfig = await initLdkConfig('alice_regtest',
        ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3003));
    ldk.Builder aliceBuilder = ldk.Builder.fromConfig(config: aliceConfig);
    aliceNode = await aliceBuilder
        .setEntropyBip39Mnemonic(
            mnemonic: ldk.Mnemonic(
                seedPhrase:
                    "cart super leaf clinic pistol plug replace close super tooth wealth usage"))
        .setEsploraServer(esploraUrl)
        .build();
    await startNode(aliceNode);
    final res = await aliceNode.nodeId();
    setState(() {
      aliceNodeId = res;
      displayText = "${aliceNodeId?.hexCode} started successfully";
    });
  }

  startNode(ldk.Node node) async {
    try {
      node.start();
    } on ldk.NodeException catch (e) {
      print(e.toString());
    }
  }

  initBobNode() async {
    final bobConfig = await initLdkConfig(
        "bob_regtest", ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3001));
    ldk.Builder bobBuilder = ldk.Builder.fromConfig(config: bobConfig);
    bobNode = await bobBuilder
        .setEntropyBip39Mnemonic(
            mnemonic: ldk.Mnemonic(
                seedPhrase:
                    'puppy interest whip tonight dad never sudden response push zone pig patch'))
        .setEsploraServer(esploraUrl)
        .build();
    await startNode(bobNode);
    final res = await bobNode.nodeId();
    setState(() {
      bobNodeId = res;
      displayText = "$bobNodeId started successfully";
    });
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
      aliceBalance = alice.spendableOnchainBalanceSats;
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
          print("nodeId: ${aliceNodeId!.hexCode}");
          print("userChannelId: ${e.userChannelId.data}");
          print("channelId: ${e.channelId.data}");
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
            print("hash: ${e.hash.data}");
            print("preimage: ${e.preimage?.data}");
            print("secret: ${e.secret!.data}");
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
      final _ = await aliceNode.removePayment(paymentHash: lastPayment.hash);
      setState(() {
        displayText = "${lastPayment.hash.internal} removed";
      });
    }
  }

  Future<List<String>> newOnchainAddress() async {
    final alice = await aliceNode.newOnchainAddress();
    final bob = await bobNode.newOnchainAddress();
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

  connectOpenChannel() async {
    final funding_amount_sat = 80000;
    final push_msat = (funding_amount_sat / 2) * 1000;
    userChannelId = await aliceNode.connectOpenChannel(
        channelAmountSats: funding_amount_sat,
        announceChannel: true,
        address: bobAddr!,
        pushToCounterpartyMsat: push_msat.toInt(),
        nodeId: bobNodeId!);
  }

  receiveAndSendPayments() async {
    invoice = await bobNode.receivePayment(
        amountMsat: 2500000, description: 'asdf', expirySecs: 9217);
    setState(() {
      displayText = invoice.toString();
    });
    final paymentHash = await aliceNode.sendPayment(invoice: invoice!);
    final res = await aliceNode.payment(paymentHash: paymentHash);
    setState(() {
      displayText = "send payment success ${res?.hash.data}";
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
                        : "@Id_:${aliceNodeId!.hexCode}",
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
