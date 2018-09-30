#import "JSONModel.h"
#import <IGListKit/IGListKit.h>

@class Content;
@class FeaturedMedia;

// Content sub-model
@interface Content : JSONModel
@property (nonatomic) NSString *rendered;
@end

@interface FeaturedMedia : JSONModel
@property (nonatomic) NSNumber *mediaID;
@property (weak, nonatomic) NSString *sourceUrl;
@end

// Main Post model
@interface Post : JSONModel

@property (nonatomic) NSDate *date;
@property (nonatomic) int postID;
@property (nonatomic) NSString *link;
@property (nonatomic) NSDate<Optional> *modified;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *title;
// @property (weak, nonatomic) NSString *thumbnailUrl;

@property (weak, nonatomic) FeaturedMedia<Optional> *featuredMedia;
@property (nonatomic) NSString *excerpt;
//@property (nonatomic) Content *content;
@property (nonatomic) NSNumber *author; // Author ID.

@end
