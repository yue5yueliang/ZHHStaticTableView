//
//  ZHHAppearance.h
//  ZHHAnneKitExample
//
//  Created by 桃色三岁 on 2020/5/16.
//  Copyright © 2021 桃色三岁. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ZHHColors)

#pragma mark - 页面背景色

/// 页面背景色（亮色：纯白 #FFFFFF，暗黑：深蓝黑 #121826）
+ (instancetype)zhh_backgroundColor;

/// ImageView 背景色（亮色：浅灰 #F2F2F2，暗黑：蓝灰 #3B4455）
+ (instancetype)zhh_imageViewBackgourndColor;

#pragma mark - 分层容器背景色

/// 顶层背景色（亮色：极浅灰 #F8F8F8，暗黑：蓝黑 #1A202E）
/// 用于浮层、弹窗、顶层卡片等视觉最浅区域
+ (instancetype)zhh_backgroundPrimaryColor;

/// 次级背景色（亮色：浅灰 #EDEDED，暗黑：中蓝灰 #2A3242）
/// 用于普通卡片、容器等中层背景
+ (instancetype)zhh_backgroundSecondaryColor;

/// 底层背景色（亮色：中灰 #DFDFDF，暗黑：深蓝灰 #3B4455）
/// 用于分割底板、较次要区域背景
+ (instancetype)zhh_backgroundTertiaryColor;

#pragma mark - 导航栏颜色

/// 导航栏背景色（亮色：纯白 #FFFFFF，暗黑：深蓝黑 #121826）
+ (instancetype)zhh_navigationBarColor;

#pragma mark - TabBar 颜色

/// TabBar 背景色（亮色：纯白 #FFFFFF，暗黑：深蓝黑 #121826）
+ (instancetype)zhh_tabBarBackgourndColor;

/// TabBar 文字常态颜色（亮色：灰 #999999，暗黑：浅灰 #888888）
+ (instancetype)zhh_tabBarTextColor;

/// TabBar 文字选中颜色（亮/暗一致：主题红 #F12F54）
+ (instancetype)zhh_tabBarSelectedTextColor;

#pragma mark - 分隔线 & 标识色

/// 分隔线颜色（亮色：lightGray α=0.3，暗黑：darkGray α=0.3）
+ (instancetype)zhh_separatorColor;

/// 徽标颜色（亮/暗色一致：鲜红 #FF0049）
+ (instancetype)zhh_badgeColor;

/// 主题主色调（亮/暗色一致：品牌红 #F12F54）
+ (instancetype)zhh_themeColor;

/// 指示器颜色（亮/暗色一致：品牌红 #F12F54）
+ (instancetype)zhh_indicatorColor;

#pragma mark - 文字颜色

/// 标题文字颜色（亮色：深灰 #333333，暗黑：纯白 #FFFFFF）
+ (instancetype)zhh_titleColor;

/// 副标题文字颜色（亮色：中灰 #666666，暗黑：浅灰 #CCCCCC）
+ (instancetype)zhh_subtitleColor;

/// 正文字颜色（亮色：浅灰 #999999，暗黑：中灰 #888888）
+ (instancetype)zhh_contentColor;

/// 占位符文字颜色（亮色：浅灰 #999999，暗黑：中灰 #888888）
+ (instancetype)zhh_placeholderColor;
#pragma mark - 表格类颜色

/// section 背景色（亮色：纯白 #FFFFFF，暗黑：深蓝黑 #121826）
+ (instancetype)zhh_tableViewInSectionColor;

/// cell 高亮背景色（亮色：浅灰 #F8F8F8，暗黑：中蓝灰 #1A202E）
+ (instancetype)zhh_tableViewCellHighlightedColor;

#pragma mark - 链接颜色

/// 超链接颜色（亮色：蓝 #4979F5，暗黑：亮蓝 #5C8DFF）
+ (instancetype)zhh_linkColor;

/// 超链接点击高亮颜色（统一色值 #5A7CC2，rgba(90, 124, 194, 1)）
+ (instancetype)zhh_linkHighlightColor;

#pragma mark - 主按钮颜色（用于主要操作，视觉上最突出）

/// 普通按钮正常状态（亮金黄 #FFC300）
+ (instancetype)zhh_buttonNormalColor;

/// 普通按钮禁用状态（柔金黄 #FFE8A3）
+ (instancetype)zhh_buttonDisabledColor;

/// 普通按钮高亮状态（暗金黄 #DFAF00）
+ (instancetype)zhh_buttonHighlightedColor;

#pragma mark - 次级按钮颜色（语义上为次要操作按钮，非取消按钮专属）

/// 次级按钮背景色 - 正常状态（亮色：浅灰色 #F8F8F8，暗黑：深蓝灰 #1A202E）
+ (instancetype)zhh_buttonSecondaryColor;

/// 次级按钮高亮颜色 - 高亮状态（亮色：浅灰色 #EDEDED，暗黑：深蓝灰 #2A3242）
+ (instancetype)zhh_buttonSecondaryHighlightedColor;

/// 次级按钮选中背景色 - 选中状态（亮色：中灰 #DFDFDF，暗黑：深蓝灰 #3B4455）
+ (instancetype)zhh_buttonSecondarySelectedColor;

#pragma mark - 取消按钮颜色

/// 取消按钮正常状态（亮色：极浅灰 #F8F8F8，暗黑：蓝黑 #1A202E）
+ (instancetype)zhh_buttonCancelColor;

/// 取消按钮高亮状态（亮色：浅灰 #EDEDED，暗黑：中蓝灰 #2A3242）
+ (instancetype)zhh_buttonCancelHighlightedColor;

#pragma mark - 危险操作按钮颜色

/// 危险操作按钮正常状态（鲜红 #FF0049）
+ (instancetype)zhh_buttonDangerColor;

/// 危险操作按钮高亮状态（深红 #CC0036）
+ (instancetype)zhh_buttonDangerHighlightedColor;

/// 危险操作按钮禁用状态（浅红 #FFD6E0）
+ (instancetype)zhh_buttonDangerDisabledColor;

@end

/**
    苹方-简 中黑体    PingFangSC-Medium
    苹方-简 中粗体    PingFangSC-Semibold
    苹方-简 细体      PingFangSC-Light
    苹方-简 极细体    PingFangSC-Ultralight
    苹方-简 常规体    PingFangSC-Regular
    苹方-简 纤细体    PingFangSC-Thin
*/
@interface UIFont (ZHHFonts)
+ (instancetype)zhh_fontSizeRegular:(CGFloat)fontSize;
+ (instancetype)zhh_fontSizeMedium:(CGFloat)fontSize;
+ (instancetype)zhh_fontSizeBold:(CGFloat)fontSize;
+ (instancetype)zhh_fontSizeArialBoldMT:(CGFloat)fontSize;
+ (instancetype)zhh_fontSizeArialBoldItalicMT:(CGFloat)fontSize;

+ (instancetype)zhh_regular10;
+ (instancetype)zhh_regular11;
+ (instancetype)zhh_regular12;
+ (instancetype)zhh_regular13;
+ (instancetype)zhh_regular14;
+ (instancetype)zhh_regular15;
+ (instancetype)zhh_regular16;
+ (instancetype)zhh_regular17;
+ (instancetype)zhh_regular18;

+ (instancetype)zhh_medium11;
+ (instancetype)zhh_medium12;
+ (instancetype)zhh_medium13;
+ (instancetype)zhh_medium14;
+ (instancetype)zhh_medium15;
+ (instancetype)zhh_medium16;
+ (instancetype)zhh_medium17;
+ (instancetype)zhh_medium18;

+ (instancetype)zhh_boldMT12;
+ (instancetype)zhh_boldMT13;
+ (instancetype)zhh_boldMT14;
+ (instancetype)zhh_boldMT15;
+ (instancetype)zhh_boldMT16;
+ (instancetype)zhh_boldMT17;
+ (instancetype)zhh_boldMT18;
+ (instancetype)zhh_boldMT19;
+ (instancetype)zhh_boldMT20;
+ (instancetype)zhh_boldMT21;
+ (instancetype)zhh_boldMT22;
+ (instancetype)zhh_boldMT24;
+ (instancetype)zhh_boldMT26;
+ (instancetype)zhh_boldMT40;
@end

@interface UIColor (Colors)

@end
NS_ASSUME_NONNULL_END
