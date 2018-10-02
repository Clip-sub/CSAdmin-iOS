//
//  PostItemCollectionViewCell.h
//  CSAdmin
//
//  Created by Quan Pham  on 9/17/18.
//  Copyright © 2018 Quan Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"

@interface PostItemCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *postTitle;

@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;

@end
