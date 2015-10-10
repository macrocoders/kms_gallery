class RemoveImagesFromGalleries < ActiveRecord::Migration
  def change
    remove_column :galleries, :images
  end
end
