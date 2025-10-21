//
//  ZHHStaticUIDataProvider.m
//  ZHHStaticTableView
//
//  Created by 桃色三岁 on 2025/4/8.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHStaticUIDataProvider.h"
#import "ZHHStaticTableViewConfig.h"

@implementation ZHHStaticUIDataProvider

#pragma mark - 优化的数据创建方法

/// 创建基础Cell ViewModel的工厂方法
+ (ZHHStaticTableviewCellViewModel *)createCellWithIdentifier:(NSInteger)identifier title:(NSString *)title icon:(UIImage * _Nullable)icon {
    ZHHStaticTableviewCellViewModel *cellVM = [[ZHHStaticTableviewCellViewModel alloc] init];
    cellVM.identifier = identifier;
    cellVM.leftTitleText = title;
    if (icon) {
        cellVM.leftIconImage = icon;
    }
    return cellVM;
}

/// 创建带右侧内容的Cell ViewModel
+ (ZHHStaticTableviewCellViewModel *)createCellWithIdentifier:(NSInteger)identifier title:(NSString *)title icon:(UIImage * _Nullable)icon rightDetail:(NSString * _Nullable)rightDetail rightIcon:(UIImage * _Nullable)rightIcon {
    ZHHStaticTableviewCellViewModel *cellVM = [self createCellWithIdentifier:identifier title:title icon:icon];
    
    if (rightDetail) {
        cellVM.rightDetailText = rightDetail;
    }
    if (rightIcon) {
        cellVM.rightIconImage = rightIcon;
    }
    
    return cellVM;
}

/// 创建Section ViewModel的工厂方法
+ (ZHHStaticTableViewSectionViewModel *)createSectionWithData:(NSArray *)data header:(NSString * _Nullable)header footer:(NSString * _Nullable)footer {
    ZHHStaticTableViewSectionViewModel *sectionVM = [[ZHHStaticTableViewSectionViewModel alloc] initWithDataSource:data];
    
    ZHHStaticTableViewConfig *config = [ZHHStaticTableViewConfig sharedConfig];
    
    if (header) {
        sectionVM.sectionHeaderText = header;
        sectionVM.sectionHeaderHeight = config.defaultSectionHeaderHeight; // 使用配置的默认值
        sectionVM.sectionHeaderTextFont = config.defaultSectionHeaderFont; // 使用配置的默认字体
        sectionVM.sectionHeaderTextColor = config.defaultSectionHeaderColor; // 使用配置的默认颜色
    }
    if (footer) {
        sectionVM.sectionFooterText = footer;
        sectionVM.sectionFooterHeight = config.defaultSectionFooterHeight > 0 ? config.defaultSectionFooterHeight : 30.0; // 如果配置为0则使用30pt
        sectionVM.sectionFooterTextFont = config.defaultSectionFooterFont; // 使用配置的默认字体
        sectionVM.sectionFooterTextColor = config.defaultSectionFooterColor; // 使用配置的默认颜色
    }
    
    return sectionVM;
}

/// 示例数据：用于构建静态表格的预览内容
+ (NSArray<ZHHStaticTableViewSectionViewModel *> *)mainExampleData {
    
    // ===== Section 0：基础功能展示
    ZHHStaticTableviewCellViewModel *cell0_0 = [self createCellWithIdentifier:0 title:@"左侧有图" icon:nil];
    ZHHStaticTableviewCellViewModel *cell0_1 = [self createCellWithIdentifier:1 title:@"左侧无图" icon:nil];
    ZHHStaticTableviewCellViewModel *cell0_2 = [self createCellWithIdentifier:2 title:@"自定义 Cell" icon:nil];
    ZHHStaticTableviewCellViewModel *cell0_3 = [self createCellWithIdentifier:3 title:@"数据更新" icon:nil];
    
    ZHHStaticTableViewSectionViewModel *section0 = [self createSectionWithData:@[cell0_0, cell0_1, cell0_2, cell0_3] 
                                                                        header:@"基础功能" 
                                                                        footer:nil];
    section0.sectionMargin = 15;
    section0.sectionHeaderHeight = 40;
    return @[section0];
}

/// 左侧图标示例数据（含有箭头/无箭头）
/// @param showLeftIcon 是否显示左侧图标
+ (NSArray<ZHHStaticTableViewSectionViewModel *> *)example0DataWithLeftIcon:(BOOL)showLeftIcon {
    UIImage *wechatIcon = showLeftIcon ? [UIImage imageNamed:@"icon_example_wechat"] : nil;
    UIImage *qrcodeIcon = [UIImage imageNamed:@"icon_setting_qrcode"];
    
    // ===== Section 0：有箭头
    NSMutableArray *section0Data = [NSMutableArray array];
    for (NSInteger i = 0; i < 4; i++) {
        ZHHStaticTableviewCellViewModel *vm = [self createCellWithIdentifier:i title:@"朋友圈" icon:wechatIcon];
        vm.rightArrowImage = nil; // 无箭头

        switch (i) {
            case 1:
                vm.rightDetailText = @"v1.2.7";
                break;
            case 2:
                vm.rightIconImage = qrcodeIcon;
                break;
            case 3:
                vm.showRightOptionSwitch = YES;
                break;
            default:
                break;
        }

        [section0Data addObject:vm];
    }

    ZHHStaticTableViewSectionViewModel *section0 = [self createSectionWithData:section0Data header:@"有箭头" footer:nil];
    section0.sectionHeaderHeight = 40;

    // ===== Section 1：无箭头
    NSMutableArray *section1Data = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        ZHHStaticTableviewCellViewModel *vm = [self createCellWithIdentifier:i + 4 title:@"朋友圈" icon:wechatIcon];

        switch (i) {
            case 1:
                vm.rightDetailText = @"v1.2.7";
                break;
            case 2:
                vm.rightIconImage = qrcodeIcon;
                break;
            case 3:
                vm.rightTitleText = @"你的精彩瞬间";
                vm.rightIconImage = qrcodeIcon;
                break;
            case 4:
                vm.rightDetailText = @"你的精彩瞬间";
                vm.rightIconImage = qrcodeIcon;
                break;
            default:
                break;
        }

        [section1Data addObject:vm];
    }

    ZHHStaticTableViewSectionViewModel *section1 = [self createSectionWithData:section1Data header:@"无箭头" footer:nil];
    section1.sectionHeaderHeight = 40;

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
    
    ZHHStaticTableViewSectionViewModel *section0 = [self createSectionWithData:@[avatarVM] header:nil footer:nil];

    // ===== Section 1：自定义 Header 信息展示 Cell（高度更大）
    ZHHStaticTableviewCellViewModel *userHeaderVM = [[ZHHStaticTableviewCellViewModel alloc] init];
    userHeaderVM.identifier = 1;
    userHeaderVM.cellType = ZHHStaticCellTypeCustom;
    userHeaderVM.cellClassName = @"ZHHExampleCustomTableViewCell";
    userHeaderVM.cellHeight = 64;

    ZHHStaticTableViewSectionViewModel *section1 = [self createSectionWithData:@[userHeaderVM] header:nil footer:nil];

    // ===== Section 2：退出登录按钮 Cell
    ZHHStaticTableviewCellViewModel *logoutVM = [[ZHHStaticTableviewCellViewModel alloc] init];
    logoutVM.identifier = 2;
    logoutVM.cellType = ZHHStaticCellTypeCustom;
    logoutVM.cellClassName = @"ZHHCustomLogoutTableViewCell";
    logoutVM.cellHeight = 44;

    ZHHStaticTableViewSectionViewModel *section2 = [self createSectionWithData:@[logoutVM] header:nil footer:nil];

    return @[section0, section1, section2];
}

#pragma mark - 性能测试

/// 性能测试：创建大量Cell
/// @param count Cell数量
+ (void)performanceTestWithCellCount:(NSInteger)count {
    NSLog(@"=== ZHHStaticUIDataProvider 性能测试 ===");
    
    // 测试Cell创建性能
    NSDate *startTime = [NSDate date];
    NSMutableArray *cells = [NSMutableArray array];
    
    for (NSInteger i = 0; i < count; i++) {
        ZHHStaticTableviewCellViewModel *cellVM = [self createCellWithIdentifier:i title:[NSString stringWithFormat:@"Cell %ld", (long)i] icon:nil];
        [cells addObject:cellVM];
    }
    
    NSTimeInterval duration = [[NSDate date] timeIntervalSinceDate:startTime] * 1000;
    NSLog(@"⚡ 创建%ld个Cell耗时: %.2f毫秒", (long)count, duration);
    
    // 测试Section创建性能
    startTime = [NSDate date];
    ZHHStaticTableViewSectionViewModel *sectionVM = [self createSectionWithData:cells header:@"性能测试" footer:nil];
    duration = [[NSDate date] timeIntervalSinceDate:startTime] * 1000;
    NSLog(@"⚡ 创建Section耗时: %.2f毫秒", duration);
    
    // 验证Section创建成功
    NSLog(@"📊 Section包含%lu个Cell", (unsigned long)sectionVM.dataSource.count);
    
    // 测试ViewModel比较性能
    if (cells.count >= 2) {
        startTime = [NSDate date];
        ZHHStaticTableviewCellViewModel *cell1 = cells[0];
        ZHHStaticTableviewCellViewModel *cell2 = cells[1];
        
        for (NSInteger i = 0; i < 1000; i++) {
            [cell1 isEqual:cell2];
        }
        
        duration = [[NSDate date] timeIntervalSinceDate:startTime] * 1000;
        NSLog(@"⚡ 1000次ViewModel比较耗时: %.2f毫秒", duration);
    }
    
    NSLog(@"✅ 性能测试完成！");
}

@end
