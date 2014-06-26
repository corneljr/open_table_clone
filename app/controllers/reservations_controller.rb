class ReservationsController < ApplicationController

	def create
		date = DateTime.new(reservation_params[:year].to_i, reservation_params[:month].to_i, reservation_params[:day].to_i, reservation_params[:hour].to_i, 0, 0)
		@reservation = current_user.reservations.new
		@reservation.date = date
		@reservation.guest_count = reservation_params[:guest_count]
		binding.pry
	end

	private

	def reservation_params
		params.require(:reservation).permit(:year, :month, :day, :hour, :guest_count)
	end
end
