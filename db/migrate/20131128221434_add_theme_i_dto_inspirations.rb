class AddThemeIDtoInspirations < ActiveRecord::Migration
  def change
  	add_column :inspirations, :theme_id, :integer
  end
end
