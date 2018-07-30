#import <Foundation/Foundation.h>

@interface ResponseObject : NSObject

@property (nonatomic, strong) id data;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, strong) NSString *message;

@end
