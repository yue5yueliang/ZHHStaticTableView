//
//  ZHHExampleCustomTableViewCell.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2025/6/8.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHExampleCustomTableViewCell.h"

@interface ZHHExampleCustomTableViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;
@end

@implementation ZHHExampleCustomTableViewCell

- (void)configureCustomTableViewCellWithViewModel:(ZHHStaticTableviewCellViewModel*)viewModel {
    self.viewModel = viewModel;

    // 添加子视图
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subtitleLabel];
    [self.contentView addSubview:self.arrowImageView];
    
    // 关闭 autoresizing，启用 Auto Layout
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.arrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 设置 Auto Layout 约束
    [NSLayoutConstraint activateConstraints:@[
        // titleLabel: 顶部 + 左对齐
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:12],
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:16],
        [self.titleLabel.trailingAnchor constraintLessThanOrEqualToAnchor:self.trailingAnchor constant:-60],

        // subtitleLabel: titleLabel 下方 + 左对齐
        [self.subtitleLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:4],
        [self.subtitleLabel.leadingAnchor constraintEqualToAnchor:self.titleLabel.leadingAnchor],
        [self.subtitleLabel.trailingAnchor constraintLessThanOrEqualToAnchor:self.arrowImageView.leadingAnchor constant:-8],
        [self.subtitleLabel.bottomAnchor constraintLessThanOrEqualToAnchor:self.bottomAnchor constant:-12],

        // arrowImageView: 靠右 + 垂直居中于 subtitleLabel
        [self.arrowImageView.centerYAnchor constraintEqualToAnchor:self.titleLabel.centerYAnchor],
        [self.arrowImageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-16],
        [self.arrowImageView.widthAnchor constraintEqualToConstant:16],
        [self.arrowImageView.heightAnchor constraintEqualToConstant:16],
    ]];
}

#pragma mark - Lazy Load

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
        _titleLabel.textColor = [UIColor labelColor];
        _titleLabel.numberOfLines = 1;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = @"申请官方认证";
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.font = [UIFont systemFontOfSize:14];
        _subtitleLabel.textColor = [UIColor tertiaryLabelColor];
        _subtitleLabel.numberOfLines = 1;
        _subtitleLabel.textAlignment = NSTextAlignmentLeft;
        _subtitleLabel.text = @"个人、企业机构的账号认证";
    }
    return _subtitleLabel;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_setting_arrow_black"]];
        _arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
        _arrowImageView.clipsToBounds = YES;
    }
    return _arrowImageView;
}

@end
