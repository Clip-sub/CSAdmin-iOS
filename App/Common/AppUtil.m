#import "AppUtil.h"
#import "UIApplication+UIID.h"

@implementation AppUtil

+ (BOOL)isEmpty:(NSString *)value {
    if (value == nil || value == NULL || [value isEqual:[NSNull null]] || [value isEqualToString:@""]) {
        return TRUE;
    }
    if ([[value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return TRUE;
    }
    return FALSE;
}

// Convert RGB color to UIColor.
+ (UIColor *)getUIColorFromRGB:(NSString *)rgbColor {
    unsigned int red, green, blue;
    NSRange range;
    
    range.length = 2;
    range.location = 0;
    
    [[NSScanner scannerWithString:[rgbColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[rgbColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[rgbColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
}

+ (NSString *)getCurrentDeviceID {
    NSString *uuid = [[UIApplication sharedApplication] uniqueInstallationIdentifier];
    return uuid;
}

@end
