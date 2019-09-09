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
    @items = Item.where(seller_id: @user.id).limit(6).order(id: "DESC").where.not(id: @item.id)
  end

  def search
    @items = Item.where('name LIKE ?', "%#{params[:keyword]}%")
  end

end
