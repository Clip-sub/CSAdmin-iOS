//
//  CustomItemFlowLayout.m
//  CSAdmin
//
//  Created by Quan Pham  on 10/8/18.
//  Copyright © 2018 Quan Pham. All rights reserved.
//

#import "CustomItemFlowLayout.h"

@implementation CustomItemFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.minimumLineSpacing = 1.0;
        self.minimumInteritemSpacing = 1.0;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}

- (CGSize)itemSize
{
    NSInteger numberOfColumns = 3;
    CGFloat itemWidth = (CGRectGetWidth(self.collectionView.frame) - (numberOfColumns - 1)) / numberOfColumns;
    return CGSizeMake(itemWidth, itemWidth);
}

@end
