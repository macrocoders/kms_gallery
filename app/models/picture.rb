class Picture < ActiveRecord::Base
  belongs_to  :gallery
  mount_uploader :picture, GalleryUploader
end
