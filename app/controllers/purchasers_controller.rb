class PurchasersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  # セキュリティ面を強化するためcreateアクションも適用。
  # create、update、destroyアクションは、今回のFURIMAにおいて対応するビューファイルがなく（create.html.erbなど）、
  # 一見不正なアクセスができないように思える処理ですが、「検証ツールを使用する」「URLの直接入力をする」といった行為で不正なアクセスができてしまうことがあるため。

  def index
    @purchaser = PurchaserAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchaser = PurchaserAddress.new(purchaser_params)
    if @purchaser.valid?
      pay_item
      @purchaser.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_address)
          .permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :token)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchaser_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.purchaser_history != nil
      redirect_to root_path
    end
  end

end