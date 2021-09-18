class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only:   [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :index
    end
  end

  #def update
    #if current_user.update(user_params)
     # redirect_to root_path
    #else
    #  render :edit
    #end
  #end

  private

  def item_params
    params.require(:item).permit(:category_id, :description, :status_id, :shipping_id, :prefecture_id, :charge_id,  :money, :name, :image).merge(user_id: current_user.id)
  end

end
