class CreditCardInfoController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @credit_card = Braintree::CreditCard.find(params[:id])
  end

  def confirm
    @result = Braintree::TransparentRedirect.confirm(request.query_string)

    if @result.success?
			session[:return_to] = request.referer
    else
      @credit_card = Braintree::CreditCard.find(@result.params[:payment_method_token])
      render :action => "edit"
    end
  end
end