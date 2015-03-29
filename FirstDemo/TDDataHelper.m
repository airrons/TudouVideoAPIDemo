//
//  TDDataHelper.m
//  FirstDemo
//
//  Created by 王世坚 on 15/1/18.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import "TDDataHelper.h"

@implementation TDDataHelper

+ (NSMutableArray *)parserVideolist:(NSArray *)result{
    NSMutableArray * items = [[NSMutableArray alloc]init];
    for (int i =0; i<result.count; i++) {
        NSDictionary * video = [result objectAtIndex:i];
        TDVideoModel * videoModel = [[TDVideoModel alloc]init];
        videoModel.alias = [video objectForKey:@"alias"];
        videoModel.bigPicUrl = [video objectForKey:@"bigPicUrl"];
        videoModel.channelId = [video objectForKey:@"channelId"];
        videoModel.commentCount = [[video objectForKey:@"commentCount"] intValue];
        videoModel.videoDescription = [video objectForKey:@"description"];
        videoModel.donwEnable = [[video objectForKey:@"downEnable"] boolValue];
        videoModel.favorCount = [[video objectForKey:@"favorCount"] intValue];
        videoModel.hdType = [video objectForKey:@"hdType"];
        videoModel.itemCode = [video objectForKey:@"itemCode"];
        videoModel.mediaType = [video objectForKey:@"mediaType"];
        videoModel.outerGPlayerUrl = [video objectForKey:@"outerGPlayerUrl"];
        videoModel.outerPlayerUrl = [video objectForKey:@"outerPlayerUrl"];
        videoModel.ownerId = [video objectForKey:@"ownerId"];
        videoModel.ownerName = [video objectForKey:@"ownerName"];
        videoModel.ownerNickName = [video objectForKey:@"ownerNickname"];
        videoModel.ownerPicUrl = [video objectForKey:@"ownerPic"];
        videoModel.ownerUrl = [video objectForKey:@"ownerUrl"];
        videoModel.picUrl = [video objectForKey:@"picUrl"];
        videoModel.playTimes = [[video objectForKey:@"playTimes"] intValue];
        videoModel.playUrl = [video objectForKey:@"playUrl"];
        videoModel.publishTime = [video objectForKey:@"pubDate"];
        videoModel.secret = [[video objectForKey:@"secret"] boolValue];
        videoModel.videoTitle = [video objectForKey:@"title"];
        videoModel.totalTime = [[video objectForKey:@"totalTime"] intValue];
        videoModel.vcode = [video objectForKey:@"vcode"];
        [items addObject:videoModel];
    }
    return items;
}

@end


