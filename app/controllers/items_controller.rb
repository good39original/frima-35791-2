class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :new]

  def index
    #@item = category.order=("created_at DESC")
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

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title,:text,:category_id)
  end

end
