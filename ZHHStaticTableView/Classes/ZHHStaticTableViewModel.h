//
//  ZHHStaticTableViewModel.h
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHHStaticTableViewCell.h"
#import "ZHHStaticTableviewCellViewModel.h"
#import "ZHHStaticTableViewSectionViewModel.h"

NS_ASSUME_NONNULL_BEGIN

/// ZHHStaticTableViewModel 协议
/// 该协议继承自 UITableViewDataSource，并额外提供静态数据表格所需的方法
@protocol ZHHStaticTableViewModel <UITableViewDataSource>
@optional

/// 获取某个 section 的 ViewModel（可选实现）
/// @param tableView 目标 UITableView
/// @param section 需要获取 ViewModel 的分区索引
/// @return 返回该 section 对应的 ViewModel
- (ZHHStaticTableViewSectionViewModel *)tableView:(UITableView *)tableView sectionViewModelInSection:(NSInteger)section;

/// 获取某个 cell 的 ViewModel（可选实现）
/// @param tableView 目标 UITableView
/// @param indexPath 需要获取 ViewModel 的 cell 的索引
/// @return 返回该 cell 对应的 ViewModel
- (ZHHStaticTableviewCellViewModel *)tableView:(UITableView *)tableView cellViewModelAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol ZHHStaticTableViewCellBuilder <NSObject>
@required
/// 配置 Cell 的回调方法
/// @param cell 需要配置的 TableViewCell
/// @param viewModel 该 Cell 对应的 ViewModel
- (void)configureCell:(ZHHStaticTableViewCell *)cell viewModel:(ZHHStaticTableviewCellViewModel *)viewModel;
@end

/// ZHHStaticTableViewModel 数据源类
/// 该类用于管理静态数据表格的数据，并提供默认的 UITableViewDataSource 实现
@interface ZHHStaticTableViewModel : NSObject <ZHHStaticTableViewModel>

/// 数据源数组，存储所有的 ViewModel（通常为 ZHHStaticTableViewSectionViewModel 的数组）
@property (nonatomic, strong) NSArray *dataSource;

/// 初始化方法
/// @param dataSource 需要传入的静态数据源（通常为 SectionViewModel 数组）
- (instancetype)initWithDataSource:(NSArray *)dataSource;

/**
 * `builder` —— **Cell 构建器**
 *
 * - 负责根据 `ViewModel` 创建并配置 `ZHHStaticTableViewCell`。
 * - 主要用于解耦 `TableViewCell` 的 UI 逻辑和数据绑定逻辑。
 * - 避免在 `TableViewCell` 内部直接处理数据，遵循 `MVVM` 设计模式。
 */
@property (nonatomic, weak) id<ZHHStaticTableViewCellBuilder> builder;

@end

NS_ASSUME_NONNULL_END
