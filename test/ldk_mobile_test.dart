import 'package:flutter_test/flutter_test.dart';
import 'package:ldk_mobile/ldk_mobile.dart';
import 'package:ldk_mobile/ldk_mobile_platform_interface.dart';
import 'package:ldk_mobile/ldk_mobile_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLdkMobilePlatform
    with MockPlatformInterfaceMixin
    implements LdkMobilePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LdkMobilePlatform initialPlatform = LdkMobilePlatform.instance;

  test('$MethodChannelLdkMobile is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLdkMobile>());
  });

  test('getPlatformVersion', () async {
    LdkMobile ldkMobilePlugin = LdkMobile();
    MockLdkMobilePlatform fakePlatform = MockLdkMobilePlatform();
    LdkMobilePlatform.instance = fakePlatform;

    expect(await ldkMobilePlugin.getPlatformVersion(), '42');
  });
}
