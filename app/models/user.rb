class User < ActiveRecord::Base
	
	has_secure_password

	has_many :restaurants
	has_many :reservations
	has_many :reviews

	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, presence: true, confirmation: true, length: { minimum: 5 }

end
