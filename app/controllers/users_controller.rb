class UsersController < ApplicationController

	def new
		@patron = Patron.new
		@owner = Owner.new
	end

	def show
		@restaurants = current_user.restaurants
		@reservations = current_user.reservations
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.update(user_params)
		if @user.save
			redirect_to @user, notice: "Information successfully updated"
		else
			render :edit, alert: "Please fill out valid information"
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
