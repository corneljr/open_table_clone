class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	has_many :reviews

	validates :name, presence: true
	validates :address, presence: true
	validates :price_range, presence: true
	validates :summary, presence: true

end
