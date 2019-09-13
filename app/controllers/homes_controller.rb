class HomesController < ApplicationController
  def index
    @items = Item.all.limit(4).order(id: "DESC")
    @ladys = Item.where(category_id: 1).limit(4).order(id: "DESC")
    @mens = Item.where(category_id: 200).limit(4).order(id: "DESC")
    @kids = Item.where(category_id: 346).limit(4).order(id: "DESC")
    @kosemes = Item.where(category_id: 798).limit(4).order(id: "DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def listing
    @items = Item.where(seller_id: current_user.id)

  end
end
