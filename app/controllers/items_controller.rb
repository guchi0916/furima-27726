class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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

  def show   
  end

  def edit
    if user_signed_in?
      if current_user.id != @item.user_id
        redirect_to root_path
      end
    else 
      redirect_to new_user_session_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in?
      if current_user.id = @item.user_id
        @item.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end
    else 
      redirect_to new_user_session_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, 
                                 :name, 
                                 :price, 
                                 :item_detail, 
                                 :category_id, 
                                 :status_id, 
                                 :charge_delivery_fee_id, 
                                 :prefecture_id, 
                                 :day_id
                                ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
