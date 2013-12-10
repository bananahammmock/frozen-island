class InspirationsController < ApplicationController
	
	def index
		@inspirations = Inspiration.all
	end
	
	def new
		@insp = Inspiration.new
		@insp.quote = params[:quote]
		@insp.theme_id = 6
		@insp.save!
		flash[:notice] = "You have added #{@insp.quote}"
		redirect_to "/themes/6"
	end
	def show
		@insp = Inspiration.find(params[:id])
		x = @insp.id
		@y = x+= 1
		
	end
	def update
		@insp = Inspiration.find(params[:id])
		x = @insp.id
		@y = x+= 1
		@insp.update(inspiration_params)
		# if params[:commit] == 'hello'
  #   elsif params[:commit] == 'bye'
  #   elsif params[:commit] == 'whatevs'
  #   end
    @insp.save
		
		redirect_to "/inspirations/#{@y}"
		
	end
	def destroy
		@theme = Theme.find(6)
		@inspiration = Inspiration.find(params[:id])
		@inspiration.destroy
		# @subscriptions = Subscription.where(:user_id => current_user.id, :theme_id => @theme.id)
		# @subscriptions.destroy_all
		redirect_to "/themes/6"
	end
private
	
	def inspiration_params
		params.require(:inspiration).permit(:quote, :status, :theme_id)
	end
end