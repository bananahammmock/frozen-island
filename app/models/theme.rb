class Theme < ActiveRecord::Base
	has_many :inspirations
	has_many :users, through: :subscriptions
end
