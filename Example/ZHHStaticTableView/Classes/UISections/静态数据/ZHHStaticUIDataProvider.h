//
//  ZHHStaticUIDataProvider.h
//  ZHHStaticTableView
//
//  Created by 桃色三岁 on 2025/4/8.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHHStaticUIDataProvider : NSObject

#pragma mark - 示例数据

/// 示例数据：用于构建静态表格的预览内容
+ (NSArray<ZHHStaticTableViewSectionViewModel *> *)mainExampleData;

/// 左侧图标示例数据（含有箭头/无箭头）
/// @param showLeftIcon 是否显示左侧图标
+ (NSArray<ZHHStaticTableViewSectionViewModel *> *)example0DataWithLeftIcon:(BOOL)showLeftIcon;

/// 自定义 Cell 示例数据（如头像信息展示、退出按钮）
/// @return 包含多个 Section 的示例数据
+ (NSArray<ZHHStaticTableViewSectionViewModel *> *)exampleCustomData;

#pragma mark - 性能测试

/// 性能测试：创建大量Cell
/// @param count Cell数量
+ (void)performanceTestWithCellCount:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END

