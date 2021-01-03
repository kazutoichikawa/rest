FactoryBot.define do
  factory :shop do
    image           {Faker::Lorem.sentence}
    shop_name       {"テスト"}
    profile         {"テスト"}
    genre_id        {2}
    p_num           {"0561-12-3456"}
    p_code          {"123-4567"}
    prefecture_id   {2}
    city            {"テスト"}
    address         {"テスト"}
    building        {"テスト"}

    association :user
  end
end
