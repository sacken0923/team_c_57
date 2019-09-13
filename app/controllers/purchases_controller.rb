class PurchasesController < ApplicationController
  require "payjp"
  # before_action :set_item, only: [:show]

  def show
    @item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => card.customer_id,
    :currency => "jpy", 
  )
  end

  # def update
  #   binding.pry
  #   @item.update(item_params)
  #   redirect_to done_purchases_path
  # end

  def done
    # binding.pry
    @item = Item.find(params[:id])
    @item.update(buyer_id: current_user.id)
  end

  # private

  # def item_params
  #   params.require(:item).permit(
  #     :name,
  #     :price,
  #     :description,
  #     :state,
  #     :delivery,
  #     :shipping_method,
  #     :shipping_time,
  #     photos_attributes:[:item_id, :image ]
  #   ).merge(buyer_id: current_user.id)
  # end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

end