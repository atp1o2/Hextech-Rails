FactoryGirl.define do
  factory :game do
    datePlayed { Faker::Date.backward(200) }
  end
end
