//
//  PostItemTableCell.m
//  CSAdmin
//
//  Created by Quan Pham  on 7/10/18.
//  Copyright © 2018 Quan Pham. All rights reserved.
//

#import "PostItemTableCell.h"

@implementation PostItemTableCell

@synthesize postTitle = _postTitle;
@synthesize postExcerpt = _postExcerpt;
@synthesize thumbnailImageView = _thumbnailImageView;

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
