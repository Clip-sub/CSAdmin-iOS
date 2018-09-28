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
    return 4; // One item per array item.
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(floor(self.collectionContext.containerSize.width / 3), 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    PostItemCollectionViewCell *cell
        = [self.collectionContext dequeueReusableCellWithNibName:@"PostItemCollectionViewCell" bundle:nil forSectionController:self atIndex:index];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.post = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    // Code...
}

@end
