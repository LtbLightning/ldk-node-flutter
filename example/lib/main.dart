import 'dart:io';
import 'dart:math';

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
  late  LdkNode liteNodeA;
  late  LdkNode liteNodeB;
  String ? nodeAId;
  String ? nodeBId;
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
    final availablePort = await getUnusedPort(InternetAddress.anyIPv4);
    final esploraUrl = "http://0.0.0.0:$availablePort";
    final randDir = generateRandomString(4);
    final randPath = "$storagePath/$randDir";
   final randPort =Random(1000).nextInt(10000);
   final listeningAddress = "127.0.0.1:$randPort";
   final config = LiteConfig(storageDirPath: randPath, esploraServerUrl:  esploraUrl, network: Network.Regtest, listeningAddress:  listeningAddress);
   return config;
  }
  initNodes() async {
    final path = await getApplicationSupportDirectory();
    final randConfig = await getRandomConfig(path.path);
    LiteBuilder liteBuilder = LiteBuilder.fromConfig(config: randConfig);
    liteNodeA = await liteBuilder.toLdkNode();
   await liteNodeA.start();
    setState(() {
      nodeAId = liteNodeA.nodeId!;
    });
    final randConfig2 = await getRandomConfig(path.path);
    LiteBuilder liteBuilder2 = LiteBuilder.fromConfig(config: randConfig2);
    liteNodeB = await liteBuilder2.toLdkNode();
    await liteNodeB.start();
   setState(() {
     nodeBId = liteNodeB.nodeId!;
   });
  }
  sync() async{
  //  await liteNode.sync();
  }
  connectChannel({  required String nodePubkeyAndAddress,   required int channelAmountSats,   required bool announceChannel, }) async{
    final res =  await liteNodeA.connectOpenChannel(
        nodePubkeyAndAddress: nodePubkeyAndAddress,
        channelAmountSats: channelAmountSats, announceChannel: announceChannel);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lite Node'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children:  [
                  Text(nodeAId==null? "Node uninitialized":'Node A Id :',
                    maxLines: 2,
                    overflow:TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.blue, fontSize: 12, height: 2, fontWeight: FontWeight.w600),),
                Text(nodeAId==null? "":nodeAId.toString(),
                  maxLines: 1,
                  overflow:TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 10, height: 2, fontWeight: FontWeight.w500),),
                const SizedBox(height: 10,),
                Text(nodeAId==null? "Node uninitialized":'Node B Id :',
                  maxLines: 2,
                  overflow:TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.blue, fontSize: 12, height: 2, fontWeight: FontWeight.w600),),
                Text(nodeBId==null? "":nodeAId.toString(),
                  maxLines: 1,
                  overflow:TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 10, height: 2, fontWeight: FontWeight.w500),),
               const SizedBox(height: 50,),
                TextButton(onPressed: () async {
                  await sync();
                },
                    child: const Text('Sync ',
                      maxLines: 2,
                      overflow:TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue, fontSize: 12, height: 2, fontWeight: FontWeight.w600),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
