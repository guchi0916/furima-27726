class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :price, :item_detail, :category_id, :status_id, :charge_delivery_fee_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end
end
