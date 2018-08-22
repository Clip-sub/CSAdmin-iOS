#import "JSONModel.h"

// Title sub-model
@interface Title : JSONModel
@property (nonatomic) NSString *rendered;
@end

// Excerpt sub-model
@interface Excerpt : JSONModel
@property (nonatomic) BOOL isProtected;
@property (nonatomic) NSString *rendered;
@end

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
@property (nonatomic) NSDate<Optional> *modified; // By adhering to the Optional protocol, the Post class knows that the JSON data won't always contain "modified" property.
@property (nonatomic) NSString *status;
//@property (nonatomic) Title *title;
//@property (nonatomic) Excerpt *excerpt;
//@property (nonatomic) Content *content;
@property (nonatomic) NSNumber *author; // Author ID.

@end
