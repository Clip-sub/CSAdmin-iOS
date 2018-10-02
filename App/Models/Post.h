#import "JSONModel.h"
#import <IGListKit/IGListKit.h>

@class FeaturedMedia;
@class Author;

@protocol Embedded @end
@protocol FeaturedMedia @end
@protocol Author;

// Content sub-model
@interface Embedded : JSONModel
@property (nonatomic) NSArray <Author, Optional> *author;
@end

@interface Author : JSONModel

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

// @property (weak, nonatomic) Embedded *embedded;

@property (nonatomic) NSString *excerpt;

@end
