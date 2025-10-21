//
//  ZHHStaticTableViewConfig.m
//  ZHHStaticTableView
//
//  Created by 桃色三岁 on 2025/1/15.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHStaticTableViewConfig.h"

@implementation ZHHStaticTableViewConfig

+ (instancetype)sharedConfig {
    static ZHHStaticTableViewConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZHHStaticTableViewConfig alloc] init];
        [instance resetToDefaults];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self resetToDefaults];
    }
    return self;
}

#pragma mark - 配置方法

/// 重置为默认配置
- (void)resetToDefaults {
    // 使用系统语义化颜色，自动适配系统主题
    _defaultTextColor = UIColor.labelColor;
    _defaultDetailTextColor = UIColor.secondaryLabelColor;
    _defaultFont = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    _defaultDetailFont = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    
    // 默认布局
    _defaultCellHeight = 50.0;
    _defaultLeftMargin = 15.0;
    _defaultRightMargin = 15.0;
    _defaultContentSpacing = 10.0;
    
    // 默认图标尺寸
    _defaultIconSize = CGSizeMake(20, 20);
    _defaultArrowSize = CGSizeMake(10, 16);
    
    // 默认箭头图片（懒加载）
    _defaultArrowImage = nil; // 将在getter中懒加载
    
    // 默认Section配置 - 使用系统语义化颜色
    _defaultSectionHeaderHeight = 20.0;
    _defaultSectionFooterHeight = 0.0;
    _defaultSectionMargin = 0.0;
    _defaultSectionHeaderFont = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
    _defaultSectionHeaderColor = UIColor.labelColor;
    _defaultSectionFooterFont = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    _defaultSectionFooterColor = UIColor.secondaryLabelColor;
}

#pragma mark - 懒加载

/// 懒加载默认箭头图片，使用SF Symbols系统图标
- (UIImage *)defaultArrowImage {
    if (!_defaultArrowImage) {
        // 使用SF Symbols系统图标，设置默认颜色
        UIImage *systemImage = [UIImage systemImageNamed:@"chevron.right"];
        _defaultArrowImage = [systemImage imageWithTintColor:UIColor.tertiaryLabelColor 
                                                 renderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    return _defaultArrowImage;
}

@end

