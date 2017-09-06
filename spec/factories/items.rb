FactoryGirl.define do
  factory :item do
    name { Faker::Lorem.name }
  end
end
