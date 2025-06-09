//
//  ZHHStaticTableViewCell+ZHHLogout.h
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import <ZHHStaticTableView/ZHHStaticTableView.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHHCustomLogoutTableViewCell : ZHHStaticTableViewCell

//- (void)configureLogoutTableViewCellWithViewModel:(ZHHStaticTableviewCellViewModel *)viewModel;

@property (nonatomic, strong) UILabel *logoutLabel;             ///< 退出登录的label

@end

NS_ASSUME_NONNULL_END
