#import "Post.h"
#import "JSONKeyMapper.h"

@implementation FeaturedMedia
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:
            @{
            @"mediaID": @"id",
            @"sourceUrl": @"source_url",
            @"mediaType": @"media_type",
            @"mimeType": @"mime_type"
    }];
}

@end

@implementation Post

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:
            @{
            @"postID": @"id",
            @"title": @"title.rendered",
            @"excerpt": @"excerpt.rendered"
    }];
}

- (nonnull id<NSObject>)diffIdentifier
{
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object
{
    return [self isEqualToDiffableObject:object];
}

@end
