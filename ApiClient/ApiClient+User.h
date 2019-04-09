#import "ApiClient.h"

// API for users.
@interface ApiClient (User)

- (void) loginWithUsername:(NSString *) username password:(NSString *) pw;

- (void) logout;

- (void) updateSelfProfile: (NSDictionary *) params;

- (void) deleteUser: (NSNumber *) userID;

@end
