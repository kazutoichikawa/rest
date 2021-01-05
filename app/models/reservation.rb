class Reservation < ApplicationRecord
belongs_to :shop
belongs_to :user

  with_options presence: true do
    validates :time
    validates :date
    validates :n_people
  end
end
