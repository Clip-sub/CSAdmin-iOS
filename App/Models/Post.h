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

// Main Post model
@interface Post : JSONModel

@property (nonatomic) NSDate *date;
@property (nonatomic) int *postID;
@property (nonatomic) NSString *link;
@property (nonatomic) NSDate<Optional> *modified; // By adhering to the Optional protocol, the Post class knows that the JSON data won't always contain "modified" property.
@property (nonatomic) NSString *status;
@property (nonatomic) Title *title;
@property (nonatomic) NSString *content;
@property (nonatomic) NSNumber *author; // Author ID.

+ (void) getLatestPosts;

@end
