class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    if user_signed_in?
      if current_user.id == @item.user_id
        redirect_to root_path
      end
    else 
      redirect_to new_user_session_path
    end
  end
 
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
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

end
