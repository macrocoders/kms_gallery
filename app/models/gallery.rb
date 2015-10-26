class Gallery < ActiveRecord::Base
  include Liquor::Dropable
  extend FriendlyId
  include Kms::Permalinkable
  include Kms::CompileTemplates
  friendly_id :title, use: :slugged
  has_many :pictures, dependent: :destroy
  mount_uploader :poster, GalleryUploader

  default_scope { order(:position) }
end
