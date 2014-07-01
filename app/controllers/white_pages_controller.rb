class WhitePagesController < ApplicationController

	def home
		@top4 = Restaurant.top4
	end
	
end
