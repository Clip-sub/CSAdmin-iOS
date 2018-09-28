//
//  PostItemCollectionViewCell.m
//  CSAdmin
//
//  Created by Quan Pham  on 9/17/18.
//  Copyright © 2018 Quan Pham. All rights reserved.
//

#import "PostItemCollectionViewCell.h"

@implementation PostItemCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.thumbnail setImageWithURL:[NSURL URLWithString:@"https://loremflickr.com/320/320"]];
}

- (void)prepareForReuse {
    [super prepareForReuse];    
}

@end
