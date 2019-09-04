class HomesController < ApplicationController
  def index
    @items = Item.all.limit(4).order(id: "DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
end
