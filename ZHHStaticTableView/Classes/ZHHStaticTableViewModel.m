//
//  ZHHStaticTableViewModel.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import "ZHHStaticTableViewModel.h"

@interface ZHHStaticTableViewModel ()


@end

@implementation ZHHStaticTableViewModel

#pragma mark - 🔹 Public API

/// 初始化方法
/// @param dataSource 需要传入的静态数据源（通常为 SectionViewModel 数组）
- (instancetype)initWithDataSource:(NSArray *)dataSource {
    self = [super init];
    if (self) {
        _dataSource = [dataSource copy]; // 赋值时使用 copy，保证数据安全性
    }
    return self;
}

#pragma mark - 🔹 ZHHStaticTableViewModel 协议方法

/// 获取指定 indexPath 处的 Cell ViewModel
/// @param tableView 目标 UITableView
/// @param indexPath Cell 的索引
/// @return 返回该 Cell 对应的 ViewModel
- (ZHHStaticTableviewCellViewModel *)tableView:(UITableView *)tableView cellViewModelAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < self.dataSource.count) {
        ZHHStaticTableViewSectionViewModel *sectionViewModel = self.dataSource[indexPath.section];
        if (indexPath.row < sectionViewModel.dataSource.count) {
            return sectionViewModel.dataSource[indexPath.row];
        }
    }
    return nil;
}

/// 获取指定 Section 的 ViewModel
/// @param tableView 目标 UITableView
/// @param section 需要获取 ViewModel 的分区索引
/// @return 返回该 Section 对应的 ViewModel
- (ZHHStaticTableViewSectionViewModel *)tableView:(UITableView *)tableView sectionViewModelInSection:(NSInteger)section {
    if (section < self.dataSource.count) {
        return self.dataSource[section];
    }
    return nil;
}

#pragma mark - 🔹 UITableViewDataSource 协议方法

/// 获取 TableView 中的 Section 数量
/// @param tableView 目标 UITableView
/// @return Section 的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

/// 获取指定 Section 中的 Row 数量
/// @param tableView 目标 UITableView
/// @param section 目标 Section 索引
/// @return 该 Section 中的 Row 数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section < self.dataSource.count) {
        ZHHStaticTableViewSectionViewModel *sectionViewModel = self.dataSource[section];
        return sectionViewModel.dataSource.count;
    }
    return 0;
}

/// 配置并返回指定 indexPath 的 Cell
/// @param tableView 目标 UITableView
/// @param indexPath Cell 的索引
/// @return 目标 Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 防止越界
    if (indexPath.section >= self.dataSource.count) return [[UITableViewCell alloc] init];
    ZHHStaticTableViewSectionViewModel *sectionViewModel = self.dataSource[indexPath.section];

    if (indexPath.row >= sectionViewModel.dataSource.count) return [[UITableViewCell alloc] init];
    ZHHStaticTableviewCellViewModel *cellViewModel = sectionViewModel.dataSource[indexPath.row];

    // 获取 Cell Class
    Class cellClass = NSClassFromString(cellViewModel.cellClassName);
    if (!cellClass || ![cellClass isSubclassOfClass:[ZHHStaticTableViewCell class]]) {
        return [[UITableViewCell alloc] init]; // 兜底返回
    }

    // 获取可复用 Cell
    NSString *reuseIdentifier = [self finalCellIdentifier:cellViewModel indexPath:indexPath];
    ZHHStaticTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];

    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    if ([self.builder respondsToSelector:@selector(configureCell:viewModel:)]) {
        [self.builder configureCell:cell viewModel:cellViewModel];
    }
    return cell;
}

- (NSString *)finalCellIdentifier:(ZHHStaticTableviewCellViewModel *)viewModel indexPath:(NSIndexPath *)indexPath {
    switch (viewModel.cellType) {
        case ZHHStaticCellTypeCustom:
            return viewModel.cellClassName;
        default:
            return [NSString stringWithFormat:@"%@_%ld_%ld", viewModel.cellID, (long)indexPath.section, (long)indexPath.row];
    }
}
@end
