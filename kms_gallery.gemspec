$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kms_gallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kms_gallery"
  s.version     = KmsGallery::VERSION
  s.authors     = ["Ivan"]
  s.email       = ["ivfefilov@gmail.com"]
  s.homepage    = "http://webgradus.ru"
  s.summary     = "Summary of KmsGallery."
  s.description = "Description of KmsGallery."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency 'friendly_id', '~> 5.0.0'
  s.add_dependency 'babosa'
  s.add_dependency 'carrierwave'
  s.add_dependency 'mini_magick'
  s.add_dependency 'carrierwave-imageoptimizer'

  s.add_development_dependency "sqlite3"
end
