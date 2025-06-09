//
//  ZHHStaticTableView.h
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHHStaticTableViewModel.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - ZHHStaticTableViewDelegate
/// 自定义静态 TableView 代理协议，继承自 `UITableViewDelegate`
@protocol ZHHStaticTableViewDelegate <UITableViewDelegate>
@optional

/// 选中 Cell 时的回调方法
/// @param viewModel 被选中的 Cell 对应的 ViewModel
/// @param indexPath 选中的索引路径
- (void)didSelectViewModel:(ZHHStaticTableviewCellViewModel *)viewModel atIndexPath:(NSIndexPath *)indexPath;

@end

/// 自定义静态 TableView，封装 UITableView，便于管理
@interface ZHHStaticTableView : UITableView <UITableViewDelegate>

/// 代理属性，负责处理 Cell 选中事件
@property (nonatomic, weak) id <ZHHStaticTableViewDelegate> zhh_delegate;

/// 数据源属性，提供静态数据
@property (nonatomic, weak) id <ZHHStaticTableViewModel> zhh_dataSource;

@end

NS_ASSUME_NONNULL_END
