class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: "商品が出品されました。"
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:images, :name, :description, :price, :category_id, :condition, :category)
  end

end
