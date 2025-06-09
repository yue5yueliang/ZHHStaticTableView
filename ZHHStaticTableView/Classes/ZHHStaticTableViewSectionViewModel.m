//
//  ZHHStaticTableViewSectionViewModel.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import "ZHHStaticTableViewSectionViewModel.h"

@implementation ZHHStaticTableViewSectionViewModel

- (instancetype)initWithDataSource:(NSArray *)dataSource {
    self = [super init];
    if (self) {
        // 默认高度
        self.sectionHeaderHeight = 20.f;
        self.sectionFooterHeight = 0.f;
        self.sectionMargin = 0.f;
        
        // 默认字体和颜色
        self.sectionHeaderTextFont = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
        self.sectionHeaderTextColor = UIColor.labelColor;
        self.sectionFooterTextFont = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        self.sectionFooterTextColor = UIColor.tertiaryLabelColor;
        self.sectionHeaderSubTextFont = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        self.sectionHeaderSubTextColor = UIColor.tertiaryLabelColor;
        
        // 默认图标大小
        self.sectionHeaderIconImageSize = CGSizeMake(20, 20);
        
        // 赋值数据源
        self.dataSource = [dataSource mutableCopy];
    }
    return self;
}

@end
