Pod::Spec.new do |s|
  s.name             = 'ZHHStaticTableView'
  s.version          = '0.0.1'
  s.summary          = '一个用于构建设置页面或静态表单的轻量级封装组件。'

  s.description      = <<-DESC
一个基于 UITableView 的封装，专为构建静态表格场景设计，
例如设置页、表单页等，支持分组、图标、标题、副标题、开关、箭头跳转等常见样式，也可以自定义
让开发者以声明式方式快速构建 UI，提升开发效率与可维护性。
                       DESC

  s.homepage         = 'https://github.com/yue5yueliang/ZHHStaticTableView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '桃色三岁' => '136769890@qq.com' }
  s.source           = { :git => 'https://github.com/yue5yueliang/ZHHStaticTableView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |core|
    core.source_files = 'ZHHStaticTableView/Classes/**/*'
    # 如果需要，添加依赖项或资源文件
    # core.resources = ['ZHHStaticTableView/Assets/*.xcassets']
  end
end
