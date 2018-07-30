#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ResponseObject.h"

/*
 * The app's main API client.
 */
@interface ApiClient : AFHTTPSessionManager

+ (ApiClient *) sharedClient;

- (void) onSuccess: (id) responseData success:(void (^)(id resp)) successBlock;

- (void) onError: (NSError *) error failure:(void(^)(ResponseObject *responseObject)) errorBlock;

@end
