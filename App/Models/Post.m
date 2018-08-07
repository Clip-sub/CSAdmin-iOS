#import "Post.h"
#import "JSONKeyMapper.h"

@implementation Post

+(JSONKeyMapper *) keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:
  @{
    @"featuredMedia": @"wp:featuredmedia"
    }];
}

@end
