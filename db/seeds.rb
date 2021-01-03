User.create!(
  name:  "管理者",
  email: "admin@example.jp",
  f_name: "あどみん",
  l_name: "あどみん",
  f_name_r: "アドミン",
  l_name_r: "アドミン",
  password:  "admin11",
  password_confirmation: "admin11",
  birthday: "1994-11-24",
  p_num: "08012345678",
  admin: true
)

Tag.create( name:'カジュアル')
Tag.create( name:'高級志向' )
Tag.create( name:'リーズナブル')
Tag.create( name:'珈琲がおいしい')
Tag.create( name:'アルコールの種類豊富' )
Tag.create( name:'個性派・おもしろ' )
Tag.create( name:'内装にこだわり')
Tag.create( name:'シェフが凄腕' )
Tag.create( name:'スイーツにこだわり' )
Tag.create( name:'辛党向き')
Tag.create( name:'甘党向き' )
Tag.create( name:'テイクアウト')