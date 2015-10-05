class Api::ItemsController < ApplicationController
  def index
    @items = Item.where({:category=>params[:category]})


    respond_to do |format|
      format.json { render :json => @items }
    end
  end

  def cart
  end
end
