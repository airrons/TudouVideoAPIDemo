//
//  TDQueryService.h
//  FirstDemo
//
//  Created by 王世坚 on 14/12/28.
//  Copyright (c) 2014年 airrons. All rights reserved.
//
/*
  该类用于土豆数据查询
 */
#import <Foundation/Foundation.h>

/*本周视频，本月视频，全部视频*/
typedef enum {
    TD_QUERY_TIME_ALL,
     TD_QUERY_TIME_WEEK,
    TD_QUERY_TIME_MONTH
}TD_QUERY_TIME_TYPE;

/*资源长度，短片，中片，长片*/
typedef enum {
    TD_QUERY_LEVEL_SHORT,
    TD_QUERY_LEVEL_MIDDLE,
    TD_QUERY_LEVEL_LONG
}TD_QUERY_LEVEL_TYPE;

/*资源类型，视频和音频*/
typedef enum {
    TD_QUERY_SOURCE_VIDEO,
    TD_QUERY_SOURCE_AUDIO
}TD_QUERY_SOURCE_TYPE;

/*按照相关度，观看次数，创建的时间来筛选视频*/
typedef enum {
    TD_QUERY_SORT_RELEVENCE,
    TD_QUERY_SORT_VIEWS,
    TD_QUERY_SORT_CREATEDTIME
}TD_QUERY_SORT_TYPE;

/*按照评论次数，评分，观看次数，发布时间排序视频*/
typedef enum {
    TD_QUERY_ORDER_COMMENTCOUNTS,
    TD_QUERY_ORDER_RATING,
    TD_QUERY_ORDER_VIEWCOUNTS,
    TD_QUERY_ORDER_PUBLISHDATE
}TD_QUERY_ORDER_TYPE;

/*根据时间或者热度获取评论*/
typedef enum {
    TD_QUERY_COMMENT_SORT_TIME,
    TD_QUERY_COMMENT_SORT_HOT
}TD_QUERY_COMMENT_SORT_TYPE;

@interface TDQueryService : NSObject

/*搜索关键字*/
@property (nonatomic,strong)NSString * q;

@property (nonatomic,assign)NSInteger pageNo;

@property (nonatomic,assign)NSInteger pageSize;

@property (nonatomic,strong)NSString  * channelId;

@property (nonatomic,assign)TD_QUERY_TIME_TYPE queryTimeType;

@property (nonatomic,assign)TD_QUERY_LEVEL_TYPE queryLevelType;

@property (nonatomic,assign)TD_QUERY_SOURCE_TYPE querySourceType;

@property (nonatomic,assign)TD_QUERY_SORT_TYPE querySortType;

@property (nonatomic,assign)TD_QUERY_ORDER_TYPE queryOrderType;

@property (nonatomic,assign)TD_QUERY_COMMENT_SORT_TYPE queryCommentSortType;

@property (nonatomic,strong)NSString * videoCode;



@end
