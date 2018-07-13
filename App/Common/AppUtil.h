#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface AppUtil : NSObject

#pragma mark -- Text utils

+ (BOOL) isEmpty:(NSString*) value;
+ (BOOL) isValidEmail:(NSString*) email;

+ (BOOL) getCurrentDeviceID;

@end
