class RestaurantsController < ApplicationController

	def index
		@distance = params[:miles]
		@price = params[:price]
		@restaurants = Restaurant.near(params[:q],@distance).where(price_range: @price)
	end

	def all
		@restaurants = if params[:search]
			Restaurant.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%").page(params[:page])
		else
			Restaurant.order('restaurants.name ASC').page(params[:page])
		end

		respond_to do |format| 
			format.html
			format.js 
		end

	end

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
		@review = Review.new
	end	

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :address, :price_range, :summary, :restaurant)
	end

end
