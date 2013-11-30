class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
    	t.integer :inspiration_id
    	t.integer :theme_id

      t.timestamps
    end
  end
end
