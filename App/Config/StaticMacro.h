#ifndef StaticMacro_h
#define StaticMacro_h

#define IS_IPAD() (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdionPad)

#define HEIGHT_STATUSBAR 20

#define kAppDelegate ((AppDelegate *)([[UIApplication sharedApplication].delegate]))

#ifdef DEBUG
#define DEBUGLOG(...) NSLog(__VA_ARGS__)
#else
#define DEBUGLOG(...) ;
#endif

/** String: iPhone **/
#define DEVICE_IPHONE @"iPhone"

/** String: iPad **/
#define DEVICE_IPAD @"iPad"

#define DEVICE_MODEL_LOCALIZED ( [[UIDevice currentDevice ] localizedModel ] )
#define SETLOCALIZED(string) NSLocalizedString(string, nil)

#endif /* StaticMacro_h */
