class AddThemeNameToInspiration < ActiveRecord::Migration
  def change
        add_column :inspirations, :themename, :string
  end
end
