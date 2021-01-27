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
      errors.add(:date, "は現在から6時間後以降で入力してください")
    elsif date == Date.today && time_aftersix > time
      errors.add(:time, "は現在から6時間後以降で入力してください")
    end
  end
end
