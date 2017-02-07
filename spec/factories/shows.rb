FactoryGirl.define do
  factory :show do
    name FFaker::Movie.name
    description FFaker::Lorem.sentence(3)
    category
  end
end
