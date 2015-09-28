class Gallery < ActiveRecord::Base
  include Liquor::Dropable
  extend FriendlyId
  include Kms::Permalinkable
  include Kms::CompileTemplates
  friendly_id :title, use: :slugged
  mount_uploader :poster, SlideUploader
  mount_uploaders :images, SlideUploader
end
