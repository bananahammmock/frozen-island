class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash[:alert] = @user.errors.messages
      render :new
    end
  end

	def index
		if current_user
		@user = current_user
		@themes = Theme.all
		@user_themes_array = current_user.themes
		
		# @user_quotes = @user_themes.each.inspirations
		end
	end

	def show
		@user = current_user
	end
	def update
		@user = current_user
		@user.update(user_params)
		@user.phone_number = @user.phone_number.tr(")( -","")
		if @user.save
		flash[:alert] = "You have updated your information."
		redirect_to root_url
		else
			redirect_to "/users/#{current_user.id}"
			flash[:alert] = "That is not a valid number."
		end
	end
private

	def user_params
		params.require(:user).permit(:email, :phone_number, :name)
	end
end
