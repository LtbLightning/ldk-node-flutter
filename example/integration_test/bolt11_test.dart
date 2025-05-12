import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'package:path_provider/path_provider.dart';

void main() {
  BigInt satsToMsats(int sats) => BigInt.from(sats * 1000);
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('bolt11_integration', () {
    setUp(() async {});
    testWidgets('full_cycle', (WidgetTester tester) async {
      final directory = await getApplicationDocumentsDirectory();
      final ldkCache = "${directory.path}/ldk_cache";
      final aliceStoragePath = "$ldkCache/integration/alice";
      debugPrint('Alice Storage Path: $aliceStoragePath');
      final aliceBuilder = ldk.Builder.mutinynet()
          .setEntropyBip39Mnemonic(
              mnemonic: ldk.Mnemonic(
                  seedPhrase:
                      "replace force spring cruise nothing select glass erupt medal raise consider pull"))
          .setStorageDirPath(aliceStoragePath)
          .setListeningAddresses(
              [const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3080)]);
      final aliceNode = await aliceBuilder.build();
      await aliceNode.start();
      final bobStoragePath = "$ldkCache/integration/bob";
      final bobBuilder = ldk.Builder.mutinynet()
          .setEntropyBip39Mnemonic(
              mnemonic: ldk.Mnemonic(
                  seedPhrase:
                      "skin hospital fee risk health theory actor kiwi solution desert unhappy hello"))
          .setStorageDirPath(bobStoragePath)
          .setListeningAddresses(
              [const ldk.SocketAddress.hostname(addr: "0.0.0.0", port: 3084)]);
      debugPrint('Bob Storage Path: $bobStoragePath');
      final bobNode = await bobBuilder.build();
      await bobNode.start();
      debugPrint("Manually syncing Alice's node");
      await aliceNode.syncWallets();
      debugPrint("Manually syncing Bob's node");
      final aliceBalance =
          (await aliceNode.listBalances()).spendableOnchainBalanceSats;
      await bobNode.syncWallets();
      debugPrint("Alice's onChain balance ${aliceBalance.toString()}");
      final bobBalance =
          (await bobNode.listBalances()).spendableOnchainBalanceSats;
      debugPrint("Bob's onChain balance ${bobBalance.toString()}");

      final bobBolt11PaymentHandler = await bobNode.bolt11Payment();
      await bobBolt11PaymentHandler.receiveViaJitChannel(
        amountMsat: satsToMsats(100000),
        description: 'test',
        expirySecs: 9000,
      );
      debugPrint("Bob's onChain balance ${bobBalance.toString()}");
      final aliceBolt11PaymentHandler = await aliceNode.bolt11Payment();
      await aliceBolt11PaymentHandler.receiveViaJitChannel(
        amountMsat: satsToMsats(100000),
        description: 'test',
        expirySecs: 9000,
      );
      final aliceLBalance =
          (await aliceNode.listBalances()).totalLightningBalanceSats;
      debugPrint("Alice's Lightning balance ${aliceLBalance.toString()}");
      final bobInvoice = await bobBolt11PaymentHandler.receive(
          amountMsat: satsToMsats(10000),
          description: 'test',
          expirySecs: 9000);
      final paymentId =
          await aliceBolt11PaymentHandler.send(invoice: bobInvoice);
      debugPrint("Alice's payment id ${paymentId.field0}");
    });
  });
}
