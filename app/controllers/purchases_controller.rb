class PurchasesController < ApplicationController
  before_action :authenticate_user! ,only: :show
  require "payjp"

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

  def done
    # binding.pry
    @item = Item.find(params[:id])
    @item.update(buyer_id: current_user.id)
  end

  def authenticate
    redirect_to new_user_session_path unless user_signed_in?
  end

end