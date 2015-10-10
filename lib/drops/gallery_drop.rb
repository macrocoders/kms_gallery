class GalleryDrop < Liquor::Drop
  attributes :title, :slug
  has_many :pictures

  export :poster_url

  def poster_url
    self.source.poster.url
  end
end
