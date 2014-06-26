class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = 'Account successfully created'
			redirect_to root_path
		else
			flash[:alert] = 'There has been an error'
			render :new
		end
	end

	def destroy
	end

	def update
	end

	def edit
	end

	def index
	end

	def show
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
