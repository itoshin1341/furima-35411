class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :category_id, :product_stats_id, :delivery_change_burden_id,
                                 :prefecture_id, :delivery_date_id, :product_name, :product_description, :price)
                         .merge(user_id: current_user.id)
  end

end