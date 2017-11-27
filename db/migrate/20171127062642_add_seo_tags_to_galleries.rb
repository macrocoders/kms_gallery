class AddSeoTagsToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :h1, :string
    add_column :galleries, :meta_title, :string
    add_column :galleries, :meta_description, :string 
    add_column :galleries, :meta_keywords, :string
  end
end
