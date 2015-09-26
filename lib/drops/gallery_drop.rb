class GalleryDrop < Liquor::Drop
  attributes :title, :slug

  export :poster_url
  export :image_urls

  def poster_url
    self.source.poster.url
  end

  def image_urls
    urls = []
    self.source.images.map { |image| urls << image.url }
    urls
  end
end
