class WhitePagesController < ApplicationController

	def home
		@top4 = Restaurant.top4[1..4]
	end
	
end
