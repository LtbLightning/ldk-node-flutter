<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/dashboard_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/settings_screen.dart';
import 'services/settings_service.dart';
=======
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'package:ldk_node/src/generated/api/types.dart';
import 'package:path_provider/path_provider.dart';
>>>>>>> feat/upgrade-ldk-node-0.5.0

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
<<<<<<< HEAD
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lightning Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppStartupScreen(),
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

class AppStartupScreen extends StatefulWidget {
  const AppStartupScreen({super.key});

  @override
  State<AppStartupScreen> createState() => _AppStartupScreenState();
}

class _AppStartupScreenState extends State<AppStartupScreen> {
  bool _isLoading = true;
  bool _isFirstRun = true;

  @override
  void initState() {
    super.initState();
    _checkFirstRun();
  }

  Future<void> _checkFirstRun() async {
    try {
      final isFirstRun = await SettingsService.isFirstRun();
      setState(() {
        _isFirstRun = isFirstRun;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isFirstRun = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_isFirstRun) {
      return const OnboardingScreen();
    } else {
      return const DashboardScreen();
    }
=======
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
  bool isInitialized = false;
  bool isInitializing = true;

  /*
  // For local esplora server

  String esploraUrl = Platform.isAndroid
      ?
      //10.0.2.2 to access the AVD
      'http://10.0.2.2:30000'
      : 'http://127.0.0.1:30000';*/

  @override
  void initState() {
    super.initState();
    initNodes();
  }

  Future<void> clearStorageDirectories() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final ldkCacheDir = Directory("${directory.path}/ldk_cache");
      
      if (await ldkCacheDir.exists()) {
        await ldkCacheDir.delete(recursive: true);
        debugPrint("Cleared LDK cache directory");
      }
    } catch (e) {
      debugPrint("Error clearing storage directories: $e");
    }
  }

  Future<void> initNodes() async {
    try {
      setState(() {
        displayText = "Clearing old data and initializing nodes...";
        isInitializing = true;
      });
      
      // Clear any old/corrupted storage data
      await clearStorageDirectories();
      
      setState(() {
        displayText = "Initializing Alice's node...";
      });
      
      await initAliceNode();
      
      setState(() {
        displayText = "Initializing Bob's node...";
      });
      
      await initBobNode();
      
      setState(() {
        isInitialized = true;
        isInitializing = false;
        displayText = "Both nodes initialized successfully";
      });
    } catch (e) {
      setState(() {
        isInitializing = false;
        displayText = "Initialization failed: $e";
      });
      debugPrint("Node initialization error: $e");
    }
  }

  Future<ldk.Builder> createBuilder(
      String path, ldk.SocketAddress address, String mnemonic) async {
    final directory = await getApplicationDocumentsDirectory();
    final nodeStorageDir = "${directory.path}/ldk_cache/$path";
    debugPrint(nodeStorageDir);
    // For a node on the mutiny network with default config and service
    ldk.Builder builder = ldk.Builder.mutinynet()
        .setEntropyBip39Mnemonic(mnemonic: ldk.Mnemonic(seedPhrase: mnemonic))
        .setStorageDirPath(nodeStorageDir)
        .setListeningAddresses([address]);
    return builder;
  }

  Future<void> initAliceNode() async {
    aliceNode = await (await createBuilder(
            'alice_mutinynet',
            const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3003),
            "cart super leaf clinic pistol plug replace close super tooth wealth usage"))
        .setNodeAlias("alice_mutinynet_node")
        // .buildWithVssStoreAndFixedHeaders(
        //     vssUrl: "https://mutinynet.ltbl.io/vss",
        //     storeId: "alice_mutinynet_store",
        //     fixedHeaders: {});
        .build();

    await startNode(aliceNode);
    final res = await aliceNode.nodeId();
    aliceNodeId = res;
  }

  Future<void> initBobNode() async {
    bobNode = await (await createBuilder(
            'bob_mutinynet',
            const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3004),
            "puppy interest whip tonight dad never sudden response push zone pig patch"))
        .setNodeAlias("bob_mutinynet_node")
        // .buildWithVssStoreAndFixedHeaders(
        //     vssUrl: "https://mutinynet.ltbl.io/vss",
        //     storeId: "bob_mutinynet_store",
        //     fixedHeaders: {});
        .build();
    await startNode(bobNode);
    final res = await bobNode.nodeId();
    bobNodeId = res;
  }

  startNode(ldk.Node node) async {
    try {
      await node.start();
    } on ldk.NodeException catch (e) {
      debugPrint(e.toString());
    }
  }

  totalOnchainBalanceSats() async {
    final alice = await aliceNode.listBalances();
    final bob = await bobNode.listBalances();
    if (kDebugMode) {
      print("alice's balance: ${alice.totalOnchainBalanceSats}");
      print("alice's lightning balance: ${alice.totalLightningBalanceSats}");
      print("bob's balance: ${bob.totalOnchainBalanceSats}");
      print("bob's lightning balance: ${bob.totalLightningBalanceSats}");
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
    final aliceChannnels = await aliceNode.listChannels();
    final bobChannels = await bobNode.listChannels();
    if (kDebugMode) {
      if (aliceChannnels.isNotEmpty) {
        print("======Alice Channels========");
        for (var e in aliceChannnels) {
          print("counterparty nodeId: ${e.counterpartyNodeId.hex}");
          print("userChannelId: ${e.userChannelId.data}");
          print("confirmations required: ${e.confirmationsRequired}");
          print("isChannelReady: ${e.isChannelReady}");
          print("isUsable: ${e.isUsable}");
          print("outboundCapacityMsat: ${e.outboundCapacityMsat}");
        }
      }
      if (bobChannels.isNotEmpty) {
        print("======Bob Channels========");
        for (var e in bobChannels) {
          print("counterparty nodeId: ${e.counterpartyNodeId.hex}");
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
            print("paymentId: ${e.id.data}");
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
        counterpartyNodeId: const ldk.PublicKey(
          hex:
              '02465ed5be53d04fde66c9418ff14a5f2267723810176c9212b722e542dc1afb1b',
        ));
  }

  connectOpenChannel() async {
    const fundingAmountSat = 80000;
    const pushMsat = (fundingAmountSat / 2) * 1000;
    userChannelId = await aliceNode.openChannel(
        channelAmountSats: BigInt.from(fundingAmountSat),
        socketAddress: const ldk.SocketAddress.hostname(
          addr: '45.79.52.207',
          port: 9735,
        ),
        pushToCounterpartyMsat: BigInt.from(pushMsat),
        nodeId: const ldk.PublicKey(
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
    final bobInvoice = await bobBolt11Handler.receive(
        amountMsat: BigInt.from(5000000),
        description: 'asdf',
        expirySecs: 9217);
    final aliceLBalance =
        (await aliceNode.listBalances()).totalLightningBalanceSats;
    debugPrint("Alice's Lightning balance ${aliceLBalance.toString()}");
    final bobLBalance =
        (await bobNode.listBalances()).totalLightningBalanceSats;
    debugPrint("Bob's Lightning balance ${bobLBalance.toString()}");
    debugPrint(bobInvoice.signedRawInvoice);
    setState(() {
      displayText = bobInvoice.signedRawInvoice;
    });
    final paymentId = await aliceBolt11Handler.send(invoice: bobInvoice);
    debugPrint("Alice's payment id ${paymentId.data.toString()}");
    final res = await aliceNode.payment(paymentId: paymentId);
    setState(() {
      displayText =
          "Payment status: ${res?.status.name}\n PaymentId: ${res?.id.data}";
    });
  }

  stop() async {
    await bobNode.stop();
    await aliceNode.stop();
  }

  Future handleEvent(ldk.Node node) async {
    final res = await node.nextEvent();
    // res?.map(paymentSuccessful: (e) {
    //   if (kDebugMode) {
    //     print("paymentSuccessful: ${e.paymentHash.data}");
    //   }
    // }, paymentFailed: (e) {
    //   if (kDebugMode) {
    //     print("paymentFailed: ${e.paymentHash?.data.toList()}");
    //   }
    // }, paymentReceived: (e) {
    //   if (kDebugMode) {
    //     print("paymentReceived: ${e.paymentHash.data}");
    //   }
    // }, channelReady: (e) {
    //   if (kDebugMode) {
    //     print(
    //         "channelReady: ${e.channelId.data}, userChannelId: ${e.userChannelId.data}");
    //   }
    // }, channelClosed: (e) {
    //   if (kDebugMode) {
    //     print(
    //         "channelClosed: ${e.channelId.data}, userChannelId: ${e.userChannelId.data}");
    //   }
    // }, channelPending: (e) {
    //   if (kDebugMode) {
    //     print(
    //         "channelClosed: ${e.channelId.data}, userChannelId: ${e.userChannelId.data}");
    //   }
    // }, paymentClaimable: (e) {
    //   if (kDebugMode) {
    //     print(
    //         "paymentId: ${e.paymentId.data.toString()}, claimableAmountMsat: ${e.claimableAmountMsat}, userChannelId: ${e.claimDeadline}");
    //   }
    // }, paymentForwarded: (value) {
    //   if (kDebugMode) {
    //     print("paymentForwarded: prevChannelId: ${value.prevChannelId.data}, "
    //         "nextChannelId: ${value.nextChannelId.data}, "
    //         "outboundAmountMsat: ${value.outboundAmountForwardedMsat}, ");
    //   }
    // });


    if (res != null && kDebugMode) {
      switch (res){
        case Event_PaymentClaimable():
          print("Payment claimable: "
              "paymentId: ${res.paymentId.data.toString()}, "
              "claimableAmountMsat: ${res.claimableAmountMsat}, "
              "userChannelId: ${res.claimDeadline}");
          break;
        case Event_PaymentSuccessful():
          print("Payment successful: ${res.paymentHash.data}");
          break;
        case Event_PaymentFailed():
          print("Payment failed: ${res.paymentHash?.data.toList()}");
          break;
        case Event_PaymentReceived():
          print("Payment received: ${res.paymentHash.data}");
          break;
        case Event_ChannelPending():
          print("Channel pending: ${res.channelId.data}");
          break;
        case Event_ChannelReady():
          print("Channel ready: "
              "channelId: ${res.channelId.data}, "
              "userChannelId: ${res.userChannelId.data}");
          break;
        case Event_ChannelClosed():
          print("Channel closed: "
              "channelId: ${res.channelId.data}, "
              "userChannelId: ${res.userChannelId.data}");
          break;
        case Event_PaymentForwarded():
          print("Payment forwarded: "
              "prevChannelId: ${res.prevChannelId.data}, "
              "nextChannelId: ${res.nextChannelId.data}, "
              "outboundAmountMsat: ${res.outboundAmountForwardedMsat}");
          break;
      }
    }
    await node.eventHandled();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight * 2),
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
                  if (isInitializing)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 16),
                          Text("Initializing nodes..."),
                        ],
                      ),
                    ),
                  TextButton(
                      onPressed: isInitialized ? null : () async {
                        if (!isInitializing) {
                          await initNodes();
                        }
                      },
                      child: Text(
                        isInitialized ? "Nodes initialized ✓" : "Initialize Nodes",
                        style: GoogleFonts.nunito(
                            color: isInitialized ? Colors.green : Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: (!isInitialized && !isInitializing) ? () async {
                        setState(() {
                          displayText = "Clearing storage directories...";
                        });
                        await clearStorageDirectories();
                        setState(() {
                          displayText = "Storage cleared. You can now initialize nodes.";
                        });
                      } : null,
                      child: Text(
                        "Clear Storage & Reset",
                        style: GoogleFonts.nunito(
                            color: (!isInitialized && !isInitializing) ? Colors.red : Colors.grey,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: isInitialized ? () async {
                        await syncWallets();
                      } : null,
                      child: Text(
                        "Sync Alice's & Bob's node",
                        style: GoogleFonts.nunito(
                            color: isInitialized ? Colors.indigoAccent : Colors.grey,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: isInitialized ? () async {
                        await listChannels();
                      } : null,
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
                      onPressed: isInitialized ? () async {
                        await totalOnchainBalanceSats();
                      } : null,
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
                      onPressed: isInitialized ? () async {
                        await newOnchainAddress();
                      } : null,
                      child: Text(
                        'Get new Onchain Address for Alice and Bob',
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: isInitialized ? () async {
                        await listeningAddress();
                      } : null,
                      child: Text(
                        'Get node listening addresses',
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: isInitialized ? () async {
                        await connectOpenChannel();
                      } : null,
                      child: Text(
                        'Connect Open Channel',
                        style: GoogleFonts.nunito(
                            color: Colors.indigoAccent,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w800),
                      )),
                  TextButton(
                      onPressed: isInitialized ? () async {
                        await handleEvent(aliceNode);
                        await handleEvent(bobNode);
                      } : null,
                      child: Text('Handle event',
                          style: GoogleFonts.nunito(
                              color: Colors.indigoAccent,
                              fontSize: 12,
                              height: 1.5,
                              fontWeight: FontWeight.w800))),
                  TextButton(
                      onPressed: isInitialized ? () async {
                        await receiveAndSendPayments();
                      } : null,
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
                      onPressed: isInitialized ? () async {
                        await listPaymentsWithFilter(true);
                      } : null,
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
                      onPressed: isInitialized ? () async {
                        await listPaymentsWithFilter(true);
                      } : null,
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
                      onPressed: isInitialized ? () async {
                        await closeChannel();
                      } : null,
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
                      onPressed: isInitialized ? () async {
                        await stop();
                      } : null,
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
                        color: Colors.black.withValues(alpha: 0.3),
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
>>>>>>> feat/upgrade-ldk-node-0.5.0
  }
}
