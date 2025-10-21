//
//  ZHHStaticUIDataProvider使用示例.md
//  ZHHStaticTableView
//
//  该文档为完整版使用说明，README 中只保留精简版并指向此处。
//

# ZHHStaticTableView 优化后使用示例（完整版）

## 🌟 系统语义化颜色和图标优势

使用系统提供的语义化颜色和SF Symbols图标的优势：

- ✅ 自动适配浅色/深色模式
- ✅ 无障碍高对比度支持
- ✅ 未来兼容、风格一致
- ✅ 代码简洁

## ⚙️ ZHHStaticTableViewConfig 配置类使用

### 基本配置使用

```objc
// 获取全局配置
ZHHStaticTableViewConfig *config = [ZHHStaticTableViewConfig sharedConfig];

// 查看默认配置
NSLog(@"默认Cell高度: %.1f", config.defaultCellHeight);
NSLog(@"默认字体: %@", config.defaultFont);
NSLog(@"默认文本颜色: %@", config.defaultTextColor);

// 重置为默认配置
[config resetToDefaults];
```

### 自定义配置示例

```objc
ZHHStaticTableviewCellViewModel *cellVM = [[ZHHStaticTableviewCellViewModel alloc] init];
cellVM.leftTitleText = @"自定义配置Cell";

ZHHStaticTableViewConfig *config = [ZHHStaticTableViewConfig sharedConfig];
cellVM.cellHeight = config.defaultCellHeight;
cellVM.leftContentMargin = config.defaultLeftMargin;
cellVM.rightContentMargin = config.defaultRightMargin;
cellVM.leftTitleTextFont = config.defaultFont;
cellVM.leftTitleTextColor = config.defaultTextColor;
cellVM.rightTitleTextFont = config.defaultDetailFont;
cellVM.rightTitleTextColor = config.defaultDetailTextColor;
```

### 🎨 SF Symbols 系统图标

```objc
UIImage *arrowImage = [UIImage systemImageNamed:@"chevron.right"];
UIImage *settingsImage = [UIImage systemImageNamed:@"gear"];
UIImage *personImage = [UIImage systemImageNamed:@"person.circle"];

UIImage *coloredArrow = [arrowImage imageWithTintColor:UIColor.systemBlueColor
                                           renderingMode:UIImageRenderingModeAlwaysOriginal];
```

### 🎯 自定义箭头颜色

```objc
ZHHStaticTableviewCellViewModel *cellVM = [[ZHHStaticTableviewCellViewModel alloc] init];
cellVM.leftTitleText = @"自定义箭头颜色";
cellVM.rightArrowImageColor = UIColor.systemBlueColor;
[cellVM updateArrowImageColor];
```

## 🎨 主示例数据

```objc
NSArray *mainData = [ZHHStaticUIDataProvider mainExampleData];
```

涵盖：基础功能、不同高度/边距/颜色、配置类使用示例与属性展示。

## 📊 性能测试

```objc
[ZHHStaticUIDataProvider performanceTestWithCellCount:1000];
```

## 🔧 最佳实践（节选）

```objc
NSArray *data = [ZHHStaticUIDataProvider mainExampleData];
ZHHStaticTableviewCellViewModel *cellVM = [[ZHHStaticTableviewCellViewModel alloc] init];
cellVM.cellHeight = 60.0;
cellVM.leftContentMargin = 20.0;
cellVM.rightArrowImageColor = UIColor.systemBlueColor;
[cellVM updateArrowImageColor];
```


