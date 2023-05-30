require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報入力がうまくいかない時' do
      it "imagesが未選択では登録できない" do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Images can't be blank")
      end
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "descriptionが空では登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "categoryが未選択では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "conditionが未選択では登録できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_costが未選択では登録できない" do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it "shipping_originが未選択では登録できない" do
        @item.shipping_origin_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it "shipping_dateが未選択では登録できない" do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceは300~9,999,999以外は登録できない" do
        @item.price = '200'
        @item.valid?
        expect(@item.errors[:price]).to include("is out of setting range")

        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors[:price]).to include("is out of setting range")
      end

      it "item_nameは40字以上は登録できない" do
        @item = Item.new(item_name: "This is a very long item name that exceeds the maximum limit of 40 characters")
        expect(@item).to be_invalid
        expect(@item.errors[:item_name]).to include("is too long (maximum is 40 characters)")
      end
      it "descriptionが1001文字だと登録できない" do
        @item.description = "a" * 1001
        @item.valid?
        expect(@item.errors[:description]).to include("is too long (maximum is 1000 characters)")
      end
    end
  end
end
