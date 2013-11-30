class SubscriptionsController < ApplicationController
	def new
		@theme = Theme.find(params[:theme_id])
		@current_sub = Subscription.where(:user_id => current_user.id, :theme_id => @theme.id)
		while @current_sub.count == 0 do
			@subscription = Subscription.new
			@subscription.user_id = current_user.id
			@subscription.theme_id = @theme.id
				if @subscription.save
					flash[:notice] = "You have subscribed to #{@theme.name}"
					redirect_to root_path
				else
					render new
				end	
		end
	end

	def destroy
		@theme = Theme.find(params[:theme_id])
		@subscriptions = Subscription.where(:user_id => current_user.id, :theme_id => @theme.id)
		@subscriptions.destroy_all
		flash[:notice] = "You have unsubscribed to #{@theme.name}"
		redirect_to root_path
	end
	
end