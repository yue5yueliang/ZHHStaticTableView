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
        // 赋值时使用 copy，保证数据安全性
        _dataSource = [dataSource copy];
    }
    return self;
}

#pragma mark - 🔹 ZHHStaticTableViewModel 协议方法

/// 获取指定 indexPath 处的 Cell ViewModel
/// @param tableView 目标 UITableView
/// @param indexPath Cell 的索引
/// @return 返回该 Cell 对应的 ViewModel
- (ZHHStaticTableviewCellViewModel *)tableView:(UITableView *)tableView cellViewModelAtIndexPath:(NSIndexPath *)indexPath {
    // 添加边界检查
    if (!indexPath || indexPath.section < 0 || indexPath.row < 0) {
        NSLog(@"ZHHStaticTableView: Invalid indexPath: %@", indexPath);
        return nil;
    }
    
    if (indexPath.section >= self.dataSource.count) {
        NSLog(@"ZHHStaticTableView: Section index %ld out of bounds (count: %lu)", (long)indexPath.section, (unsigned long)self.dataSource.count);
        return nil;
    }
    
    ZHHStaticTableViewSectionViewModel *sectionViewModel = self.dataSource[indexPath.section];
    if (!sectionViewModel) {
        NSLog(@"ZHHStaticTableView: SectionViewModel is nil at index %ld", (long)indexPath.section);
        return nil;
    }
    
    if (indexPath.row >= sectionViewModel.dataSource.count) {
        NSLog(@"ZHHStaticTableView: Row index %ld out of bounds in section %ld (count: %lu)", (long)indexPath.row, (long)indexPath.section, (unsigned long)sectionViewModel.dataSource.count);
        return nil;
    }
    
    return sectionViewModel.dataSource[indexPath.row];
}

/// 获取指定 Section 的 ViewModel
/// @param tableView 目标 UITableView
/// @param section 需要获取 ViewModel 的分区索引
/// @return 返回该 Section 对应的 ViewModel
- (ZHHStaticTableViewSectionViewModel *)tableView:(UITableView *)tableView sectionViewModelInSection:(NSInteger)section {
    // 添加边界检查
    if (section < 0) {
        NSLog(@"ZHHStaticTableView: Invalid section index: %ld", (long)section);
        return nil;
    }
    
    if (section >= self.dataSource.count) {
        NSLog(@"ZHHStaticTableView: Section index %ld out of bounds (count: %lu)", (long)section, (unsigned long)self.dataSource.count);
        return nil;
    }
    
    ZHHStaticTableViewSectionViewModel *sectionViewModel = self.dataSource[section];
    if (!sectionViewModel) {
        NSLog(@"ZHHStaticTableView: SectionViewModel is nil at index %ld", (long)section);
    }
    
    return sectionViewModel;
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
    if (indexPath.section >= self.dataSource.count) {
        NSLog(@"ZHHStaticTableView: Section index %ld out of bounds (count: %lu)", (long)indexPath.section, (unsigned long)self.dataSource.count);
        return [[UITableViewCell alloc] init];
    }
    
    ZHHStaticTableViewSectionViewModel *sectionViewModel = self.dataSource[indexPath.section];
    if (!sectionViewModel) {
        NSLog(@"ZHHStaticTableView: SectionViewModel is nil at section %ld", (long)indexPath.section);
        return [[UITableViewCell alloc] init];
    }

    if (indexPath.row >= sectionViewModel.dataSource.count) {
        NSLog(@"ZHHStaticTableView: Row index %ld out of bounds in section %ld (count: %lu)", (long)indexPath.row, (long)indexPath.section, (unsigned long)sectionViewModel.dataSource.count);
        return [[UITableViewCell alloc] init];
    }
    
    ZHHStaticTableviewCellViewModel *cellViewModel = sectionViewModel.dataSource[indexPath.row];
    if (!cellViewModel) {
        NSLog(@"ZHHStaticTableView: CellViewModel is nil at indexPath: %@", indexPath);
        return [[UITableViewCell alloc] init];
    }

    // 获取 Cell Class
    Class cellClass = NSClassFromString(cellViewModel.cellClassName);
    if (!cellClass) {
        NSLog(@"ZHHStaticTableView: Cell class not found: %@", cellViewModel.cellClassName);
        return [[UITableViewCell alloc] init];
    }
    
    if (![cellClass isSubclassOfClass:[ZHHStaticTableViewCell class]]) {
        NSLog(@"ZHHStaticTableView: Invalid cell class: %@, must be subclass of ZHHStaticTableViewCell", cellViewModel.cellClassName);
        return [[UITableViewCell alloc] init];
    }

    // 获取可复用 Cell
    NSString *reuseIdentifier = [self finalCellIdentifier:cellViewModel indexPath:indexPath];
    ZHHStaticTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];

    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        if (!cell) {
            NSLog(@"ZHHStaticTableView: Failed to create cell instance for class: %@", cellViewModel.cellClassName);
            return [[UITableViewCell alloc] init];
        }
    }
    
    // 配置Cell
    if ([self.builder respondsToSelector:@selector(configureCell:viewModel:)]) {
        [self.builder configureCell:cell viewModel:cellViewModel];
    } else {
        NSLog(@"ZHHStaticTableView: Builder does not implement configureCell:viewModel: method");
    }
    
    return cell;
}

/// 生成Cell的复用标识符
/// @param viewModel Cell的ViewModel
/// @param indexPath Cell的索引路径
/// @return 复用标识符
- (NSString *)finalCellIdentifier:(ZHHStaticTableviewCellViewModel *)viewModel indexPath:(NSIndexPath *)indexPath {
    switch (viewModel.cellType) {
        case ZHHStaticCellTypeCustom:
            return viewModel.cellClassName;
        default:
            return [NSString stringWithFormat:@"%@_%ld_%ld", viewModel.cellID, (long)indexPath.section, (long)indexPath.row];
    }
}
@end
