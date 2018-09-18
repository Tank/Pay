Pod::Spec.new do |s|
  s.name             = 'Pay'
  s.version          = '0.0.4'
  s.summary          = 'Wechat and Alipay for Swift'
  s.homepage         = 'https://github.com/Tank/Pay'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tank' => 'frog2020@126.com' }
  s.source           = { :git => 'https://github.com/Tank/Pay.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.ios.deployment_target = '9.0'

  s.source_files = 'Pay/Classes/**/*.swift', 'Alipay/**/*.h', 'Wechat/**/*.h', 'Pay/Classes/*.h'
  
  s.vendored_frameworks = 'Alipay/AlipaySDK.framework'
  s.vendored_libraries  = 'Wechat/libWeChatSDK.a'
  s.frameworks = 'SystemConfiguration', 'Security', 'CoreTelephony', 'CFNetwork', 'UIKit', 'QuartzCore', 'CoreText', 'CoreGraphics', 'Foundation', 'CoreMotion'
  s.libraries = 'z', 'c++', 'sqlite3.0'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load' }
  
  s.resource_bundles = {
     'Pay' => ['Pay/Assets/**/*.png', 'Alipay/AlipaySDK.bundle']
  }
  s.public_header_files = 'Pay/Classes/*.h', 'Alipay/**/*.h', 'Wechat/**/*.h'
  
  s.dependency 'Alamofire'
end
