//
//  PostItemTableCell.h
//  CSAdmin
//
//  Created by Quan Pham  on 7/10/18.
//  Copyright © 2018 Quan Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostItemTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *postTitle;
@property (nonatomic, weak) IBOutlet UILabel *postExcerpt;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
