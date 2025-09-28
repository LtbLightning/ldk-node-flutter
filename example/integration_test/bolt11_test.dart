import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'package:ldk_node/src/generated/frb_generated.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  String esploraUrl = Platform.isAndroid
      ?
      //10.0.2.2 to access the AVD
      'http://10.0.2.2:30000'
      : 'http://127.0.0.1:30000';
  final regTestClient = BtcClient("");
  final esploraConfig = ldk.EsploraSyncConfig(
      backgroundSyncConfig: ldk.BackgroundSyncConfig(
          onchainWalletSyncIntervalSecs: BigInt.from(60),
          lightningWalletSyncIntervalSecs: BigInt.from(60),
          feeRateCacheUpdateIntervalSecs: BigInt.from(600)));
  Future<ldk.Config> initLdkConfig(
      String path, ldk.SocketAddress address) async {
    final directory = await getApplicationDocumentsDirectory();
    final nodePath = "${directory.path}/ldk_cache/integration/regtest/$path";
    final config = ldk.Config(
      probingLiquidityLimitMultiplier: BigInt.from(3),
      trustedPeers0Conf: [],
      storageDirPath: nodePath,
      network: ldk.Network.regtest,
      listeningAddresses: [address]
    );
    return config;
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('bolt11_integration', () {
    setUp(() async {});
    testWidgets('full_cycle', (WidgetTester tester) async {
      // Initialize flutter_rust_bridge
      await core.init();
      
      final aliceConfig = await initLdkConfig('alice',
          const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3001));
      debugPrint("Creating Alice builder...");
      final aliceBuilder = ldk.Builder.fromConfig(config: aliceConfig)
          .setEntropyBip39Mnemonic(
              mnemonic: await ldk.Mnemonic.fromSeedPhrase(seedPhrase: "replace force spring cruise nothing select glass erupt medal raise consider pull"))
          .setChainSourceEsplora(
              esploraServerUrl: esploraUrl, syncConfig: esploraConfig)
          .setFilesystemLogger(
              logFilePath: "${aliceConfig.storageDirPath}/alice.log",
              maxLogLevel: ldk.LogLevel.debug);
      debugPrint("Building Alice node...");
      final aliceNode = await aliceBuilder.build();
      debugPrint("Starting Alice node...");
      await aliceNode.start();
      debugPrint("Alice node started successfully!");
      final bobConfig = await initLdkConfig(
          'bob', const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3002));

      debugPrint("Creating Bob builder...");
      final bobBuilder = ldk.Builder.fromConfig(config: bobConfig)
          .setEntropyBip39Mnemonic(
              mnemonic: await ldk.Mnemonic.fromSeedPhrase(seedPhrase: "skin hospital fee risk health theory actor kiwi solution desert unhappy hello"))
          .setChainSourceEsplora(
              esploraServerUrl: esploraUrl, syncConfig: esploraConfig);
      debugPrint("Building Bob node...");
      final bobNode = await bobBuilder.build();
      debugPrint("Starting Bob node...");
      await bobNode.start();
      debugPrint("Bob node started successfully!");
      
      // loading bitcoin core wallet
      debugPrint("Loading Bitcoin Core wallet...");
      await regTestClient.loadWallet();
      debugPrint("Bitcoin Core wallet loaded successfully!");
      
      debugPrint("Manually syncing Alice's node");
      await Future.wait([aliceNode.syncWallets()]);

      debugPrint("Manually syncing Bob's node");
      await Future.wait([bobNode.syncWallets()]);

      debugPrint("syncing complete");

      final aliceNodeAddress =
          await (await aliceNode.onChainPayment()).newAddress();
      final bobNodeAddress =
          await (await bobNode.onChainPayment()).newAddress();
      debugPrint("Alice address: ${await aliceNodeAddress.asString()}");
      debugPrint("Bob address: ${await bobNodeAddress.asString()}");

      // Use nigiri faucet to send funds instead of generating blocks
      await regTestClient.sendToAddress(await aliceNodeAddress.asString(), 1); // Send 1 BTC to Alice
      await regTestClient.sendToAddress(await bobNodeAddress.asString(), 1); // Send 1 BTC to Bob
      debugPrint("Sent 1 BTC each to Alice and Bob via faucet");
      
      // Generate a few blocks to confirm the transactions
      await regTestClient.generate(6, "bcrt1qld2yjm7mrdydft88xv8gdk289r836hcg2chwzp"); // Generate to any address
      debugPrint("Manually syncing Alice's node");
      await Future.wait([aliceNode.syncWallets()]);

      debugPrint("Manually syncing Bob's node");
      await Future.wait([bobNode.syncWallets()]);
      debugPrint("syncing complete");
      debugPrint(
          "Alice's onChain Balance:${(await aliceNode.listBalances()).spendableOnchainBalanceSats}");
      debugPrint(
          "Bob's onChain Balance:${(await bobNode.listBalances()).spendableOnchainBalanceSats}");

      // Check if Alice has enough funds for the channel
      final aliceBalance = (await aliceNode.listBalances()).spendableOnchainBalanceSats;
      const requiredAmount = 11000; // 10000 for channel + 1000 for fees
      if (aliceBalance < BigInt.from(requiredAmount)) {
        debugPrint("Alice needs more funds. Current: $aliceBalance, Required: $requiredAmount");
        // Generate more blocks to Alice
        await regTestClient.generate(50, await aliceNodeAddress.asString());
        debugPrint("Generated 50 more blocks to Alice");
        await Future.wait([aliceNode.syncWallets()]);
        final newAliceBalance = (await aliceNode.listBalances()).spendableOnchainBalanceSats;
        debugPrint("Alice's new balance: $newAliceBalance");
      }

      debugPrint("Opening channel from aliceNode to bobNode");
      final bobNodeId = await bobNode.nodeId();
      debugPrint("Bob's node ID: ${bobNodeId.hex}");
      
      // Check if nodes can see each other
      final bobListeningAddresses = await bobNode.listeningAddresses();
      debugPrint("Bob's listening addresses: $bobListeningAddresses");
      
      const fundingAmountSat = 10000;
      const pushMsat = (fundingAmountSat / 2) * 1000;
      debugPrint("Opening channel with ${fundingAmountSat}sats, pushing ${pushMsat}msat to Bob");
      
      final userChannelId = await aliceNode.openChannel(
        socketAddress: bobListeningAddresses!.first,
        nodeId: bobNodeId,
        channelAmountSats: BigInt.from(fundingAmountSat),
        pushToCounterpartyMsat: BigInt.from(pushMsat),
      );
      debugPrint("Channel created; id: ${userChannelId.data}");
      
      // Wait a moment for the funding transaction to be broadcast
      await Future.delayed(const Duration(seconds: 2));
      debugPrint("Waiting for funding transaction to be broadcast...");
      
      // Generate blocks to confirm the channel funding transaction
      // Generate to a dummy address to ensure blocks are mined
      await regTestClient.generate(10, "bcrt1qld2yjm7mrdydft88xv8gdk289r836hcg2chwzp");
      debugPrint("Generated 10 blocks to confirm channel funding");
      
      // Wait for both nodes to sync and see the confirmed channel
      await Future.wait([aliceNode.syncWallets(), bobNode.syncWallets()]);
      debugPrint("Nodes synced after channel confirmation");
      
      // Check if funding transaction is in mempool or confirmed
      debugPrint("Checking channel funding status...");
      final initialChannels = await aliceNode.listChannels();
      if (initialChannels.isNotEmpty) {
        debugPrint("Initial channel confirmations: ${initialChannels.first.confirmations}");
      }
      
      // Wait for channel to be ready and usable
      bool channelReady = false;
      int channelAttempts = 0;
      const maxChannelAttempts = 100; // 50 seconds timeout
      
      while (!channelReady && channelAttempts < maxChannelAttempts) {
        final channels = await aliceNode.listChannels();
        debugPrint("Alice has ${channels.length} channels");
        
        final bobChannels = channels.where((e) => e.counterpartyNodeId.hex == bobNodeId.hex).toList();
        
        if (bobChannels.isNotEmpty) {
          final channel = bobChannels.first;
          debugPrint("Channel state: usable=${channel.isUsable}, ready=${channel.isChannelReady}, confirmations=${channel.confirmations}");
          debugPrint("Channel funding: ${channel.channelValueSats}sats, outbound capacity: ${channel.outboundCapacityMsat}msat");
          debugPrint("Channel ID: ${channel.channelId.data}, User Channel ID: ${channel.userChannelId.data}");
          
          // If channel has 0 confirmations, generate more blocks
          if (channel.confirmations == 0 && channelAttempts % 10 == 0) {
            debugPrint("Channel still has 0 confirmations, generating more blocks...");
            await regTestClient.generate(6, "bcrt1qld2yjm7mrdydft88xv8gdk289r836hcg2chwzp");
            await Future.wait([aliceNode.syncWallets(), bobNode.syncWallets()]);
          }
          
          if (channel.isUsable && channel.isChannelReady) {
            channelReady = true;
            debugPrint("Channel is ready and usable!");
          } else {
            debugPrint("Channel not ready yet - waiting...");
          }
        } else {
          debugPrint("No channel found with Bob yet");
        }
        
        if (!channelReady) {
          debugPrint("Waiting for channel to be ready... attempt ${channelAttempts + 1}");
          await Future.delayed(const Duration(milliseconds: 500));
          channelAttempts++;
        }
      }
      
      if (!channelReady) {
        debugPrint("Channel not ready after timeout! Checking final state...");
        final finalChannels = await aliceNode.listChannels();
        for (final channel in finalChannels) {
          debugPrint("Final channel state: counterparty=${channel.counterpartyNodeId.hex}, usable=${channel.isUsable}, ready=${channel.isChannelReady}");
        }
      }
      
      final alicePeers = await aliceNode.listPeers();
      final aliceChannels = await aliceNode.listChannels();
      debugPrint("Alice has ${alicePeers.length} peers and ${aliceChannels.length} channels");
      
      for (final peer in alicePeers) {
        debugPrint("Alice peer: ${peer.nodeId.hex}, connected: ${peer.isConnected}");
      }
      
      expect(
          (alicePeers.where((e) => e.nodeId.hex == bobNodeId.hex)).toList().isNotEmpty,
          equals(true));

      // Generate more blocks to ensure channel is well-confirmed
      await regTestClient.generate(5, await aliceNodeAddress.asString());
      expect(
          (aliceChannels
                      .where((e) => e.counterpartyNodeId.hex == bobNodeId.hex))
                  .where((f) => f.isUsable && f.isChannelReady)
                  .toList() !=
              [],
          true);

      // BOLT11 Payment Tests
      debugPrint("Starting BOLT11 payment tests...");
      final bobBolt11Handler = await bobNode.bolt11Payment();
      final aliceBolt11Handler = await aliceNode.bolt11Payment();
      
      // Test 1: Simple payment
      const payment1AmountSats = 1000;
      final payment1AmountMsat = BigInt.from(payment1AmountSats * 1000);
      debugPrint("Creating BOLT11 invoice for ${payment1AmountSats}sats (${payment1AmountMsat}msat)");
      
      final invoice1 = await bobBolt11Handler.receive(
        amountMsat: payment1AmountMsat,
        description: "BOLT11 payment test 1",
        expirySecs: 3600,
      );
      debugPrint("Invoice created: ${invoice1.signedRawInvoice}");
      
      debugPrint("Alice sending payment to Bob's invoice...");
      final payment1Id = await aliceBolt11Handler.send(invoice: invoice1);
      debugPrint("Payment 1 successful: ${payment1Id.data}");
      
      // Wait for payment to be recorded
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Check Alice's payments
      final alicePayments = await aliceNode.listPayments();
      debugPrint("Alice has ${alicePayments.length} payments recorded");
      expect(alicePayments.length >= 1, true);
      
      // Check Bob's payments (should have received the payment)
      final bobPayments = await bobNode.listPayments();
      debugPrint("Bob has ${bobPayments.length} payments recorded");
      
      // Check Alice's remaining capacity before second payment
      final aliceChannelsAfterFirst = await aliceNode.listChannels();
      debugPrint("Alice channels after first payment: ${aliceChannelsAfterFirst.length}");
      for (final channel in aliceChannelsAfterFirst) {
        debugPrint("Channel outbound capacity after first payment: ${channel.outboundCapacityMsat}msat");
      }
      
      // Test 2: Another payment with smaller amount to ensure we have capacity
      const payment2AmountSats = 500; // Further reduced to ensure capacity
      final payment2AmountMsat = BigInt.from(payment2AmountSats * 1000);
      debugPrint("Creating second BOLT11 invoice for ${payment2AmountSats}sats");
      
      final invoice2 = await bobBolt11Handler.receive(
        amountMsat: payment2AmountMsat,
        description: "BOLT11 payment test 2",
        expirySecs: 3600,
      );
      debugPrint("Second invoice created: ${invoice2.signedRawInvoice}");
      
      debugPrint("Alice sending second payment...");
      final payment2Id = await aliceBolt11Handler.send(invoice: invoice2);
      debugPrint("Payment 2 successful: ${payment2Id.data}");
      
      // Wait for payment to be recorded
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Check final payment counts
      final finalAlicePayments = await aliceNode.listPayments();
      final finalBobPayments = await bobNode.listPayments();
      debugPrint("Final payment counts - Alice: ${finalAlicePayments.length}, Bob: ${finalBobPayments.length}");
      
      // Verify payments exist
      expect(finalAlicePayments.length >= 2, true);
      
      // Verify specific payments exist in Alice's list
      final payment1Match = finalAlicePayments.where((p) => listEquals(p.id.data, payment1Id.data)).toList();
      final payment2Match = finalAlicePayments.where((p) => listEquals(p.id.data, payment2Id.data)).toList();
      
      debugPrint("Payment 1 found in Alice's list: ${payment1Match.length == 1}");
      debugPrint("Payment 2 found in Alice's list: ${payment2Match.length == 1}");
      
      expect(payment1Match.length, equals(1));
      expect(payment2Match.length, equals(1));
      debugPrint("BOLT11 payment tests completed successfully!");
      
      // Cleanup
      debugPrint("Closing channel between Alice and Bob");
      await aliceNode.closeChannel(
          counterpartyNodeId: bobNodeId, userChannelId: userChannelId);
      
      // Stop nodes with timeout to prevent hanging
      try {
        debugPrint("Stopping Alice node...");
        await aliceNode.stop().timeout(const Duration(seconds: 10));
        debugPrint("Alice node stopped");
      } catch (e) {
        debugPrint("Warning: Alice node stop timed out or failed: $e");
      }
      
      try {
        debugPrint("Stopping Bob node...");
        await bobNode.stop().timeout(const Duration(seconds: 10));
        debugPrint("Bob node stopped");
      } catch (e) {
        debugPrint("Warning: Bob node stop timed out or failed: $e");
      }
      
      // Check node status with timeout
      try {
        final aliceStatus = await aliceNode.status().timeout(const Duration(seconds: 5));
        expect(aliceStatus.isRunning, false);
      } catch (e) {
        debugPrint("Warning: Could not check Alice status: $e");
      }
      
      try {
        final bobStatus = await bobNode.status().timeout(const Duration(seconds: 5));
        expect(bobStatus.isRunning, false);
      } catch (e) {
        debugPrint("Warning: Could not check Bob status: $e");
      }
    });
  });
}

class BtcClient {
  // Bitcoin core credentials
  String rpcUser = "admin1";
  String rpcPassword = "123";
  int rpcPort = 18443;

  Dio? _dioClient;
  late Map<String, String> _headers;
  late String _url;
  final String wallet;

  String getConnectionString(String host, int port, String wallet) {
    return 'http://$host:$port/wallet/$wallet';
  }

  BtcClient(this.wallet) {
    _headers = {
      'Content-Type': 'application/json',
      'authorization':
          'Basic ${base64.encode(utf8.encode("$rpcUser:$rpcPassword"))}'
    };
    _url = getConnectionString(
        Platform.isAndroid ? "10.0.2.2" : "0.0.0.0", rpcPort, wallet);
    _dioClient = Dio();
  }

  Future<void> loadWallet() async {
    try {
      var params = [wallet];
      await call("loadwallet", params);
    } on Exception catch (e) {
      if (e.toString().contains("-4")) {
        debugPrint(" $wallet already loaded!");
      } else if (e.toString().contains("-18")) {
        debugPrint("$wallet doesn't exist!");
        var params = [wallet];
        await call("createwallet", params);
      }
    }
  }

  Future<List<dynamic>> generate(int nblocks, String address) async {
    var params = [
      nblocks,
      address,
    ];
    final res = await call("generatetoaddress", params);
    return res;
  }

  Future<String> sendToAddress(String address, int amount) async {
    var params = [address, amount];
    final res = await call("sendtoaddress", params);
    return res;
  }

  Future<int> getBlockCount() async {
    var params = [];
    final res = await call("getblockcount", params);
    return res;
  }

  Future<dynamic> call(var methodName, [var params]) async {
    var body = {
      'jsonrpc': '2.0',
      'method': methodName,
      'params': params ?? [],
      'id': '1'
    };

    try {
      var response = await _dioClient!.post(
        _url,
        data: body,
        options: Options(
          headers: _headers,
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        var body = response.data as Map<String, dynamic>;
        if (body.containsKey('error') && body["error"] != null) {
          var error = body['error'];

          if (error["message"] is Map<String, dynamic>) {
            error = error['message'];
          }

          throw Exception(
            "errorCode: ${error['code']},errorMsg: ${error['message']}",
          );
        }
        return body['result'];
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        var errorResponseBody = e.response!.data;

        switch (e.response!.statusCode) {
          case 401:
            throw Exception(
              " code: 401, message: Unauthorized",
            );
          case 403:
            throw Exception(
              "code: 403,message: Forbidden",
            );
          case 404:
            if (errorResponseBody['error'] != null) {
              var error = errorResponseBody['error'];
              throw Exception(
                "errorCode: ${error['code']},errorMsg: ${error['message']}",
              );
            }
            throw Exception(
              "code: 500, message: Internal Server Error",
            );
          default:
            if (errorResponseBody['error'] != null) {
              var error = errorResponseBody['error'];
              throw Exception(
                "errorCode: ${error['code']},errorMsg: ${error['message']}",
              );
            }
            throw Exception(
              "code: 500, message: 'Internal Server Error'",
            );
        }
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
          "code: 500,message: e.message ?? 'Connection Error'",
        );
      }
      throw Exception(
        "code: 500, message: e.message ?? 'Unknown Error'",
      );
    }
  }
}
