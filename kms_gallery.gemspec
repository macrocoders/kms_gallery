$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kms/gallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kms_gallery"
  s.version     = Kms::Gallery::VERSION
  s.authors     = ["Ivan Fefilov"]
  s.email       = ["ivfefilov@gmail.com"]
  s.homepage    = "http://webgradus.ru"
  s.summary     = "Summary of KmsGallery."
  s.description = "Description of KmsGallery."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'kms', ">= 0.9.0"
  s.add_dependency 'friendly_id', '~> 5.0'
  s.add_dependency 'babosa'
  s.add_dependency 'carrierwave'
  s.add_dependency 'mini_magick'
  s.add_dependency 'carrierwave-imageoptimizer'
end
