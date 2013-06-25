# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "sinatra-fuzzy_layout"
  spec.version       = "0.0.3"
  spec.authors       = ["Kashyap"]
  spec.email         = ["kashyap.kmbc@gmail.com"]
  spec.description   = %q{Provides ability to enable or disable layouts 
                          for templates via Regex}
  spec.summary       = %q{
                          In Sinatra, the user can disable the layout 
                          template either globally or on a per template 
                          basis in the individual routes. This module 
                          will provide support to enable or disable the 
                          layout rendering based on Regex description. 
                          Refer to Readme for more details
                          }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*") + ['Rakefile', 'README.md'] + Dir.glob("spec/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "sinatra"
end
