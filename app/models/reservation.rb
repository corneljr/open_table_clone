class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	# validates :availability

	private

	def availability
		if !restaurant.availability?(party_size, party_time)
			errors.add(:base, "Restaurant is full")
		end
	end
end

