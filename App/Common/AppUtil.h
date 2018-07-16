#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface AppUtil : NSObject

#pragma mark -- Text utils

+ (BOOL) isEmpty:(NSString*) value;
+ (BOOL) isValidEmail:(NSString*) email;

+ (NSString *) getCurrentDeviceID;

# pragma mark -- Color utils
+ (UIColor *) getUIColorFromRGB: (NSString *) rgbColor;
+ (UIColor *) getUIColorFromRGB: (NSString *) rgbColor withAlpha:(CGFloat) alpha;

@end
