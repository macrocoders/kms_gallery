module Kms
  module Gallery
    class PictureDrop < Liquor::Drop
      export :url

      def url
        self.source.picture.url
      end
    end
  end  
end  
