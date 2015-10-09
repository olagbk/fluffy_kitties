class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def get_user
    login_token_value = request.headers["x-login-token"]
    user_token = LoginToken.find_by token: login_token_value
    @user = user_token.user
  end
end
