# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/dotenv/version'

Gem::Specification.new do |spec|
  spec.name = 'mina-dotenv'
  spec.version = Mina::Dotenv::VERSION::STRING
  spec.authors = ['Stanko Krtalić Rusendić']
  spec.email = ['stanko.krtalic@gmail.com']

  spec.summary = 'Dotenv tasks for mina'
  spec.description = 'Dotenv tasks for mina'

  spec.homepage = 'https://github.com/Stankec/mina-dotenv'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`
    .split("\x0")
    .reject { |f| f.match(/^(test|spec|features)\//) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'mina'
  spec.add_dependency 'mina-scp'

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
end
