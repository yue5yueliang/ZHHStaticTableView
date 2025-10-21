//
//  ZHHStaticTableviewCellViewModel.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import "ZHHStaticTableviewCellViewModel.h"
#import "ZHHStaticTableViewConfig.h"

@interface ZHHStaticTableviewCellViewModel()

@end

@implementation ZHHStaticTableviewCellViewModel

/// 初始化方法，使用配置类设置默认值
- (instancetype)init {
    self = [super init];
    if (self) {
        // 使用配置类获取默认值
        ZHHStaticTableViewConfig *config = [ZHHStaticTableViewConfig sharedConfig];
        
        // 默认配置
        _cellID = @"ZHHStaticTableViewCell";
        _cellClassName = @"ZHHStaticTableViewCell";
        _cellType = ZHHStaticCellTypeDefault;
        _cellHeight = config.defaultCellHeight;
        _showRightOptionSwitch = NO;
        _showBadgeView = NO;

        // 左侧UI配置
        _leftContentMargin = config.defaultLeftMargin;
        _leftContentSpacing = config.defaultContentSpacing;
        _leftTitleTextFont = config.defaultFont;
        _leftTitleTextColor = config.defaultTextColor;
        _leftIconImageSize = config.defaultIconSize;

        // 右侧UI配置
        _rightContentMargin = config.defaultRightMargin;
        _rightContentSpacing = 5;
        _rightTitleTextFont = config.defaultDetailFont;
        _rightTitleTextColor = config.defaultDetailTextColor;
        _rightDetailTextFont = config.defaultDetailFont;
        _rightDetailTextColor = config.defaultDetailTextColor;
        _rightIconImageSize = config.defaultIconSize;
        // 箭头颜色使用系统语义化颜色，自动适配主题
        _rightArrowImageColor = UIColor.tertiaryLabelColor;
    }
    return self;
}

#pragma mark - 懒加载图片资源

/// 懒加载右侧箭头图片，使用SF Symbols系统图标
- (UIImage *)rightArrowImage {
    if (!_rightArrowImage) {
        // 使用SF Symbols系统图标，应用自定义颜色
        UIImage *systemImage = [UIImage systemImageNamed:@"chevron.right"];
        _rightArrowImage = [systemImage imageWithTintColor:self.rightArrowImageColor 
                                               renderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return _rightArrowImage;
}

/// 懒加载右侧箭头图片尺寸，从配置类获取默认值
- (CGSize)rightArrowImageSize {
    if (CGSizeEqualToSize(_rightArrowImageSize, CGSizeZero)) {
        ZHHStaticTableViewConfig *config = [ZHHStaticTableViewConfig sharedConfig];
        _rightArrowImageSize = config.defaultArrowSize;
    }
    return _rightArrowImageSize;
}

#pragma mark - 箭头颜色更新

/// 更新箭头颜色，清除缓存图片以便重新生成
- (void)updateArrowImageColor {
    // 清除缓存的图片，下次访问时会重新生成
    _rightArrowImage = nil;
}

@end
