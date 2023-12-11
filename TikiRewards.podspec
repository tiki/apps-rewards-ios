Pod::Spec.new do |s|
  s.name             = 'TikiRewards'
  s.version          = '0.1.0'
  s.summary          = 'TIKI Rewards.'
  s.description      = <<-DESC
  The TIKI Rewards App is a low code solution for integrating reward functionalities into your iOS applications in exchange of user data licensing. 

  This SDK provides easy-to-use classes and functions to enhance your app with features like theming, account management, data capture, and licensing.  
                       DESC
  s.homepage              = 'https://github.com/tiki/apps-rewards-ios'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'TIKI Team' => 'hello@mytiki.com' }
  s.source                = { :git => 'https://github.com/tiki/apps-rewards-ios.git', :branch => 'main' }
  s.swift_version         = '5.1'
  s.ios.deployment_target = '15.0'

  s.source_files = 'Rewards/Classes/**/*'

  s.dependency 'CaptureReceipt'
  s.dependency 'BlinkReceipt'
  s.dependency 'BlinkEReceipt'
  s.dependency 'TikiSdkDebug'
  s.dependency 'TikiSdkRelease'

  s.resource_bundles = {
    'RewardsAssets' => [
      'Rewards/Assets'
    ],
  }
  s.resources = 'Rewards/Assets'
end
