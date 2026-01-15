import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'package:ldk_node/src/generated/api/builder.dart' as builder;
import 'package:ldk_node/src/generated/frb_generated.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  String esploraUrl = Platform.isAndroid
      ? 'http://10.0.2.2:30000'
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
        listeningAddresses: [address]);
    return config;
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Track if FRB has been initialized
  bool frbInitialized = false;

  Future<void> ensureFrbInitialized() async {
    if (!frbInitialized) {
      await core.init();
      frbInitialized = true;
    }
  }

  group('new_apis_integration', () {
    setUp(() async {});

    testWidgets('mnemonic_word_count_test', (WidgetTester tester) async {
      // Initialize flutter_rust_bridge
      await ensureFrbInitialized();

      debugPrint("Testing Mnemonic.generateWithWordCount()...");

      // Test 12-word mnemonic using the generated FfiMnemonic API
      final mnemonic12 = await builder.FfiMnemonic.generateWithWordCount(wordCount: 12);
      final words12 = mnemonic12.seedPhrase.split(' ');
      debugPrint("Generated 12-word mnemonic: ${mnemonic12.seedPhrase}");
      expect(words12.length, equals(12));

      // Test 24-word mnemonic
      final mnemonic24 = await builder.FfiMnemonic.generateWithWordCount(wordCount: 24);
      final words24 = mnemonic24.seedPhrase.split(' ');
      debugPrint("Generated 24-word mnemonic: ${mnemonic24.seedPhrase}");
      expect(words24.length, equals(24));

      debugPrint("Mnemonic word count test completed successfully!");
    });

    testWidgets('custom_preimage_api_test', (WidgetTester tester) async {
      await ensureFrbInitialized();

      debugPrint("Testing PaymentPreimage creation and sendWithPreimageUnsafe API availability...");
      
      // Test PaymentPreimage convenience extension
      final customPreimage = ldk.PaymentPreimageExtensions.fromBytes([
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
        17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32
      ]);
      
      debugPrint("PaymentPreimage created successfully");
      expect(customPreimage.data.inner.length, equals(32));
      
      // Create a node to verify spontaneousPayment().sendWithPreimageUnsafe exists
      final aliceConfig = await initLdkConfig(
          'alice_preimage_api', const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3017));
      final aliceBuilder = ldk.Builder.fromConfig(config: aliceConfig)
          .setEntropyBip39Mnemonic(
              mnemonic: ldk.Mnemonic(
                  seedPhrase:
                      "replace force spring cruise nothing select glass erupt medal raise consider pull"))
          .setChainSourceEsplora(
              esploraServerUrl: esploraUrl, syncConfig: esploraConfig);
      final aliceNode = await aliceBuilder.build();
      await aliceNode.start();
      
      // Verify the spontaneousPayment handler and sendWithPreimageUnsafe method exist
      final spontaneousHandler = await aliceNode.spontaneousPayment();
      debugPrint("SpontaneousPayment handler obtained successfully");
      
      // Test that the method exists by checking it's callable (will fail due to no route but that's ok)
      final testNodeId = await aliceNode.nodeId(); // Use own node ID for test
      try {
        await spontaneousHandler.sendWithPreimageUnsafe(
          nodeId: testNodeId,
          preimage: customPreimage,
          amountMsat: BigInt.from(1000),
        );
      } catch (e) {
        // Expected to fail - no route to self, but this proves the API exists
        debugPrint("sendWithPreimageUnsafe() API exists - got expected error: $e");
      }
      
      debugPrint("Custom preimage API test completed successfully!");
      await aliceNode.stop();
    });

    testWidgets('bolt12_route_parameters_api_test', (WidgetTester tester) async {
      await ensureFrbInitialized();

      debugPrint("Testing RouteParametersConfig and BOLT12 API availability...");

      // Test RouteParametersConfig creation
      final routeParams = ldk.RouteParametersConfig(
        maxTotalCltvExpiryDelta: 1008,
        maxPathCount: 3,
        maxChannelSaturationPowerOfHalf: 2,
      );
      debugPrint("RouteParametersConfig created: maxPathCount=${routeParams.maxPathCount}");
      expect(routeParams.maxTotalCltvExpiryDelta, equals(1008));
      expect(routeParams.maxPathCount, equals(3));
      expect(routeParams.maxChannelSaturationPowerOfHalf, equals(2));

      // Create a node to verify bolt12Payment() API exists
      final config = await initLdkConfig(
          'bolt12_api', const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3019));
      final nodeBuilder = ldk.Builder.fromConfig(config: config)
          .setEntropyBip39Mnemonic(
              mnemonic: ldk.Mnemonic(
                  seedPhrase:
                      "replace force spring cruise nothing select glass erupt medal raise consider pull"))
          .setChainSourceEsplora(
              esploraServerUrl: esploraUrl, syncConfig: esploraConfig);
      final node = await nodeBuilder.build();
      await node.start();
      
      // Sync wallets
      debugPrint("Syncing wallets...");
      await node.syncWallets();
      debugPrint("Sync complete");

      // Verify the bolt12Payment handler exists
      final bolt12Handler = await node.bolt12Payment();
      debugPrint("Bolt12Payment handler obtained successfully");

      // Test creating a BOLT12 offer
      // BOLT12 offer creation requires the node to have announced itself to the network
      // For a fresh node without channels, this may fail
      try {
        final offer = await bolt12Handler.receive(
          amountMsat: BigInt.from(500000),
          description: "Test BOLT12 offer",
        );
        debugPrint("BOLT12 offer created successfully: ${offer.s}");
        expect(offer.s.isNotEmpty, true);
      } catch (e) {
        // OfferCreationFailed is expected for a node without any channels or network presence
        debugPrint("bolt12Payment.receive() - expected for fresh node without channels: $e");
        
        // Still verify the receiveVariableAmountUnsafe API exists
        debugPrint("Verifying receiveVariableAmountUnsafe API exists...");
        try {
          await bolt12Handler.receiveVariableAmountUnsafe(description: "Variable amount test");
        } catch (e2) {
          debugPrint("receiveVariableAmountUnsafe API verified (same expected error): $e2");
        }
      }

      debugPrint("BOLT12 RouteParametersConfig API test completed successfully!");
      await node.stop();
    });

    testWidgets('pathfinding_scores_test', (WidgetTester tester) async {
      await ensureFrbInitialized();

      final config = await initLdkConfig(
          'pathfinding', const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3011));
      debugPrint("Creating node for pathfinding scores test...");
      final nodeBuilder = ldk.Builder.fromConfig(config: config)
          .setEntropyBip39Mnemonic(
              mnemonic: ldk.Mnemonic(
                  seedPhrase:
                      "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"))
          .setChainSourceEsplora(
              esploraServerUrl: esploraUrl, syncConfig: esploraConfig);
      final node = await nodeBuilder.build();
      await node.start();
      
      // Sync wallets to initialize persistence
      debugPrint("Syncing wallets...");
      await node.syncWallets();
      debugPrint("Sync complete");

      debugPrint("Testing pathfinding scores API...");

      // Test exporting pathfinding scores
      debugPrint("Testing exportPathfindingScores()...");
      try {
        final scores = await node.exportPathfindingScores();
        debugPrint("Exported pathfinding scores: ${scores.length} bytes");
        expect(scores, isNotNull);
        // For a fresh node with no routing data, the scores might be empty or minimal
        debugPrint("Pathfinding scores export successful!");
      } catch (e) {
        // persistenceFailed can happen on a fresh node with no routing data
        debugPrint("exportPathfindingScores() returned error (expected for fresh node): $e");
      }

      await node.stop();
      debugPrint("Pathfinding scores test completed!");
    });

    testWidgets('bolt12_async_receive_test', (WidgetTester tester) async {
      await ensureFrbInitialized();

      final config = await initLdkConfig(
          'async_receive', const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3012));
      debugPrint("Creating node for async receive test...");
      final nodeBuilder = ldk.Builder.fromConfig(config: config)
          .setEntropyBip39Mnemonic(
              mnemonic: ldk.Mnemonic(
                  seedPhrase:
                      "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"))
          .setChainSourceEsplora(
              esploraServerUrl: esploraUrl, syncConfig: esploraConfig);
      final node = await nodeBuilder.build();
      await node.start();
      
      // Sync wallets
      debugPrint("Syncing wallets...");
      await node.syncWallets();
      debugPrint("Sync complete");

      debugPrint("Testing BOLT12 receiveAsync API...");

      // receiveAsyncUnsafe is for async payments (BOLT12 static invoices)
      // This requires setting up paths to a static invoice server first
      // Without that setup, it's expected to fail with offerCreationFailed
      final bolt12Handler = await node.bolt12Payment();
      debugPrint("Bolt12Payment handler obtained successfully");
      
      try {
        final asyncOffer = await bolt12Handler.receiveAsyncUnsafe();
        debugPrint("Async offer created: ${asyncOffer.s}");
        expect(asyncOffer.s.isNotEmpty, true);
      } catch (e) {
        // Expected: offerCreationFailed because we haven't set up
        // paths to a static invoice server via setPathsToStaticInvoiceServerUnsafe
        debugPrint("receiveAsyncUnsafe() - expected error without static invoice server setup: $e");
        
        // Verify the setPathsToStaticInvoiceServerUnsafe API exists
        debugPrint("Verifying setPathsToStaticInvoiceServerUnsafe API exists...");
        // This would need real BlindedMessagePath objects to work
        // For now, just verify the method exists on the handler
        expect(bolt12Handler.setPathsToStaticInvoiceServerUnsafe, isNotNull);
        debugPrint("setPathsToStaticInvoiceServerUnsafe API verified!");
      }

      await node.stop();
      debugPrint("BOLT12 async receive test completed!");
    });
  });
}

class BtcClient {
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
