#import "LdkNodeFlutterPlugin.h"
#if __has_include(<ldk_node_flutter/ldk_node_flutter-Swift.h>)
#import <ldk_node_flutter/ldk_node_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ldk_node_flutter-Swift.h"
#endif


@implementation LdkNodeFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLdkNodeFlutterPlugin registerWithRegistrar:registrar];
}
@end
