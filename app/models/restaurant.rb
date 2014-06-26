class Restaurant < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :address, presence: true
	validates :price_range, presence: true
	validates :summary, presence: true

	def available?(party_size)
		restaurant.sum(:guest_count) + party_size <= 100
	end
end
