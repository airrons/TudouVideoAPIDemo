//
//  TDBaseTableView.m
//  FirstDemo
//
//  Created by 王世坚 on 15/1/18.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import "TDBaseTableView.h"

@implementation TDBaseTableView

@synthesize tdDelegate;
@synthesize tableViewDataModel;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        tableViewDataModel = [[TDTableViewDataModel alloc]init];
        
        [self addObserver:self forKeyPath:@"self.tableViewDataModel" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"self.tableViewDataModel.queryState" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"self.tableViewDataModel"]) {
        [self reloadData];
    }else if ([keyPath isEqualToString:@"self.tableViewDataModel.queryState"]){
        [self reloadData];
    }
}


-(void)dealloc{
    [self removeObserver:self forKeyPath:@"self.tableViewDataModel"];
    [self removeObserver:self forKeyPath:@"self.tableViewDataModel.queryState"];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableViewDataModel.queryState == TD_QUERY_STATE_ERROR ||
        tableViewDataModel.queryState == TD_QUERY_STATE_LOADING) {
        return tableViewDataModel.modelArray.count + 1;
    }
    return tableViewDataModel.modelArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell;
    static NSString * dataCellidentifier = @"dataCellIdentifier";
    static NSString * queryIdentifier = @"queryCellIdentifier";
    if (indexPath.row == tableViewDataModel.modelArray.count) {
        cell = [tableView dequeueReusableCellWithIdentifier:queryIdentifier];
        if (cell == nil) {
            NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"TDQueryCell" owner:nil options:nil];
            cell = [nib firstObject];
        }
        TDQueryCell * queryCell = (TDQueryCell *)cell;
        [queryCell setQueryState:tableViewDataModel.queryState];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:dataCellidentifier];
        if (cell==nil) {
            NSArray * nib = [[NSBundle mainBundle]loadNibNamed:@"TDBaseTableViewCell" owner:nil options:nil];
            cell = [nib objectAtIndex:0];
        }
        TDVideoModel * videoModel = [[tableViewDataModel modelArray] objectAtIndex:indexPath.row];
        TDBaseTableViewCell * dataCell = (TDBaseTableViewCell *)cell;
        [dataCell videoModel:videoModel];
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableViewDataModel.queryState == TD_QUERY_STATE_ERROR ||
        tableViewDataModel.queryState == TD_QUERY_STATE_LOADING) {
        if (indexPath.row == tableViewDataModel.modelArray.count) {
            return 44;
        }
        return 100;
    }
    return 100;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > 100) {
        if (tableViewDataModel.queryState == TD_QUERY_STATE_NONE) {
            if ([self.tdDelegate respondsToSelector:@selector(tdBaseTableViewTrigerForMoreData:)]) {
                [self.tdDelegate tdBaseTableViewTrigerForMoreData:self];
            }
        }
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.tdDelegate respondsToSelector:@selector(tdBaseTableViewDidSelect:indexPath:)]) {
        [self.tdDelegate tdBaseTableViewDidSelect:self indexPath:indexPath];
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    if ([self.tdDelegate respondsToSelector:@selector(tdBaseTableViewAccessoryButtonClicked:indexPath:)]) {
        [self.tdDelegate tdBaseTableViewAccessoryButtonClicked:self indexPath:indexPath];
    }
}


@end
