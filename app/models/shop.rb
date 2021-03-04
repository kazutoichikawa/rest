class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :prefecture
  belongs_to :tag
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :image

    with_options presence: true do
      validates :image
      validates :shop_name , length: { maximum: 40 }
      validates :profile,    length: { maximum: 1000 }
      validates :p_num,      format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/},
                             length: { in: 1..13 }  
      validates :p_code,     format: { with: /\A\d{3}[-]\d{4}\z/}
      validates :city
      validates :address
      validates :genre_id
      validates :prefecture_id
    end

    after_commit :add_default_image, only: [:create, :update]

    def add_default_image
      unless image.attached?
        image.attach(io: File.open(Rails.root.join('app/assets/images/test-shop-image.jpg')),
        filename: 'test-shop-image.jpg')
      end
    end
end
