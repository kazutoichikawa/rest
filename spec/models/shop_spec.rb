require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @shop = FactoryBot.build(:shop)
  end

  describe '店舗新規登録' do
    context '店舗登録がうまくいく時' do
      it 'shop_name,profile,p_code,city,address,genre_id,prefecture_id,user_idがあれば登録できる' do
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
        expect(@shop.errors.full_messages).to include "店名を入力してください"
      end
      it 'shop_nameが40文字を超えると登録できない' do
        @shop.shop_name = "a" * 41
        @shop.valid?
        expect(@shop.errors.full_messages).to include "店名は40文字以内で入力してください"
      end
      it 'profileが空では登録できない' do
        @shop.profile = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "店舗プロフィールを入力してください"
      end
      it 'profileが1000字を超えると登録できない' do
        @shop.profile = "a" * 1001
        @shop.valid?
        expect(@shop.errors.full_messages).to include "店舗プロフィールは1000文字以内で入力してください"
      end
      it 'p_numが空では登録できない' do
        @shop.p_num = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "電話番号を入力してください"
      end
      it 'p_codeが空では登録できない' do
        @shop.p_code = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "郵便番号を入力してください"
      end
      it 'p_codeにハイフンが含まれていないと登録できない' do
        @shop.p_code = "1234567"
        @shop.valid?
        expect(@shop.errors.full_messages).to include "郵便番号は不正な値です"
      end
      it 'cityが空では登録できない' do
        @shop.city = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "市町村を入力してください"
      end
      it 'addressが空では登録できない' do
        @shop.address = ""
        @shop.valid?
        expect(@shop.errors.full_messages).to include "番地を入力してください"
      end
      it 'genre_idが空では登録できない' do
        @shop.genre_id = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include "ジャンルを入力してください"
      end

      it 'prefecture_idが空では登録できない' do
        @shop.prefecture_id = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include "都道府県を入力してください"
      end
    end
  end
end