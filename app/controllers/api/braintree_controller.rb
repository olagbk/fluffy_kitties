class Api::BraintreeController < ApplicationController

  def get_token
    respond_to do |format|
      format.json { render :json => {:key => Braintree::ClientToken.generate} }
    end
  end

end