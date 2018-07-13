#import "ApiClient.h"

@interface ApiClient (User)

- (void) loginWithUsername:(NSString *) username password:(NSString *) pw;

- (void) logout;

- (void) updateSelfProfile: (NSDictionary *) params;

- (void) deleteUser: (NSNumber *) userID;

@end
