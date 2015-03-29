//
//  TDVideoComment.h
//  FirstDemo
//
//  Created by 王世坚 on 15/1/5.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDVideoBaseComment : NSObject

/*评论内容*/
@property (nonatomic,strong)NSString * content;

/*用户Id*/
@property (nonatomic,assign)int userId;

/*用户名称*/
@property (nonatomic,strong)NSString * userName;

/*发表的时间*/
@property (nonatomic,assign)long publishedTime;

/*用户所在的地点*/
@property (nonatomic,strong)NSString * location;

/*用户昵称*/
@property (nonatomic,strong)NSString * nickName;

/*用户图片*/
@property (nonatomic,strong)NSString * userPic;

/*评论ID*/
@property (nonatomic,assign)int commentId;

@end


@interface TDVIdeoComment : TDVideoBaseComment

@property (nonatomic,strong)TDVideoBaseComment * parentComment;

@end