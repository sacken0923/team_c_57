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
    @item = Item.find(params[:id])
    
    @parents = Category.where(ancestry: nil)
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(params_int(item_params))
      redirect_to root_path
    else
      redirect_to edit_item_path(@item)
    end
  end


  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.seller_id)
    @items = Item.where(seller_id: @user.id).limit(6).order(id: "DESC").where.not(id: @item.id)
  end

  def search
    @items = Item.where('name LIKE ?', "%#{params[:keyword]}%")
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
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

    def integer_string?(str)
      Integer(str)
      true
    rescue ArgumentError
      false
    end

    def params_int(item_params)
      item_params.each do |key,value|
        if integer_string?(value)
          item_params[key]=value.to_i
        end
      end
  end

end
