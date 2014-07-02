class ProductsController < ApplicationController
  
  def create
    
    
    @product = Product.new(product_params)
    @product.save
    
  end
  
  def new 
    respond_to do |format|
			format.js
			format.html
		end
  end
  
  private
  
  def product_params 
    params.require(:product).permit(:name, :price)
  end
  
end
