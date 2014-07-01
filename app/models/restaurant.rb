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

	def self.top4
		self.all.sample(4)
	end

	def get_address
		self.address
	end
end
