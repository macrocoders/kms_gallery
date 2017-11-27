require "friendly_id"
module Kms
  module Gallery
    class Engine < ::Rails::Engine
      engine_name 'kms_gallery'
      isolate_namespace Kms::Gallery
      config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    end
  end  
end
