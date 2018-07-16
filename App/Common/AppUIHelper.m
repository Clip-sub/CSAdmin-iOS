#import "AppUIHelper.h"
#import "AppUtil.h"

@implementation AppUIHelper

+ (UIViewController *)visibleViewController {
    UIViewController *rootViewController = [AppUtil appDelegate].window.rootViewController;
    return nil;
}

+ (UIViewController *) getVisibleViewControllerFrom:(UIViewController *) vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [AppUIHelper getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    }
    if ()
}

+ (void)showAlertViewWithTitle:(NSString *)title andMessage:(NSString *)message {
    if ([AppUtil isEmpty:title]) {
        title = @"";
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:SETLOCALIZED(@"OK") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:cancelButton];
    [alert setPreferredAction:cancelButton];
}

@end
