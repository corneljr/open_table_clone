class RestaurantsController < ApplicationController

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = current_user.restaurants.build(restaurant_params)
		if @restaurant.save
			redirect_to current_user
		else
			render :new 
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reservation = Reservation.new
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :address, :price_range, :summary, :restaurant)
	end

end
