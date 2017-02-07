require 'ffaker'

FactoryGirl.define do
  factory :category do
    name FFaker::Music.genre
  end
end
