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

- (void)onSuccess:(id)responseData success:(void (^)(ResponseObject *))successBlock {
    if (successBlock) {
        NSError *error = nil;
        NSDictionary *responseDict;
        if (responseData) {
            responseDict = [responseData mutableCopy];
        } else {
            responseDict = nil;
        }
        
        ResponseObject *responseObject = [[ResponseObject alloc] init];
        if (error) {
            responseObject.data = nil;
            responseObject.message = [responseData objectForKey:@"message"];
        } else {
            responseObject.data = responseDict;
            responseObject.message = [responseData objectForKey:@"message"];
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
