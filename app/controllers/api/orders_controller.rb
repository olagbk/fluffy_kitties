class Api::OrdersController < ApplicationController
  before_action :get_user

  def create

    order_details = {}
    order_details[:missing_items] = []
    order_details[:order_items] = []

    order_prms = params.require(:order).permit!
    order_prms[:products].each do |pair|
      item = pair.last
      order_details[:order_items] << item
    end



    @order = Order.create({
         :total => order_prms[:total],
         :address_id => order_prms[:address][:id],
         :user_id => @user.id })

    reserve_inventory = lambda do

      reserve_item = lambda do |item_id|
        @item = InventoryItem.find_by(item_id: item_id, order_id: nil)

        if(!@item || @item.id.nil?)
          return false
        end

        @item.with_lock do
          @item.reload #makes another fetch to the database for the current state of this InventoryItem row.

          if(@item.order_id != nil) #check that the order_id is still nil
            return reserve_item.call(item_id)
          else
            @item.order_id = @order.id
            @item.save!
            return true
          end

        end
      end

      item_ok = true
      inventory_ok = true

      order_prms[:products].each do |pair|
        order_item = pair.last

        item_ok = reserve_item.call(order_item[:id])

        unless item_ok
          order_details[:missing_items] << order_item[:id]
          (inventory_ok)? inventory_ok = false : return
        end

      end

      return inventory_ok

    end

    if(reserve_inventory.call())

      @order.status = "PENDING_PAYMENT"
      @order.save!

      result = Braintree::Transaction.sale(
          :amount => params[:amount],
          :payment_method_nonce => params[:payment_method_nonce]
      )

      if(result.success?)

        to_import = []
        order_prms[:products].each do |pair|
          product = pair.last

          @order_item = OrderItem.new({ :item_id=>product[:id] })
          @order_item.order = @order
          to_import << @order_item
        end

        OrderItem.import(to_import)

        @order.status = "PAID"
        @order.completed = true
      else
        @order.status = "UNPAID"
      end

      @order.save!
    else
      @order.status = "INVENTORY_UNAVAILABLE"
      @order.save!
    end

    order_details[:order] = @order

    respond_to do |format|
      format.json { render :json => order_details }
    end
  end
end
