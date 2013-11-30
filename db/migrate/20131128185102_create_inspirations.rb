class CreateInspirations < ActiveRecord::Migration
  def change
    create_table :inspirations do |t|
    	t.text :quote
      t.timestamps
    end
  end
end
