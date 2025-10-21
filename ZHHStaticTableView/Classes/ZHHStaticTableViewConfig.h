//
//  ZHHStaticTableViewConfig.h
//  ZHHStaticTableView
//
//  Created by 桃色三岁 on 2025/1/15.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// ZHHStaticTableView 全局配置类
/// 用于统一管理默认样式和配置
@interface ZHHStaticTableViewConfig : NSObject

/// 单例实例
+ (instancetype)sharedConfig;

#pragma mark - 默认样式配置

/// 默认文本颜色（默认：UIColor.labelColor）
@property (nonatomic, strong) UIColor *defaultTextColor;

/// 默认副文本颜色（默认：UIColor.secondaryLabelColor）
@property (nonatomic, strong) UIColor *defaultDetailTextColor;

/// 默认字体（默认：system 15 regular）
@property (nonatomic, strong) UIFont *defaultFont;

/// 默认副文本字体（默认：system 14 regular）
@property (nonatomic, strong) UIFont *defaultDetailFont;

/// 默认箭头图片（使用SF Symbols：chevron.right，自动适配主题，默认颜色：tertiaryLabelColor）
@property (nonatomic, strong) UIImage *defaultArrowImage;

/// 默认Cell高度（默认：50）
@property (nonatomic, assign) CGFloat defaultCellHeight;

/// 默认左侧边距（默认：15）
@property (nonatomic, assign) CGFloat defaultLeftMargin;

/// 默认右侧边距（默认：15）
@property (nonatomic, assign) CGFloat defaultRightMargin;

/// 默认内容间距（默认：10）
@property (nonatomic, assign) CGFloat defaultContentSpacing;

/// 默认图标尺寸（默认：20x20）
@property (nonatomic, assign) CGSize defaultIconSize;

/// 默认箭头尺寸（默认：10x16）
@property (nonatomic, assign) CGSize defaultArrowSize;

#pragma mark - Section 默认配置

/// 默认Section Header高度（默认：20）
@property (nonatomic, assign) CGFloat defaultSectionHeaderHeight;

/// 默认Section Footer高度（默认：0；内部会在示例中兜底为30）
@property (nonatomic, assign) CGFloat defaultSectionFooterHeight;

/// 默认Section边距（默认：0）
@property (nonatomic, assign) CGFloat defaultSectionMargin;

/// 默认Section Header字体（默认：system 15 medium）
@property (nonatomic, strong) UIFont *defaultSectionHeaderFont;

/// 默认Section Header颜色（默认：UIColor.labelColor）
@property (nonatomic, strong) UIColor *defaultSectionHeaderColor;

/// 默认Section Footer字体（默认：system 13 regular）
@property (nonatomic, strong) UIFont *defaultSectionFooterFont;

/// 默认Section Footer颜色（默认：UIColor.secondaryLabelColor）
@property (nonatomic, strong) UIColor *defaultSectionFooterColor;

#pragma mark - 配置方法

/// 重置为默认配置
- (void)resetToDefaults;

@end

NS_ASSUME_NONNULL_END

