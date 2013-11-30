class AddUserIDtoSubscription < ActiveRecord::Migration
  def change
  	add_column :subscriptions, :user_id, :integer
  	remove_column :subscriptions, :inspiration_id
  end
end
