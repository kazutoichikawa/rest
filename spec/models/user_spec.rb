require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nameとemail,passwordとpassword_confirmation,l_name,f_name,l_name_r,f_name_r,birthday,p_numが存在すると登録できる' do
        expect(@user).to be_valid
      end
    end
  
    context '新規登録がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailに@が含まれなければ登録できない' do
        @user.email = "samplesample.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'emailが一意性でなければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "sampl1"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end
      it 'passwordが英語だけだと登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end
      it 'passwordがに記号が含まれると登録できない' do
        @user.password = "@aaaa1"
        @user.password_confirmation = "@aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordとpassword_confirmationが一致していなければ登録できない' do
        @user.password_confirmation = "test56"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'l_name_rが空だと登録できない' do
        @user.l_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "L name can't be blank"
      end
      it 'f_name_rが空だと登録できない' do
        @user.f_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "F name can't be blank"
      end
      it 'l_name_rが空だと登録できない' do
        @user.l_name_r = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "L name r can't be blank"

      end
      it 'f_name_rが空だと登録できない' do
        @user.f_name_r = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "F name r can't be blank"
      end
      it 'l_nameが半角だと登録できない' do
        @user.l_name = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include "L name Full-width characters"
      end
      it 'f_nameが半角だと登録できない' do
        @user.f_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include "F name Full-width characters"

      end
      it 'l_name_rが半角カナだと登録できない' do
        @user.l_name_r = "ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include "L name r Full-width katakana characters"
      end
      it 'l_name_rが漢字だと登録できない' do
        @user.l_name_r = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include "L name r Full-width katakana characters"
      end
      it 'l_name_rが英語だと登録できない' do
        @user.l_name_r = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include "L name r Full-width katakana characters"
      end
      it 'f_name_rが半角カナだと登録できない' do
        @user.f_name_r = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include "F name r Full-width katakana characters"
      end
      it 'f_name_rが漢字だと登録できない' do
        @user.f_name_r = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include "F name r Full-width katakana characters"
      end
      it 'f_name_rが英語だと登録できない' do
        @user.f_name_r = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include "F name r Full-width katakana characters"
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it '電話番号が空だと登録できない'do
        @user.p_num = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("P num can't be blank")
      end
      it '電話番号に文字列が含まれていると登録できない'do
        @user.p_num = "あああああああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("P num is invalid")
      end
      it '電話番号にハイフンが含まれていると登録できない'do
        @user.p_num = '080-1234-5678'
        @user.valid?
        expect(@user.errors.full_messages).to include("P num is too long (maximum is 11 characters)")
      end

      it '電話番号が12桁以上だと登録できない'do
        @user.p_num = '080-1234-567891'
        @user.valid?
        expect(@user.errors.full_messages).to include("P num is too long (maximum is 11 characters)")
      end
    end
  end
end
