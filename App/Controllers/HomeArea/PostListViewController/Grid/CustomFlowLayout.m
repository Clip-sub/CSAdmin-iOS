//
//  CustomFlowLayout.m
//  CSAdmin
//
//  Created by Quan Pham  on 10/7/18.
//  Copyright © 2018 Quan Pham. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout

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

- (CGSize)itemSize {
    NSInteger numberOfColumns = 3;
    
    CGFloat itemWidth = (CGRectGetWidth(self.collectionView.frame) - (numberOfColumns - 1)) / numberOfColumns;
    return CGSizeMake(itemWidth, itemWidth + 50);
}

@end
