#import "LdkMobilePlugin.h"
#if __has_include(<ldk_mobile/ldk_mobile-Swift.h>)
#import <ldk_mobile/ldk_mobile-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ldk_mobile-Swift.h"
#endif

@implementation LdkMobilePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLdkMobilePlugin registerWithRegistrar:registrar];
}
@end
