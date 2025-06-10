//
//  ZHHStaticUIDataProvider.m
//  ZHHStaticTableView
//
//  Created by 桃色三岁 on 2025/4/8.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHStaticUIDataProvider.h"

@implementation ZHHStaticUIDataProvider

/// 示例数据：用于构建静态表格的预览内容
+ (NSArray<ZHHStaticTableViewSectionViewModel *> *)mainExampleData {
    
    // Section 0 - 左侧有图
    ZHHStaticTableviewCellViewModel *cell0_0 = [[ZHHStaticTableviewCellViewModel alloc] init];
    cell0_0.identifier = 0;
    cell0_0.leftTitleText = @"左侧有图";
    
    // Section 1 - 左侧无图
    ZHHStaticTableviewCellViewModel *cell0_1 = [[ZHHStaticTableviewCellViewModel alloc] init];
    cell0_1.identifier = 1;
    cell0_1.leftTitleText = @"左侧无图";
    
    // Section 2 - 自定义 cell 样式
    ZHHStaticTableviewCellViewModel *cell0_2 = [[ZHHStaticTableviewCellViewModel alloc] init];
    cell0_2.identifier = 2;
    cell0_2.leftTitleText = @"自定义 Cell";
    
    // Section 3 - 数据更新演示
    ZHHStaticTableviewCellViewModel *cell0_3 = [[ZHHStaticTableviewCellViewModel alloc] init];
    cell0_3.identifier = 3;
    cell0_3.leftTitleText = @"数据更新";
    
    ZHHStaticTableViewSectionViewModel *section0 = [[ZHHStaticTableViewSectionViewModel alloc] initWithDataSource:@[cell0_0,cell0_1,cell0_2,cell0_3]];
    return @[section0];
}

/// 左侧图标示例数据（含有箭头/无箭头）
/// @param showLeftIcon 是否显示左侧图标
+ (NSArray<ZHHStaticTableViewSectionViewModel *> *)example0DataWithLeftIcon:(BOOL)showLeftIcon {
    // ===== Section 0：有箭头
    NSMutableArray *section0Data = [NSMutableArray array];
    for (NSInteger i = 0; i < 4; i++) {
        ZHHStaticTableviewCellViewModel *vm = [[ZHHStaticTableviewCellViewModel alloc] init];
        vm.identifier = i;
        vm.leftTitleText = @"朋友圈";
        if (showLeftIcon) {
            vm.leftIconImage = [UIImage imageNamed:@"icon_example_wechat"];
        }
        vm.rightArrowImage = nil;

        if (i == 1) {
            vm.rightDetailText = @"v1.2.7";
        } else if (i == 2) {
            vm.rightIconImage = [UIImage imageNamed:@"icon_setting_qrcode"];
        } else if (i == 3) {
            vm.showRightOptionSwitch = YES;
        }

        [section0Data addObject:vm];
    }

    ZHHStaticTableViewSectionViewModel *section0 =
        [[ZHHStaticTableViewSectionViewModel alloc] initWithDataSource:section0Data];
    section0.sectionHeaderHeight = 40;
    section0.sectionHeaderText = @"有箭头";

    // ===== Section 1：无箭头
    NSMutableArray *section1Data = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        ZHHStaticTableviewCellViewModel *vm = [[ZHHStaticTableviewCellViewModel alloc] init];
        vm.identifier = i + 4;
        vm.leftTitleText = @"朋友圈";
        if (showLeftIcon) {
            vm.leftIconImage = [UIImage imageNamed:@"icon_example_wechat"];
        }

        switch (i) {
            case 1:
                vm.rightDetailText = @"v1.2.7";
                break;
            case 2:
                vm.rightIconImage = [UIImage imageNamed:@"icon_setting_qrcode"];
                break;
            case 3:
                vm.rightTitleText = @"你的精彩瞬间";
                vm.rightIconImage = [UIImage imageNamed:@"icon_setting_qrcode"];
                break;
            case 4:
                vm.rightDetailText = @"你的精彩瞬间";
                vm.rightIconImage = [UIImage imageNamed:@"icon_setting_qrcode"];
                break;
            default:
                break;
        }

        [section1Data addObject:vm];
    }

    ZHHStaticTableViewSectionViewModel *section1 =
        [[ZHHStaticTableViewSectionViewModel alloc] initWithDataSource:section1Data];
    section1.sectionHeaderHeight = 40;
    section1.sectionHeaderText = @"无箭头";

    return @[section0, section1];
}

/// 自定义 Cell 示例数据（如头像信息展示、退出按钮）
/// @return 包含多个 Section 的示例数据
+ (NSArray<ZHHStaticTableViewSectionViewModel *> *)exampleCustomData {
    
    // ===== Section 0：自定义头像信息 Cell（左图 + 姓名 + 抖音号 + 二维码）
    ZHHStaticTableviewCellViewModel *avatarVM = [[ZHHStaticTableviewCellViewModel alloc] init];
    avatarVM.identifier = 0;
    avatarVM.cellType = ZHHStaticCellTypeCustom;
    avatarVM.cellClassName = @"ZHHCustomAvatarTableViewCell";
    avatarVM.cellHeight = 80;
    avatarVM.avatarImage = [UIImage imageNamed:@"icon_example_avatar23"];
    avatarVM.userName = @"桃色三岁";
    avatarVM.userID = @"抖音号：taosesansui";
    avatarVM.codeImage = [UIImage imageNamed:@"icon_setting_qrcode"];
    
    ZHHStaticTableViewSectionViewModel *section0 = [[ZHHStaticTableViewSectionViewModel alloc] initWithDataSource:@[avatarVM]];

    
    // ===== Section 1：自定义 Header 信息展示 Cell（高度更大）
    ZHHStaticTableviewCellViewModel *userHeaderVM = [[ZHHStaticTableviewCellViewModel alloc] init];
    userHeaderVM.identifier = 1;
    userHeaderVM.cellType = ZHHStaticCellTypeCustom;
    userHeaderVM.cellClassName = @"ZHHExampleCustomTableViewCell";
    userHeaderVM.cellHeight = 64;

    ZHHStaticTableViewSectionViewModel *section1 = [[ZHHStaticTableViewSectionViewModel alloc] initWithDataSource:@[userHeaderVM]];

    
    // ===== Section 2：退出登录按钮 Cell
    ZHHStaticTableviewCellViewModel *logoutVM = [[ZHHStaticTableviewCellViewModel alloc] init];
    logoutVM.identifier = 2;
    logoutVM.cellType = ZHHStaticCellTypeCustom;
    logoutVM.cellClassName = @"ZHHCustomLogoutTableViewCell";
    logoutVM.cellHeight = 44;

    ZHHStaticTableViewSectionViewModel *section2 = [[ZHHStaticTableViewSectionViewModel alloc] initWithDataSource:@[logoutVM]];
    section2.sectionHeaderHeight = 30;

    return @[section0, section1, section2];
}

@end
