Pod::Spec.new do |s|
  s.name         = "Halo"
  s.version      = "0.1.0"
  s.summary      = "My own iOS development kit, written by Swift 3."
  s.homepage     = "https://github.com/HaloWang/Halo"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "王策" => "634692517@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/HaloWang/Halo.git", :tag => "0.1.0" }
  s.source_files = "Halo/Source/**/*.{swift}"
  s.frameworks   = "UIKit"
  s.requires_arc = true

  s.subspec 'Foundation' do |ss|
    ss.source_files = "Halo/Source/Swift+Halo/*.{swift}"
  end

end
