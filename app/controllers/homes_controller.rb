class HomesController < ApplicationController
  def index
    @items = Item.all.limit(4).order(id: "DESC")
  end

  def show
  end
end
