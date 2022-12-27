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
  late  LdkNode liteNode;
  late  LdkNode liteNode2;
  String ? nodeId;
  int balance = 0;
  String displayText = "";
  String listeningAddress="";
  String invoice= "";
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
    listeningAddress = "$host:$randPort";
    const esploraUrl="https://blockstream.info/testnet/api";
    final config = LiteConfig(
        storageDirPath:randPath,
        esploraServerUrl: esploraUrl ,
        network: Network.Testnet,
        listeningAddress:  listeningAddress);
    return config;
  }
  receivePayment()async{
    final res = await liteNode.receivePayments("asdf", 9217, 1000);
  }
  getNodeWalletBalance() async{
    final res = await liteNode.getBalance();
    final res2 = await liteNode2.getBalance();
    print("liteNode1: $res");
    print("liteNode2: $res2");
    setState(() {
      balance= res;
    });
  }
  getChannelId()async{
   final res = await  liteNode.getChannelId();
   print(res.toString());
  }
  Future<LiteConfig> getConfig1(String path)async{
    final  storagePath = "$path/ldk_cache/node1";
    const host =  "0.0.0.0";
    listeningAddress = "$host:3314";
    const esploraUrl="https://blockstream.info/testnet/api";
    final config = LiteConfig(
        storageDirPath:storagePath,
        esploraServerUrl: esploraUrl ,
        network: Network.Testnet,
        listeningAddress:  listeningAddress);
    return config;
  }

  Future<LiteConfig> getConfig2(String path)async{
    final  storagePath = "$path/ldk_cache/node2";
    const host =  "0.0.0.0";
    listeningAddress = "$host:7731";
    const esploraUrl="https://blockstream.info/testnet/api";
    final config = LiteConfig(
        storageDirPath:storagePath,
        esploraServerUrl: esploraUrl ,
        network: Network.Testnet,
        listeningAddress: listeningAddress);
    return config;
  }
  initNodes() async {
    final path = await getApplicationSupportDirectory();
    print("loading config");
    final randConfig = await getConfig1(path.path);
    print("initializing builder");
    LiteBuilder liteBuilder = LiteBuilder.fromConfig(config: randConfig);
    liteNode = await liteBuilder.toLdkNode();
    print("starting node");
    await liteNode.start();
    setState(() {
      nodeId = liteNode.nodeId!;
    });
    print("$nodeId started");
    print("==========");
    print("loading config");
    final randConfig2 =  await getConfig2(path.path);
    print("initializing builder");
    LiteBuilder liteBuilder2 = LiteBuilder.fromConfig(config: randConfig2);
    liteNode2 = await liteBuilder2.toLdkNode();
    print("starting node");
    await liteNode2.start();
    print("${liteNode2.nodeId} started");
  }
  initNode() async {
    final path = await getApplicationSupportDirectory();
    final randConfig = await getRandomConfig(path.path);
    LiteBuilder liteBuilder = LiteBuilder.fromConfig(config: randConfig);
    liteNode = await liteBuilder.toLdkNode();
    await liteNode.start();
    setState(() {
      nodeId = liteNode.nodeId!;
    });
  }
  node1Sync() async{
    await liteNode.sync();
  }
  node2Sync() async{
    await liteNode2.sync();
  }
  getNewAddress() async{
    final res = await liteNode.getNewAddress();
    final res2 = await liteNode2.getNewAddress();
    if (kDebugMode) {
      print("liteNode1: $res");
      print("liteNode2: $res2");
    }
    setState(() {
      displayText= res;
    });
  }
  getNodeAddress() async{
    final res = await liteNode.getPeerListeningAddress();
    final res2 = await liteNode2.getPeerListeningAddress();
    if (kDebugMode) {
      print("liteNode1: $res");
      print("liteNode2: $res2");
    }
    setState(() {
      displayText= res;
    });
  }
  connectChannel() async{
    await liteNode.connectOpenChannel(
       nodePubKeyAndAddress: "0328b4c9c2753096e672b4938a203fe629bae60ff9c7dcda42c80fab730afb1f76@0.0.0.0:7731",
        channelAmountSats: 10000, announceChannel:true);
  }
  receivedPayment() async{
    final res  = await liteNode.receivePayments("asdf", 9217, 1000);
    setState(() {
      invoice = res;
    });
    print(invoice);
  }
 nextEvent() async{
   await liteNode2.nextEvent();
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
                     await  getChannelId();
                  },
                      child:Text('Get ChannelId',
                        overflow:TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),
                  TextButton(onPressed: () async {
                    await getNewAddress();
                  },
                      child:  Text('Get new address',
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),
                  TextButton(onPressed: () async {
                    await receivePayment();
                  },
                      child:  Text('Receive payment',
                        textAlign: TextAlign.center,
                        style:   GoogleFonts.nunito(color: Colors.indigoAccent, fontSize: 12, height: 1.5,
                            fontWeight: FontWeight.w800),)),

                  TextButton(onPressed: () async {
                    await getNodeAddress();
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
