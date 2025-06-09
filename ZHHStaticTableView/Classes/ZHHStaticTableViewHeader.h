//
//  ZHHStaticTableViewHeader.h
//  ZHHStaticTableView
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#ifndef ZHHStaticTableViewHeader_h
#define ZHHStaticTableViewHeader_h

#if __has_include(<ZHHStaticTableView/ZHHStaticTableViewHeader.h>)

FOUNDATION_EXPORT double ZHHStaticTableViewVersionNumber;
//! Project version string for ZHHAnneKit.
FOUNDATION_EXPORT const unsigned char ZHHStaticTableViewVersionString[];
// 在这个头文件中导入框架的所有公共头文件
#import <ZHHStaticTableView/ZHHStaticTableView.h>
#import <ZHHStaticTableView/ZHHStaticTableViewModel.h>
#import <ZHHStaticTableView/ZHHStaticTableviewCellViewModel.h>
#import <ZHHStaticTableView/ZHHStaticTableViewSectionViewModel.h>
#import <ZHHStaticTableView/ZHHStaticTableViewCell.h>

#else

// 如果不能使用框架导入，则使用本地路径的导入方式
#import "ZHHStaticTableView.h"
#import "ZHHStaticTableViewModel.h"
#import "ZHHStaticTableviewCellViewModel.h"
#import "ZHHStaticTableViewSectionViewModel.h"
#import "ZHHStaticTableViewCell.h"

#endif

#endif /* ZHHStaticTableViewHeader_h */
