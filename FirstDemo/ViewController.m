//
//  ViewController.m
//  FirstDemo
//
//  Created by 王世坚 on 14/12/24.
//  Copyright (c) 2014年 airrons. All rights reserved.
//

#import "ViewController.h"
#import "TDDataService.h"

@interface ViewController ()

{
    TDTableViewDataModel * tableViewDataModel;
}

@end

@implementation ViewController

- (void)createTableView{
    TDBaseTableView * tableView = [[TDBaseTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.tdDelegate = self;
    tableView.tableViewDataModel = tableViewDataModel;
    tableView.autoresizingMask = self.view.autoresizingMask;
    [self.view addSubview:tableView];
}


- (void)queryVideoList{
    TDQueryService * query = [[TDQueryService alloc]init];
    query.q = @"LOL";
    query.pageNo = tableViewDataModel.page;
    query.pageSize = 25;
    query.queryTimeType = TD_QUERY_TIME_WEEK;
    query.querySourceType = TD_QUERY_SOURCE_VIDEO;
    query.querySortType = TD_QUERY_SORT_RELEVENCE;
    query.queryLevelType = TD_QUERY_LEVEL_LONG;
    TDDataService * service = [TDDataService sharedDataService];
    tableViewDataModel.queryState = TD_QUERY_STATE_LOADING;
    [service queryWithSearchList:query WithSearchList:^(NSDictionary *response, NSError *error) {
        if (error) {
            //            DLog(@"error occurred %@ !",error);
            tableViewDataModel.queryState = TD_QUERY_STATE_ERROR;
        }else{
            //            DLog(@"fetched data %@",response);
            
            NSArray * results = [response objectForKey:@"results"];
            NSMutableArray * items = [TDDataHelper parserVideolist:results];
            [tableViewDataModel.modelArray addObjectsFromArray:items];
            
            int page = [[[response objectForKey:@"page"] objectForKey:@"pageNo"] intValue];
            int pageCount = [[[response objectForKey:@"page"] objectForKey:@"pageCount"] intValue];
            tableViewDataModel.page = page;
            if (page < pageCount) {
                tableViewDataModel.hasMore = YES;
                tableViewDataModel.page += 1;
                tableViewDataModel.queryState = TD_QUERY_STATE_NONE;
            }else{
                tableViewDataModel.hasMore = NO;
                tableViewDataModel.queryState = TD_QUERY_STATE_FINISH;
            }
        }
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableViewDataModel = [[TDTableViewDataModel alloc]init];
    [self createTableView];
    [self queryVideoList];
    
//    TDQueryService * query = [[TDQueryService alloc]init];
//    query.q = @"LOL";
//    query.pageNo = 1;
//    query.pageSize = 25;
//    query.queryTimeType = TD_QUERY_TIME_WEEK;
//    query.querySourceType = TD_QUERY_SOURCE_VIDEO;
//    query.querySortType = TD_QUERY_SORT_RELEVENCE;
//    query.queryLevelType = TD_QUERY_LEVEL_LONG;
//    TDDataService * service = [TDDataService sharedDataService];
//    tableViewDataModel.queryState = TD_QUERY_STATE_LOADING;
//    [service queryWithSearchList:query WithSearchList:^(NSDictionary *response, NSError *error) {
//        if (error) {
////            DLog(@"error occurred %@ !",error);
//            tableViewDataModel.queryState = TD_QUERY_STATE_ERROR;
//        }else{
////            DLog(@"fetched data %@",response);
//            
//            NSArray * results = [response objectForKey:@"results"];
//            NSMutableArray * items = [TDDataHelper parserVideolist:results];
//            [tableViewDataModel.modelArray addObjectsFromArray:items];
//            
//            int page = [[[response objectForKey:@"page"] objectForKey:@"pageNo"] intValue];
//            int pageCount = [[[response objectForKey:@"page"] objectForKey:@"pageCount"] intValue];
//            tableViewDataModel.page = page;
//            if (page < pageCount) {
//                tableViewDataModel.hasMore = YES;
//                tableViewDataModel.queryState = TD_QUERY_STATE_NONE;
//            }else{
//                tableViewDataModel.hasMore = NO;
//                tableViewDataModel.queryState = TD_QUERY_STATE_FINISH;
//            }
//        }
//    }];
//    
//    
//    query.videoCode = @"siuBXDL5nGs";
//    [service queryWithVideoInfo:query completion:^(NSDictionary *response, NSError *error) {
//        if (error) {
////            DLog(@"error occurred %@ !",error);
//        }else{
////            DLog(@"fetched data %@",response);
////            self.textView.text = [response description];
//        }
//    }];
//    
//    
//    query.channelId = @"99";
//    query.queryOrderType = TD_QUERY_ORDER_VIEWCOUNTS;
//    [service queryWithVideoTopList:query completion:^(NSDictionary *response, NSError *error) {
//        if (error) {
////            DLog(@"error occurred %@ !",error);
//        }else{
////            DLog(@"fetched data %@",response);
//        }
//    }];
//    
//    query.queryCommentSortType = TD_QUERY_COMMENT_SORT_HOT;
//    query.videoCode = @"siuBXDL5nGs";
//    [service queryWithCommentList:query completion:^(NSDictionary *response, NSError *error) {
//        if (error) {
////            DLog(@"error occurred %@ !",error);
//        }else{
////            DLog(@"fetched data %@",response);®
//        }
//    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}



#pragma mark ---TDBaseTableView
-(void)tdBaseTableViewAccessoryButtonClicked:(TDBaseTableView *)tableView indexPath:(NSIndexPath *)indexPath{
    
}

-(void)tdBaseTableViewDidSelect:(TDBaseTableView *)tableView indexPath:(NSIndexPath *)indexPath{
    TDVideoModel * videoModel = [tableView.tableViewDataModel.modelArray objectAtIndex:indexPath.row];
//    NSURL * url = [NSURL URLWithString:[videoModel playUrl]];
//    NSURLRequest * request = [NSURLRequest requestWithURL:url];
//    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        DLog(@"-----------response %@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        DLog(@"-----------error %@",error.description);
//
//    }];
//    [operation start];
    TDVideoPlayerViewController * viewController = [[TDVideoPlayerViewController alloc]init];
    viewController.videoId = videoModel.vcode;
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)tdBaseTableViewTapErrorForData:(TDBaseTableView *)tableView{
    [self queryVideoList];
}

-(void)tdBaseTableViewTrigerForMoreData:(TDBaseTableView *)tableView{
    [self queryVideoList];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
