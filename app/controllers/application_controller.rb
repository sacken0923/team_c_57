class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  before_action :set_parents
  protect_from_forgery with: :exception


  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:singup,keys:[:nickname,:first_name,:last_name,:kana_first_name,:kana_last_name,:year,:month,:day,:tell,:address_last_name,:address_first_name,:kana_address_last_name,:kana_address_first_name,:prefecture,:postal_code,:city,:address,:building,:home_tel])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
  
end
