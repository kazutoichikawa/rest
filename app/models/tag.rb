class Tag < ActiveHash::Base
  self.data = [
    { id: 1, name: 'カジュアル' },
    { id: 2, name: '内装にこだわり' },
    { id: 3, name: 'リーズナブル' },
    { id: 4, name: '高級志向' },
    { id: 5, name: 'シェフが凄腕' },
    { id: 6, name: 'ファミリー向け' },
    { id: 7, name: '大人数で入れる' },
    { id: 8, name: '個性派' },
    { id: 9, name: '珈琲がおいしい' },
    { id: 10, name: 'こだわりスイーツ' },
    { id: 11, name: 'テイクアウト' },
    { id: 12, name: '辛党におすすめ' }
  ]
  include ActiveHash::Associations
  has_many :shops
end
