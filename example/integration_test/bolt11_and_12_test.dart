import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ldk_node/ldk_node.dart' as ldk;
import 'package:path_provider/path_provider.dart';

void main() {
  BigInt satsToMsats(int sats) => BigInt.from(sats * 1000);
  String mSatsToSats(BigInt mSats) => '${mSats.toInt() ~/ 1000}sats';
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('bolt11_&_bolt12', () {
    setUp(() async {});
    testWidgets('bolt11_full_cycle', (WidgetTester tester) async {
      final directory = await getApplicationDocumentsDirectory();
      final ldkCache = "${directory.path}/ldk_cache";
      final aliceStoragePath = "$ldkCache/integration/alice";
      debugPrint('Alice Storage Path: $aliceStoragePath');
      final alice_builder = ldk.Builder.mutinynet()
          .setEntropyBip39Mnemonic(
              mnemonic: ldk.Mnemonic(
                  seedPhrase:
                      "replace force spring cruise nothing select glass erupt medal raise consider pull"))
          .setStorageDirPath(aliceStoragePath);
      final aliceNode = await alice_builder.build();
      await aliceNode.start();
      final bobStoragePath = "$ldkCache/integration/bob";
      final bob_builder = ldk.Builder.mutinynet()
          .setEntropyBip39Mnemonic(
              mnemonic: ldk.Mnemonic(
                  seedPhrase:
                      "skin hospital fee risk health theory actor kiwi solution desert unhappy hello"))
          .setStorageDirPath(bobStoragePath);
      debugPrint('Bob Storage Path: $bobStoragePath');
      final bobNode = await bob_builder.build();
      await bobNode.start();
      debugPrint("Manually syncing Alice's node");
      await aliceNode.syncWallets();
      debugPrint("Manually syncing Bob's node");
      final aliceBalance =
          (await aliceNode.listBalances()).spendableOnchainBalanceSats;
      await bobNode.syncWallets();
      expect(aliceBalance, 0);
      debugPrint("Alice's onChain balance ${aliceBalance.toString()}");
      final bobBalance =
          (await bobNode.listBalances()).spendableOnchainBalanceSats;
      debugPrint("Bob's onChain balance ${bobBalance.toString()}");

      final bobBolt11PaymentHandler = await bobNode.bolt11Payment();
      final bobJitInvoice = await bobBolt11PaymentHandler.receiveViaJitChannel(
        amountMsat: satsToMsats(10000),
        description: 'test',
        expirySecs: 9000,
      );
      debugPrint("Bob's onChain balance ${bobBalance.toString()}");
      final aliceBolt11PaymentHandler = await aliceNode.bolt11Payment();
      final aliceJitInvoice =
          await aliceBolt11PaymentHandler.receiveViaJitChannel(
        amountMsat: satsToMsats(10000),
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
