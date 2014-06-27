class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	has_many :reviews

	validates :name, presence: true
	validates :address, presence: true
	validates :price_range, presence: true
	validates :summary, presence: true

	geocoded_by :get_address 
	before_save :geocode #auto-fetches coordinates

	def self.top10
		limit(10).find_by_sql("SELECT * FROM restaurants 
														INNER JOIN reviews ON restaurants.id = reviews.id 
														INNER JOIN (
															SELECT AVG(rating) avg_rating, restaurant_id 
															FROM reviews 
															GROUP BY restaurant_id) avg_res_rating ON restaurants.id = avg_res_rating.restaurant_id 
														ORDER BY avg_res_rating.avg_rating DESC")
	end

	def get_address
		self.address
	end
end
