# User.create!(
#   name:  "管理者",
#   email: "admin@example.jp",
#   f_name: "あどみん",
#   l_name: "あどみん",
#   f_name_r: "アドミン",
#   l_name_r: "アドミン",
#   password:  "admin11",
#   password_confirmation: "admin11",
#   birthday: "1994-11-24",
#   p_num: "08012345678",
#   admin: true
# )
# User.create!(
#   name:  "サンプル",
#   email: "sample@sample.jp",
#   f_name: "サン",
#   l_name: "プル",
#   f_name_r: "サン",
#   l_name_r: "プル",
#   password:  "sample11",
#   password_confirmation: "sample11",
#   birthday: "1994-11-24",
#   p_num: "08012345678",
#   admin: false
# )

30.times do |m|
  Shop.create(
    shop_name: "店#{m + 1}",
    genre_id: 1,
    tag_id: 1,
    profile: "店#{m + 1}の詳細が表示されます",
    p_num: "0561-12-3456",
    p_code: "123-4567",
    prefecture_id: m + 1,
    city: "テスト市",
    address: "12-3",
    building: "テストビル",
    user_id: 1,
  )
end




# Tag.create( name:'カジュアル')
# Tag.create( name:'高級志向' )
# Tag.create( name:'リーズナブル')
# Tag.create( name:'珈琲がおいしい')
# Tag.create( name:'アルコールの種類豊富' )
# Tag.create( name:'個性派・おもしろ' )
# Tag.create( name:'内装にこだわり')
# Tag.create( name:'シェフが凄腕' )
# Tag.create( name:'スイーツにこだわり' )
# Tag.create( name:'辛党向き')
# Tag.create( name:'甘党向き' )
# Tag.create( name:'テイクアウト')
