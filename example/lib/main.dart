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
  String ? nodeId;
  int balance = 0;
  String displayText = "";
  String listeningAddress="";
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
    final randPath = "$storagePath/$randDir";
    final randPort =Random(1000).nextInt(10000);
   final port = Platform.isAndroid?9736:9736;
    listeningAddress = "127.0.0.1:$randPort";
    const esploraUrl="https://blockstream.info/testnet/api";

    final config = LiteConfig(
        storageDirPath: randPath,
        esploraServerUrl: esploraUrl ,
        network: Network.Testnet,
        listeningAddress:  listeningAddress);
    return config;
  }
  getNodeWalletBalance() async{
    final res = await liteNode.getBalance();
    setState(() {
      balance= res;
    });
  }

  initNodes() async {
    final path = await getApplicationSupportDirectory();
    final randConfig = await getRandomConfig(path.path);
    LiteBuilder liteBuilder = LiteBuilder.fromConfig(config: randConfig);
    liteNode = await liteBuilder.toLdkNode();
    await liteNode.start();
    setState(() {
      nodeId = liteNode.nodeId!;
    });
  }
  sync() async{
    await liteNode.sync();
  }
  getNewAddress() async{
    final res = await liteNode.getNewAddress();
    if (kDebugMode) {
      print(res);
    }
    setState(() {
      displayText= res;
    });
  }
  getNodeAddress() async{
    final res =  liteNode.getPeerListeningAddress(listeningAddress);
    if (kDebugMode) {
      print(res);
    }
    setState(() {
      displayText= res;
    });
  }
  connectChannel() async{
    await liteNode.connectOpenChannel(
        nodePubKeyAndAddress: Platform.isAndroid?"03dd0e8f06918401bb07f081a38125a0e13eea611fdf3781390593148e84124fa4@0.0.0.0:9735":
        "0210686fd6d0f2d9a9eacf0268c0445e5d746bdf97608e705bfd9027368823e0cf@0.0.0.0:9736",
        channelAmountSats: 5000, announceChannel:true);
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
                    await sync();
                  },
                      child:Text('Sync ',
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
                    await getNodeWalletBalance();
                  },
                      child:  Text('Get balance',
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
