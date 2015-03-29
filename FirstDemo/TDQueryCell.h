//
//  TDQueryCell.h
//  FirstDemo
//
//  Created by 王世坚 on 15/1/18.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDTableViewDataModel.h"

@interface TDQueryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;


- (void)setQueryState:(TD_QUERY_STATE)queryState;


@end
