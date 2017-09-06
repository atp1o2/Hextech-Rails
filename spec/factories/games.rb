FactoryGirl.define do
  factory :game do
    datePlayed { Faker::Lorem.date }
  end
end
