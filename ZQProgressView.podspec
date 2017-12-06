Pod::Spec.new do |s|
s.name                  = "ZQProgressView"
s.version               = "0.0.1"
s.summary               = "这是一个自定义的模拟加载进度条显示的库."
s.homepage              = "https://github.com/ZQQiOS/ZQProgressView"
s.license               = "MIT"
s.authors               = { "ZQQ" => "zqq0702@sina.com" }
s.source                = { :git => "https://github.com/ZQQiOS/ZQProgressView.git", :tag => "0.0.1" }
s.platform     = :ios, "8.0"
s.framework             = "UIKit"
s.source_files          = "ZQProgressView", "ZQProgressView/**/*.{h,m}"


end
