import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ldk_mobile_method_channel.dart';

abstract class LdkMobilePlatform extends PlatformInterface {
  /// Constructs a LdkMobilePlatform.
  LdkMobilePlatform() : super(token: _token);

  static final Object _token = Object();

  static LdkMobilePlatform _instance = MethodChannelLdkMobile();

  /// The default instance of [LdkMobilePlatform] to use.
  ///
  /// Defaults to [MethodChannelLdkMobile].
  static LdkMobilePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LdkMobilePlatform] when
  /// they register themselves.
  static set instance(LdkMobilePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
