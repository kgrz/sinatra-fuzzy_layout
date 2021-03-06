# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "sinatra-fuzzy_layout"
  spec.version       = "0.0.6"
  spec.authors       = ["Kashyap"]
  spec.email         = ["kashyap.kmbc@gmail.com"]
  spec.description   = %q{Provides ability to enable or disable layouts 
                          for multiple templates via Regex}
  spec.summary       = %q{
                          In Sinatra, the user can disable the layout 
                          template either globally or on a per template 
                          basis in the individual routes. This extension 
                          will provide support to enable or disable the 
                          layout rendering based on Regex description. 
                          Refer to Readme for more details
                          }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*") + ['Rakefile', 'README.md']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.0.0"
  spec.add_development_dependency "rspec", "~> 2.6"

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency "sinatra", "~> 1.3"
end
