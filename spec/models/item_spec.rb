require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    before(:each) do
      I18n.locale = :ja
    end
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報入力がうまくいかない時' do
      it 'imageが未選択では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数値で入力してください')
      end
      it 'priceは300~9,999,999以外は登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors[:price]).to include('販売価格の範囲内で入力してください')

        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors[:price]).to include('販売価格の範囲内で入力してください')
      end

      it 'item_nameは40字以上は登録できない' do
        @item = Item.new(item_name: 'This is a very long item name that exceeds the maximum limit of 40 characters')
        expect(@item).to be_invalid
        expect(@item.errors[:item_name]).to include('40字以上は入力できません')
      end
      it 'descriptionが1001文字だと登録できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors[:description]).to include('文字数が多すぎます')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include('Userを入力してください')
      end
      it 'categotyに「---」が選択されていると出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include('カテゴリーを入力してください')
      end
      it 'conditionに「---」が選択されていると出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors[:condition_id]).to include('商品の状態を入力してください')
      end
      it 'shipping_costに「---」が選択されていると出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors[:shipping_cost_id]).to include('配送料を入力してください')
      end
      it 'shipping_originに「---」が選択されていると出品できない' do
        @item.shipping_origin_id = 1
        @item.valid?
        expect(@item.errors[:shipping_origin_id]).to include('都道府県を入力してください')
      end
      it 'shipping_dateに「---」が選択されていると出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors[:shipping_date_id]).to include('発送までの日数を入力してください')
      end
    end
  end
end
