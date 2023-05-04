import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
// import 'package:path_provider/path_provider.dart';

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
  ldk.SocketAddr? bobAddr;
  ldk.Invoice? invoice;
  ldk.U8Array32? channelId;

  @override
  void initState() {
    initAliceNode();
    super.initState();
  }

  Future<ldk.Config> initLdkConfig(String path, ldk.SocketAddr address) async {
    // Please replace this url with your Electrum RPC Api url
    // Please use 10.0.2.2, instead of 0.0.0.0
    //final directory = await getApplicationDocumentsDirectory();
    final nodePath = "{directory.path}/ldk_cache/$path";
    final esploraUrl =
        Platform.isAndroid ? "http://10.0.2.2:3002" : "http://0.0.0.0:3002";
    final config = ldk.Config(
        storageDirPath: nodePath,
        esploraServerUrl: esploraUrl,
        network: ldk.Network.Regtest,
        listeningAddress: address,
        defaultCltvExpiryDelta: 144);
    return config;
  }

  closeChannel() async {
    await aliceNode.closeChannel(
        channelId: channelId!, counterpartyNodeId: bobNodeId!);
  }

  initAliceNode() async {
    final aliceConfig = await initLdkConfig(
        'alice', const ldk.SocketAddr(ip: "0.0.0.0", port: 3006));
    ldk.Builder aliceBuilder = ldk.Builder.fromConfig(config: aliceConfig);
    aliceNode = await aliceBuilder.build();
    await aliceNode.start();
    final res = await aliceNode.nodeId();
    setState(() {
      aliceNodeId = res;
      displayText = "${aliceNodeId?.keyHex} started successfully";
    });
  }

  initBobNode() async {
    final bobConfig = await initLdkConfig(
        "bob", const ldk.SocketAddr(ip: "0.0.0.0", port: 8077));
    ldk.Builder bobBuilder = ldk.Builder.fromConfig(config: bobConfig);
    bobNode = await bobBuilder.build();
    await bobNode.start();
    final res = await bobNode.nodeId();
    setState(() {
      bobNodeId = res;
      displayText = "$bobNodeId started successfully";
    });
  }

  getNodeBalances() async {
    final alice = await aliceNode.onChainBalance();
    final bob = await bobNode.onChainBalance();
    if (kDebugMode) {
      print("alice's_balance: ${alice.confirmed}");
      print("bob's balance: ${bob.confirmed}");
    }
    setState(() {
      aliceBalance = alice.confirmed;
    });
  }

  syncAliceNode() async {
    await aliceNode.syncWallets();
    setState(() {
      displayText = "aliceNode: Sync Completed";
    });
  }

  getNodeInfo() async {
    final res = await aliceNode.listChannels();
    if (kDebugMode) {
      if (res.isNotEmpty) {
        print("======Channels========");
        for (var e in res) {
          print("nodeId: ${aliceNodeId!.keyHex}");
          print("channelId: ${e.channelId}");
          print("isChannelReady: ${e.isChannelReady}");
          print("isUsable: ${e.isUsable}");
          print("channelValueSatoshis: ${e.outboundCapacityMsat}");
        }
      }
    }
  }

  Future<ldk.PaymentDetails?> listPayments(bool printPayments) async {
    final res = await aliceNode.listPaymentsWithFilter(
        paymentDirection: ldk.PaymentDirection.Outbound);
    if (res.isNotEmpty) {
      if (printPayments) {
        if (kDebugMode) {
          print("======Payments========");
          for (var e in res) {
            print("amountMsat: ${e.amountMsat}");
            print("hash: ${e.hash.field0}");
            print("preimage: ${e.preimage!.field0}");
            print("secret: ${e.secret!.field0}");
          }
        }
      }
      return res.last;
    } else {
      return null;
    }
  }

  removeLastPayment() async {
    final lastPayment = await listPayments(false);
    if (lastPayment != null) {
      final res = await aliceNode.removePayment(paymentHash: lastPayment.hash);
      if (res) {
        setState(() {
          displayText = "${lastPayment.hash.field0} removed";
        });
      } else {
        displayText = "payment not found";
      }
    }
  }

  syncBobNode() async {
    await bobNode.syncWallets();
    setState(() {
      displayText = "bobNode: Sync Completed";
    });
  }

  Future<List<String>> generateNewAddresses() async {
    final alice = await aliceNode.newFundingAddress();
    final bob = await bobNode.newFundingAddress();
    if (kDebugMode) {
      print("alice's address: ${alice.addressHex}");
      print("bob's address: ${bob.addressHex}");
    }
    setState(() {
      displayText = alice.addressHex;
    });
    return [alice.addressHex, bob.addressHex];
  }

  getListeningAddresses() async {
    final alice = await aliceNode.listeningAddress();
    final bob = await bobNode.listeningAddress();
    setState(() {
      bobAddr = bob;
    });
    if (kDebugMode) {
      print("alice's listeningAddress : ${alice!.ip}:${alice.port}");
      print("bob's listeningAddress: ${bob!.ip}:${bob.port}");
    }
  }

  openChannel() async {
    await aliceNode.connectOpenChannel(
        channelAmountSats: 5000000,
        announceChannel: true,
        address: bobAddr!,
        pushToCounterpartyMsat: 50000,
        nodeId: bobNodeId!);
  }

  receiveAndSendPayments() async {
    invoice = await bobNode.receivePayment(
        amountMsat: 100000000, description: 'ALICE', expirySecs: 10000);
    setState(() {
      displayText = invoice.toString();
    });
    final paymentHash = await aliceNode.sendPayment(invoice: invoice!);
    final res = await aliceNode.payment(paymentHash: paymentHash);
    setState(() {
      displayText = "send payment success ${res?.status}";
    });
  }

  getChannelId() async {
    final channelInfos = await aliceNode.listChannels();
    if (channelInfos.isNotEmpty) {
      channelId = channelInfos.first.channelId;
      if (kDebugMode) {
        print(channelId.toString());
      }
      setState(() {
        displayText = channelId.toString();
      });
    } else {
      if (kDebugMode) {
        print("No open channels available");
      }
    }
  }

  stop() async {
    await bobNode.stop();
    await aliceNode.stop();
  }

  Future handleEvent(ldk.Node node) async {
    final res = await node.nextEvent();
    res.map(paymentSuccessful: (e) {
      if (kDebugMode) {
        print("paymentSuccessful: ${e.paymentHash.field0}");
      }
    }, paymentFailed: (e) {
      if (kDebugMode) {
        print("paymentFailed: ${e.paymentHash.field0}");
      }
    }, paymentReceived: (e) {
      if (kDebugMode) {
        print("paymentReceived: ${e.paymentHash.field0}");
      }
    }, channelReady: (e) {
      if (kDebugMode) {
        print(
            "channelReady: ${e.channelId}, userChannelId: ${e.userChannelId}");
      }
    }, channelClosed: (e) {
      if (kDebugMode) {
        print(
            "channelClosed: ${e.channelId}, userChannelId: ${e.userChannelId}");
      }
    }, channelPending: (e) {
      if (kDebugMode) {
        print(
            "channelClosed: ${e.channelId}, userChannelId: ${e.userChannelId}");
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
                        await syncAliceNode();
                      },
                      child: Text(
                        "Sync Alice's node",
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await syncBobNode();
                      },
                      child: Text(
                        "Sync Bob's node",
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await getNodeInfo();
                      },
                      child: Text(
                        'Get nodeInfo',
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
                        await getNodeBalances();
                      },
                      child: Text(
                        'Get node balances',
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
                        await generateNewAddresses();
                      },
                      child: Text(
                        'Get new addresses for Alice and Bob',
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await getListeningAddresses();
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
                        await openChannel();
                      },
                      child: Text(
                        'Open channel',
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
                      child: Text('Next event',
                          style: GoogleFonts.nunito(
                              color: Colors.indigoAccent,
                              fontSize: 12,
                              height: 1.5,
                              fontWeight: FontWeight.w800))),
                  TextButton(
                      onPressed: () async {
                        await getChannelId();
                      },
                      child: Text(
                        'Get channelId',
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
                        await receiveAndSendPayments();
                      },
                      child: Text(
                        'Send Invoice Payment',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await listPayments(true);
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
                        await listPayments(true);
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
                        : "@Id_:${aliceNodeId!.keyHex}",
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
