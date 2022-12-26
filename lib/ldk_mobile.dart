
import 'ldk_mobile_platform_interface.dart';

class LdkMobile {
  Future<String?> getPlatformVersion() {
    return LdkMobilePlatform.instance.getPlatformVersion();
  }
}
