class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が出品されました。'
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :shipping_cost_id,
                                 :shipping_date_id, :shipping_origin_id, :price).merge(user_id: current_user.id)
  end
end
