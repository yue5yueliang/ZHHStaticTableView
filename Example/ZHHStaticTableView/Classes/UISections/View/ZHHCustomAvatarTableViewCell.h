//
//  ZHHCustomAvatarTableViewCell.h
//  ZHHStaticTableView
//
//  Created by 桃色三岁 on 2025/3/27.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import <ZHHStaticTableView/ZHHStaticTableView.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHHCustomAvatarTableViewCell : ZHHStaticTableViewCell

// =============== 用户自定义的cell里面的控件 =============== //

//MeViewController里面的头像cell
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIImageView *codeImageView;
@property (nonatomic, strong) UIImageView *avatarIndicatorImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *userIdLabel;

/// 自定义cell
- (void)configureCustomTableViewCellWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel;
@end

NS_ASSUME_NONNULL_END
