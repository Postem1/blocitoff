require 'faker'

FactoryGirl.define do
   factory :user do |u|
     u.name { Faker::Name.name }
     u.password 'password'
   end
 end
