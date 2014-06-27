class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	after_create :add_user_points
	after_destroy :remove_user_points

	def remove_user_points
		self.user.loyalty_points -= self.guest_count * 20
	end

	def add_user_points
		self.user.loyalty_points += self.guest_count * 10
	end

	def available?(party_size, date)
		restaurant.reservations.where(date: date).sum(:guest_count) + party_size <= 100
	end

	def already_reserved?(date, user)
		restaurant.reservations.where(date: date, user_id: user.id).exists?
	end
	
end

