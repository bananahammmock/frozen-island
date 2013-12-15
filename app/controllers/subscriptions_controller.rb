class SubscriptionsController < ApplicationController
def new
@theme = Theme.find(params[:theme_id])
	if current_user.phone_number == nil
			redirect_to "/users/#{current_user.id}"
			flash[:alert] = "Please input phone number to subscribe"
	
	else
		if @theme.inspirations.each.count == 0
			redirect_to "/themes/6"
			flash[:alert] = "Please add quotes to subscribe"
		else
		# this_theme = Theme.find(params[:theme_id])
    @theme = Theme.find(params[:theme_id])
		current_sub = Subscription.where(:user_id => current_user.id, :theme_id => @theme.id)
		if current_sub.count == 0
			@subscription = Subscription.new
			@subscription.user_id = current_user.id
			@subscription.theme_id = @theme.id
				if @subscription.save
					begin
    			@inspirations = @theme.inspirations
    			@inspiration = @inspirations.sample
    			number_to_send_to = "+1#{current_user.phone_number}"
   				twilio_sid = "AC4eada82bf78d9b4111871a0148af29a8"
   				twilio_token = "7487cd98f26533f386dbfcfb70570a73"
    			twilio_phone_number = "7142942970"
    			@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    			@text = @twilio_client.account.messages.create(
     		 		:from => "+1#{twilio_phone_number}", :to => number_to_send_to, :body => "#{@theme.name}: #{@inspiration.quote}"
    			)
					flash[:alert] = "You have subscribed to #{@theme.name}"
					redirect_to root_path
					rescue Twilio::REST::RequestError
						@subscription.destroy
						redirect_to '/users/update'
						flash[:alert] = "Please input a valid number."
					end
				else
					redirect_to '/users/update'
				end
      else
        redirect_to root_path
			end
		end
		end
end

	def destroy
		@theme = Theme.find(params[:theme_id])
		@subscriptions = Subscription.where(:user_id => current_user.id, :theme_id => @theme.id)
		@subscriptions.destroy_all
		flash[:alert] = "You have unsubscribed from #{@theme.name}"
		redirect_to root_path
	end
	
end