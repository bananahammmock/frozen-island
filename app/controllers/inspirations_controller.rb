class InspirationsController <ApplicationController
	
	def index
		@inspirations = Inspiration.all
	end
	
	def new
		@insp = Inspiration.new
		@insp.quote = params[:quote]
		@insp.theme_id = 6
		@insp.save!
		flash[:notice] = "You have added #{@insp.quote}"
		redirect_to root_url
	end

private
	
	def inspiration_params
		params.require(:inspiration).permit(:quote)
	end
end