class HomeController < ApplicationController	
  def index
    @user = current_user
  end
	
	def new 
		respond_to do |format|
			format.js
			format.html
		end
	end
	
end
