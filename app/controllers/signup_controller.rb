class SignupController < ApplicationController

  # def registration0
  # end

  def registration1
    @user = User.new
  end

  def registration2
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
    @user = User.new
  end

  def registration3
    session[:tell] = user_params[:tell]
    @user = User.new
  end

  def registration4
    @user = User.new
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
      prefecture: user_params[:prefecture],
      postal_code: user_params[:postal_code],
      city: user_params[:city],
      address: user_params[:address],
      building: user_params[:building],
      home_tel: user_params[:home_tel]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to complete_signup_index_path
    else
      redirect_to registration1_signup_index_path
    end

    def complete
      sign_in User.find(session[:id]) unless user_signed_in?
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
        :postal_code,
        :city,
        :address,
        :building,
        :home_tel
      )
    end



end
