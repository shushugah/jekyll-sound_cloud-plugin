# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))
require 'jekyll/sound_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-sound_cloud'
  spec.summary       = 'Jekyll SoundCloud integration'
  spec.description   = 'Jekyll plugin adds Liquid Tag for generating embedded Soundcloud iframes'
  spec.version       = Jekyll::SoundCloud::VERSION
  spec.authors       = ['Chris Nunciato, Yonatan Miller']
  spec.email         = ['yonatan.miller@shushugah.com']
  spec.homepage      = 'https://github.com/shushugah/jekyll-sound_cloud-plugin'
  spec.licenses      = ['MIT']
  spec.files         = %w(Gemfile README.md) + Dir['lib/**/*'] + Dir['tasks/*']
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'jekyll', '~> 3.6'
  spec.add_development_dependency 'rake', '~> 11.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.41'
  spec.license = 'MIT'
end
