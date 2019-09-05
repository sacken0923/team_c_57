class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
  end

  def edit
  end
  
  def update
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.seller_id)
  end

end
