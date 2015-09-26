class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :slug
      t.string :poster
      t.json :images
      
      t.timestamps null: false
    end
  end
end
