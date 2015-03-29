//
//  TDBaseTableView.h
//  FirstDemo
//
//  Created by 王世坚 on 15/1/18.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDBaseTableViewCell.h"
#import "TDQueryCell.h"
#import "TDTableViewDataModel.h"

@class  TDBaseTableView;

@protocol TDBaseTableViewDelegate <NSObject>

- (void)tdBaseTableViewTrigerForMoreData:(TDBaseTableView *)tableView;

- (void)tdBaseTableViewTapErrorForData:(TDBaseTableView *)tableView;

- (void)tdBaseTableViewDidSelect:(TDBaseTableView *)tableView indexPath:(NSIndexPath *)indexPath;

- (void)tdBaseTableViewAccessoryButtonClicked:(TDBaseTableView *)tableView indexPath:(NSIndexPath *)indexPath;
@end

@interface TDBaseTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign)id <TDBaseTableViewDelegate>tdDelegate;

@property (nonatomic,strong)TDTableViewDataModel * tableViewDataModel;

@end
