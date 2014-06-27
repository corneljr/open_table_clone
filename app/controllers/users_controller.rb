class UsersController < ApplicationController

	def new
		@patron = Patron.new
		@owner = Owner.new
	end

	def show
		@restaurants = current_user.restaurants
		@reservations = current_user.reservations
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
