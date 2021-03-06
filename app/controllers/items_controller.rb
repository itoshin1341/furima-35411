class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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

  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :category_id, :product_stats_id, :delivery_change_burden_id,
                                 :prefecture_id, :delivery_date_id, :product_name, :product_description, :price)
                         .merge(user_id: current_user.id)
  end

  def set_item
      @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user_id || @item.purchaser_history != nil
      redirect_to root_path
    end
  end

end