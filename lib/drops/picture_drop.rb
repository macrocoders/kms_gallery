class PictureDrop < Liquor::Drop
  export :url

  def url
    self.source.picture.url
  end
end
