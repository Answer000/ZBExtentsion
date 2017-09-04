Pod::Spec.new do |s|
   s.name         = 'ZBExtension'
   s.version      = '0.0.4'
   s.license      = { :type => "MIT", :file => "LICENSE" } 
   s.homepage     = 'https://github.com/AnswerXu/ZBExtentsion.git'
   s.author       = { "AnswerXu" => "zhengbo073017@163.com" }
   s.summary      = 'iOS开发中常用类封装'
   s.platform     = :ios, '8.0'
   s.source       = { :git => 'https://github.com/AnswerXu/ZBExtentsion.git', :tag => s.version }
   s.source_files = 'Extension_Swift/*.swift',
   s.frameworks   =  'UIKit'
   s.requires_arc = true
end

