Pod::Spec.new do |s|
  s.name             = 'Rewards'
  s.version          = '0.1.0'
  s.summary          = 'TIKI Rewards.'
  s.description      = <<-DESC
TIKI Rewards
                       DESC
  s.homepage         = 'https://github.com/tiki/apps-rewards-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'TIKI Team' => 'hello@mytiki.com' }
  s.source           = { :git => 'https://github.com/tiki/apps-rewards-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '15.0'

  s.source_files = 'Rewards/Classes/**/*'
  
  s.resource_bundles = {
    'RewardsAssets' => [
      'Rewards/Assets'
    ],
  }
  s.resources = 'Rewards/Assets'
end
