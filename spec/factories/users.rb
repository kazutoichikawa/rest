FactoryBot.define do
  factory :user do
    name                  {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {"test1234"}
    password_confirmation {password}
    l_name                {'手スと'}
    f_name                {'手スと'}
    l_name_r              {'テスト'}
    f_name_r              {'テスト'}
    birthday              {'1994-11-24'}
    p_num                 {"08012345678"}
  end
end