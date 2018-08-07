/**
 * All post-related API functions should be here.
 */
#import "ApiClient.h"

@interface ApiClient (Post)

- (void) getLatestPosts:(NSNumber *) page success:(void(^)(NSArray *responseArray))onSuccess failure:(void(^)(NSError *error))onFailure;

- (void) getLatestPosts:(NSNumber *) page perPage:(NSNumber *) perPage success:(void(^)(NSArray *postArray))onSuccess failure:(void(^)(NSError *error))onFailure;

- (void) getSinglePost:(NSNumber *) postID success:(void(^)(ResponseObject *responseObject))onSuccess failure:(void(^)(ResponseObject *failureObject))onFailure;

- (void) updateSinglePost:(NSNumber *) postID success:(void(^)(ResponseObject *responseObject)) onSuccess failure:(void(^)(ResponseObject *failureObject))onFailure;

- (void) deleteSinglePost:(NSNumber *) postID bypassTrash:(BOOL) force success:(void(^)(ResponseObject *responseObject))onSuccess failure:(void(^)(ResponseObject *failureObject)) onFailure;

@end
