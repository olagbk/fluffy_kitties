class PageController < ApplicationController
  def list_items
    @cat = params[:category]
  end
end
