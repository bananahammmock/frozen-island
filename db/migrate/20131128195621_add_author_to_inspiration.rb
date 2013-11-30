class AddAuthorToInspiration < ActiveRecord::Migration
  def change
  	add_column :inspirations, :author, :string
  end
end
