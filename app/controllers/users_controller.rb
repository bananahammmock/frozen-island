class UsersController < ApplicationController
	def index
		@user = current_user
		
		
	end

	def update
		@user = current_user
		@user.update(user_params)
		@user.save!
		redirect_to root_url
	end
private
	def user_params
		params.require(:user).permit(:email, :phone_number)	if params[:user]	
	end
end
