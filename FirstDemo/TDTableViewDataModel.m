//
//  TDTableViewDataModel.m
//  FirstDemo
//
//  Created by 王世坚 on 15/1/18.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import "TDTableViewDataModel.h"

@implementation TDTableViewDataModel
@synthesize queryState;
@synthesize modelArray;
@synthesize hasMore;
@synthesize page;


-(instancetype)init{
    self = [super init];
    if (self) {
        modelArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)cancel{
    [modelArray removeAllObjects];
    queryState = TD_QUERY_STATE_BEGIN;
    hasMore = YES;
    page = 1;
}

@end
