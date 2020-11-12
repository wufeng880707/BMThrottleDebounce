Pod::Spec.new do |spec|
  spec.name         = 'BMThrottleDebounce'
  spec.version      = '0.0.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/zhengbomo/BMThrottleDebounce'
  spec.authors      = { 'zhengbomo' => 'zhengbomo@hotmail.com' }
  spec.summary      = 'throttle and debounce trigger'
  spec.source       = { :git => 'https://github.com/zhengbomo/BMThrottleDebounce.git', :tag => '0.0.1' }
  spec.source_files = 'ThrottleDebounce/*.{h,m}'
  spec.ios.deployment_target = '9.0'
end
