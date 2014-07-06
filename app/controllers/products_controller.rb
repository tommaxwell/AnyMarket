class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @product = Product.new(product_params)
    @product.set_user!(current_user)
    respond_to do |format|
      if @product.save
        flash.now[:notice] = "Successfully listed"
        format.html {render :action => "show"}
      else
        format.html{render :action => "create"}
      end
    end
  end
  
  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  def user_products
    @user = User.find(params[:id])
    @products = @user.products
    render json: @products
  end
  
  # new is a form that sends data to create action through HTTP POST
  def new 
    respond_to do |format|
			format.js
			format.html
		end
  end
  
  # displays every product in the database, rendered in json
  def index
    render json: Product.all
  end
  
  private
  
  # all the attributes that must be submitted for the product to be listed
  def product_params 
    params.require(:product).permit(:name, :price)
  end
  
end
