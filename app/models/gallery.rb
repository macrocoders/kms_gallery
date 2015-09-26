class Gallery < ActiveRecord::Base
  include Liquor::Dropable
  mount_uploader :poster, SlideUploader
  mount_uploaders :images, SlideUploader
end
