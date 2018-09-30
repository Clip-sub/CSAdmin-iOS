#import "AppUtil.h"

@implementation AppUtil

+ (AppDelegate *)appDelegate
{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    return delegate;
}

+ (BOOL)isEmpty:(NSString *)value
{
    if (value == nil || value == NULL || [value isEqual:[NSNull null]] || [value isEqualToString:@""]) {
        return TRUE;
    }
    if (value.length == 0) {
        return TRUE;
    }
    if ([[value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return TRUE;
    }
    return FALSE;
}

+ (BOOL)isValidEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];

    if ([emailTest evaluateWithObject:[email stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]] == NO) {
        return FALSE;
    }
    return TRUE;
}

// Convert RGB color to UIColor.
+ (UIColor *)getUIColorFromRGB:(NSString *)rgbColor
{
    unsigned int red, green, blue;
    NSRange range;

    range.length = 2;
    range.location = 0;

    [[NSScanner scannerWithString:[rgbColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[rgbColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[rgbColor substringWithRange:range]] scanHexInt:&blue];

    return [UIColor colorWithRed:(float)(red / 255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}

+ (UIColor *)getUIColorFromRGB:(NSString *)rgbColor withAlpha:(CGFloat)alpha
{
    unsigned int red, green, blue;
    NSRange range;

    range.length = 2;
    range.location = 0;

    [[NSScanner scannerWithString:[rgbColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[rgbColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[rgbColor substringWithRange:range]] scanHexInt:&blue];

    return [UIColor colorWithRed:(float)(red / 255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:alpha];
}

+ (NSString *)getCurrentDeviceID
{
    NSString *uuid = [[UIApplication sharedApplication] uniqueInstallationIdentifier];
    return uuid;
}

+ (NSString *)base64Encode:(NSString *)value
{
    NSData *nsdata = [value dataUsingEncoding:NSUTF8StringEncoding];

    return [NSString stringWithFormat:@"thumb/%@", [nsdata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength]];
}

@end
