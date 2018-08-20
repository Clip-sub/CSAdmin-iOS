#import "Post.h"
#import "JSONKeyMapper.h"

@implementation FeaturedMedia
+(JSONKeyMapper *) keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:
            @{
              @"featuredMedia": @"wp:featuredmedia",
              @"sourceUrl": @"source_url"
              }];
}
@end

@implementation Post

@end
