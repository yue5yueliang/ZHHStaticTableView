//
//  ZHHExample0ViewController.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2025/6/8.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import "ZHHExample1ViewController.h"

@interface ZHHExample1ViewController () <ZHHStaticTableViewCellBuilder>

@property (nonatomic, strong) ZHHStaticTableViewModel *dataSource;

@end

@implementation ZHHExample1ViewController

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
    
    self.title = @"左侧有图";
    
    // 方式 1：初始化本地数据源
    self.mainTableView.zhh_dataSource = self.dataSource;
}

/// 代理方法：配置 Cell
- (void)configureCell:(ZHHStaticTableViewCell *)cell viewModel:(ZHHStaticTableviewCellViewModel *)viewModel {
    switch (viewModel.cellType) {
        case ZHHStaticCellTypeDefault:
        {
            [cell configureDefaultTableViewCellWithViewModel:viewModel];
            [cell.rightOptionSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
        }
            break;
        default:
            break;
    }
}

/// UISwitch 开关状态改变事件
/// @param sender 触发事件的 UISwitch
- (void)switchValueChanged:(UISwitch *)sender {
    BOOL isOn = sender.isOn;
    
    // 根据开关状态执行相应逻辑
    if (isOn) {
        NSLog(@"开关已打开");
        // 执行打开状态的逻辑，例如保存设置、更新 UI 等
    } else {
        NSLog(@"开关已关闭");
        // 执行关闭状态的逻辑，例如清除缓存、禁用某些功能等
    }
}

/// 选中 Cell 时的回调方法
- (void)didSelectViewModel:(ZHHStaticTableviewCellViewModel *)viewModel atIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - 懒加载数据源

- (ZHHStaticTableViewModel *)dataSource {
    if (!_dataSource) {  // 这里确保先初始化 _dataSource
        _dataSource = [[ZHHStaticTableViewModel alloc] initWithDataSource:[ZHHStaticUIDataProvider example0DataWithLeftIcon:NO]];
        _dataSource.builder = self;
    }
    return _dataSource;
}
@end
