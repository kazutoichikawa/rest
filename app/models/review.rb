class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  validates :text, presence: true,
                   length: { maximum: 100 ,message: 'は100文字以内で入力してください'}
end