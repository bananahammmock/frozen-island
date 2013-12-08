class Addstatustoinspirations < ActiveRecord::Migration
  def change
  	add_column :inspirations, :status, :string
  end
end
