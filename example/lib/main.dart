import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:ldk_node_flutter/ldk_node_flutter.dart';
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
  late LdkNode aliceNode;
  late LdkNode bobNode;
  PublicKey? aliceNodeId;
  PublicKey? bobNodeId;
  int aliceBalance = 0;
  String displayText = "";
  String bobNodePubKeyAndAddress = "";
  Invoice? invoice;
  String? channelId;

  @override
  void initState() {
    initAliceNode();
    super.initState();
  }

  Future<Config> initLdkConfig(String path, String listeningAddress) async {
    // Please replace this url with your Electrum RPC Api url
    // Please use 10.0.2.2, instead of 0.0.0.0
    final esploraUrl =
        Platform.isAndroid ? "http://10.0.2.2:3002" : "http://0.0.0.0:3002";
    //const esploraUrl = "https://blockstream.info/testnet/api";
    final config = Config(
        storageDirPath: path,
        esploraServerUrl: esploraUrl,
        network: Network.Regtest,
        listeningAddress: listeningAddress);
    return config;
  }

  initAliceNode() async {
    //Path to a directory where the application may place application support files.
    final directory = await getApplicationDocumentsDirectory();
    final alicePath = "${directory.path}/ldk_cache/alice's_node";
    final aliceConfig = await initLdkConfig(alicePath, "0.0.0.0:80");
    NodeBuilder aliceBuilder = NodeBuilder.fromConfig(aliceConfig);
    aliceNode = await aliceBuilder.build();
    await aliceNode.start();
    final res = await aliceNode.nodeId();

    setState(() {
      aliceNodeId = res;
      displayText = "$aliceNodeId started successfully";
    });
  }

  initBobNode() async {
    //Path to a directory where the application may place application support files
    final path = await getApplicationDocumentsDirectory();
    //Specifying node folder
    final bobConfig =
        await initLdkConfig("${path.path}/ldk_cache/bob's_node", "0.0.0.0:81");
    NodeBuilder bobBuilder = NodeBuilder.fromConfig(bobConfig);
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
      print("alice's_balance: ${alice.total}");
      print("bob's balance: ${bob.total}");
    }
    setState(() {
      aliceBalance = alice.total;
    });
  }

  syncAliceNode() async {
    await aliceNode.syncWallet();
    setState(() {
      displayText = "aliceNode: Sync Completed";
    });
  }

  getNodeInfo() async {
    final res = await bobNode.getNodeInfo();
    if (kDebugMode) {
      print("======Channels========");
      for (var e in res.channels) {
        print("channelId: ${e.channelId}");
        print("isChannelReady: ${e.isChannelReady}");
        print("localBalanceMsat: ${e.localBalanceMsat}");
        print("availableBalanceForRecvMsat: ${e.availableBalanceForRecvMsat}");
        print("isChannelReadyToSendPayments: ${e.channelCanSendPayments}");
      }
      print("======Peers========");
      for (var e in res.peers) {
        print("peerId: $e");
      }
    }
  }

  syncBobNode() async {
    await bobNode.syncWallet();
    setState(() {
      displayText = "bobNode: Sync Completed";
    });
  }

  Future<List<String>> generateNewAddresses() async {
    final alice = await aliceNode.newFundingAddress();
    final bob = await bobNode.newFundingAddress();
    if (kDebugMode) {
      print("alice's address: ${alice.asString}");
      print("bob's address: ${bob.asString}");
    }
    setState(() {
      displayText = alice.asString;
    });
    return [alice.asString, bob.asString];
  }

  getListeningAddresses() async {
    final alice = await aliceNode.listeningAddress();
    final bob = await bobNode.listeningAddress();
    setState(() {
      bobNodePubKeyAndAddress = "${bobNodeId!.asString}@$bob";
      displayText = "bob's node pubKey & Address : $bobNodePubKeyAndAddress";
    });
    if (kDebugMode) {
      print("alice's listeningAddress : $alice");
      print("bob's listeningAddress: $bob");
    }
  }

  openChannel() async {
    await aliceNode.connectOpenChannel(
        nodePubKeyAndAddress: bobNodePubKeyAndAddress,
        channelAmountSats: 5000000,
        announceChannel: true);
  }

  //Failed to send payment due to routing failure: Failed to find a path to the given destination
  receiveAndSendPayments() async {
    invoice = await bobNode.receivePayment("asdf", 10000, 100000000);
    setState(() {
      displayText = invoice.toString();
    });
    final paymentHash = await aliceNode.sendPayment(invoice!);
    final res = await aliceNode.paymentInfo(paymentHash);
    setState(() {
      displayText = "send payment success ${res?.status}";
    });
  }

  getChannelId() async {
    final channelInfos = await aliceNode.getChannelIds();
    if (channelInfos.isNotEmpty) {
      channelId = channelInfos.first;
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

  Future handleEvent(LdkNode node) async {
    final res = await node.nextEvent();
    res?.map(paymentSuccessful: (e) {
      if (kDebugMode) {
        print("paymentSuccessful: ${e.paymentHash.asString}");
      }
    }, paymentFailed: (e) {
      if (kDebugMode) {
        print("paymentFailed: ${e.paymentHash.asString}");
      }
    }, paymentReceived: (e) {
      if (kDebugMode) {
        print("paymentReceived: ${e.paymentHash.asString}");
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
    });
    await node.eventHandled();
  }

  closeChannel() async {
    await bobNode.closeChannel(channelId!, aliceNodeId!);
  }

  stop() async {
    await bobNode.stop();
    await aliceNode.stop();
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
                    Text('Ldk Node',
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
                        "$aliceBalance",
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
                        : "@Id_:${aliceNodeId!.asString}",
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
