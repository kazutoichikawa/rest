class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  validates :text , presence: true, length: { maximum: 100 }
end
