Pod::Spec.new do |s|
  s.name	 = 'MBXPageController'
  s.version      = "0.5.0"
  s.summary      = "Easy, clean and fast UIPageController with Control Buttons."
  s.homepage     = "https://github.com/Moblox/MBXPageViewController"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "Nicolas A" => "nicolas@moblox.io" }

  s.platform     = :ios, '7.0'

  s.source       = { :git => "https://github.com/Moblox/MBXPageViewController.git", :tag => "0.5.0" }

  s.source_files  =  "MBXPageViewController/MBXSegmentPage/*.{h,m}", "LICENSES/*"
end
