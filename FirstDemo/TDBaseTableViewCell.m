//
//  TDBaseTableViewCell.m
//  FirstDemo
//
//  Created by 王世坚 on 15/1/18.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import "TDBaseTableViewCell.h"

@interface TDBaseTableViewCell()

{
    TDVideoModel * _videoModel;
}

@end

@implementation TDBaseTableViewCell


- (void)videoModel:(TDVideoModel *)videoModel{
    if (_videoModel != videoModel && videoModel) {
        _videoModel = videoModel;
        
        self.videoTitle.text = _videoModel.videoTitle;
        self.ownerNickName.text = _videoModel.ownerNickName;
        self.viewCounts.text = [NSString stringWithFormat:@"%d 次观看",_videoModel.playTimes];
        NSURL * imageUrl = [NSURL URLWithString:_videoModel.picUrl];
        [self.thumbnailView setImageWithURL:imageUrl placeholderImage:nil];
    }
}


@end
