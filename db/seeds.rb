# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

address_list = [
	'56 York St Toronto ON M5J 1S8', 
	'22 Front St W Toronto ON M5J 1C4',
	'390 Danforth Ave Toronto ON M4K 1P3',
	'277 Augusta Ave Toronto ON M5T 2M1',
	'2028 Queen St E Toronto ON M4L 1J4',
	'181 Bay St Toronto ON M5J 2T3',
	'679 St Clair Ave W Toronto ON M6C 1A7',
	'1085 Bathurst St Toronto ON M5R 3G8',
	'220 Yonge St Toronto ON M5B 2H1',
	'17 Baldwin St Toronto ON M5T 1L1',
	'3200 Dufferin St North York ON M6A 3B2'
]

price = %w[$10-$20 $20-$30 $30-$40 '$40+']

100.times do 
	Restaurant.create(name: Faker::Company.name, address: address_list.sample, summary: Faker::Lorem.paragraph, user_id: rand(1..5), price_range: price.sample)
end


10.times do
	User.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password', type: 'Patron')
	User.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password', type: 'Owner')
end

def rand_time(from=Time.now, to)
	rounded = Time.at(((rand_in_range(from.to_f, to.to_f)/3600.0).round)*3600)
end

def rand_in_range(from,to)
	rand * (to - from) + from
end

500.times do 
	user = User.find(rand(1..11))
	Reservation.create(date: rand_time(5.days.from_now), user_id: user.id, guest_count: rand(1..15), restaurant_id: rand(1..100))
	user.loyalty_points += 1000
end

500.times do 
	Review.create(body: Faker::Lorem.sentence, user_id: rand(1..11), restaurant_id: rand(1..11), rating: rand(1..5))
end



















