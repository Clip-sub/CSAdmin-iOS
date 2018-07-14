#import "ApiAuthClient.h"
#import "ResponseObject.h"

@implementation ApiAuthClient

+ (ApiAuthClient *)sharedAuthClient {
    static ApiAuthClient *_sharedAuthClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAuthClient = [[ApiAuthClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseAuthServer]];
    });
    
    return _sharedAuthClient;
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
