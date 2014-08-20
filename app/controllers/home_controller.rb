class HomeController < ApplicationController	
	before_filter :categories
	
	def categories
		@categories = Category.all 
	end
	
  def index
    @user = current_user
  end
	
	def new 
		respond_to do |format|
			format.js
			format.html
		end
	end
	
	def terms
		respond_to do |format|
			format.html
		end
	end
	
end
