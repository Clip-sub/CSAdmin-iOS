#import "JSONModel.h"

@interface Comment : JSONModel

@property (nonatomic) NSDate *date;
@property (nonatomic) int commentID;
@property (nonatomic) int postID;
@property (nonatomic) int parent;

@end
