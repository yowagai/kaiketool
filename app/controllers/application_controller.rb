class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER_KAIKETOOL"] && password == ENV["BASIC_AUTH_PASSWORD_KAIKETOOL"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:child_name, :child_name_kana, :parent_name, :parent_name_kana, :sex_id, :birthday])
  end

end
