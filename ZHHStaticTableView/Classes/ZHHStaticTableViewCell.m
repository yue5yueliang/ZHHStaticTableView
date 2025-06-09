//
//  ZHHStaticTableViewCell.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import "ZHHStaticTableViewCell.h"

@implementation ZHHStaticTableViewCell

#pragma mark - 配置 Cell

- (void)configureCustomTableViewCellWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    
}

/// 配置默认的 TableViewCell，基于 ViewModel 设置 UI
- (void)configureDefaultTableViewCellWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    self.viewModel = viewModel;
    
    // 添加左侧布局容器及子视图
    [self.contentView addSubview:self.leftStackView];
    [self.leftStackView addArrangedSubview:self.leftImageView];
    [self.leftStackView addArrangedSubview:self.leftTitleLabel];
    
    // 添加右侧布局容器及子视图
    [self.contentView addSubview:self.rightStackView];
    NSArray *orderedSubviews = @[self.rightTitleLabel, self.rightIconImageView, self.rightDetailLabel, self.rightOptionSwitch, self.rightArrowImageView];
    for (UIView *subview in orderedSubviews) {
        [self.rightStackView addArrangedSubview:subview];
    }

    // 配置右侧标题
    self.rightTitleLabel.hidden = !viewModel.rightTitleText;
    self.rightTitleLabel.text = viewModel.rightTitleText;
    self.rightTitleLabel.font = viewModel.rightTitleTextFont;
    self.rightTitleLabel.textColor = viewModel.rightTitleTextColor;
    
    // 配置右侧图标
    self.rightIconImageView.hidden = !viewModel.rightIconImage;
    self.rightIconImageView.image = viewModel.rightIconImage;
    
    // 配置右侧详细信息
    self.rightDetailLabel.hidden = !viewModel.rightDetailText;
    self.rightDetailLabel.text = viewModel.rightDetailText;
    self.rightDetailLabel.font = viewModel.rightDetailTextFont;
    self.rightDetailLabel.textColor = viewModel.rightDetailTextColor;
    
    // 配置右侧箭头
    self.rightArrowImageView.image = viewModel.rightArrowImage;

    // 配置左侧图标
    self.leftImageView.hidden = (viewModel.leftIconImage == nil);
    if (viewModel.leftIconImage) {
        self.leftImageView.image = viewModel.leftIconImage;
    }

    // 配置左侧标题
    self.leftTitleLabel.hidden = (viewModel.leftTitleText == nil);
    if (viewModel.leftTitleText) {
        self.leftTitleLabel.text = viewModel.leftTitleText;
        self.leftTitleLabel.font = viewModel.leftTitleTextFont;
        self.leftTitleLabel.textColor = viewModel.leftTitleTextColor;
    }

    // 处理小红点逻辑
//    [self.leftTitleLabel zhh_addDotWithColor:UIColor.zhh_badgeColor];
//    [self.leftTitleLabel zhh_moveBadgeWithX:5 Y:2];
//    viewModel.showBadgeView ? [self.leftTitleLabel zhh_showBadge] : [self.leftTitleLabel zhh_hiddenBadge];

    // 配置开关
    self.rightOptionSwitch.hidden = !viewModel.showRightOptionSwitch;
    
    // 添加约束
    [self setupConstraints];
}

#pragma mark - 添加约束

/// 使用 Auto Layout 添加约束
- (void)setupConstraints {
    // 左侧 StackView 约束
    [NSLayoutConstraint activateConstraints:@[
        [self.leftStackView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:self.viewModel.leftContentMargin],
        [self.leftStackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.leftStackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor]
    ]];

    // 右侧 StackView 约束
    [NSLayoutConstraint activateConstraints:@[
        [self.rightStackView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-self.viewModel.rightContentMargin],
        [self.rightStackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.rightStackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor]
    ]];

    // 右侧图标约束
    if (self.rightIconImageView.image) {
        [NSLayoutConstraint activateConstraints:@[
            [self.rightIconImageView.widthAnchor constraintEqualToConstant:self.viewModel.rightIconImageSize.width],
            [self.rightIconImageView.heightAnchor constraintEqualToConstant:self.viewModel.rightIconImageSize.height]
        ]];
    }

    // 右侧箭头约束
    if (!CGSizeEqualToSize(self.viewModel.rightArrowImageSize, CGSizeZero)) {
        [NSLayoutConstraint activateConstraints:@[
            [self.rightArrowImageView.widthAnchor constraintEqualToConstant:self.viewModel.rightArrowImageSize.width],
            [self.rightArrowImageView.heightAnchor constraintEqualToConstant:self.viewModel.rightArrowImageSize.height]
        ]];
    }

    // 左侧图标约束
    if (self.leftImageView.image) {
        [NSLayoutConstraint activateConstraints:@[
            [self.leftImageView.widthAnchor constraintEqualToConstant:self.viewModel.leftIconImageSize.width],
            [self.leftImageView.heightAnchor constraintEqualToConstant:self.viewModel.leftIconImageSize.height]
        ]];
    }
}

#pragma mark - UISwitch 事件处理

/// 处理 UISwitch 开关状态变化
- (void)switchTouched:(UISwitch *)indicatorSwitch {
    if (self.viewModel.switchValueDidChangeBlock) {
        self.viewModel.switchValueDidChangeBlock(indicatorSwitch.isOn);
    }
}

#pragma mark - 懒加载视图

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
        _leftImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _leftImageView;
}

- (UILabel *)leftTitleLabel {
    if (!_leftTitleLabel) {
        _leftTitleLabel = [[UILabel alloc] init];
        _leftTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _leftTitleLabel;
}

- (UISwitch *)rightOptionSwitch {
    if (!_rightOptionSwitch) {
        _rightOptionSwitch = [[UISwitch alloc] init];
        _rightOptionSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _rightOptionSwitch;
}

- (UIImageView *)rightArrowImageView {
    if (!_rightArrowImageView) {
        _rightArrowImageView = [[UIImageView alloc] init];
        _rightArrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _rightArrowImageView;
}

- (UILabel *)rightTitleLabel {
    if (!_rightTitleLabel) {
        _rightTitleLabel = [[UILabel alloc] init];
        _rightTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _rightTitleLabel;
}

- (UILabel *)rightDetailLabel {
    if (!_rightDetailLabel) {
        _rightDetailLabel = [[UILabel alloc] init];
        _rightDetailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _rightDetailLabel;
}

- (UIImageView *)rightIconImageView {
    if (!_rightIconImageView) {
        _rightIconImageView = [[UIImageView alloc] init];
        _rightIconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _rightIconImageView;
}

#pragma mark - StackView 懒加载

- (UIStackView *)leftStackView {
    if (!_leftStackView) {
        _leftStackView = [[UIStackView alloc] init];
        _leftStackView.axis = UILayoutConstraintAxisHorizontal;
        _leftStackView.alignment = UIStackViewAlignmentCenter;
        _leftStackView.spacing = 10;
        _leftStackView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _leftStackView;
}

- (UIStackView *)rightStackView {
    if (!_rightStackView) {
        _rightStackView = [[UIStackView alloc] init];
        _rightStackView.axis = UILayoutConstraintAxisHorizontal;
        _rightStackView.alignment = UIStackViewAlignmentCenter;
        _rightStackView.spacing = 5;
        _rightStackView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _rightStackView;
}
@end
