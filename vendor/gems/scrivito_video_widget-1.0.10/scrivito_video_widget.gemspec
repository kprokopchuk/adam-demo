$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scrivito_video_widget/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.platform    = Gem::Platform::RUBY
  gem.name        = 'scrivito_video_widget'
  gem.version     = ScrivitoVideoWidget::VERSION
  gem.summary     = 'Scrivito video Widget.'
  gem.description = 'Scrivito video Widget.'

  gem.license     = 'LGPL-3.0'

  gem.authors     = ['Scrivito']
  gem.email       = ['support@scrivito.com']
  gem.homepage    = 'https://www.scrivito.com'

  gem.bindir      = 'bin'
  gem.executables = []
  gem.test_files  = Dir['spec/**/*']
  gem.files       = Dir[
    '{app,lib,scrivito}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md',
  ]

  gem.add_dependency 'bundler'
  gem.add_dependency 'scrivito_sdk'

  gem.add_dependency 'projekktor-rails'

  gem.add_development_dependency 'rake'
end
