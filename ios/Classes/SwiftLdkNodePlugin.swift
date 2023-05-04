import Flutter
import UIKit

public class SwiftLdkNodePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ldk_node", binaryMessenger: registrar.messenger())
    let instance = SwiftLdkNodePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func dummyMethodToEnforceBundling() {
            let dummy = dummy_method_to_enforce_bundling()
            print(dummy)

     }
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {}
}
