Pod::Spec.new do |s|
  s.name         = "FXBlocks"
  s.version      = "1.0.1"
  s.summary      = "Delegate转Block"

  s.homepage     = "https://github.com/zqw87699/FXBlocks"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = {"zhangdazong" => "929013100@qq.com"}

  s.source       = { :git => "https://github.com/zqw87699/FXBlocks.git", :tag => "#{s.version}"}

  s.platform     = :ios, "7.0"

  s.source_files  = "Classes/*.{h,m}"

  s.public_header_files = "Classes/*.h"

  s.frameworks = "Foundation", "UIKit"

  s.module_name = 'FXBlocks' 

  s.requires_arc = true

  s.dependency 'FXCommon'

end