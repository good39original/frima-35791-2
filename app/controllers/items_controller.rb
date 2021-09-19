class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only:   [:new]

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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  #def destroy
   #@item = Item.find(params[:id])
   #@item.update(item_params)
  #end

  private

  def item_params
    params.require(:item).permit(:category_id, :description, :status_id, :shipping_id, :prefecture_id, :charge_id,  :money, :name, :image).merge(user_id: current_user.id)
  end

  #def set_item
    #@item = Item.find(params[:id])
  #end

end
