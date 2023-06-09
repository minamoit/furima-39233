require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入記録の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空でも購入できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号は空では保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号を入力してください')
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @purchase_address.postal_code = '123-123４'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号は「3桁-4桁」の半角数値で入力してください')
      end
      it '郵便番号にハイフンが含まれていないと保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号は「3桁-4桁」の半角数値で入力してください')
      end
      it '都道府県に「---」が選択されている場合は購入できないこと' do
        @purchase_address.shipping_origin_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('都道府県を入力してください')
      end
      it '市区町村が空だと購入できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('市区町村を入力してください')
      end
      it '番地が空だと購入できないこと' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('番地を入力してください')
      end
      it '電話番号が空だと購入できないこと' do
        @purchase_address.telephone = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号を入力してください')
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @purchase_address.telephone = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は10文字以上で入力してください')
      end
      it '電話番号が12桁以上だと購入できない' do
        @purchase_address.telephone = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は11文字以内で入力してください')
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @purchase_address.telephone = '０9012341234'
        @purchase_address.valid?
        expect(@purchase_address.errors[:telephone]).to include('電話番号は数値で入力してください')
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Userを入力してください')
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Itemを入力してください')
      end
      it 'カード情報が空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('カード情報を入力してください')
      end
    end
  end
end
