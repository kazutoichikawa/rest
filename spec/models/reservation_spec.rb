require 'rails_helper'
require 'date'
require 'time'

RSpec.describe Reservation, type: :model do
  before do
    @reservation = FactoryBot.build(:reservation)
  end

  describe '予約' do
    context '予約がうまくいく時' do
      it 'date,time,n_peopleがあれば登録できる' do
        expect(@reservation).to be_valid
      end
    end
    context '予約がうまくいかない時' do
      it 'dateが空では登録できない' do
        @reservation.date = ""
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "日付を入力してください"
      end
      it 'timeが空では登録できない' do
        @reservation.date = ""
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "日付を入力してください"
      end
      it '予約時間が現在時刻より6時間以内では登録できない' do
        @reservation.date = Date.today
        @reservation.time = Time.now
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "予約時間は現在から6時間後以降で入力してください"
      end
      it 'n_peopleが空では登録できない' do
        @reservation.n_people = ""
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "来店人数を入力してください"
      end
    end
  end
end