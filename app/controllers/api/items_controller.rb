class Api::ItemsController < ApplicationController
  def index
    @items = Item.where({:category=>params[:category]})

    respond_to do |format|
      format.json { render :json => @items }
    end
  end

  def add
    @item = Item.find(params[:id])

    respond_to do |format|
      format.json { render :json => @item }
    end
  end

  def cart
  end
end
