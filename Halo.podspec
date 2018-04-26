Pod::Spec.new do |s|
  s.name                = "Halo"
  s.version             = "0.1.7"
  s.summary             = "My own iOS development kit, written by Swift."
  s.homepage            = "https://github.com/HaloWang/Halo"
  s.license             = { :type => "MIT", :file => "LICENSE" }
  s.author              = { "王策" => "634692517@qq.com" }
  s.platform            = :ios, "8.0"
  s.source              = { :git => "https://github.com/HaloWang/Halo.git", :tag => s.version }
  s.source_files        = "Halo/Classes/*.{swift}"
  s.frameworks          = "UIKit"
  s.requires_arc        = true
  s.swift_version       = '4.1'
end
