class Api::AddressesController < ApplicationController
  before_action :get_user

  def index
    @addresses = Address.where({:user_id=>@user})

    respond_to do |format|
      format.json { render :json => @addresses }
    end

  end

  def create
    @address = Address.new(params[:address].permit(:name, :surname, :street, :number, :city, :postcode, :country))
    @address.user = @user
    @address.save!

    respond_to do |format|
      format.json { render :json => @address }
    end

  end

  def destroy
    @address = Address.find(params[:id])
    if @address.user == @user
      @address.destroy
    end

    render :nothing => true, :status => 200, :content_type => 'text/html'
    end
end
