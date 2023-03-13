class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER_KAIKETOOL"] && password == ENV["BASIC_AUTH_PASSWORD_KAIKETOOL"]
    end
  end
end
