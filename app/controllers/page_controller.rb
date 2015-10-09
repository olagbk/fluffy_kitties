class PageController < ApplicationController
  def index
  end

  def checkout
    @client_token = Braintree::ClientToken.generate
  end

  def list_items
    @cat = params[:category]
  end
end
