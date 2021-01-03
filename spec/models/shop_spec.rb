require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @shop = FactoryBot.build(:shop)
  end

  describe '店舗新規登録' do
    context '店舗登録がうまくいく時' do
      it 'image,shop_name,profile,p_code,city,address,genre_id,prefecture_id,user_idがあれば登録できる' do
        expect(@shop).to be_valid
      end
      it 'buildingがなくても登録できる' do
        @shop.building = ""
        expect(@shop).to be_valid
      end
    end

    context '店舗登録がうまくいかない時' do
      it 'shop_nameが空では登録できない' do
        @shop.shop_name = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Shop name can't be blank"
      end
      it 'shop_nameが40文字を超えると登録できない' do
        @shop.shop_name = "a" * 41
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Shop name is too long (maximum is 40 characters)"
      end
      it 'profileが空では登録できない' do
        @shop.profile = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Profile can't be blank"
      end
      it 'profileが1000字を超えると登録できない' do
        @shop.profile = "a" * 1001
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Profile is too long (maximum is 1000 characters)"
      end
      it 'p_numが空では登録できない' do
        @shop.p_num = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "P num can't be blank"
      end
      it 'p_codeが空では登録できない' do
        @shop.p_code = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "P code can't be blank"
      end
      it 'p_codeにハイフンが含まれていないと登録できない' do
        @shop.p_code = "1234567"
        @shop.valid?
        expect(@shop.errors.full_messages).to include "P code is invalid"
      end
      it 'cityが空では登録できない' do
        @shop.city = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空では登録できない' do
        @shop.address = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Address can't be blank"
      end
      it 'genre_idが空では登録できない' do
        @shop.genre_id = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Genre can't be blank", "Genre is not a number"
      end
      it 'genre_idが1では登録できない' do
        @shop.genre_id = 1
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Genre must be other than 1"
      end
      it 'prefecture_idが空では登録できない' do
        @shop.prefecture_id = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが1では登録できない' do
        @shop.prefecture_id = 1
        @shop.valid?
        expect(@shop.errors.full_messages).to include "Prefecture must be other than 1"
      end
    end
  end
end