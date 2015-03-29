//
//  TDDataService.h
//  FirstDemo
//
//  Created by 王世坚 on 14/12/28.
//  Copyright (c) 2014年 airrons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDConstants.h"
#import "TDQueryService.h"
#import <AFNetworking/AFNetworking.h>

typedef  void (^TDDResponse)(NSDictionary * response ,NSError * error);

@interface TDDataService : NSObject

+ (TDDataService *)sharedDataService;


/*根据关键字搜索*/
- (void)queryWithSearchList:(TDQueryService *)query WithSearchList:(TDDResponse)TDDResponse;


/*
 根据视频id请求视频详细信息。
 */
- (void)queryWithVideoInfo:(TDQueryService *)query completion:(TDDResponse)TDDResponse;


/*
 根据视频频道id请求当前频道视频排行。
 */
- (void)queryWithVideoTopList:(TDQueryService *)query completion:(TDDResponse)TDDResponse;


/*
 根据视频编码请求当前视频评论列表.
 */
- (void)queryWithCommentList:(TDQueryService *)query completion:(TDDResponse)TDDResponse;

@end
