//
//  TDDataService.m
//  FirstDemo
//
//  Created by 王世坚 on 14/12/28.
//  Copyright (c) 2014年 airrons. All rights reserved.
//

#import "TDDataService.h"

@interface TDDataService()

{
    NSString * url;
}

@end

@implementation TDDataService


+ (TDDataService *)sharedDataService
{
    static TDDataService *sharedDataServiceInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedDataServiceInstance = [[self alloc] init];
    });
    return sharedDataServiceInstance;
}


/*根据关键字搜索*/
- (void)queryWithSearchList:(TDQueryService *)query WithSearchList:(TDDResponse)TDDResponse{
    NSMutableString * urlStr = [NSMutableString stringWithString:TD_BASE_URL];
    [urlStr appendString:@"search?"];
    [urlStr appendFormat:@"&app_key=%@&format=json",APPv3KEY];

    /*在v6中的搜索下不可用*/
   /*
    if (query.channelId) {
        [urlStr appendFormat:@"&channelId=%@",query.channelId];
    }
    
    if (query.queryTimeType == TD_QUERY_TIME_WEEK) {
        [urlStr appendFormat:@"&inDays=7"];
    }else if (query.queryTimeType == TD_QUERY_TIME_MONTH){
        [urlStr appendFormat:@"&inDays=30"];
    }
    
    if (query.querySourceType == TD_QUERY_SOURCE_VIDEO) {
        [urlStr appendString:@"&media=v"];
    }else if (query.querySourceType == TD_QUERY_SOURCE_AUDIO){
        [urlStr appendString:@"&media=a"];
    }
    
    if (query.queryLevelType == TD_QUERY_LEVEL_LONG) {
        [urlStr appendString:@"&ttlevel=l"];
    }else if (query.queryLevelType == TD_QUERY_LEVEL_MIDDLE){
        [urlStr appendString:@"&ttlevel=m"];
    }else if (query.queryLevelType == TD_QUERY_LEVEL_SHORT){
        [urlStr appendString:@"&ttlevel=s"];
    }
    */
    if (query.q) {
        [urlStr appendFormat:@"&kw=%@",query.q];
    }
    
    if (query.querySortType == TD_QUERY_SORT_VIEWS){
        [urlStr appendString:@"&sort=viewed_all"];
    }else if (query.querySortType == TD_QUERY_SORT_CREATEDTIME){
        [urlStr appendString:@"&sort=createTime"];
    }
    
    if (query.pageNo) {
        [urlStr appendFormat:@"&pageNo=%ld",(long)query.pageNo];
    }
    if (query.pageSize) {
        [urlStr appendFormat:@"&pageSize=%ld",(long)query.pageSize];
    }else{
        [urlStr appendString:@"&pageSize=25"];
    }
    
    NSURL * requestUrl = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestUrl];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError * error = nil;
        NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if (error) {
//            DLog(@"error occurred !");
            TDDResponse(nil,error);
        }else{
//            DLog(@"======the result is %@",jsonData);
            TDDResponse(jsonData,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        DLog(@"----------error %@",error);
        TDDResponse(nil,error);
    }];
    [operation start];
}




- (void)queryWithVideoInfo:(TDQueryService *)query completion:(TDDResponse)TDDResponse{
    
    NSMutableString * urlStr = [NSMutableString stringWithString:TD_BASE_URL];
    [urlStr appendString:@"info?"];
    [urlStr appendFormat:@"&app_key=%@&format=json",APPv3KEY];
    if (query.videoCode) {
        [urlStr appendFormat:@"&itemCodes=%@",query.videoCode];
    }
    NSURL * requestUrl = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestUrl];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError * error = nil;
        NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if (error) {
//            DLog(@"error occurred !");
            TDDResponse(nil,error);
        }else{
//            DLog(@"the result is %@",jsonData);
            TDDResponse(jsonData,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        DLog(@"----------error %@",error);
        TDDResponse(nil,error);
    }];
    [operation start];
    
}


- (void)queryWithVideoTopList:(TDQueryService *)query completion:(TDDResponse)TDDResponse{
    NSMutableString * urlStr = [NSMutableString stringWithString:TD_BASE_URL];
    [urlStr appendString:@"top_list?"];
    [urlStr appendFormat:@"&app_key=%@&format=json",APPv3KEY];
    [urlStr appendFormat:@"&channelId=%@",query.channelId];
    [urlStr appendFormat:@"&pageNo=%ld",(long)query.pageNo];
    [urlStr appendFormat:@"&pageSize=%ld",(long)query.pageSize];
    if (query.queryOrderType == TD_QUERY_ORDER_COMMENTCOUNTS) {
        [urlStr appendString:@"&order=c"];
    }else if (query.queryOrderType == TD_QUERY_ORDER_RATING){
        [urlStr appendString:@"&order=r"];
    }else if (query.queryOrderType == TD_QUERY_ORDER_VIEWCOUNTS){
        [urlStr appendString:@"&order=v"];
    }else if (query.queryOrderType == TD_QUERY_ORDER_PUBLISHDATE){
        [urlStr appendString:@"&order=t"];
    }
    
    NSURL * requestUrl = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestUrl];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError * error = nil;
        NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if (error) {
//            DLog(@"error occurred !");
            TDDResponse(nil,error);
        }else{
//            DLog(@"the result is %@",jsonData);
            TDDResponse(jsonData,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        DLog(@"----------error %@",error);
        TDDResponse(nil,error);
    }];
    [operation start];
    
}



- (void)queryWithCommentList:(TDQueryService *)query completion:(TDDResponse)TDDResponse{
    
    NSMutableString * urlStr = [NSMutableString stringWithString:TD_BASE_URL];
    [urlStr appendString:@"comment_list?"];
    [urlStr appendFormat:@"&app_key=%@&format=json",APPv3KEY];
    [urlStr appendFormat:@"&itemCode=%@",query.videoCode];
    if (query.queryCommentSortType == TD_QUERY_COMMENT_SORT_TIME) {
        [urlStr appendString:@"&getType=getCmt"];
    }else if (query.queryCommentSortType == TD_QUERY_COMMENT_SORT_HOT){
        [urlStr appendString:@"&getType=getHotCmt"];
    }
    [urlStr appendFormat:@"&pageNo=%ld",(long)query.pageNo];
    [urlStr appendFormat:@"&pageSize=%ld",(long)query.pageSize];
    
    NSURL * requestUrl = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestUrl];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError * error = nil;
        NSDictionary * jsonData = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        if (error) {
//            DLog(@"error occurred !");
            TDDResponse(nil,error);
        }else{
//            DLog(@"the result is %@",jsonData);
            TDDResponse(jsonData,nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        DLog(@"----------error %@",error);
        TDDResponse(nil,error);
    }];
    [operation start];
}































@end
