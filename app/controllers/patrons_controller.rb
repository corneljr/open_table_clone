class PatronsController < ApplicationController

	def create
		@patron = Patron.new(patron_params)

		if @patron.save 
			session[:user_id] = @patron.id
			flash[:notice] = 'Account successfully created'
			redirect_to root_path
		else
			flash[:alert] = 'There has been an error'
			redirect_to new_user_path
		end
	end

	def show
		@reservations = current_user.reservationsx
	end

	def destroy
	end

	private

	def patron_params
		params.require(:patron).permit(:email, :password, :password_confirmation)
	end

end
