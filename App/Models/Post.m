#import "Post.h"
#import "JSONKeyMapper.h"

@implementation FeaturedMedia
+ (JSONKeyMapper *) keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:
            @{
              @"postID": @"id",
              @"featuredMedia": @"wp:featuredmedia",
              @"sourceUrl": @"source_url"
            }];
}
@end

@implementation Post

/* + (JSONKeyMapper *) keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:
            @{
              @"postID": @"id"
            }];
} */

- (nonnull id<NSObject>) diffIdentifier {
    return self;
}

- (BOOL) isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [self isEqualToDiffableObject:object];
}

@end
