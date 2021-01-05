class User < ApplicationRecord
  has_many :shops
  has_many :reservations, dependent: :destroy
  has_many :reviews
  with_options presence: true do
    validates :name
    validates :email, uniqueness: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/, message: 'Include both letters and numbers'}
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'} do
     validates :l_name 
     validates :f_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'} do
     validates :l_name_r
     validates :f_name_r
    end
    validates :birthday
    validates :p_num, format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/},
                      length: { in: 1..13 }
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end