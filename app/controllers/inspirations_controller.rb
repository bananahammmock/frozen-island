class InspirationsController <ApplicationController
	def index
		@inspirations = Inspiration.all
	end
	def new
		@bob = Inspiration.all
		@bob.each do |b|
			@bobby = b
		end
		@insp = Inspiration.new
		@insp.quote = @bob
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