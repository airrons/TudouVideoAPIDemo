//
//  TDQueryCell.m
//  FirstDemo
//
//  Created by 王世坚 on 15/1/18.
//  Copyright (c) 2015年 airrons. All rights reserved.
//

#import "TDQueryCell.h"

@implementation TDQueryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setQueryState:(TD_QUERY_STATE)queryState{
    switch (queryState) {
        case TD_QUERY_STATE_ERROR:
            self.errorLabel.hidden = NO;
            self.loadingIndicator.hidden = YES;
            break;
        case TD_QUERY_STATE_LOADING:
            self.errorLabel.hidden = YES;
            self.loadingIndicator.hidden = NO;
        default:
            self.errorLabel.hidden = YES;
            self.loadingIndicator.hidden = YES;
            break;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
