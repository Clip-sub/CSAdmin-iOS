#import "AppUIHelper.h"
#import "AppUtil.h"

@implementation AppUIHelper

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
