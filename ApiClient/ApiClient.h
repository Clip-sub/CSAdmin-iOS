#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ResponseObject.h"

/*
 * The app's main API client.
 */
@interface ApiClient : AFHTTPSessionManager

+ (ApiClient *) sharedClient;

@end
