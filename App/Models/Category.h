#import "JSONModel.h"

@interface Category : JSONModel

@property (nonatomic, readonly) int categoryID;
@property (nonatomic, readonly) int count;
@property (nonatomic, readonly) NSString *categoryDescription;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *slug;
@property (nonatomic, readonly) NSString *taxonomy;
@property (nonatomic, readonly) int parent;

@end
