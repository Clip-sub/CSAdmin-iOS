#import "ApiClient+Post.h"
#import "Post.h"

@implementation ApiClient (Post)

// Get latest posts, 10 items per page.
-(void)getLatestPosts:(NSNumber *)page success:(void (^)(NSArray *responseArray))onSuccess failure:(void (^)(NSError *))onFailure {
    [self GET:kPathPosts parameters:@{ @"page": page } headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        onSuccess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        onFailure(error);
    }];
}

// Get latest posts.
- (void)getLatestPosts:(NSNumber *)page perPage:(NSNumber *)perPage success:(void (^)(NSArray *))onSuccess failure:(void (^)(NSError *))onFailure {
    [self GET:kPathPosts parameters:@{ @"page": page, @"per_page": perPage, @"_embed": @"1" } headers: nil
     progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        onSuccess(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        onFailure(error);
    }];
}

- (void)getSinglePost:(NSNumber *)postID success:(void (^)(ResponseObject *))onSuccess failure:(void (^)(ResponseObject *))onFailure {
    [self GET:kPathPosts parameters:@{ @"id": postID } headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //[self onSuccess:responseObject success:onSuccess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //[self onError:error failure:onFailure];
    }];
}

- (void)updateSinglePost:(NSNumber *)postID success:(void (^)(ResponseObject *))onSuccess failure:(void (^)(ResponseObject *))onFailure {
    [self PUT:kPathPosts parameters:@{ @"id": postID } headers:nil
    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //[self onSuccess:responseObject success:onSuccess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //[self onError:error failure:onFailure];
    }];
}

/**
 * Delete single post from the database. Requires authorization.
 */
- (void)deleteSinglePost:(NSNumber*)postID bypassTrash:(BOOL)force success:(void (^)(ResponseObject *))onSuccess failure:(void (^)(ResponseObject *))onFailure {
    
    [self DELETE:kPathPosts parameters:@{@"id": postID} headers:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //[self onSuccess:responseObject success:onSuccess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //[self onError:error failure:onFailure];
    }];
}

@end
