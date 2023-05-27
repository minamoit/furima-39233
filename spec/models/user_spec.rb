require 'rails_helper'
require 'gimei'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        before do
          @user.first_name = 'あああ'
          @user.last_name = 'あああ'
          @user.password = 'test1234'
          @user.password_confirmation = 'test1234'
          @user.first_name_kana = 'アアア'
          @user.last_name_kana = 'アアア'
        end
        it '正常に登録できる' do
          expect(@user).to be_valid
        end
      end
      context '新規登録出来ない時' do
        it "nicknameが空では登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordが数字だけだと登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation is invalid")
        end
        it 'passwordが英字だけだと登録できない' do
          @user.password = 'aaaaaaa'
          @user.password_confirmation = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation is invalid")
        end
        it 'passwordが全角だと登録できない' do
          @user.password = 'ああああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation is invalid")
        end
        it 'passwordとconfirmが一致していないと登録できない' do
          @user.password = 'test12'
          @user.password_confirmation ='test123'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordが英数字混合でも6文字未満なら登録できない' do
          @user.password ='test1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: 'another@example.com')
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailには@が含まれていないと登録できない' do
          @user.email = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'first_nameが半角では登録できない' do
          @user.first_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'last_nameが半角では登録できない' do
          @user.last_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'first_name_kanaが半角では登録できない' do
          @user.first_name_kana = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it 'first_name_kanaがカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
          @user.first_name_kana = 'a1/あ亜'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it 'last_name_kanaが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'last_name_kanaが半角では登録できない' do
          @user.first_name_kana = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it 'last_name_kanaがカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
          @user.first_name_kana = 'a1/あ亜'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it 'birth_dayが空では登録できない' do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
      end
  end
end
