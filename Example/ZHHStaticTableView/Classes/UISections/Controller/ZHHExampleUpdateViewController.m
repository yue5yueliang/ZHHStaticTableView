//
//  ZHHExampleUpdateViewController.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2025/6/8.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHExampleUpdateViewController.h"

@interface ZHHExampleUpdateViewController () <ZHHStaticTableViewCellBuilder>

@property (nonatomic, strong) ZHHStaticTableViewModel *dataSource;

@end

@implementation ZHHExampleUpdateViewController

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
    
    self.title = @"5秒后更新数据";
    
    // 方式 1：初始化本地数据源
    self.mainTableView.zhh_dataSource = self.dataSource;
    
    // 更新部分数据
    [self updateData];
}

/// 模拟更新指定 `indexPath` 的数据
- (void)updateData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *responseDict = @{
            @"detailText"  : @"我是更新后的文字"
        };
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:1];
        [self updateViewModelAtIndexPath:indexPath withData:responseDict];
    });
}

/// 更新指定 `indexPath` 的 `ViewModel`
- (void)updateViewModelAtIndexPath:(NSIndexPath *)indexPath withData:(NSDictionary *)data {
    ZHHStaticTableviewCellViewModel *viewModel = [self.dataSource tableView:self.mainTableView cellViewModelAtIndexPath:indexPath];

    if (!viewModel) return;
    
    viewModel.rightDetailText = data[@"detailText"];
    
    // 刷新指定 `indexPath`
    [self.mainTableView zhh_reloadRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationNone];
}

/// 代理方法：配置 Cell
- (void)configureCell:(ZHHStaticTableViewCell *)cell viewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    [cell configureDefaultTableViewCellWithViewModel:viewModel];

}

/// 选中 Cell 时的回调方法
- (void)didSelectViewModel:(ZHHStaticTableviewCellViewModel *)viewModel atIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - 懒加载数据源

- (ZHHStaticTableViewModel *)dataSource {
    if (!_dataSource) {  // 这里确保先初始化 _dataSource
        _dataSource = [[ZHHStaticTableViewModel alloc] initWithDataSource:[ZHHStaticUIDataProvider example0DataWithLeftIcon:YES]];
        _dataSource.builder = self;
    }
    return _dataSource;
}

@end
