//
//  ZHHAppearance.m
//  ZHHAnneKitExample
//
//  Created by 桃色三岁 on 2020/5/16.
//  Copyright © 2021 桃色三岁. All rights reserved.
//

#import "ZHHAppearance.h"

@implementation UIColor (ZHHColors)

#pragma mark - 通用动态色创建方法

+ (instancetype)zhh_dynamicColorWithLight:(uint32_t)lightHex dark:(uint32_t)darkHex alpha:(CGFloat)alpha {
    UIColor *lightColor = [UIColor zhh_colorWithHex:lightHex alpha:alpha];
    UIColor *darkColor = [UIColor zhh_colorWithHex:darkHex alpha:alpha];
    return [UIColor colorWithLightColor:lightColor darkColor:darkColor];
}

#pragma mark - 页面背景色

/// 页面背景色（亮色：纯白 #FFFFFF，暗黑：深蓝黑 #121826）
+ (instancetype)zhh_backgroundColor {
    return [self zhh_dynamicColorWithLight:0xF8F8F8 dark:0x121826 alpha:1.0];
}

/// ImageView 背景色（亮色：浅灰 #F2F2F2，暗黑：蓝灰 #3B4455）
+ (instancetype)zhh_imageViewBackgourndColor {
    return [self zhh_dynamicColorWithLight:0xF2F2F2 dark:0x3B4455 alpha:1.0];
}

#pragma mark - 分层容器背景色

/// 顶层背景色（亮色：极浅灰 #F8F8F8，暗黑：蓝黑 #1A202E）
/// 用于浮层、弹窗、顶层卡片等视觉最浅区域
+ (instancetype)zhh_backgroundPrimaryColor {
    return [self zhh_dynamicColorWithLight:0xF8F8F8 dark:0x1A202E alpha:1.0];
}

/// 次级背景色（亮色：浅灰 #EDEDED，暗黑：中蓝灰 #2A3242）
/// 用于普通卡片、容器等中层背景
+ (instancetype)zhh_backgroundSecondaryColor {
    return [self zhh_dynamicColorWithLight:0xEDEDED dark:0x2A3242 alpha:1.0];
}

/// 底层背景色（亮色：中灰 #DFDFDF，暗黑：深蓝灰 #3B4455）
/// 用于分割底板、较次要区域背景
+ (instancetype)zhh_backgroundTertiaryColor {
    return [self zhh_dynamicColorWithLight:0xDFDFDF dark:0x3B4455 alpha:1.0];
}

#pragma mark - 导航栏颜色

/// 导航栏背景色（亮色：纯白 #FFFFFF，暗黑：深蓝黑 #121826）
+ (instancetype)zhh_navigationBarColor {
    return [self zhh_dynamicColorWithLight:0xFFFFFF dark:0x121826 alpha:1.0];
}

#pragma mark - TabBar 颜色

/// TabBar 背景色（亮色：纯白 #FFFFFF，暗黑：深蓝黑 #121826）
+ (instancetype)zhh_tabBarBackgourndColor {
    return [self zhh_dynamicColorWithLight:0xFFFFFF dark:0x121826 alpha:1.0];
}

/// TabBar 文字常态颜色（亮色：灰 #999999，暗黑：浅灰 #888888）
+ (instancetype)zhh_tabBarTextColor {
    return [self zhh_dynamicColorWithLight:0x999999 dark:0x888888 alpha:1.0];
}

/// TabBar 文字选中颜色（亮色：灰 #333333，暗黑：浅灰 #ffffff）
+ (instancetype)zhh_tabBarSelectedTextColor {
    return [self zhh_dynamicColorWithLight:0x333333 dark:0xffffff alpha:1.0];
}

#pragma mark - 分隔线 & 标识色

/// 分隔线颜色（亮色：lightGray α=0.3，暗黑：darkGray α=0.3）
+ (instancetype)zhh_separatorColor {
    UIColor *lightColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    UIColor *darkColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.3];
    return [UIColor colorWithLightColor:lightColor darkColor:darkColor];
}

/// 徽标颜色（亮/暗色一致：鲜红 #FF0049）
+ (instancetype)zhh_badgeColor {
    return [self zhh_dynamicColorWithLight:0xFF0049 dark:0xFF0049 alpha:1.0];
}

/// 主题主色调（亮/暗色一致：品牌红 #F12F54）
+ (instancetype)zhh_themeColor {
    return [self zhh_dynamicColorWithLight:0xF12F54 dark:0xF12F54 alpha:1.0];
}

/// 指示器颜色（亮/暗色一致：品牌红 #F12F54）
+ (instancetype)zhh_indicatorColor {
    return [self zhh_dynamicColorWithLight:0xF12F54 dark:0xF12F54 alpha:1.0];
}

#pragma mark - 文字颜色

/// 标题文字颜色（亮色：深灰 #333333，暗黑：纯白 #FFFFFF）
+ (instancetype)zhh_titleColor {
    return [self zhh_dynamicColorWithLight:0x333333 dark:0xFFFFFF alpha:1.0];
}

/// 副标题文字颜色（亮色：中灰 #666666，暗黑：浅灰 #CCCCCC）
+ (instancetype)zhh_subtitleColor {
    return [self zhh_dynamicColorWithLight:0x666666 dark:0xCCCCCC alpha:1.0];
}

/// 正文字颜色（亮色：浅灰 #999999，暗黑：中灰 #888888）
+ (instancetype)zhh_contentColor {
    return [self zhh_dynamicColorWithLight:0x999999 dark:0x888888 alpha:1.0];
}

/// 占位符文字颜色（亮色：浅灰 #999999，暗黑：中灰 #888888）
+ (instancetype)zhh_placeholderColor {
    return [self zhh_dynamicColorWithLight:0x999999 dark:0x888888 alpha:1.0];
}

#pragma mark - 表格类颜色

/// section 背景色（亮色：纯白 #FFFFFF，暗黑：深蓝黑 #121826）
+ (instancetype)zhh_tableViewInSectionColor {
    return [self zhh_dynamicColorWithLight:0xFFFFFF dark:0x121826 alpha:1.0];
}

/// cell 高亮背景色（亮色：浅灰 #F8F8F8，暗黑：中蓝灰 #1A202E）
+ (instancetype)zhh_tableViewCellHighlightedColor {
    return [self zhh_dynamicColorWithLight:0xF8F8F8 dark:0x1A202E alpha:1.0];
}

#pragma mark - 链接颜色

/// 超链接颜色（亮色：蓝 #4979F5，暗黑：亮蓝 #5C8DFF）
+ (instancetype)zhh_linkColor {
    return [self zhh_dynamicColorWithLight:0x4979F5 dark:0x5C8DFF alpha:1.0];
}

/// 超链接点击高亮颜色（统一色值 #5A7CC2，rgba(90, 124, 194, 1)）
+ (instancetype)zhh_linkHighlightColor {
    return [UIColor zhh_colorWithHex:0x5A7CC2];
}

#pragma mark - 普通按钮,主按钮颜色（用于主要操作，视觉上最突出）

/// 普通按钮正常状态（亮金黄 #FFC300）
+ (instancetype)zhh_buttonNormalColor {
    return [UIColor zhh_colorWithHex:0xFFC300];
}

/// 普通按钮禁用状态（柔金黄 #FFE8A3）
+ (instancetype)zhh_buttonDisabledColor {
    return [UIColor zhh_colorWithHex:0xFFE8A3];
}

/// 普通按钮高亮状态（暗金黄 #DFAF00）
+ (instancetype)zhh_buttonHighlightedColor {
    return [UIColor zhh_colorWithHex:0xDFAF00];
}

#pragma mark - 次级按钮颜色（语义上为次要操作按钮，非取消按钮专属）

/// 次级按钮背景色 - 正常状态（亮色：浅灰色 #F8F8F8，暗黑：深蓝灰 #1A202E）
+ (instancetype)zhh_buttonSecondaryColor {
    return [self zhh_dynamicColorWithLight:0xF8F8F8 dark:0x1A202E alpha:1.0];
}

/// 次级按钮高亮颜色 - 高亮状态（亮色：浅灰色 #EDEDED，暗黑：深蓝灰 #2A3242）
+ (instancetype)zhh_buttonSecondaryHighlightedColor {
    return [self zhh_dynamicColorWithLight:0xEDEDED dark:0x2A3242 alpha:1.0];
}

/// 次级按钮选中背景色 - 选中状态（亮色：中灰 #DFDFDF，暗黑：深蓝灰 #3B4455）
+ (instancetype)zhh_buttonSecondarySelectedColor {
    return [self zhh_dynamicColorWithLight:0xDFDFDF dark:0x3B4455 alpha:1.0];
}

#pragma mark - 取消按钮颜色

/// 取消按钮正常状态（亮色：极浅灰 #F8F8F8，暗黑：蓝黑 #1A202E）
+ (instancetype)zhh_buttonCancelColor {
    return [self zhh_dynamicColorWithLight:0xF8F8F8 dark:0x1A202E alpha:1.0];
}

/// 取消按钮高亮状态（亮色：浅灰 #EDEDED，暗黑：中蓝灰 #2A3242）
+ (instancetype)zhh_buttonCancelHighlightedColor {
    return [self zhh_dynamicColorWithLight:0xEDEDED dark:0x2A3242 alpha:1.0];
}

#pragma mark - 危险操作按钮颜色

/// 危险操作按钮正常状态（鲜红 #FF0049）
+ (instancetype)zhh_buttonDangerColor {
    return [UIColor zhh_colorWithHex:0xFF0049];
}

/// 危险操作按钮高亮状态（深红 #CC0036）
+ (instancetype)zhh_buttonDangerHighlightedColor {
    return [UIColor zhh_colorWithHex:0xCC0036];
}

/// 危险操作按钮禁用状态（浅红 #FFD6E0）
+ (instancetype)zhh_buttonDangerDisabledColor {
    return [UIColor zhh_colorWithHex:0xFFD6E0];
}

@end

@implementation UIFont (ZHHFonts)
+ (instancetype)zhh_fontSizeRegular:(CGFloat)fontSize {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
}

+ (instancetype)zhh_fontSizeMedium:(CGFloat)fontSize {
    return [UIFont fontWithName:@"PingFangSC-Medium"  size:fontSize];
}

+ (instancetype)zhh_fontSizeBold:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Arial-BoldMT"  size:fontSize];
}

+ (instancetype)zhh_fontSizeArialBoldMT:(CGFloat)fontSize {
    return [UIFont fontWithName:@"Arial-BoldMT"       size:fontSize];
}

+ (instancetype)zhh_fontSizeArialBoldItalicMT:(CGFloat)fontSize{
    return [UIFont fontWithName:@"Arial-BoldItalicMT" size:fontSize];
}

+ (instancetype)zhh_regular10 {
    return [self zhh_fontSizeRegular:10];
}

+ (instancetype)zhh_regular11 {
    return [self zhh_fontSizeRegular:11];
}

+ (instancetype)zhh_regular12 {
    return [self zhh_fontSizeRegular:12];
}

+ (instancetype)zhh_regular13 {
    return [self zhh_fontSizeRegular:13];
}

+ (instancetype)zhh_regular14 {
    return [self zhh_fontSizeRegular:14];
}

+ (instancetype)zhh_regular15 {
    return [self zhh_fontSizeRegular:15];
}

+ (instancetype)zhh_regular16 {
    return [self zhh_fontSizeRegular:16];
}

+ (instancetype)zhh_regular17 {
    return [self zhh_fontSizeRegular:17];
}

+ (instancetype)zhh_regular18 {
    return [self zhh_fontSizeRegular:18];
}



+ (instancetype)zhh_medium11 {
    return [self zhh_fontSizeMedium:11];
}

+ (instancetype)zhh_medium12 {
    return [self zhh_fontSizeMedium:12];
}

+ (instancetype)zhh_medium13 {
    return [self zhh_fontSizeMedium:13];
}

+ (instancetype)zhh_medium14 {
    return [self zhh_fontSizeMedium:14];
}

+ (instancetype)zhh_medium15 {
    return [self zhh_fontSizeMedium:15];
}

+ (instancetype)zhh_medium16 {
    return [self zhh_fontSizeMedium:16];
}

+ (instancetype)zhh_medium17 {
    return [self zhh_fontSizeMedium:17];
}

+ (instancetype)zhh_medium18 {
    return [self zhh_fontSizeMedium:18];
}

+ (instancetype)zhh_boldMT12 {
    return [self zhh_fontSizeBold:12];
}

+ (instancetype)zhh_boldMT13 {
    return [self zhh_fontSizeBold:13];
}

+ (instancetype)zhh_boldMT14 {
    return [self zhh_fontSizeBold:14];
}

+ (instancetype)zhh_boldMT15 {
    return [self zhh_fontSizeBold:15];
}

+ (instancetype)zhh_boldMT16 {
    return [self zhh_fontSizeBold:16];
}

+ (instancetype)zhh_boldMT17 {
    return [self zhh_fontSizeBold:17];
}

+ (instancetype)zhh_boldMT18 {
    return [self zhh_fontSizeBold:18];
}

+ (instancetype)zhh_boldMT19 {
    return [self zhh_fontSizeBold:19];
}

+ (instancetype)zhh_boldMT20 {
    return [self zhh_fontSizeBold:20];
}

+ (instancetype)zhh_boldMT21 {
    return [self zhh_fontSizeBold:21];
}

+ (instancetype)zhh_boldMT22 {
    return [self zhh_fontSizeBold:22];
}

+ (instancetype)zhh_boldMT24 {
    return [self zhh_fontSizeBold:24];
}

+ (instancetype)zhh_boldMT26 {
    return [self zhh_fontSizeBold:26];
}

+ (instancetype)zhh_boldMT40 {
    return [self zhh_fontSizeBold:40];
}
@end


@implementation UIColor (Colors)

/**
 花白 (255, 250, 240) #FFFAF0
 棕色 (128, 42, 42)   #802A2A
 
 黑色 0 0 0 #000000

 黄色 255 255 0 #FFFF00

 浅灰蓝色 176 224 230 #B0E0E6

 象牙黑 41 36 33 #292421

 香蕉色 227 207 87 #E3CF57

 品蓝 65 105 225 #4169E1

 灰色 192 192 192 #C0C0C0

 镉黄 255 153 18 #FF9912

 石板蓝 106 90 205 #6A5ACD

 冷灰 128 138 135 #808A87

 dougello 235 142 85 #EB8E55

 天蓝 135 206 235 #87CEEB

 石板灰  112 128 105 #708069

 forum gold 255 227 132 #FFE384

 暖灰色 128 128 105 #808069

 金黄色 255 215 0 #FFD700

 青色 0 255 255 #00FFFF

 黄花色 218 165 105 #DAA569

 绿土 56 94 15 #385E0F

 白色 255 255 255 #FFFFFF

 瓜色 227 168 105 #E3A869

 靛青 8 46 84 #082E54
 古董白 250  235 215 #FAEBD7

 橙色 255 97 0 #FF6100

 碧绿色 127 255 212 #7FFFD4

 天蓝色 240 255 255 #F0FFFF

 镉橙 255 97 3 #FF6103

 青绿色 64 224 208 #40E0D0

 白烟 245 245 245 #F5F5F5

 胡萝卜色 237 145 33 #ED9121

 绿色 0 255 0 #00FF00

 白杏仁 255 235 205 #FFFFCD

 桔黄 255 128 0 #FF8000

 黄绿色 127 255 0 #7FFF00

 cornsilk 255 248 220 #FFF8DC

 淡黄色 245 222 179 #F5DEB3

 钴绿色 61 145 64 #3D9140

 蛋壳色 252 230 201 #FCE6C9

 翠绿色 0 201 87 #00C957

 花白 255 250 240 #FFFAF0

 棕色 128 42 42 #802A2A

 森林绿 34 139 34 #228B22

 gainsboro 220 220 220 #DCDCDC

 米色 163 148 128 #A39480
 
 草地绿 124 252 0 #7CFC00

 ghostWhite 248 248 255 #F8F8FF

 锻浓黄土色 138 54 15 #8A360F

 酸橙绿 50 205 50 #32CD32

 蜜露橙 240 255 240 #F0FFF0

 锻棕土色 135 51 36 #873324

 薄荷色 189 252 201 #BDFCC9

 象牙白 250 255 240 #FAFFF0

 巧克力色 210 105 30 #D2691E

 草绿色 107 142 35 #6B8E23

 亚麻色 250 240 230 #FAF0E6

 肉色 255 125 64 #FF7D40

 暗绿色 48 128 20 #308014

 navajoWhite 255 222 173 #FFDEAD

 黄褐色 240 230 140 #F0E68C

 海绿色 46 139 87 #2E8B57

 old lace 253 245 230 #FDF5E6

 玫瑰红 188 143 143 #BC8F8F

 嫩绿色 0 255 127 #00FF7F

 海贝壳色 255 245 238 #FFF5EE

 肖贡土色 199 97 20 #C76114

 雪白 255 250 250 #FFFAFA

 标土棕 115 74 18 #734A12

 紫色 160 32 240 #A020F0

 乌贼墨棕 94 38 18 #5E2612

 紫罗蓝色 138 43 226 #8A2BE2

 红色 255 0 0 #FF0000

 赫色 160  82 45 #A0522D

 jasoa 160 102 211 #A066D3

 砖红 156 102 31 #9C661F

 马棕色 139 69 19 #8B4513

 湖紫色 153 51 250 #9933FA

 镉红 227 23 13 #E3170D

 沙棕色 244 164 96 #F4A460

 淡紫色 218 112 214 #DA70D6

 珊瑚色 255 127 80 #FF7F50

 棕褐色 210 180 140 #D2B48C

 梅红色 221 160 221 #DDA0DD

 耐火砖红 178 34 34 #B22222

 印度红 176 23 31 #B0171F

 蓝色 0 0 255 #0000FF

 栗色 176 48 96 #B03060

 钴色 61 89 171 #3D59AB

 粉红 255 192 203 #FFC0CB

 dodger blue 30 144 255 #1E90FF

 草莓色 135 38 87 #872657

 jackie blue 11 23 70 #0B1746

 橙红色 250 128 114 #FA8072

 锰蓝 3 168 158 #03A89E

 蕃茄红 255 99 71 #FF6347

 深蓝色 25 25 112 #191970

 桔红 255 69 0 #FF4500

 孔雀蓝 51 161 201 #33A1C9

 深红色 255 0 255 #FF00FF

 土耳其玉色 0 199 140 #00C78C
 
 */
@end
