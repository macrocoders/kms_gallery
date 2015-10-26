class AddPositionToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :position, :integer, default: 0, null: false
  end
end
