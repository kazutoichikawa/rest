class Reservation < ApplicationRecord
belongs_to :shop
belongs_to :user

  with_options presence: true do
    validates :time
    validates :date
    validates :n_people
  end
  validate :if_date_is_tommorrow


  def if_date_is_tommorrow
    return if date.blank?
    errors.add(:date, "は今日以降のものを選択してください") if date < Date.today
  end
end
