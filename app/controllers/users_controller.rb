class UsersController < ApplicationController
  def cards
    
  end
  
  def show
    @user = User.find(params[:id])
  end

  def index
  end
end
