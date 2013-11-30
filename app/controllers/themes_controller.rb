class ThemesController < ApplicationController
	def index
		@themes = Theme.all
	end
	def show
		@theme = Theme.find(params[:id])
		@current_subs = Subscription.where(:user_id => current_user.id, :theme_id => @theme.id)
		
	end

private
def theme_params
	 	params.require(:theme).permit(:name)
	 end
end