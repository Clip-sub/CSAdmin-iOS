#import "ApiClient+Post.h"

@implementation ApiClient (Post)

- (void)getLatestPosts:(NSNumber *)page success:(void (^)(ResponseObject *))onSuccess failure:(void (^)(ResponseObject *))onFailure {
    [self GET:kPathPosts parameters:@{ @"page": page } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self onSuccess:responseObject success:onSuccess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self onError:error failure:onFailure];
    }];
}

- (void)getLatestPosts:(NSNumber *)page perPage:(NSNumber *)perPage success:(void (^)(ResponseObject *))onSuccess failure:(void (^)(ResponseObject *))onFailure {
    [self GET:kPathPosts parameters:@{ @"page": page, @"per_page": perPage } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self onSuccess:responseObject success:onSuccess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self onError:error failure:onFailure];
    }];
}

- (void)getSinglePost:(NSNumber *)postID success:(void (^)(ResponseObject *))onSuccess failure:(void (^)(ResponseObject *))onFailure {
    [self GET:kPathPosts parameters:@{ @"id": postID } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self onSuccess:responseObject success:onSuccess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self onError:error failure:onFailure];
    }];
}

- (void)updateSinglePost:(NSNumber *)postID success:(void (^)(ResponseObject *))onSuccess failure:(void (^)(ResponseObject *))onFailure {
    [self PUT:kPathPosts parameters:@{ @"id": postID } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self onSuccess:responseObject success:onSuccess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self onError:error failure:onFailure];
    }];
}

/**
 * Delete single post from the database. Requires authorization.
 */
- (void)deleteSinglePost:(NSNumber*)postID bypassTrash:(BOOL)force success:(void (^)(ResponseObject *))onSuccess failure:(void (^)(ResponseObject *))onFailure {
    
    [self DELETE:kPathPosts parameters:@{@"id": postID} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self onSuccess:responseObject success:onSuccess];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self onError:error failure:onFailure];
    }];
}

@end
