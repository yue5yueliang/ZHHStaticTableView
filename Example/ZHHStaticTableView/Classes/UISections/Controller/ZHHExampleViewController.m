//
//  ZHHExampleViewController.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2025/6/7.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHExampleViewController.h"

@interface ZHHExampleViewController () <ZHHStaticTableViewCellBuilder>

@property (nonatomic, strong) ZHHStaticTableViewModel *dataSource;

@end

@implementation ZHHExampleViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.style = UITableViewStyleGrouped;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"静态表单的轻量级封装组件";
    // 方式 1：初始化本地数据源
    self.mainTableView.zhh_dataSource = self.dataSource;
}

/// 代理方法：配置 Cell
- (void)configureCell:(ZHHStaticTableViewCell *)cell viewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    [cell configureDefaultTableViewCellWithViewModel:viewModel];
}

/// 选中 Cell 时的回调方法
- (void)didSelectViewModel:(ZHHStaticTableviewCellViewModel *)viewModel atIndexPath:(NSIndexPath *)indexPath {
    if (viewModel.identifier == 0) {
        [self.navigationController zhh_pushViewControllerWithClassName:@"ZHHExample0ViewController"];
    } else if (viewModel.identifier == 1) {
        [self.navigationController zhh_pushViewControllerWithClassName:@"ZHHExample1ViewController"];
    } else if (viewModel.identifier == 2) {
        [self.navigationController zhh_pushViewControllerWithClassName:@"ZHHExampleCustomViewController"];
    } else if (viewModel.identifier == 3) {
        [self.navigationController zhh_pushViewControllerWithClassName:@"ZHHExampleUpdateViewController"];
    }
}

#pragma mark - 懒加载数据源

- (ZHHStaticTableViewModel *)dataSource {
    if (!_dataSource) {  // 这里确保先初始化 _dataSource
        _dataSource = [[ZHHStaticTableViewModel alloc] initWithDataSource:[ZHHStaticUIDataProvider mainExampleData]];
        _dataSource.builder = self;
    }
    return _dataSource;
}

@end
