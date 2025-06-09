//
//  ZHHStaticTableviewCellViewModel.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import "ZHHStaticTableviewCellViewModel.h"

@interface ZHHStaticTableviewCellViewModel()

@end

@implementation ZHHStaticTableviewCellViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        // 默认配置
        _cellID = @"ZHHStaticTableViewCell";
        _cellClassName = @"ZHHStaticTableViewCell";
        _cellType = ZHHStaticCellTypeDefault;
        _cellHeight = 50;
        _showRightOptionSwitch = NO;
        _showBadgeView = NO;

        // 左侧默认配置
        _leftContentMargin = 15;
        _leftContentSpacing = 10;
        _leftTitleTextFont = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
        _leftTitleTextColor = UIColor.labelColor;
        _leftIconImageSize = CGSizeMake(20, 20);

        // 右侧默认配置
        _rightContentMargin = 15;
        _rightContentSpacing = 5;
        _rightTitleTextFont = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _rightTitleTextColor = [UIColor tertiaryLabelColor];
        _rightDetailTextFont = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        _rightDetailTextColor = [UIColor tertiaryLabelColor];
        _rightIconImageSize = CGSizeMake(20, 20);
        _rightArrowImage = [UIImage imageNamed:@"icon_setting_arrow_black"];
    }
    return self;
}

@end
