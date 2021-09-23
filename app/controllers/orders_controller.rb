class OrdersController < ApplicationController
  before_action :set_item, only:[:index, :create]

  def index
    @order = Order.new
  end

  def new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end