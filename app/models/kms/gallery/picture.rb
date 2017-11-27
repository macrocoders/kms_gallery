module Kms
  module Gallery
    class Picture < ActiveRecord::Base
      self.table_name = 'pictures'
      belongs_to  :gallery
      mount_uploader :picture, GalleryUploader
      
      validates :picture, presence: true
    end
  end
end  
