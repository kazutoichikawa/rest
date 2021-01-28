FactoryBot.define do
  factory :review do
    text                  {Faker::Lorem.sentence}

  association :user
  association :shop
  end
end