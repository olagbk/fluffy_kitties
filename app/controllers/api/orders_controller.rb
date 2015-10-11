class Api::OrdersController < ApplicationController
  before_action :get_user

  def create
    @order = Order.new(params[:order].permit(:address_id, :total))
    @order.user = @user
    @order.save!

    @order_items = params[:items]

    to_import = []


    @order_items.each_with_index do |pair, idx|
      item = pair.last
      @order_item = OrderItem.new({:item_id=>item['id']})
      @order_item.order = @order
      to_import << @order_item

    end

    OrderItem.import(to_import)

    respond_to do |format|
       format.json { render :json => @order.to_json(:include => :order_items) }
    end
  end
end
