//
//  ResponseObject.h
//  CSAdmin
//
//  Created by Quan Pham  on 7/2/18.
//  Copyright © 2018 Quan Pham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseObject : NSObject

@property (nonatomic, strong) id data;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, strong) NSString *message;

@end
