class PurchasesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :redirect_root


  def index
    @purchase_address = PurchaseAddress.new
  end
 
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, 
                                             :prefecture_id, 
                                             :city, 
                                             :address, 
                                             :build_name, 
                                             :phone_number, 
                                             :purchase_id,).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'          
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_root
    if (current_user.id == @item.user_id) || @item.purchase.present?
      redirect_to root_path
    end
  end
end
