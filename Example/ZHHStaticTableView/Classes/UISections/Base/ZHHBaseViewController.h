//
//  ZHHBaseViewController.h
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2025/6/7.
//  Copyright © 2025 桃色三岁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHHStaticUIDataProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHHBaseViewController : UIViewController <ZHHStaticTableViewDelegate>

@property (nonatomic, strong, readonly) ZHHStaticTableView *mainTableView;
@property (nonatomic, assign) UITableViewStyle style;

@end

NS_ASSUME_NONNULL_END
