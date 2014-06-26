class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	def available?(party_size, date)
		restaurant.reservations.where(date: date).sum(:guest_count) + party_size <= 100
	end

	def already_reserved?(date, user)
		restaurant.reservations.where(date: date, user_id: user.id).exists?
	end
	
end

