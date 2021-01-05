class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '和食' },
    { id: 2, name: '洋食' },
    { id: 3, name: 'フランス料理' },
    { id: 4, name: 'スペイン料理' },
    { id: 5, name: 'イタリア料理' },
    { id: 6, name: '中華料理' },
    { id: 7, name: 'タイ料理' },
    { id: 8, name: '韓国料理' },
    { id: 9, name: 'ベトナム料理' },
    { id: 10, name: 'インド料理' },
    { id: 11, name: 'カフェ' }
  ]

  include ActiveHash::Associations
  has_many :shops
  end