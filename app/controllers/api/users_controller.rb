class Api::UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params[:user].permit(:first_name, :last_name, :email, :password))
    @user.save!

    respond_to do |format|
      format.json { render :json => @user }
    end

  end


  def verify
    user_params = params[:user].permit(:email, :password)
    @user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])
    if @user
      @token = LoginToken.new
      time = Time.new
      login_token = "catbakescookies" + time.to_s + @user.email
      login_token_hash = BCrypt::Password.create(login_token)
      @token.token = login_token_hash
      @token.user = @user
      @token.save!
    end

    respond_to do |format|
      format.json { render :json => @token }
    end
  end

  end
