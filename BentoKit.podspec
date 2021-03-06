Pod::Spec.new do |s|

  s.name          = "BentoKit"
  s.version       = "0.3"
  s.summary       = "Common components and toolbox for building component based interfaces. Built on top of Bento."

  s.description   = <<-DESC
                    Common components and toolbox for building component based interfaces. Built on top of Bento.
                    DESC

  s.homepage      = "https://github.com/Babylonpartners/Bento"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.author        = { "Babylon iOS" => "ios.development@babylonhealth.com" }
  s.ios.deployment_target = '10.0'

# Switch back to use the version tag when we release 0.4.
  s.source           = { :git => "https://github.com/Babylonpartners/Bento.git", :branch => "master" } #, :tag => "#{s.version}" }
  s.source_files     = 'BentoKit/BentoKit/**/*.swift'
  s.resource_bundles =  { 'BentoKit' => 'BentoKit/BentoKit/Resources/Media.xcassets' }
  s.exclude_files    = 'BentoKit/BentoKit/Components.playground/**/*'

  s.swift_version = "4.2"
# Switch back to use the master spec when we release 0.4.
  s.dependency "Bento"
  s.dependency "StyleSheets"
  s.dependency "ReactiveSwift", "~> 4.0.0"
  s.dependency "ReactiveCocoa", "~> 8.0.2"
end
