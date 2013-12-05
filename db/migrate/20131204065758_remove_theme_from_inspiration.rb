class RemoveThemeFromInspiration < ActiveRecord::Migration
  def change
        remove_column :inspirations, :theme
  end
end
