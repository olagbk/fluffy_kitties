class Api::InventoryItemsController < ApplicationController
  def verify
    @items = params[:items]
    @saved_items = {}

    @items.each do |id|
      @item = InventoryItem.find_by(item_id: id, order_id: nil)
      if @item
        @item.with_lock do
          @item.order_id = 0
          @saved_items[@item.id] = id.to_i
          @item.save!
        end
      else
        next
      end
    end

    respond_to do |format|
      format.json { render :json => @saved_items }
    end

  end

  def update_all

    @inv_items = params[:inv_items]
    @inv_items.each do |id|
      @item = InventoryItem.find(id)
      @item.order_id = params[:order_id]
      @item.save!
    end

    @items = params[:items]
    @items.each do |id|
      @item = Item.find(id)
      @item.inventory -= 1
      @item.save!
    end

    render :nothing => true, :status => 200, :content_type => 'text/html'

  end
end
