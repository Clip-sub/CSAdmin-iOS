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

- (instancetype)initWithItems: (NSArray<Post *> *) items
{
    self = [super init];
    if (self) {
        self.posts = items;
    }
    return self;
}

- (NSInteger)numberOfItems
{
    return [self.posts count]; // One item per array item.
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    CGFloat width = self.collectionContext.containerSize.width ? : 0;
    CGFloat itemSize = floor(width / 3);
    return CGSizeMake(itemSize, itemSize * 1.5);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    NSLog(@"called %ld", (long)index);
    PostItemCollectionViewCell *cell
    = [self.collectionContext dequeueReusableCellWithNibName:@"PostItemCollectionViewCell" bundle:nil forSectionController:self atIndex:index];
    cell.postTitle.text = [NSString stringWithFormat:@"Yolo %ld", (long)index];
    
    return cell;
}

@end
