import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:ldk_mobile/ldk_mobile.dart';
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
  late  LdkNode liteNodeOne;
  late  LdkNode liteNodeTwo;
  String ? nodeId;
  int balance = 0;
  String displayText = "";
  String listeningAddress="";
  String invoice= "";
  U8Array32? channelId;

  @override
  void initState() {
    initNodes();
    super.initState();
  }

  Future<int> getUnusedPort(InternetAddress address) {
    return ServerSocket.bind(address ?? InternetAddress.anyIPv4, 0).then((socket) {
      var port = socket.port;
      socket.close();
      return port;
    });
  }
  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }
  Future<LiteConfig> getRandomConfig(String storagePath)async{
    final randDir = generateRandomString(4);
    final randPath = "$storagePath/ldk_cache/$randDir";
    print(randPath);
    Random random =  Random();
    int randPort = random.nextInt(10000);
    const host =  "127.0.0.1";
    final listeningAddress = "$host:$randPort";
    const esploraUrl="https://blockstream.info/testnet/api/";
    final config = LiteConfig(
        storageDirPath:randPath,
        esploraServerUrl: esploraUrl ,
        network: Network.Testnet,
        listeningAddress:  listeningAddress);
    return config;
  }
  getNodeWalletBalance() async{
    final res = await liteNodeOne.getBalance();
    final res2 = await liteNodeTwo.getBalance();
    print("liteNode1: ${res.total}");
    print("liteNode2: ${res2.total}");
    setState(() {
      balance= res2.total;
    });
  }
  Future<LiteConfig> getConfigOne(String path)async{
    final  storagePath = "$path/ldk_cache/node1";
    const host =  "0.0.0.0";
    final listeningAddress = "$host:3314";
    const esploraUrl="http://127.0.0.1:3002";
    final config = LiteConfig(
        storageDirPath:storagePath,
        esploraServerUrl: esploraUrl ,
        network: Network.Regtest,
        listeningAddress:  listeningAddress);
    return config;
  }
  Future<LiteConfig> getConfigTwo(String path)async{
    final  storagePath = "$path/ldk_cache/node2";
    const host =  "0.0.0.0";
    final listeningAddress = "$host:7731";
    const esploraUrl="http://127.0.0.1:3002";
    final config = LiteConfig(
        storageDirPath:storagePath,
        esploraServerUrl: esploraUrl ,
        network: Network.Regtest,
        listeningAddress: listeningAddress);
    return config;
  }
  initNodes() async {
    final path = await getApplicationSupportDirectory();
    final randConfig = await getConfigOne(path.path);
    LiteBuilder liteBuilder = LiteBuilder.fromConfig(config: randConfig);
    liteNodeOne = await liteBuilder.toLdkNode();
    await liteNodeOne.start();
    setState(() {
      nodeId = liteNodeOne.nodeId!;
    });
    final randConfig2 =  await getConfigTwo(path.path);
    LiteBuilder liteBuilder2 = LiteBuilder.fromConfig(config: randConfig2);
    liteNodeTwo = await liteBuilder2.toLdkNode();
    await liteNodeTwo.start();
  }
  initRandomNode() async {
    final path = await getApplicationSupportDirectory();
    final randConfig = await getRandomConfig(path.path);
    LiteBuilder liteBuilder = LiteBuilder.fromConfig(config: randConfig);
    liteNodeOne = await liteBuilder.toLdkNode();
    await liteNodeOne.start();
    setState(() {
      nodeId = liteNodeOne.nodeId!;
    });
  }
  nodeOneSync() async{
    await liteNodeOne.sync();
  }
  nodeTwoSync() async{
    await liteNodeTwo.sync();
  }
  getNewWalletAddress() async{
    final res = await liteNodeOne.getNewAddress();
    final res2 = await liteNodeTwo.getNewAddress();
    if (kDebugMode) {
      print("liteNode1 address: $res");
      print("liteNode2 address: $res2");
    }
    setState(() {
      displayText= res;
    });
  }
  getNodePeerAddress() async{
    final res = await liteNodeOne.getPeerListeningAddress();
    final res2 = await liteNodeTwo.getPeerListeningAddress();
    if (kDebugMode) {
      print("liteNode1 Peer: $res");
      print("liteNode2 Peer: $res2");
    }
    setState(() {
      listeningAddress = res;
      displayText= res;
    });
  }
  connectChannel() async{
    await liteNodeTwo.connectOpenChannel(
       nodePubKeyAndAddress: listeningAddress,
        channelAmountSats: 100000, announceChannel:true);
  }
  receiveAndSendPayments()async{
    invoice = await liteNodeTwo.receivePayments("asdf", 9217, 10000);
    await liteNodeOne.sendPayments(invoice);
  }
  getChannelId()async{
    channelId = await  liteNodeOne.getChannelId();
    if (kDebugMode) {
      print(channelId.toString());
    }
  }
 nextEvent() async{
   await liteNodeTwo.nextEvent();
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight*1.8),
            child: Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
              color: Colors.blue,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lite Node', style: GoogleFonts.montserrat(fontWeight: FontWeight.w900, fontSize: 16,
                        height: 2.5,
                        color: Colors.white)),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Response:",
                            textAlign: TextAlign.center,
                            style:  GoogleFonts.nunito(color: Colors.white, fontSize: 12,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(displayText,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style:  GoogleFonts.nunito(color: Colors.white, fontSize: 12,
                                fontWeight: FontWeight.w700),),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Center(
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$balance",
                        style:  GoogleFonts.montserrat(fontWeight: FontWeight.w900, fontSize: 40,
                            color: Colors.blue),),
                      Text(" sats",
                        style:  GoogleFonts.montserrat(fontWeight: FontWeight.w900, fontSize: 20,
                            color: Colors.blue),),
                    ],
                  ),
                  TextButton(onPressed: () async {
                    await nodeOneSync();
                  },
                      child:  Text('Node1 Sync',
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),

                  TextButton(onPressed: () async {
                    await nodeTwoSync();
                  },
                      child:  Text('Node2 Sync',
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),
                  TextButton(onPressed: () async {
                     await  getChannelId();
                  },
                      child:Text('Get ChannelId',
                        overflow:TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),
                  TextButton(onPressed: () async {
                    await  getNodeWalletBalance();
                  },
                      child:Text('Get Balance',
                        overflow:TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),
                  TextButton(onPressed: () async {
                    await getNewWalletAddress();
                  },
                      child:  Text('Get new address',
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),
                  TextButton(onPressed: () async {
                    await receiveAndSendPayments();
                  },
                      child:  Text('Receive & Send Payment',
                        textAlign: TextAlign.center,
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),

                  TextButton(onPressed: () async {
                    await getNodePeerAddress();
                  },
                      child:  Text('Get node address',
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),
                  TextButton(onPressed: () async {
                    await connectChannel();
                  },
                      child:  Text('Open channel',
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),
                  TextButton(onPressed: () async {
                    await nextEvent();
                  },
                      child:  Text('Next event',
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800))),
                  const Spacer(),

                  Text(nodeId==null? "Node not initialized":"@Id_:${nodeId.toString()}",
                    maxLines: 1,
                    overflow:TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style:  GoogleFonts.nunito(color: Colors.black.withOpacity(.3), fontSize: 12, height: 2,
                        fontWeight: FontWeight.w700),),
                  const  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ));
  }
}
