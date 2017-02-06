FactoryGirl.define do
  factory :show do
    name Faker::Book.name
    description Faker::Lorem.sentence(3)
    category
  end
end
