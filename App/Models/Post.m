#import "Post.h"
#import "JSONKeyMapper.h"

@implementation Post

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:
            @{
            @"postID": @"id",
            @"featuredMedia": @"wp:featuredmedia"
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

@implementation FeaturedMedia
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:
            @{
              @"sourceUrl": @"source_url"
              }];
}

@end

