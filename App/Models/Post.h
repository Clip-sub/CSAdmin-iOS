#import "JSONModel.h"
#import <IGListKit/IGListKit.h>

@class FeaturedMedia;

@protocol Embedded @end
@protocol FeaturedMedia @end

// Content sub-model
@interface Embedded : JSONModel
@property (weak, nonatomic) NSDictionary *author;
@property (weak, nonatomic) NSArray <FeaturedMedia> *featuredMedia;
@end

@interface FeaturedMedia : JSONModel
@property (nonatomic) NSNumber *mediaID;
@property (weak, nonatomic) NSString *sourceUrl;
@property (weak, nonatomic) NSString *mediaType;
@property (weak, nonatomic) NSString *mimeType;
@end

// Main Post model
@interface Post : JSONModel

@property (nonatomic) NSDate *date;
@property (nonatomic) int postID;
@property (nonatomic) NSString *link;
@property (nonatomic) NSDate<Optional> *modified;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *title;

@property (weak, nonatomic) Embedded *embedded;

@property (nonatomic) NSString *excerpt;
//@property (nonatomic) Content *content;
@property (nonatomic) NSNumber *author; // Author ID.

@end
