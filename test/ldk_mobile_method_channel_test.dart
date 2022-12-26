import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ldk_mobile/ldk_mobile_method_channel.dart';

void main() {
  MethodChannelLdkMobile platform = MethodChannelLdkMobile();
  const MethodChannel channel = MethodChannel('ldk_mobile');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
