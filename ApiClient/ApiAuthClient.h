#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ResponseObject.h"

/**
 * Api client for authorization.
 Same server but different base URL, so I decided to create another instance for it.
 */
@interface ApiAuthClient : AFHTTPSessionManager

+ (ApiAuthClient *) sharedAuthClient;

- (void) onSuccess: (id) responseData success:(void (^)(ResponseObject *responseObject)) successBlock;

- (void) onError: (NSError *) error failure:(void(^)(ResponseObject *responseObject)) errorBlock;

@end
