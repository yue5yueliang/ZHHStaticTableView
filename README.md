# ZHHStaticTableView

[![CI Status](https://img.shields.io/travis/yue5yueliang/ZHHStaticTableView.svg?style=flat)](https://travis-ci.org/yue5yueliang/ZHHStaticTableView)
[![Version](https://img.shields.io/cocoapods/v/ZHHStaticTableView.svg?style=flat)](https://cocoapods.org/pods/ZHHStaticTableView)
[![License](https://img.shields.io/cocoapods/l/ZHHStaticTableView.svg?style=flat)](https://cocoapods.org/pods/ZHHStaticTableView)
[![Platform](https://img.shields.io/cocoapods/p/ZHHStaticTableView.svg?style=flat)](https://cocoapods.org/pods/ZHHStaticTableView)

## 快速开始

克隆仓库后，在 `Example` 目录执行 `pod install`，然后运行示例工程。

### 示例数据（入口）

```objc
// 获取主示例数据（已合并样式展示与配置示例）
NSArray *sections = [ZHHStaticUIDataProvider mainExampleData];
```

### 使用配置类（默认值）

```objc
ZHHStaticTableViewConfig *config = [ZHHStaticTableViewConfig sharedConfig];
// 默认：cell 高度 50，左右边距 15，内容间距 10，图标 20x20，箭头 10x16
```

更多完整说明见 `docs/ZHHStaticUIDataProvider使用示例.md`。

## Requirements

## Installation

ZHHStaticTableView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZHHStaticTableView'
```

## Author

桃色三岁, 136769890@qq.com

## License

ZHHStaticTableView is available under the MIT license. See the LICENSE file for more info.
