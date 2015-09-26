module KmsGallery
  class InstallGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../../', __FILE__)

    def insert_engine_routes
      route %(
        mount KmsGallery::Engine => '/kms'
      )
    end

    def insert_javascript
      append_file "app/assets/javascripts/application.js", "//= require kms_gallery/application\n"
    end

  end
end
