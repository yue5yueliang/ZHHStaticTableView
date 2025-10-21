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
#import "ZHHStaticTableViewSectionViewModel.h"

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

    // 如果没有 header 文字或图片，直接返回 nil
    if (!sectionViewModel.sectionHeaderText.length && !sectionViewModel.sectionHeaderIconImage) {
        return nil;
    }

    return [self createSectionHeaderViewWithViewModel:sectionViewModel];
}

/// 创建Section Header视图
- (UIView *)createSectionHeaderViewWithViewModel:(ZHHStaticTableViewSectionViewModel *)sectionViewModel {
    UIView *sectionView = [[UIView alloc] init];
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 8;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;

    // 添加主标题
    if (sectionViewModel.sectionHeaderText.length) {
        UILabel *headerTitleLabel = [self createLabelWithText:sectionViewModel.sectionHeaderText
                                                         font:sectionViewModel.sectionHeaderTextFont
                                                        color:sectionViewModel.sectionHeaderTextColor];
        [stackView addArrangedSubview:headerTitleLabel];
    }
    
    // 添加图标
    if (sectionViewModel.sectionHeaderIconImage) {
        UIImageView *iconImageView = [self createImageViewWithImage:sectionViewModel.sectionHeaderIconImage
                                                               size:sectionViewModel.sectionHeaderIconImageSize];
        [stackView addArrangedSubview:iconImageView];
    }
    
    // 添加副标题
    if (sectionViewModel.sectionHeaderSubText.length) {
        UILabel *subTitleLabel = [self createLabelWithText:sectionViewModel.sectionHeaderSubText
                                                      font:sectionViewModel.sectionHeaderSubTextFont
                                                     color:sectionViewModel.sectionHeaderSubTextColor];
        [stackView addArrangedSubview:subTitleLabel];
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

    return [self createSectionFooterViewWithViewModel:sectionViewModel];
}

/// 创建Section Footer视图
- (UIView *)createSectionFooterViewWithViewModel:(ZHHStaticTableViewSectionViewModel *)sectionViewModel {
    UIView *sectionView = [[UIView alloc] init];

    UILabel *footerTitleLabel = [self createAttributedLabelWithText:sectionViewModel.sectionFooterText
                                                               font:sectionViewModel.sectionFooterTextFont
                                                              color:sectionViewModel.sectionFooterTextColor];

    [sectionView addSubview:footerTitleLabel];
    footerTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        [footerTitleLabel.centerYAnchor constraintEqualToAnchor:sectionView.centerYAnchor],
        [footerTitleLabel.leadingAnchor constraintEqualToAnchor:sectionView.leadingAnchor constant:sectionViewModel.sectionMargin],
        [footerTitleLabel.trailingAnchor constraintEqualToAnchor:sectionView.trailingAnchor constant:-sectionViewModel.sectionMargin]
    ]];

    return sectionView;
}

#pragma mark - 公共创建方法

/// 创建Label
- (UILabel *)createLabelWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.font = font;
    label.text = NSLocalizedString(text, nil);
    label.numberOfLines = 0;
    [label sizeToFit];
    return label;
}

/// 创建带行间距的Label
- (UILabel *)createAttributedLabelWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;

    // 设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 3.0;
    paragraphStyle.alignment = NSTextAlignmentLeft;

    NSDictionary *attributes = @{
        NSParagraphStyleAttributeName: paragraphStyle,
        NSFontAttributeName: font,
        NSForegroundColorAttributeName: color
    };

    label.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    return label;
}

/// 创建ImageView
- (UIImageView *)createImageViewWithImage:(UIImage *)image size:(CGSize)size {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [imageView.widthAnchor constraintEqualToConstant:size.width].active = YES;
    [imageView.heightAnchor constraintEqualToConstant:size.height].active = YES;
    return imageView;
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
