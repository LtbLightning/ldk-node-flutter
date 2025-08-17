import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'package:path_provider/path_provider.dart';

void main() {
  String esploraUrl = Platform.isAndroid
      ?
      //10.0.2.2 to access the AVD
      'http://10.0.2.2:30000'
      : 'http://127.0.0.1:30000';
  final regTestClient = BtcClient("");
  // final esploraConfig = ldk.EsploraSyncConfig(
  //     onchainWalletSyncIntervalSecs: BigInt.from(60),
  //     lightningWalletSyncIntervalSecs: BigInt.from(60),
  //     feeRateCacheUpdateIntervalSecs: BigInt.from(600));
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
      final aliceConfig = await initLdkConfig('alice',
          const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3003));
      final aliceBuilder = ldk.Builder.fromConfig(config: aliceConfig)
          .setEntropyBip39Mnemonic(
              mnemonic: ldk.Mnemonic(
                  seedPhrase:
                      "replace force spring cruise nothing select glass erupt medal raise consider pull"))
          .setChainSourceEsplora(
              esploraServerUrl: esploraUrl, syncConfig: esploraConfig)
          .setFilesystemLogger(
              logFilePath: "${aliceConfig.storageDirPath}/alice.log",
              maxLogLevel: ldk.LogLevel.debug);
      final aliceNode = await aliceBuilder.build();
      await aliceNode.start();
      final bobConfig = await initLdkConfig(
          'bob', const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3004));

      final bobBuilder = ldk.Builder.fromConfig(config: bobConfig)
          .setEntropyBip39Mnemonic(
              mnemonic: ldk.Mnemonic(
                  seedPhrase:
                      "skin hospital fee risk health theory actor kiwi solution desert unhappy hello"))
          .setChainSourceEsplora(
              esploraServerUrl: esploraUrl, syncConfig: esploraConfig);
      final bobNode = await bobBuilder.build();
      await bobNode.start();
      // loading bitcoin core wallet
      await regTestClient.loadWallet();
      debugPrint("Manually syncing Alice's node");
      await Future.wait([aliceNode.syncWallets()]);

      debugPrint("Manually syncing Bob's node");
      await Future.wait([bobNode.syncWallets()]);

      debugPrint("syncing complete");

      final aliceNodeAddress =
          await (await aliceNode.onChainPayment()).newAddress();
      final bobNodeAddress =
          await (await bobNode.onChainPayment()).newAddress();
      debugPrint(aliceNodeAddress.s);
      debugPrint(bobNodeAddress.s);
      await regTestClient.generate(11, aliceNodeAddress.s);
      await regTestClient.generate(11, bobNodeAddress.s);
      debugPrint("Manually syncing Alice's node");
      await Future.wait([aliceNode.syncWallets()]);

      debugPrint("Manually syncing Bob's node");
      await Future.wait([bobNode.syncWallets()]);
      debugPrint("syncing complete");
      debugPrint(
          "Alice's onChain Balance:${(await aliceNode.listBalances()).spendableOnchainBalanceSats}");
      debugPrint(
          "Bob's onChain Balance:${(await bobNode.listBalances()).spendableOnchainBalanceSats}");

      debugPrint("Opening channel from aliceNode to bobNode");
      final bobNodeId = await bobNode.nodeId();
      const fundingAmountSat = 10000;
      const pushMsat = (fundingAmountSat / 2) * 1000;
      final userChannelId = await aliceNode.openChannel(
        socketAddress: (await bobNode.listeningAddresses())!.first,
        nodeId: bobNodeId,
        channelAmountSats: BigInt.from(fundingAmountSat),
        pushToCounterpartyMsat: BigInt.from(pushMsat),
      );
      debugPrint("Channel created; id: ${userChannelId.data}");
      final alicePeers = await aliceNode.listPeers();
      final aliceChannels = await aliceNode.listChannels();
      expect(
          (alicePeers.where((e) => e.nodeId.hex == bobNodeId.hex)).toList().isNotEmpty,
          equals(true));

      await regTestClient.generate(11, aliceNodeAddress.s);
      expect(
          (aliceChannels
                      .where((e) => e.counterpartyNodeId.hex == bobNodeId.hex))
                  .where((f) => f.isUsable && f.isChannelReady)
                  .toList() !=
              [],
          true);

      debugPrint("waiting for latest node announcement broadcast timestamp");
      while (
          (await bobNode.status()).latestNodeAnnouncementBroadcastTimestamp ==
              null) {
        await Future.delayed(const Duration(milliseconds: 5));
      }
      final payment1ExpectedAmountMsat = BigInt.from(1000000000);
      final bobNodeBol12Handler = await bobNode.bolt12Payment();
      final aliceNodeBol12Handler = await aliceNode.bolt12Payment();

      final offer1 = await bobNodeBol12Handler.receive(
          amountMsat: payment1ExpectedAmountMsat, description: "payment_1");
      final payment1Id = await aliceNodeBol12Handler.send(offer: offer1);
      debugPrint("payment_1 successful: ${payment1Id.data.toString()}");
      expect((await aliceNode.listPayments()).length == 1, true);
      const offerAmountMsat = 100000000;

      const payment2ExpectedAmountMsat = offerAmountMsat + 10000;
      final offer2 = await bobNodeBol12Handler.receive(
          amountMsat: BigInt.from(offerAmountMsat), description: "payment_2");
      final payment2Id = await aliceNodeBol12Handler.sendUsingAmount(
          offer: offer2, amountMsat: BigInt.from(payment2ExpectedAmountMsat));
      debugPrint("payment_2 successful: ${payment2Id.data.toString()}");
      expect(
          ((await aliceNode.listPayments())
                  .where((e) => e.id.data == payment2Id.data))
              .length ==
          1,
          true);
      // Now bobNode refunds the amount aliceNode just overpaid.
      const overPaidAmount = payment2ExpectedAmountMsat - offerAmountMsat;
      final payment2Refund = await bobNodeBol12Handler.initiateRefund(
          amountMsat: BigInt.from(overPaidAmount), expirySecs: 3600);
      final payment2RefundInvoice = await aliceNodeBol12Handler
          .requestRefundPayment(refund: payment2Refund);
      debugPrint("payment_2 refund successful: ${payment2RefundInvoice.data}");
      final bobNodePayment3Id = (await bobNode.listPayments())
          .firstWhere((p) => p.amountMsat == BigInt.from(overPaidAmount))
          .id;
      expect(
          ((await bobNode.listPayments()).where(
                      (e) => listEquals(e.id.data, bobNodePayment3Id.data)))
                  .length ==
              1,
          true);
      await aliceNode.closeChannel(
          counterpartyNodeId: bobNodeId, userChannelId: userChannelId);
      await aliceNode.stop();
      await bobNode.stop();
      expect((await aliceNode.status()).isRunning, false);
      expect((await bobNode.status()).isRunning, false);
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
