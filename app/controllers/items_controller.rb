class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.photos.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
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

  private
    def item_params
      params.require(:item).permit(
        :name,
        :price,
        :description,
        :state,
        :delivery,
        :shipping_method,
        :shipping_time,
        photos_attributes:[:item_id, :image ]
      ).merge(seller_id: current_user.id)
    end


end
