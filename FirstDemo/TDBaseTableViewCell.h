//
//  TDBaseTableViewCell.h
//  FirstDemo
//
//  Created by 王世坚 on 15/1/18.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDVideoModel.h"
#import "UIImageView+AFNetworking.h"

@interface TDBaseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *videoTitle;
@property (weak, nonatomic) IBOutlet UILabel *ownerNickName;
@property (weak, nonatomic) IBOutlet UILabel *viewCounts;


- (void)videoModel:(TDVideoModel *)videoModel;

@end
