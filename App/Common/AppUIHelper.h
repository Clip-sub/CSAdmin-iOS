#import <Foundation/Foundation.h>

@interface AppUIHelper : NSObject

+ (UIViewController *) visibleViewController;

+ (void) showAlertViewWithTitle: (NSString *) title andMessage:(NSString *) message;

@end
