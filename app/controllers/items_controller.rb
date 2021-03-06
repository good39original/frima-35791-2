class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

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

  def edit
    redirect_to root_path if current_user.id != @item.user_id || @item.card != nil
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
      redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :description, :status_id, :shipping_id, :prefecture_id, :charge_id,  :money, :name, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
