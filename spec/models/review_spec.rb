require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe '口コミ投稿' do
    context '口コミ投稿がうまくいく時' do
      it 'textがあれば登録できる' do
        expect(@review).to be_valid
      end
    end

    context '口コミ投稿がうまくいかない時' do
      it 'textが空では登録できない' do
        @review.text = ""
        @review.valid?
        expect(@review.errors.full_messages).to include "口コミを入力してください"
      end
      it 'textが100文字を超えると登録できない' do
        @review.text = "a" * 101
        @review.valid?
        expect(@review.errors.full_messages).to include "口コミは100文字以内で入力してください"
      end
    end
  end
end