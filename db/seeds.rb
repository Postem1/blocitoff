# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create Users
3.times do
  user = User.new(
        email:  Faker::Internet.email,
        password: 'password'
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

#Create items
75.times do
  item = Item.create!(
        user: users.sample,
        name: Faker::Lorem.sentence
  )
  item.update_attribute(:created_at, rand(3.days .. 14.days).ago)

end
items = Item.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
