//
//  TDTableViewDataModel.h
//  FirstDemo
//
//  Created by 王世坚 on 15/1/18.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    TD_QUERY_STATE_BEGIN,
    TD_QUERY_STATE_LOADING,
    TD_QUERY_STATE_NONE,
    TD_QUERY_STATE_FINISH,
    TD_QUERY_STATE_ERROR
    
}TD_QUERY_STATE;

@interface TDTableViewDataModel : NSObject


@property (nonatomic,assign)TD_QUERY_STATE queryState;
@property (nonatomic,strong)NSMutableArray * modelArray;
@property (nonatomic,assign)BOOL hasMore;
@property (nonatomic,assign)int page;


- (void)cancel;

@end
