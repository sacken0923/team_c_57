class HomesController < ApplicationController
  def index
    @items = Item.all.limit(4).order(id: "DESC")
    @mens = Item.where(category_id: 200).limit(4).order(id: "DESC")
    @kids = Item.where(category_id: 346).limit(4).order(id: "DESC")
    @toys = Item.where(category_id: 685).limit(4).order(id: "DESC")
    if user_signed_in? 
      @mysells = Item.where(seller_id: current_user.id).where(buyer_id: nil).limit(4).order(id: "DESC")
      @mybuys = Item.where(buyer_id: current_user.id).limit(4).order(id: "DESC")
      @mysolds = Item.where(seller_id: current_user.id).where.not(buyer_id: nil).limit(4).order(id: "DESC")
    end
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
