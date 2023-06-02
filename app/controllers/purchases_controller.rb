class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])  # 選択された商品を取得する
    @purchase = Purchase.new  # 空のPurchaseオブジェクトを作成する
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(set_params)
    if @purchase.valid?
      @purchase.save
    end
  end

  private
  def set_params
    params.permit(:item_id, :user_id)
  end
end
