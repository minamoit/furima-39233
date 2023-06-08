require 'rails_helper'
require 'gimei'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '正常に登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録出来ない時' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'Eメールが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードが存在してもパスワード(確認用)が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'パスワードが数字だけだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
      end
      it 'パスワードが英字だけだと登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
      end
      it 'パスワードが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
      end
      it 'パスワードとパスワード(確認用)が一致していないと登録できない' do
        @user.password = 'test12'
        @user.password_confirmation = 'test123'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'パスワードが英数字混合でも6文字未満なら登録できない' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '重複したEメールが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: 'another@example.com')
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'Eメールには@が含まれていないと登録できない' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角で入力してください')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字を入力してください')
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は全角で入力してください')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）を入力してください')
      end
      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は全角カナで入力してください')
      end
      it 'first_name_kanaがカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'a1/あ亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は全角カナで入力してください')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）を入力してください')
      end
      it 'last_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は全角カナで入力してください')
      end
      it 'last_name_kanaがカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'a1/あ亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は全角カナで入力してください')
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
