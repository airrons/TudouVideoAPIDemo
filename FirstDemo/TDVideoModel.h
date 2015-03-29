//
//  TDVideoModel.h
//  FirstDemo
//
//  Created by 王世坚 on 15/1/4.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDVideoModel : NSObject

/*
 别名
 */
@property (nonatomic,strong)NSString * alias;

/*
 视频大图
 */
@property (nonatomic,strong)NSString * bigPicUrl;

/*
 埋次数
 */
@property (nonatomic,assign)int buryCount;

/*
 所属频道id
 */
@property (nonatomic,strong)NSString * channelId;

/*
 评论次数
 */
@property (nonatomic,assign)int commentCount;

/*
 视频描述
 */
@property (nonatomic,strong)NSString * videoDescription;

/*
 挖次数
 */
@property (nonatomic,assign)int digCount;

/*
 是否可以下载
 */
@property (nonatomic,assign)BOOL donwEnable;

/*
 收藏次数
 */
@property (nonatomic,assign)int favorCount;

/*
 视频清晰度 。。（256P流畅    360P高清   480P超清   720P超清   99原画）
 */
@property (nonatomic,assign)NSString * hdType;

/*
 视频编码。11位字符型编码，视频唯一标识
 */
@property (nonatomic,strong)NSString * itemCode;

/*
 视频位置
 */
@property (nonatomic,strong)NSString * location;

/*
 媒体类型
 */
@property (nonatomic,strong)NSString * mediaType;

/*
 站外通用播放器URL   支持IOS,安卓等移动设备的HTML5播放器
 */
@property (nonatomic,strong)NSString * outerGPlayerUrl;

/*
 站外播放器URL
 */
@property (nonatomic,strong)NSString * outerPlayerUrl;

/*
 博客ID
 */
@property (nonatomic,strong)NSString * ownerId;

/*
 博客名
 */
@property (nonatomic,strong)NSString * ownerName;

/*
 博客昵称
 */
@property (nonatomic,strong)NSString * ownerNickName;

/*
 博客头像地址
 */
@property (nonatomic,strong)NSString * ownerPicUrl;

/*
 博客地址
 */
@property (nonatomic,strong)NSString * ownerUrl;

/*
 视频截图
 */
@property (nonatomic,strong)NSString * picUrl;

/*
 播放次数
 */
@property (nonatomic,assign)int playTimes;

/*
 播放页URL
 */
@property (nonatomic,strong)NSString * playUrl;

/*
 视频发布时间
 */
@property (nonatomic,strong)NSString * publishTime;

/*
 私密
 */
@property (nonatomic,assign)BOOL secret;

/*
 视频标签
 */
@property (nonatomic,strong)NSString * tags;

/*
 视频名字
 */
@property (nonatomic,strong)NSString * videoTitle;

/*
 视频时长
 */
@property (nonatomic,assign)int totalTime;

@property (nonatomic,strong)NSString * vcode;


@end
