class WhitePagesController < ApplicationController

	def home
		@top10 = Restaurant.top10
	end
	
end
