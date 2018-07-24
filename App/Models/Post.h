#import "JSONModel.h"

@interface Post : JSONModel

@property (nonatomic) NSDate *date;
@property (nonatomic) NSString *postID;
@property (nonatomic) NSString *link;
@property (nonatomic) NSDate *modified;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *content;
@property (nonatomic) NSNumber *author; // Author ID.

@end

/**
 *  Title sub-model.
 */
@interface Title : JSONModel

@property (nonatomic) NSString *rendered;

@end

/**
 *  Excerpt sub-model.
 */
@interface Excerpt : JSONModel

@property (nonatomic) BOOL isProtected;
@property (nonatomic) NSString *rendered;

@end
