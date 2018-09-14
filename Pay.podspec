#
# Be sure to run `pod lib lint Pay.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Swift-Pay'
  s.version          = '0.1.0'
  s.summary          = 'Wechat and Alipay for Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Tank/Swift-Pay'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tank' => 'frog2020@126.com' }
  s.source           = { :git => 'https://github.com/Tank/Swift-Pay.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.ios.deployment_target = '9.0'

  s.source_files = 'Pay/Classes/**/*.swift', 'Alipay/**/*.h', 'Wechat/**/*.h', 'Pay/Classes/*.h'
  
  s.vendored_frameworks = 'Alipay/AlipaySDK.framework'
  s.vendored_libraries  = 'Wechat/libWeChatSDK.a'
  s.frameworks = 'SystemConfiguration', 'Security', 'CoreTelephony', 'CFNetwork', 'UIKit', 'QuartzCore', 'CoreText', 'CoreGraphics', 'Foundation', 'CoreMotion'
  s.libraries = 'z', 'c++', 'sqlite3.0'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load' }
  
  s.resource_bundles = {
     'Pay' => ['Pay/Assets/**/*.{png, bundle}']
  }

  s.public_header_files = 'Pay/Classes/*.h', 'Alipay/**/*.h', 'Wechat/**/*.h'
  
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire'
end
