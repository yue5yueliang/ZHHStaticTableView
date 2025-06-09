//
//  ZHHStaticTableViewSectionViewModel.h
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHHStaticTableViewSectionViewModel : NSObject
/// 该 section 的数据源
@property (nonatomic, strong) NSMutableArray *dataSource;

/// 该 section header 的主标题
@property (nonatomic, copy) NSString *sectionHeaderText;
/// 该 section header 主标题的颜色
@property (nonatomic, strong) UIColor *sectionHeaderTextColor;
/// 该 section header 主标题的字体
@property (nonatomic, strong) UIFont *sectionHeaderTextFont;

/// 该 section header 的副标题
@property (nonatomic, copy) NSString *sectionHeaderSubText;
/// 该 section header 副标题的颜色
@property (nonatomic, strong) UIColor *sectionHeaderSubTextColor;
/// 该 section header 副标题的字体
@property (nonatomic, strong) UIFont *sectionHeaderSubTextFont;

/// 该 section header 的图标
@property (nonatomic, strong) UIImage *sectionHeaderIconImage;
/// 该 section header 图标的大小
@property (nonatomic, assign) CGSize sectionHeaderIconImageSize;

/// 该 section footer 的文字
@property (nonatomic, copy) NSString *sectionFooterText;
/// 该 section footer 文字的颜色
@property (nonatomic, strong) UIColor *sectionFooterTextColor;
/// 该 section footer 文字的字体
@property (nonatomic, strong) UIFont *sectionFooterTextFont;

/// header 的高度，默认 `20.f`
@property (nonatomic, assign) CGFloat sectionHeaderHeight;
/// 距离左右两侧的边距，header 和 footer 同等效果，默认为 `0`
@property (nonatomic, assign) CGFloat sectionMargin;
/// footer 的高度，默认 `0`
@property (nonatomic, assign) CGFloat sectionFooterHeight;

/// 初始化方法
- (instancetype)initWithDataSource:(NSArray *)dataSource;
@end

NS_ASSUME_NONNULL_END
