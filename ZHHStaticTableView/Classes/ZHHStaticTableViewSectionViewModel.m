//
//  ZHHStaticTableViewSectionViewModel.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import "ZHHStaticTableViewSectionViewModel.h"
#import "ZHHStaticTableViewConfig.h"

@implementation ZHHStaticTableViewSectionViewModel

- (instancetype)initWithDataSource:(NSArray *)dataSource {
    self = [super init];
    if (self) {
        // 使用配置类获取默认值
        ZHHStaticTableViewConfig *config = [ZHHStaticTableViewConfig sharedConfig];
        
        // 默认高度
        self.sectionHeaderHeight = config.defaultSectionHeaderHeight;
        self.sectionFooterHeight = config.defaultSectionFooterHeight;
        self.sectionMargin = config.defaultSectionMargin;
        
        // 默认字体和颜色
        self.sectionHeaderTextFont = config.defaultSectionHeaderFont;
        self.sectionHeaderTextColor = config.defaultSectionHeaderColor;
        self.sectionFooterTextFont = config.defaultSectionFooterFont;
        self.sectionFooterTextColor = config.defaultSectionFooterColor;
        self.sectionHeaderSubTextFont = config.defaultDetailFont;
        self.sectionHeaderSubTextColor = config.defaultDetailTextColor;
        
        // 默认图标大小
        self.sectionHeaderIconImageSize = config.defaultIconSize;
        
        // 赋值数据源
        self.dataSource = [dataSource mutableCopy];
    }
    return self;
}

@end
