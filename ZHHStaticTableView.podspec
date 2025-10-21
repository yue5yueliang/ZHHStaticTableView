Pod::Spec.new do |s|
  s.name             = 'ZHHStaticTableView'
  s.version          = '0.0.2'
  s.summary          = '一个用于构建设置页面或静态表单的轻量级 TableView 封装组件'

  s.description      = <<-DESC
ZHHStaticTableView 是一个基于 UITableView 的轻量级封装组件，专为构建静态表格场景设计。
适用于设置页、表单页、个人信息页等场景，支持分组、图标、标题、副标题、开关、箭头跳转等常见样式。

核心特性：
• 声明式 API 设计，快速构建静态表格 UI
• 支持系统语义化颜色，自动适配浅色/深色模式
• 内置 SF Symbols 图标支持，支持自定义箭头颜色
• 统一配置管理，支持全局样式定制
• 高性能 Cell 复用机制，优化内存占用
• 完善的类型安全和空值处理
• 支持自定义 Cell 与灵活扩展

让开发者以最少的代码快速构建美观、高性能的静态表格界面。
                       DESC

  s.homepage         = 'https://github.com/yue5yueliang/ZHHStaticTableView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '桃色三岁' => '136769890@qq.com' }
  s.source           = { :git => 'https://github.com/yue5yueliang/ZHHStaticTableView.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'
  s.requires_arc     = true
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |core|
    core.source_files = 'ZHHStaticTableView/Classes/**/*.{h,m}'
    core.public_header_files = 'ZHHStaticTableView/Classes/**/*.h'
    core.frameworks = 'UIKit', 'Foundation'
  end
  
  # s.screenshots = 'https://raw.githubusercontent.com/yue5yueliang/ZHHStaticTableView/main/Screenshots/demo.png'
  # s.documentation_url = 'https://github.com/yue5yueliang/ZHHStaticTableView/blob/main/docs/ZHHStaticUIDataProvider使用示例.md'
end
