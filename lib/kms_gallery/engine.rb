require "friendly_id"
module KmsGallery
  class Engine < ::Rails::Engine
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
