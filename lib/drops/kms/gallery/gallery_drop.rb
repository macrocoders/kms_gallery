module Kms
  module Gallery
    class GalleryDrop < Liquor::Drop
      attributes :title, :slug, :h1, :meta_title, :meta_keywords, :meta_description
      has_many :pictures

      export :poster_url

      def poster_url
        self.source.poster.url
      end
    end  
  end
end
