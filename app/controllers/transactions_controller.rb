class TransactionsController < ApplicationController
  before_filter :authenticate_user!

  def new
    if current_user.has_payment_info?
      current_user.with_braintree_data!
      @credit_card = current_user.default_credit_card
      @product = Product.find(params[:id])
    else
      redirect_to new_customer_path
    end
  end

  def confirm
    @result = Braintree::TransparentRedirect.confirm(request.query_string)

    if @result.success?
      render :confirm
      @product = Product.find(params[:id])
      @product.sold_value = true
      @product.save
    else
      @product = Product.find(params[:id])
      current_user.with_braintree_data!
      @credit_card = current_user.default_credit_card
      render :new
    end
  end

end