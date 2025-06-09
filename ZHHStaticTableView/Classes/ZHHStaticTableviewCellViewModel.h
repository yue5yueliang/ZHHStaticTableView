//
//  ZHHStaticTableviewCellViewModel.h
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 静态 cell 类型，已封装好，可以直接使用
typedef NS_ENUM(NSInteger, ZHHStaticCellType) {
    /// 默认系统样式（可包含箭头、开关等）
    ZHHStaticCellTypeDefault,
    /// 需要用户自定义的 cell 类型（如个人页“我”cell）
    ZHHStaticCellTypeCustom
};

/// switch开关切换时调用的block
typedef void(^ZHHSwitchValueChagedBlock)(BOOL isOn);

@interface ZHHStaticTableviewCellViewModel : NSObject

#pragma mark - Cell UI 配置

/// Cell 复用标识符
/// - 若 `cellType` 为 `ZHHStaticCellTypeCustom`，则默认使用 `cellClassName` 作为复用标识符
/// - 其他类型的 Cell 统一使用 `ZHHStaticTableViewCell` 作为默认复用标识符
@property (nonatomic, copy, readonly) NSString *cellID;

/// 自定义 Cell 的类名（仅在 `cellType` 为 `ZHHStaticCellTypeCustom` 时使用）
/// 用于 `dequeueReusableCellWithIdentifier:` 方法加载自定义 Cell
@property (nonatomic, copy) NSString *cellClassName;

/// Cell 的唯一标识符（用于区分不同 Cell，通常用于点击事件或数据绑定）
@property (nonatomic, assign) NSInteger identifier;

/// 是否显示小红点（默认 NO）
@property (nonatomic, assign) BOOL showBadgeView;

/// Cell 类型（默认右侧显示箭头）
@property (nonatomic, assign) ZHHStaticCellType cellType;

/// Cell 高度（默认 49.0，可修改）
@property (nonatomic, assign) CGFloat cellHeight;

#pragma mark - 左侧内容配置

/// 左侧标题（可选，未设置时不显示）
@property (nonatomic, copy) NSString *leftTitleText;
/// 左侧标题的颜色（默认：黑色）
@property (nonatomic, strong) UIColor *leftTitleTextColor;
/// 左侧标题的字体（默认：系统 15 号字体）
@property (nonatomic, strong) UIFont *leftTitleTextFont;

/// 左侧内容的外边距（默认 15）
@property (nonatomic, assign) CGFloat leftContentMargin;

/// 左侧图标（可选，未设置时不显示）
@property (nonatomic, strong) UIImage *leftIconImage;
/// 左侧图标的大小（默认 20x20）
@property (nonatomic, assign) CGSize leftIconImageSize;
/// 左侧图标与标题的间距（默认 10.0）
@property (nonatomic, assign) CGFloat leftContentSpacing;

#pragma mark - 右侧内容配置

/// 右侧主要文本（可选，未设置时不显示）
@property (nonatomic, copy) NSString *rightTitleText;
/// 右侧主要文本的颜色（默认：灰色）
@property (nonatomic, strong) UIColor *rightTitleTextColor;
/// 右侧主要文本的字体（默认：系统 13 号字体）
@property (nonatomic, strong) UIFont *rightTitleTextFont;

/// 右侧副标题（可选，未设置时不显示）
@property (nonatomic, copy) NSString *rightDetailText;
/// 右侧副标题的颜色（默认：灰色）
@property (nonatomic, strong) UIColor *rightDetailTextColor;
/// 右侧副标题的字体（默认：系统 13 号字体）
@property (nonatomic, strong) UIFont *rightDetailTextFont;

/// 右侧图标（可选，未设置时不显示）
@property (nonatomic, strong) UIImage *rightIconImage;
/// 右侧图标的大小（默认 20x20）
@property (nonatomic, assign) CGSize rightIconImageSize;

/// 右侧元素之间的间距（默认 5.0）
@property (nonatomic, assign) CGFloat rightContentSpacing;
/// 右侧内容的外边距（默认 15）
@property (nonatomic, assign) CGFloat rightContentMargin;

/// 是否显示右侧 Switch 开关（默认 NO）
@property (nonatomic, assign) BOOL showRightOptionSwitch;
/// 右侧箭头图标（默认显示）
@property (nonatomic, strong, nullable) UIImage *rightArrowImage;
/// 右侧箭头图标的大小（默认 8x14）
@property (nonatomic, assign) CGSize rightArrowImageSize;

/// 切换 Switch 开关时的回调 Block
@property (nonatomic, copy) ZHHSwitchValueChagedBlock switchValueDidChangeBlock;


#pragma mark ---- 自定义cell的数据放在这里 ----
@property (nonatomic, strong) UIImage *avatarImage;
@property (nonatomic, strong) UIImage *codeImage;
@property (nonatomic, copy)   NSString *userName;
@property (nonatomic, copy)   NSString *userID;
@end

NS_ASSUME_NONNULL_END
