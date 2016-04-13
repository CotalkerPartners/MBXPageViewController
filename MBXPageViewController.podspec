Pod::Spec.new do |s|
  s.name	 = 'MBXPageViewController'
  s.version      = "1.0.0"
  s.summary      = "Easy, clean and fast UIPageController with Control Buttons."
  s.homepage     = "https://github.com/Moblox/MBXPageViewController"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "Nicolas A" => "nicolas@moblox.io" }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source       = { :git => "https://github.com/Moblox/MBXPageViewController.git", :tag => "1.0.0" }

  s.source_files  =  "MBXPageController/MBXPageViewController/*.{h,m}"
end
