//
//  PostListSectionController.m
//  CSAdmin
//
//  Created by Quan Pham  on 9/17/18.
//  Copyright © 2018 Quan Pham. All rights reserved.
//

#import "PostListSectionController.h"
#import "PostItemCollectionViewCell.h"

@implementation PostListSectionController

- (NSInteger)numberOfItems {
    return 3; // One item per array item.
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width ?: 0;
    CGFloat itemSize = floor(width / 3);
    return CGSizeMake(itemSize, itemSize * 1.5);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    PostItemCollectionViewCell *cell
        = [self.collectionContext dequeueReusableCellWithNibName:@"PostItemCollectionViewCell" bundle:nil forSectionController:self atIndex:index];
    cell.postTitle.text = @"Yolo";
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.post = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    // Code...
}

@end
