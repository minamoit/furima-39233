class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])  # 選択された商品を取得する
    @purchase = Purchase.new  # 空のPurchaseオブジェクトを作成する
  end

  def new
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
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
                                             :telephone).merge(user_id: current_user.id)

  end

end
