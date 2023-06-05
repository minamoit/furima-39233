class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])  # 選択された商品を取得する
    @purchase = Purchase.new  # 空のPurchaseオブジェクトを作成する
  end

  def new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path, alert: 'You cannot access this page.'
    else
      @purchase_address = PurchaseAddress.new
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params.merge(item_id: params[:item_id]))
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :shipping_origin_id, :city, :house_number, :building_name,
                                             :telephone, :hoge).merge(user_id: current_user.id)
  end
end
