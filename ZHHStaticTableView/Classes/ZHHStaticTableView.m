//
//  ZHHStaticTableView.m
//  ZHHStaticTableView_Example
//
//  Created by 桃色三岁 on 2022/10/21.
//  Copyright © 2022 桃色三岁. All rights reserved.
//

#import "ZHHStaticTableView.h"
#import "ZHHStaticTableViewCell.h"
#import "ZHHStaticTableviewCellViewModel.h"
#import "ZHHStaticTableviewSectionViewModel.h"

@implementation ZHHStaticTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = UIColor.clearColor;
        
        // 隐藏默认的 Footer
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        // 让 Header 也不会悬浮
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        
        // 关键代码：阻止 Header 悬浮
        self.sectionHeaderHeight = CGFLOAT_MIN;
        self.sectionFooterHeight = CGFLOAT_MIN;

        self.delegate = self;

        self.rowHeight = UITableViewAutomaticDimension;
        self.showsVerticalScrollIndicator = NO;
        
        self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;

        // 适配 iOS 15+
        if (@available(iOS 15.0, *)) {
            self.sectionHeaderTopPadding = 0;
        }
    }
    return self;
}

- (void)setZhh_dataSource:(id<ZHHStaticTableViewModel>)zhh_dataSource {
    if (_zhh_dataSource != zhh_dataSource) {
        _zhh_dataSource = zhh_dataSource;
        self.dataSource = _zhh_dataSource;
    }
}

#pragma mark - UITableViewDelegate

// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.zhh_dataSource tableView:tableView cellViewModelAtIndexPath:indexPath].cellHeight;
}

// 处理 Section Header 高度，防止悬浮
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    ZHHStaticTableViewSectionViewModel *sectionViewModel = [self.zhh_dataSource tableView:tableView sectionViewModelInSection:section];
    return sectionViewModel.sectionHeaderHeight ?: CGFLOAT_MIN;
}

// 处理 Section Footer 高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    ZHHStaticTableViewSectionViewModel *sectionViewModel = [self.zhh_dataSource tableView:tableView sectionViewModelInSection:section];
    return sectionViewModel.sectionFooterHeight ?: CGFLOAT_MIN;
}

#pragma mark - 处理 Header 不悬浮
#pragma mark - 处理 Header 视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZHHStaticTableViewSectionViewModel *sectionViewModel = [self.zhh_dataSource tableView:tableView sectionViewModelInSection:section];

    // **优化点 1：如果没有 header 文字或图片，直接返回 nil**
    if (!sectionViewModel.sectionHeaderText.length && !sectionViewModel.sectionHeaderIconImage) {
        return nil;
    }

    UIView *sectionView = [[UIView alloc] init];
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 8;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;

    if (sectionViewModel.sectionHeaderText.length) {
        UILabel *headerTitleLabel = [[UILabel alloc] init];
        headerTitleLabel.textColor = sectionViewModel.sectionHeaderTextColor;
        headerTitleLabel.font = sectionViewModel.sectionHeaderTextFont;
        headerTitleLabel.text = NSLocalizedString(sectionViewModel.sectionHeaderText, nil);
        headerTitleLabel.numberOfLines = 0;
        [headerTitleLabel sizeToFit];
        [stackView addArrangedSubview:headerTitleLabel];
    }
    
    if (sectionViewModel.sectionHeaderIconImage) {
        UIImageView *iconImageView = [[UIImageView alloc] initWithImage:sectionViewModel.sectionHeaderIconImage];
        iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [sectionView addSubview:iconImageView];
        iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [iconImageView.widthAnchor constraintEqualToConstant:sectionViewModel.sectionHeaderIconImageSize.width].active = YES;
        [iconImageView.heightAnchor constraintEqualToConstant:sectionViewModel.sectionHeaderIconImageSize.height].active = YES;
        [stackView addArrangedSubview:iconImageView];
    }
    
    if (sectionViewModel.sectionHeaderSubText.length) {
        UILabel *headerTitleLabel = [[UILabel alloc] init];
        headerTitleLabel.textColor = sectionViewModel.sectionHeaderSubTextColor;
        headerTitleLabel.font = sectionViewModel.sectionHeaderSubTextFont;
        headerTitleLabel.text = NSLocalizedString(sectionViewModel.sectionHeaderSubText, nil);
        headerTitleLabel.numberOfLines = 0;
        [headerTitleLabel sizeToFit];
        [stackView addArrangedSubview:headerTitleLabel];
    }

    [sectionView addSubview:stackView];
    [NSLayoutConstraint activateConstraints:@[
        [stackView.centerYAnchor constraintEqualToAnchor:sectionView.centerYAnchor],
        [stackView.leadingAnchor constraintEqualToAnchor:sectionView.leadingAnchor constant:sectionViewModel.sectionMargin],
        [stackView.trailingAnchor constraintLessThanOrEqualToAnchor:sectionView.trailingAnchor constant:-sectionViewModel.sectionMargin]
    ]];

    return sectionView;
}

#pragma mark - 处理 Footer 视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    ZHHStaticTableViewSectionViewModel *sectionViewModel = [self.zhh_dataSource tableView:tableView sectionViewModelInSection:section];

    if (!sectionViewModel.sectionFooterText.length) {
        return [[UIView alloc] initWithFrame:CGRectZero];
    }

    UIView *sectionView = [[UIView alloc] init];

    UILabel *footerTitleLabel = [[UILabel alloc] init];
    footerTitleLabel.textColor = sectionViewModel.sectionFooterTextColor;
    footerTitleLabel.font = sectionViewModel.sectionFooterTextFont;
    footerTitleLabel.numberOfLines = 0;

    // 设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 3.0; // 你可以调整这个值来设置合适的行间距
    paragraphStyle.alignment = NSTextAlignmentLeft;

    NSDictionary *attributes = @{
        NSParagraphStyleAttributeName: paragraphStyle,
        NSFontAttributeName: sectionViewModel.sectionFooterTextFont,
        NSForegroundColorAttributeName: sectionViewModel.sectionFooterTextColor
    };

    footerTitleLabel.attributedText = [[NSAttributedString alloc] initWithString:sectionViewModel.sectionFooterText attributes:attributes];

    [sectionView addSubview:footerTitleLabel];
    footerTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        [footerTitleLabel.centerYAnchor constraintEqualToAnchor:sectionView.centerYAnchor],
        [footerTitleLabel.leadingAnchor constraintEqualToAnchor:sectionView.leadingAnchor constant:sectionViewModel.sectionMargin],
        [footerTitleLabel.trailingAnchor constraintEqualToAnchor:sectionView.trailingAnchor constant:-sectionViewModel.sectionMargin]
    ]];

    return sectionView;
}

#pragma mark - UITableView 选中 Cell 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    ZHHStaticTableviewCellViewModel *viewModel = [self.zhh_dataSource tableView:tableView cellViewModelAtIndexPath:indexPath];

    // 判断代理是否实现了自定义的 `didSelectViewModel:atIndexPath:` 方法
    if ([self.zhh_delegate respondsToSelector:@selector(didSelectViewModel:atIndexPath:)]) {
        [self.zhh_delegate didSelectViewModel:viewModel atIndexPath:indexPath];
    }
    // 如果未实现，则回退调用 `UITableViewDelegate` 的 `tableView:didSelectRowAtIndexPath:`
    else if ([self.zhh_delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.zhh_delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

@end
