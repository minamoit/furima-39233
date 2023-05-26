require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation、名前と名前（カナ）、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
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
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')      
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')      
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        user = User.new(password: "password") 
        user.valid?
        expect(user.errors[:password]).to include("Please enter a combination of alphanumeric characters")
        
        user.password = "password1"
        user.valid?
        expect(user.errors[:password]).not_to include("Please enter a combination of alphanumeric characters")
      end
      it '名前が空だと登録できない' do
        user = User.new(first_name: "", last_name: "Smith")
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
        
        user.first_name = "John"
        user.valid?
        expect(user.errors[:first_name]).not_to include("can't be blank")
      end
      it '名前（カナ）が空だと登録できない' do
        user = User.new(first_name_kana: "", last_name_kana: "Smith")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
        
        user.first_name_kana = "John"
        user.valid?
        expect(user.errors[:first_name_kana]).not_to include("can't be blank")
      end
      it '生年月日が空だと登録できない' do
        user = User.new
        user.valid?
        expect(user.errors[:birth_day]).to include("can't be blank")
        
        user.birth_day = Date.new(1990, 1, 1)
        user.valid?
        expect(user.errors[:birth_day]).not_to include("can't be blank")
      end
    end
  end
end
