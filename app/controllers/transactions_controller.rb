class TransactionsController < ApplicationController

  def create
    result = Braintree::Transaction.sale(
        :amount => params[:amount],
        :payment_method_nonce => params[:payment_method_nonce]
    )

  end
end
