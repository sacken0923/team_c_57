class PurchaseController < ApplicationController
  def new
    @item = Item.new
  end
end
