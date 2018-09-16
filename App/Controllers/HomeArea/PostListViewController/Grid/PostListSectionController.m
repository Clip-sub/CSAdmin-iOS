//
//  PostListSectionController.m
//  CSAdmin
//
//  Created by Quan Pham  on 9/17/18.
//  Copyright © 2018 Quan Pham. All rights reserved.
//

#import "PostListSectionController.h"

@implementation PostListSectionController

- (NSInteger)numberOfItems {
    return 1; // One item per array item.
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

@end
