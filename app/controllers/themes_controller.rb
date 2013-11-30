class ThemesController < ApplicationController
	def index
		@themes = Theme.all
	end
	def show
		@theme = Theme.find(params[:id])
		
	end
private
def theme_params
	 	params.require(:theme).permit(:name)
	 end
end