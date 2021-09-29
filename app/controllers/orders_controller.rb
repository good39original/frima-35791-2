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
    pay_item
    @order.save
    redirect_to root_path
  else
    render 'index'
  end
end

private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.money,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end