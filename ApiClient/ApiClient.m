#import "ApiClient.h"

@implementation ApiClient

+ (ApiClient *)sharedClient {
    static ApiClient *_sharedClient = nil;
    static dispatch_once_t oneTimeToken;
    dispatch_once(&oneTimeToken, ^{
        _sharedClient = [[ApiClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseServer]];
    });
    
    return _sharedClient;
}

- (void)onSuccess:(id)responseData success:(void (^)(id resp))successBlock {
    if (successBlock) {
        NSDictionary *responseDict;
        NSArray *responseArray;
        if ([responseData isKindOfClass:[NSObject class]]) {
            // If response is object.
            responseDict = [responseData mutableCopy];
        } else {
            // If response is array.
            responseArray = [responseData mutableCopy];
        }
    }
}

- (void)onError:(NSError *)error failure:(void (^)(ResponseObject *))errorBlock {
    if (errorBlock) {
        ResponseObject *responseObject = [[ResponseObject alloc] init];
        responseObject.errorCode = (NSInteger) error.code;
        responseObject.data = nil;
        responseObject.message = [NSString stringWithFormat:@"%@", error.localizedDescription];
        
        errorBlock(responseObject);
    }
}

@end
