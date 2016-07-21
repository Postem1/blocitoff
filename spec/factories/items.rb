require 'faker'

FactoryGirl.define do
   factory :item do |i|
     i.name { Faker::Sentence.name }
     i.user
   end
 end
