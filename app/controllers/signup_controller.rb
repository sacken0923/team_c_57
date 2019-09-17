class SignupController < ApplicationController
  before_action :move_to_root ,except: [:registration4,:complete]
  # before_action :step_registration, only: [:registration1,:registration2,:registration3]
  before_action :validates_registration1, only: :registration2
  before_action :validates_registration2, only: :registration3
  before_action :validates_registration3, only: :create
  def index
    
  end

  

  def registration1
    @user = User.new
  end

  def registration2
    @user = User.new
  end

  def validates_registration1
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:first_name] = user_params[:first_name]
    session[:last_name] = user_params[:last_name]
    session[:kana_first_name] = user_params[:kana_first_name]
    session[:kana_last_name] = user_params[:kana_last_name]
    session[:year] = user_params[:year]
    session[:month] = user_params[:month]
    session[:day] = user_params[:day]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name],
      last_name: session[:last_name],
      kana_first_name: session[:kana_first_name],
      kana_last_name: session[:kana_last_name],
      year: session[:year],
      month: session[:month],
      day: session[:day],
      tell: "090-1234-1234" ,
      address_last_name: "aa",
      address_first_name: "aa",
      kana_address_last_name: "aa",
      kana_address_first_name: "aa",
      prefecture: "aa",
      postal_code: "123-1234",
      city: "aa",
      address: "aa",
      building: "aa",
      home_tel: "aa"
    )
    if @user.valid?
      registration2_signup_index_path
    else
      redirect_to registration1_signup_index_path
    end
  end

  def registration3
    @user = User.new
  end
  
  def validates_registration2
    session[:tell] = user_params[:tell]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name],
      last_name: session[:last_name],
      kana_first_name: session[:kana_first_name],
      kana_last_name: session[:kana_last_name],
      year: session[:year],
      month: session[:month],
      day: session[:day],
      tell: session[:tell],
      address_last_name: "aa",
      address_first_name: "aa",
      kana_address_last_name: "aa",
      kana_address_first_name: "aa",
      prefecture: "aa",
      postal_code: "123-1234",
      city: "aa",
      address: "aa",
      building: "aa",
      home_tel: "aa"
    )
    if @user.valid?
      registration3_signup_index_path
    else
      redirect_to registration2_signup_index_path
    end
  end


  def registration4
    sign_in User.find(session[:id]) unless user_signed_in?
  end
  
  def validates_registration3
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name],
      last_name: session[:last_name],
      kana_first_name: session[:kana_first_name],
      kana_last_name: session[:kana_last_name],
      year: session[:year],
      month: session[:month],
      day: session[:day],
      tell: session[:tell],
      address_last_name: user_params[:address_last_name],
      address_first_name: user_params[:address_first_name],
      kana_address_last_name: user_params[:kana_address_last_name],
      kana_address_first_name: user_params[:kana_address_first_name],
      prefecture: user_params[:prefecture],
      postal_code: user_params[:postal_code],
      city: user_params[:city],
      address: user_params[:address],
      building: user_params[:building],
      home_tel: user_params[:home_tel]
    )
    @user.valid? unless registration3_signup_index_path
  end
  

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name],
      last_name: session[:last_name],
      kana_first_name: session[:kana_first_name],
      kana_last_name: session[:kana_last_name],
      year: session[:year],
      month: session[:month],
      day: session[:day],
      tell: session[:tell],
      address_last_name: user_params[:address_last_name],
      address_first_name: user_params[:address_first_name],
      kana_address_last_name: user_params[:kana_address_last_name],
      kana_address_first_name: user_params[:kana_address_first_name],
      prefecture: user_params[:prefecture],
      postal_code: user_params[:postal_code],
      city: user_params[:city],
      address: user_params[:address],
      building: user_params[:building],
      home_tel: user_params[:home_tel]
    )
    
    if @user.save
      session[:id] = @user.id
      redirect_to  registration4_signup_index_path
    else
      redirect_to registration3_signup_index_path
    end



    def complete
    end

  end



  private

    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation,
        :first_name,
        :last_name,
        :kana_first_name,
        :kana_last_name,
        :year,
        :month,
        :prefecture,
        :day,
        :tell,
        :address_last_name,
        :address_first_name,
        :kana_address_last_name,
        :kana_address_first_name,
        :postal_code,
        :city,
        :address,
        :building,
        :home_tel
      )
    end

    def move_to_root
      redirect_to root_path if user_signed_in?
    end

    # def  step_registration

    #   if 

    #   else
        
    #   end

    # end

    

end
