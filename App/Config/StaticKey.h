#ifndef StaticKey_h
#define StaticKey_h

// Server API:
#define kBaseServer       @"https://sonixgvn.net/wp-json/wp/v2/"
#define kBaseAuthServer   @"https://sonixgvn.net/api/"
#define kRootUrl          @"https://sonixgvn.net/"

#pragma mark -- Colors

#define UIColorFromRGB(rgbValue) [UIColor \
                                  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
                                         green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
                                          blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#define COLOR_VIOLET      @"#642580"

#pragma mark -- API Endpoints

#define kPathPosts        @"posts"
#define kPathComments     @"comments"
#define kPathCategories   @"categories"

#pragma mark -- Pre-defined JSON keys

#define KEY_ERROR         @"error"
#define KEY_ERROR_MESSAGE @"message"

#endif /* StaticKey_h */
