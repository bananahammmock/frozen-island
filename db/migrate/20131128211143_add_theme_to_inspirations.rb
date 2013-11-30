class AddThemeToInspirations < ActiveRecord::Migration
  def change
  	add_column :inspirations, :theme, :string
  end
end
