class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
       flash.now[:notice] = "Success"
    else
       flash.now[:alert] = "Error. Check logs"
    end
  end
	
	def destroy
		@category = Category.find(params[:id])
	end
  
  def new 
    respond_to do |format|
			format.js
			format.html
		end
  end
  
  def show
    @category = Category.find(params[:id])
		@products = @category.products.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
    end
  end
	
	def update
		@category = Category.find(params[:id])
    respond_to do |format|
			if @category.update_attributes(category_params)
        flash.now[:notice] = "Changes saved successfully"
      else
        flash.now[:alert] = "Woops, look like something went wrong."
      end
    end
  end
  
  private
  
  def category_params 
    params.require(:category).permit(:name, :description, :position)
  end
end
