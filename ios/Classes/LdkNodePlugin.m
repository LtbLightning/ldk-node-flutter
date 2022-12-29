#import "LdkNodePlugin.h"
#if __has_include(<ldk_node/ldk_node-Swift.h>)
#import <ldk_node/ldk_node-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ldk_node-Swift.h"
#endif

@implementation LdkNodePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLdkNodePlugin registerWithRegistrar:registrar];
}
@end
