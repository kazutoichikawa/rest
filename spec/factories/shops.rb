FactoryBot.define do
  factory :shop do
    shop_name       {"テスト"}
    profile         {"テスト"}
    genre_id        {2}
    p_num           {"0561-12-3456"}
    p_code          {"123-4567"}
    prefecture_id   {2}
    city            {"テスト"}
    address         {"テスト"}
    building        {"テスト"}

    after(:build) do |shop|
      shop.image.attach(io: File.open('app/assets/images/output-image1.png'), filename: 'default-image.png')
    end

    association :user
  end
end
