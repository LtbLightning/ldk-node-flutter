import Flutter
import UIKit

public class SwiftLdkMobilePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ldk_mobile", binaryMessenger: registrar.messenger())
    let instance = SwiftLdkMobilePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func dummyMethodToEnforceBundling() {
              dummy_method_to_enforce_bundling();
     }
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {}
}
