# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-arduino"
  spec.version       = "0.0.1"
  spec.authors       = ["futoase"]
  spec.email         = ["futoase@gmail.com"]
  spec.description   = %q{Arduino connect plugin.}
  spec.summary       = %q{fluent-plugin-arduino}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "fluentd"
  spec.add_dependency "serialport"
end
