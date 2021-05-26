#import "BureauAuthPlugin.h"
#if __has_include(<bureau_auth/bureau_auth-Swift.h>)
#import <bureau_auth/bureau_auth-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bureau_auth-Swift.h"
#endif

@implementation BureauAuthPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBureauAuthPlugin registerWithRegistrar:registrar];
}
@end
