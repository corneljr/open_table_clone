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

names = [
	'Sooo good',
	'Hell of a restaurant',
	"Billy's Bistro",
	"Jimmy's Diner",
	"John's Restaurant",
	"The Place to Be",
	"Can't Believe it ain't Home Cookin'",
	"Amazing Food Place",
	"Bathurst Thirt Quencher's",
	"Just Come Eat",
	"No Regrets"
]

lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
price = %w[$10-$20 $20-$30 $30-$40 '$40+']

# address_list.zip(names).each do |address, name|
# 	Restaurant.create(name: name, address: address, summary: lorem, user_id: rand(1..5), price_range: price.sample)
# end

# emails_patron = %w[jim@jones.com josh@gmail.com jim@gmail.com bill@gmail.com someone@gmail.com]
# emails_owner = %w[johnson@gmail.com other@gmail.com uruguay@gmail.com ithaca@gmail.com gogo@gmail.com]

# emails_patron.each do |email|
# 	User.create(email: email, password: 'password', password_confirmation: 'password', type: 'Patron')
# end


# emails_owner.each do |email|
# 	User.create(email: email, password: 'password', password_confirmation: 'password', type: 'Owner')
# end


  def rand_time(from=Time.now, to)
  	rounded = Time.at(((rand_in_range(from.to_f, to.to_f)/3600.0).round)*3600)
  end

  def rand_in_range(from,to)
  	rand * (to - from) + from
  end

  500.times do 
  	user = User.find(rand(1..11))
  	Reservation.create(date: rand_time(5.days.from_now), user_id: user.id, guest_count: rand(1..15), restaurant_id: rand(1..11))
  	user.loyalty_points += 1000
  end


  body = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
  100.times do 
  	Review.create(body: body, user_id: rand(1..11), restaurant_id: rand(1..11), rating: rand(1..5))
  end



















