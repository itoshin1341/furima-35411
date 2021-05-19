class PurchasersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchaser = PurchaserAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchaser = PurchaserAddress.new(purchaser_params)
    if @purchaser.valid?
      pay_item
      # @purchaser.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_address)
          .permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :purchaser_history_id)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end