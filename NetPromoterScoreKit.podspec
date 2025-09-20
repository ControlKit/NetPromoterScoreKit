Pod::Spec.new do |spec|
  spec.name         = 'NetPromoterScoreKit'
  spec.version      = '0.0.1'
  spec.summary      = 'A short description of NetPromoterScoreKit.'

  spec.license = 'MIT'
  spec.summary = 'The launch NetPromoterScoreKit in all app is handled easily.'
  spec.homepage = 'https://github.com/ControlKit/NetPromoterScoreKit'
  spec.source = { :git => 'https://github.com/ControlKit/NetPromoterScoreKit.git', :tag => "#{spec.version}" }
  spec.ios.deployment_target = '13.0'
  spec.source_files = 'Sources/*.swift', 'Sources/**/*.swift', 'Sources/**/**/*.swift'
  spec.resources = 'Sources/NetPromoterScoreKit/Resources/*.xcassets'
  spec.authors = { 'Maziar Saadatfar' => 'maziar.saadatfar@gmail.com' }
  spec.swift_versions = ['5.0']
end
