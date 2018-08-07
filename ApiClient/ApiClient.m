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

@end
