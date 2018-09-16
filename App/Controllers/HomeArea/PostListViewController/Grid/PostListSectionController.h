//
//  PostListSectionController.h
//  CSAdmin
//
//  Created by Quan Pham  on 9/17/18.
//  Copyright © 2018 Quan Pham. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import "Post.h"

@interface PostListSectionController : IGListSectionController
@property (nonatomic, copy) Post *post;
@end
