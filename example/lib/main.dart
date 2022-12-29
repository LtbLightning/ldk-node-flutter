import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:ldk_node_example/utils/electrs.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ldk_node/ldk_node.dart';

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
  String? nodeId;
  int aliceBalance = 0;
  String displayText = "";
  String aliceNodePubKeyAndAddress = "";
  String invoice = "";
  U8Array32? channelId;
  @override
  void initState() {
    initAliceNode();
    super.initState();
  }
  Future<int> getUnusedPort(InternetAddress address) {
    return ServerSocket.bind(address ?? InternetAddress.anyIPv4, 0)
        .then((socket) {
      var port = socket.port;
      socket.close();
      return port;
    });
  }
  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }
  initRandomNode() async {
    final path = await getApplicationSupportDirectory();
    final randDir = generateRandomString(4);
    final randPath = "$path/ldk_cache/$randDir";
    Random random = Random();
    int randPort = random.nextInt(10000);
    const host = "127.0.0.1";
    final nodePubKeyAndAddress = "$host:$randPort";
    final randConfig = await configureLiteConfig(randPath, nodePubKeyAndAddress);
    NodeBuilder liteBuilder = NodeBuilder.fromConfig(config: randConfig);
    aliceNode = await liteBuilder.toLdkNode();
    await aliceNode.start();
    setState(() {
      nodeId = aliceNode.nodeId!;
    });
  }
  Future<Config> configureLiteConfig(
      String path, String nodePubKeyAndAddress) async {
    final  esploraUrl = Platform.isAndroid? "http://10.0.2.2:3002":"http://127.0.0.1:3002";
    final config = Config(
        storageDirPath: path,
        esploraServerUrl: esploraUrl,
        network: Network.Regtest,
        listeningAddress: nodePubKeyAndAddress);
    return config;
  }
  initAliceNode() async {
    final path = await getApplicationSupportDirectory();
    final aliceConfig = await configureLiteConfig(
        "${path.path}/ldk_cache/node_.1", "0.0.0.0:3314");
    NodeBuilder aliceBuilder = NodeBuilder.fromConfig(config: aliceConfig);
    aliceNode = await aliceBuilder.toLdkNode();
    await aliceNode.start();
    setState(() {
      nodeId = aliceNode.nodeId!;
    });
  }
  initBobNode() async {
    final path = await getApplicationSupportDirectory();
    final bobConfig = await configureLiteConfig("${path.path}/ldk_cache/node_.2", "0.0.0.0:7731");
    NodeBuilder bobBuilder = NodeBuilder.fromConfig(config: bobConfig);
    bobNode = await bobBuilder.toLdkNode();
    await bobNode.start();
  }
  getNodeBalance() async {
    final alice = await aliceNode.getBalance();
    final bob = await bobNode.getBalance();
    if (kDebugMode) {
      print("alice balance: ${alice.total}");
      print("bob balance: ${bob.total}");
    }
    setState(() {
      aliceBalance = alice.total;
    });
  }
  aliceLdkNodeSync() async {
    await aliceNode.sync();
  }
  getNodeInfo() async {
    final res =   await aliceNode.getNodeInfo();
    print("======Channels========");
    for (var e in res.channels){
      print("channelId: ${e.channelId}");
      print("isChannelReady: ${e.isChannelReady}");
      print("localBalanceMsat: ${e.localBalanceMsat}");
      print("availableBalanceForRecvMsat: ${e.availableBalanceForRecvMsat}");
      print("isChannelReadyToSendPayments: ${e.channelCanSendPayments}");
    }
    print("======Peers========");
    for (var e in res.peers){
      print("peerId: $e");
    }
  }
  bobLdkNodeSync() async {
    await bobNode.sync();
  }
  Future<List<String>> generateNewAddresses() async {
    final alice = await aliceNode.getNewAddress();
    final bob = await bobNode.getNewAddress();
    if (kDebugMode) {
      print("alice address: $alice");
      print("bob address: $bob");
    }
    setState(() {
      displayText = alice;
    });
    return [alice, bob];
  }
  mineBlocks() async {
    final address = await getNewAddress();
    final res = await generateToAddress(address, 5);
    for (var e in res) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  getNodePubKeyAndAddress() async {
    final alice = await aliceNode.getPeerListeningAddress();
    final bob = await bobNode.getPeerListeningAddress();
    setState(() {
      aliceNodePubKeyAndAddress = alice;
      displayText = alice;
    });
    if (kDebugMode) {
      print("alice nodePubKeyAndAddress : $alice");
      print("bob nodePubKeyAndAddress: $bob");
    }
  }
  openChannel() async {
    await bobNode.openChannel(
        nodePubKeyAndAddress: aliceNodePubKeyAndAddress,
        channelAmountSats: 100000,
        announceChannel: true);
  }
  //Failed to send payment due to routing failure: Failed to find a path to the given destination
  receiveAndSendPayments() async {
    invoice = await aliceNode.receivePayments("asdf", 10000, 10000);
    await bobNode.sendPayments(invoice);
  }
  getChannelId() async {
    channelId = await aliceNode.getChannelId();
    if (kDebugMode) {
      print(channelId.toString());
    }
  }
  nextEvent() async {
    await bobNode.nextEvent();
  }
  closeChannel() async{
    await bobNode.closeChannel(channelId!,  aliceNodePubKeyAndAddress);
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Center(
              child: Column(
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
                        'Init Bob Wallet',
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await aliceLdkNodeSync();
                      },
                      child: Text(
                        'Sync Alice Node',
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await bobLdkNodeSync();
                      },
                      child: Text(
                        'Sync Bob Node',
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
                        'Get NodeInfo',
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
                        await getNodeBalance();
                      },
                      child: Text(
                        'Get Balance',
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
                        'Get Address',
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await mineBlocks();
                      },
                      child: Text(
                        'Mine Blocks',
                        style: GoogleFonts.nunito(
                            color: Colors.red,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: () async {
                        await getNodePubKeyAndAddress();
                      },
                      child: Text(
                        'Get Node PubKey & Address',
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
                        await nextEvent();
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
                        'Get ChannelId',
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
                        'Receive & Send Payment',
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
                        'Close Channel',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  const Spacer(),
                  Text(
                    nodeId == null
                        ? "Node not initialized"
                        : "@Id_:${nodeId.toString()}",
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
