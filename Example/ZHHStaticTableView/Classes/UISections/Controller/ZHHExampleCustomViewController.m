//
//  ZHHExampleCustomViewController.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2025/6/8.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHExampleCustomViewController.h"

@interface ZHHExampleCustomViewController () <ZHHStaticTableViewCellBuilder>

@property (nonatomic, strong) ZHHStaticTableViewModel *dataSource;

@end

@implementation ZHHExampleCustomViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.style = UITableViewStyleInsetGrouped;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"完全自定义的 Cell";
    
    // 方式 1：初始化本地数据源
    self.mainTableView.zhh_dataSource = self.dataSource;
}

/// 代理方法：配置 Cell
- (void)configureCell:(ZHHStaticTableViewCell *)cell viewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    switch (viewModel.cellType) {
        case ZHHStaticCellTypeCustom:
        {
            [cell configureCustomTableViewCellWithViewModel:viewModel];
        }
            break;
        default:
            break;
    }
}

/// 选中 Cell 时的回调方法
- (void)didSelectViewModel:(ZHHStaticTableviewCellViewModel *)viewModel atIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - 懒加载数据源

- (ZHHStaticTableViewModel *)dataSource {
    if (!_dataSource) {  // 这里确保先初始化 _dataSource
        _dataSource = [[ZHHStaticTableViewModel alloc] initWithDataSource:[ZHHStaticUIDataProvider exampleCustomData]];
        _dataSource.builder = self;
    }
    return _dataSource;
}

@end
