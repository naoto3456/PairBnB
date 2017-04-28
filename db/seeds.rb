# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = {}
user['password'] = 'asdf'
user['encrypted_password'] = 'asdf'

# ActiveRecord::Base.transaction do
#   20.times do 
#     user['first_name'] = Faker::Name.first_name 
#     user['last_name'] = Faker::Name.last_name
#     user['email'] = Faker::Internet.email
#     user['gender'] = rand(0..2)
#     user['phone_number'] = Faker::PhoneNumber.phone_number
#     user['location'] = Faker::Address.country
#     user['birthday'] = Faker::Date.between(50.years.ago, Date.today)

#     User.create(user)
#   end

listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::App.name
    listing['room_type'] = rand(0..2)
    #listing['location'] = Faker::Address.country
    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence
    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end 