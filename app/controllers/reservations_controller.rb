class ReservationsController < ApplicationController

	def create
		date = DateTime.new(reservation_params[:year].to_i, reservation_params[:month].to_i, reservation_params[:day].to_i, reservation_params[:hour].to_i, 0, 0)
		@reservation = current_user.reservations.new
		@reservation.date = date
		@reservation.restaurant_id = params[:restaurant_id]
		@reservation.guest_count = reservation_params[:guest_count]

		if @reservation.already_reserved?(date, current_user)
			redirect_to restaurant_path(params[:restaurant_id]), alert: 'You can hold one reservation at a time'
		elsif @reservation.available?(@reservation.guest_count, @reservation.date) && @reservation.save
			redirect_to user_path(current_user), notice: "Reservation confirmed"
		elsif
			redirect_to restaurant_path(params[:restaurant_id]), alert: 'The restaurant is full at this time'
		end
	end

	def destroy
		Reservation.find(params[:id]).destroy
		redirect_to current_user
	end

	private

	def reservation_params
		params.require(:reservation).permit(:year, :month, :day, :hour, :guest_count, :restaurant_id)
	end
end
