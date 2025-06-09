//
//  ZHHStaticTableViewCell.h
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHHStaticTableviewCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHHStaticTableViewCell : UITableViewCell

@property (nonatomic, strong) ZHHStaticTableviewCellViewModel *viewModel;

// =============== 系统风格cell的所有控件 =============== //

// 左半部分
@property (nonatomic, strong) UIStackView *leftStackView;       ///< 左侧的 stackView
@property (nonatomic, strong) UIImageView *leftImageView;       ///< 左侧的 ImageView
@property (nonatomic, strong) UILabel *leftTitleLabel;          ///< 左侧的 Label

// 右半部分
@property (nonatomic, strong) UIStackView *rightStackView;      ///< 右侧的 stackView
@property (nonatomic, strong) UILabel *rightTitleLabel;         ///< 右侧主要文字（标题）
@property (nonatomic, strong) UIImageView *rightIconImageView;  ///< 右侧图标
@property (nonatomic, strong) UILabel *rightDetailLabel;        ///< 右侧副标题（详细描述）
@property (nonatomic, strong) UISwitch *rightOptionSwitch;      ///< 右侧选项开关
@property (nonatomic, strong) UIImageView *rightArrowImageView; ///< 右侧箭头（指示器）

/// 统一的，布局cell左侧部分的内容（标题 ／ 图片 + 标题），所有系统风格的cell都要调用这个方法
- (void)configureDefaultTableViewCellWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel;
/// 自定义cell的时候调用此方法
- (void)configureCustomTableViewCellWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel;
@end

NS_ASSUME_NONNULL_END
