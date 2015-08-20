# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trellochow/version'

Gem::Specification.new do |spec|
  spec.name          = 'trellochow'
  spec.version       = Trellochow::VERSION
  spec.authors       = ['v4n']
  spec.email         = ['andre@vyanes.com']

  spec.summary       = %q{CLI tool to create trello card based for software development.}
  spec.description   = %q{CLI tool to create trello card based for software development.}
  spec.homepage      = 'https://github.com/v4n/trellochow'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f)  }
  spec.executables   << 'trellochow'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'ruby-trello'
end
