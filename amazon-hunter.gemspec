# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amazon/hunter/version'

Gem::Specification.new do |spec|
  spec.name          = 'amazon-hunter'
  spec.version       = Amazon::Hunter::VERSION
  spec.authors       = ['rbwsam']
  spec.email         = ['rbwsam@gmail.com']
  spec.description   = %q{Amazon Item lookup + search}
  spec.summary       = %q{Uses the Amazon Product Advertising API to lookup and search for Amazon Items}
  spec.homepage      = 'https://github.com/rbwsam/amazon-hunter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'amazon-ecs'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
