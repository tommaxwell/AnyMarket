class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
       flash.now[:notice] = "Success"
    else
       flash.now[:alert] = "Error. Check logs"
    end
  end
  
  def categories
    @categories = Category.all
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def new 
    respond_to do |format|
			format.js
			format.html
		end
  end
  
  def long_categories
    @categories = Category.all
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  private
  
  # all the attributes that must be submitted for the product to be listed
  def category_params 
    params.require(:category).permit(:name, :description)
  end
end
