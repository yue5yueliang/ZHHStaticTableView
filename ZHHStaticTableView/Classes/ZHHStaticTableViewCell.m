//
//  ZHHStaticTableViewCell.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import "ZHHStaticTableViewCell.h"

// 自定义UIImageView，重写intrinsicContentSize来忽略SF Symbol的固有尺寸
@interface ZHHFixedSizeImageView : UIImageView
@end

@implementation ZHHFixedSizeImageView

- (CGSize)intrinsicContentSize {
    // 返回CGSizeZero，让约束完全控制尺寸
    return CGSizeZero;
}

@end

@implementation ZHHStaticTableViewCell

#pragma mark - 图片处理

/// 调整图片尺寸
- (UIImage *)resizeImage:(UIImage *)image toSize:(CGSize)targetSize {
    if (!image || CGSizeEqualToSize(targetSize, CGSizeZero)) {
        return image;
    }
    
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resizedImage;
}

#pragma mark - 配置 Cell

/// 自定义cell的时候调用此方法
- (void)configureCustomTableViewCellWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    
}

/// 配置默认的 TableViewCell，基于 ViewModel 设置 UI
- (void)configureDefaultTableViewCellWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    // 设置ViewModel引用
    self.viewModel = viewModel;
    
    // 只在第一次配置时添加子视图和约束
    if (!self.leftStackView.superview) {
        [self setupSubviews];
        [self setupConstraints];
    }
    
    // 每次都要更新UI内容，确保Cell复用后正确显示
    // 这是修复Cell复用问题的关键：移除过早的优化，确保每次配置都会更新UI
    [self updateUIWithViewModel:viewModel];
}

/// 设置子视图结构（只执行一次）
- (void)setupSubviews {
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
}

/// 更新UI内容（每次复用都执行）
- (void)updateUIWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    // 更新约束
    [self updateConstraintsWithViewModel:viewModel];
    
    // 配置右侧标题
    BOOL hasRightTitle = viewModel.rightTitleText && viewModel.rightTitleText.length > 0;
    self.rightTitleLabel.hidden = !hasRightTitle;
    if (hasRightTitle) {
        self.rightTitleLabel.text = viewModel.rightTitleText;
        self.rightTitleLabel.font = viewModel.rightTitleTextFont;
        self.rightTitleLabel.textColor = viewModel.rightTitleTextColor;
    } else {
        self.rightTitleLabel.text = nil;
    }
    
    // 配置右侧图标
    self.rightIconImageView.hidden = !viewModel.rightIconImage;
    self.rightIconImageView.image = viewModel.rightIconImage;
    
    // 配置右侧详细信息
    BOOL hasRightDetail = viewModel.rightDetailText && viewModel.rightDetailText.length > 0;
    self.rightDetailLabel.hidden = !hasRightDetail;
    if (hasRightDetail) {
        self.rightDetailLabel.text = viewModel.rightDetailText;
        self.rightDetailLabel.font = viewModel.rightDetailTextFont;
        self.rightDetailLabel.textColor = viewModel.rightDetailTextColor;
    } else {
        self.rightDetailLabel.text = nil;
    }
    
    // 配置右侧箭头
    if (viewModel.rightArrowImage) {
        // 调整图片尺寸以匹配约束
        CGSize targetSize = viewModel.rightArrowImageSize;
        UIImage *resizedImage = [self resizeImage:viewModel.rightArrowImage toSize:targetSize];
        self.rightArrowImageView.image = resizedImage;
    } else {
        self.rightArrowImageView.image = nil;
    }

    // 配置左侧图标
    self.leftImageView.hidden = (viewModel.leftIconImage == nil);
    if (viewModel.leftIconImage) {
        self.leftImageView.image = viewModel.leftIconImage;
    } else {
        self.leftImageView.image = nil;
    }

    // 配置左侧标题
    BOOL hasLeftTitle = viewModel.leftTitleText && viewModel.leftTitleText.length > 0;
    self.leftTitleLabel.hidden = !hasLeftTitle;
    if (hasLeftTitle) {
        self.leftTitleLabel.text = viewModel.leftTitleText;
        self.leftTitleLabel.font = viewModel.leftTitleTextFont;
        self.leftTitleLabel.textColor = viewModel.leftTitleTextColor;
    } else {
        self.leftTitleLabel.text = nil;
    }

    // 配置开关
    self.rightOptionSwitch.hidden = !viewModel.showRightOptionSwitch;
}

/// Cell复用时的重置方法
- (void)prepareForReuse {
    [super prepareForReuse];
    
    // 重置UI状态，但保留视图结构
    self.leftTitleLabel.text = nil;
    self.rightTitleLabel.text = nil;
    self.rightDetailLabel.text = nil;
    self.leftImageView.image = nil;
    self.rightIconImageView.image = nil;
    self.rightArrowImageView.image = nil;
    self.rightOptionSwitch.hidden = YES;
    
    // 重置隐藏状态 - 确保所有UI元素都被重置
    self.leftTitleLabel.hidden = YES;
    self.rightTitleLabel.hidden = YES;
    self.rightDetailLabel.hidden = YES;
    self.leftImageView.hidden = YES;
    self.rightIconImageView.hidden = YES;
    self.rightArrowImageView.hidden = YES;
}

#pragma mark - 添加约束

/// 使用 Auto Layout 添加约束（只执行一次）
- (void)setupConstraints {
    // 避免重复添加约束
    if (self.contentView.constraints.count > 0) {
        return;
    }
    
    // 左侧 StackView 约束
    [NSLayoutConstraint activateConstraints:@[
        [self.leftStackView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15], // 使用默认值
        [self.leftStackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.leftStackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor]
    ]];

    // 右侧 StackView 约束
    [NSLayoutConstraint activateConstraints:@[
        [self.rightStackView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-15], // 使用默认值
        [self.rightStackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.rightStackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor]
    ]];

    // 设置默认的图标尺寸约束
    [self setupImageConstraints];
}

/// 设置图片尺寸约束
- (void)setupImageConstraints {
    // 右侧图标约束
    [NSLayoutConstraint activateConstraints:@[
        [self.rightIconImageView.widthAnchor constraintEqualToConstant:20],
        [self.rightIconImageView.heightAnchor constraintEqualToConstant:20]
    ]];

    // 右侧箭头约束
    NSLayoutConstraint *arrowWidthConstraint = [self.rightArrowImageView.widthAnchor constraintEqualToConstant:12];
                                                                        NSLayoutConstraint *arrowHeightConstraint = [self.rightArrowImageView.heightAnchor constraintEqualToConstant:16];
    arrowWidthConstraint.identifier = @"arrowWidth";
    arrowHeightConstraint.identifier = @"arrowHeight";
    [NSLayoutConstraint activateConstraints:@[arrowWidthConstraint, arrowHeightConstraint]];

    // 左侧图标约束
    [NSLayoutConstraint activateConstraints:@[
        [self.leftImageView.widthAnchor constraintEqualToConstant:20],
        [self.leftImageView.heightAnchor constraintEqualToConstant:20]
    ]];
}

/// 更新约束常量（当ViewModel变化时调用）
- (void)updateConstraintsWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    // 更新左侧边距
    for (NSLayoutConstraint *constraint in self.contentView.constraints) {
        if (constraint.firstItem == self.leftStackView && constraint.firstAttribute == NSLayoutAttributeLeading) {
            constraint.constant = viewModel.leftContentMargin;
        }
        if (constraint.firstItem == self.rightStackView && constraint.firstAttribute == NSLayoutAttributeTrailing) {
            constraint.constant = -viewModel.rightContentMargin;
        }
    }
    
    // 更新图片尺寸约束
    [self updateImageSizeConstraints:viewModel];
}

/// 更新图片尺寸约束
- (void)updateImageSizeConstraints:(ZHHStaticTableviewCellViewModel *)viewModel {
    // 更新右侧图标尺寸
    for (NSLayoutConstraint *constraint in self.contentView.constraints) {
        if (constraint.firstItem == self.rightIconImageView && constraint.firstAttribute == NSLayoutAttributeWidth) {
            constraint.constant = viewModel.rightIconImageSize.width;
        } else if (constraint.firstItem == self.rightIconImageView && constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = viewModel.rightIconImageSize.height;
        }
    }
    
    // 更新右侧箭头尺寸
    for (NSLayoutConstraint *constraint in self.contentView.constraints) {
        if ([constraint.identifier isEqualToString:@"arrowWidth"]) {
            constraint.constant = viewModel.rightArrowImageSize.width;
        } else if ([constraint.identifier isEqualToString:@"arrowHeight"]) {
            constraint.constant = viewModel.rightArrowImageSize.height;
        }
    }
    
    // 更新左侧图标尺寸
    for (NSLayoutConstraint *constraint in self.contentView.constraints) {
        if (constraint.firstItem == self.leftImageView && constraint.firstAttribute == NSLayoutAttributeWidth) {
            constraint.constant = viewModel.leftIconImageSize.width;
        } else if (constraint.firstItem == self.leftImageView && constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = viewModel.leftIconImageSize.height;
        }
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
        _rightArrowImageView = [[ZHHFixedSizeImageView alloc] init];
        _rightArrowImageView.contentMode = UIViewContentModeScaleAspectFit;
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
