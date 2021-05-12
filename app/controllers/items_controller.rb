class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # 全ての商品情報を出力できるように定義
    @items = Item.all
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
    params.require(:item).permit(:content, :image, :category_id, :product_stats_id, :delivery_change_burden_id,
                                 :prefecture_id, :delivery_date_id, :product_name, :product_description, :price)
                         .merge(user_id: current_user.id)
  end

end