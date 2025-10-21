//
//  ZHHCustomAvatarTableViewCell.m
//  ZHHStaticTableView
//
//  Created by 桃色三岁 on 2025/3/27.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHCustomAvatarTableViewCell.h"

@interface ZHHCustomAvatarTableViewCell ()
@property (nonatomic, assign) BOOL didSetupSubviews;
@property (nonatomic, assign) BOOL didSetupConstraints;
@end

@implementation ZHHCustomAvatarTableViewCell

- (void)configureCustomTableViewCellWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    self.viewModel = viewModel;
    
    // 子视图：仅第一次添加
    if (!self.didSetupSubviews) {
        self.didSetupSubviews = YES;
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.userNameLabel];
        [self.contentView addSubview:self.userIdLabel];
        [self.contentView addSubview:self.avatarIndicatorImageView];
        [self.contentView addSubview:self.codeImageView];
    }

    // 关闭 autoresizing，启用 Auto Layout
    self.avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.userNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.userIdLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.avatarIndicatorImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.codeImageView.translatesAutoresizingMaskIntoConstraints = NO;

    // 设置 Auto Layout 约束（每个实例只安装一次）
    if (!self.didSetupConstraints) {
        self.didSetupConstraints = YES;
        [NSLayoutConstraint activateConstraints:@[
        // 头像约束
        [self.avatarImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:16],
        [self.avatarImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.avatarImageView.widthAnchor constraintEqualToConstant:self.viewModel.cellHeight - 16],
        [self.avatarImageView.heightAnchor constraintEqualToConstant:self.viewModel.cellHeight - 16],

        // 用户名约束
        [self.userNameLabel.leadingAnchor constraintEqualToAnchor:self.avatarImageView.trailingAnchor constant:15],
        [self.userNameLabel.topAnchor constraintEqualToAnchor:self.avatarImageView.topAnchor constant:10],

        // 用户 ID 约束
        [self.userIdLabel.leadingAnchor constraintEqualToAnchor:self.userNameLabel.leadingAnchor],
        [self.userIdLabel.bottomAnchor constraintEqualToAnchor:self.avatarImageView.bottomAnchor constant:-10],

        // 右侧箭头
        [self.avatarIndicatorImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.avatarIndicatorImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-16],

        // 二维码图标
        [self.codeImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.codeImageView.trailingAnchor constraintEqualToAnchor:self.avatarIndicatorImageView.leadingAnchor constant:-10]
        ]];
    }
}

#pragma mark - Custom Cell
#pragma mark MeController Avatar Cell

/// 头像视图，显示用户头像
- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithImage:self.viewModel.avatarImage];
        _avatarImageView.layer.cornerRadius = 6.f;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

/// 用户名标签，显示用户昵称
- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.text = self.viewModel.userName;
        _userNameLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
        _userNameLabel.textColor = [UIColor labelColor]; // 适配深色模式
    }
    return _userNameLabel;
}

/// 用户 ID 标签，显示用户唯一标识
- (UILabel *)userIdLabel {
    if (!_userIdLabel) {
        _userIdLabel = [[UILabel alloc] init];
        _userIdLabel.text = self.viewModel.userID;
        _userIdLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        _userIdLabel.textColor = [UIColor secondaryLabelColor]; // 适配深色模式
    }
    return _userIdLabel;
}

/// 右侧箭头，指示可进入详情
- (UIImageView *)avatarIndicatorImageView {
    if (!_avatarIndicatorImageView) {
        _avatarIndicatorImageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"chevron.right"]];
    }
    return _avatarIndicatorImageView;
}

/// 二维码图标，用于展示二维码
- (UIImageView *)codeImageView {
    if (!_codeImageView) {
        _codeImageView = [[UIImageView alloc] initWithImage:self.viewModel.codeImage];
    }
    return _codeImageView;
}

@end
