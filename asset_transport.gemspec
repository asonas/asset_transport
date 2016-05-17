# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asset_transport/version'

Gem::Specification.new do |spec|
  spec.name          = "asset_transport"
  spec.version       = AssetTransport::VERSION
  spec.authors       = ["asonas"]
  spec.email         = ["hzw1258@gmail.com"]

  spec.summary       = %q{Synchronises Assets in a Rails 4 application and Amazon S3 with aws-sdk. (Don't include fog.gem)}
  spec.description   = %q{After you run assets:precompile your compiled assets will be synchronised with your S3 bucket.}
  spec.homepage      = "https://github.com/asonas/assets_transport"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.dependency("aws-sdk", ">= 2.3.4")
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
