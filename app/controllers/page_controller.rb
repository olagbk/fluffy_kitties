class PageController < ApplicationController
  def index
  end

  def list_items
    @cat = params[:category]
  end
end
