//
//  ZHHBaseViewController.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2025/6/7.
//  Copyright © 2025 136769890@qq.com. All rights reserved.
//

#import "ZHHBaseViewController.h"

@interface ZHHBaseViewController ()
 
@property (nonatomic, strong, readwrite) ZHHStaticTableView *mainTableView;

@end

@implementation ZHHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.zhh_backgroundColor;

    [self.view addSubview:self.mainTableView];
    
    [self.navigationController.navigationBar zhh_configureWithBlock:^(UINavigationBar *bar) {
        bar.zhh_backgroundColor  = UIColor.zhh_navigationBarColor;
        bar.zhh_tintColor        = UIColor.zhh_titleColor;
//        bar.zhh_translucent      = NO;
        bar.zhh_hideBottomLine   = YES;
    }];
}

#pragma mark - 表格初始化

- (ZHHStaticTableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[ZHHStaticTableView alloc] initWithFrame:self.view.bounds style:self.style];
        
        _mainTableView.zhh_delegate = self;
    }
    return _mainTableView;
}
@end
