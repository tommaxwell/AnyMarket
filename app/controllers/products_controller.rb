class ProductsController < ApplicationController
	before_action :authenticate_user!, :only => [:create, :destroy, :edit, :update, :new]
	before_filter :check_braintree, :only => [:show]
	
	def check_braintree
		@product = Product.find(params[:id])
		if @product.user_id === current_user.id and !current_user.braintree_customer_id?
			flash.now[:addmethod] = ""
		else
		end
	end
	

	def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
	
	def new 
    respond_to do |format|
			format.js
			format.html
		end
  end
  
  def create
    @product = Product.new(product_params)
    @product.set_user!(current_user)
      if @product.save
				redirect_to view_item_path(@product.id)
      else
        flash.now[:alert] = "Woops, looks like something went wrong."
				format.html {render :action => "new"}
      end
  end
  
  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash.now[:notice] = "Listing successfully deleted."
      redirect_to "/"
    else
      flash.now[:alert] = "Woops, looks like something went wrong."
      redirect_to "/"
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(product_params)
        flash.now[:notice] = "Changes saved successfully"
        format.html {render :action => "show"}
      else
        flash.now[:alert] = "Woops, look like something went wrong."
        format.html {render :action => "edit"}
      end
    end
  end
  
  
  # show requested product
	
	def photo_preview 
		@product = Product.find(params[:id])
		respond_to do |format|
			format.js
			format.html
		end
	end
  
  # all products added by a specific user
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
	def search
		@pg_search_documents = Product.search_by_info( params[:q] )
		@query = params[:q]
		respond_to do |format|
			format.html
		end
  end
  
  private
  
  # all the attributes that must be submitted for the product to be listed
  def product_params 
    params.require(:product).permit(:name, :decimal_price, :description, :photo, :destroy_photo, :category, :category_id, :user_id, :about_delivery)
  end
  
end
