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
    time_aftersix = Time.new + (60*60*6)
    if date < Date.today
      errors.add(:date, "現在からの6時間後が予約可能な最短時間です")
    elsif date == Date.today && time_aftersix > time
      errors.add(:time, "現在からの6時間後が予約可能な最短時間です")
    end
  end
end
