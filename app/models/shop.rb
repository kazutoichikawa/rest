class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :prefecture

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :shop_tag_relations, dependent: :destroy
  has_many :tags, through: :shop_tag_relations
  has_one_attached :image

    with_options presence: true do
      validates :image
      validates :shop_name , length: { maximum: 40 }
      validates :profile,    length: { maximum: 400 }
      validates :p_num,      format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/},
                             length: { in: 1..12 }  
      validates :p_code,     format: { with: /\A\d{3}[-]\d{4}\z/}
      validates :city
      validates :address
        with_options numericality: { other_than: 1 } do
          validates :genre_id
          validates :prefecture_id
        end
    end
end
