class Tag < ApplicationRecord
  has_many :shops, through: :shop_tag_relation, dependent: :destroy
end
