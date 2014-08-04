class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	after_filter :store_locaton
	# might need to be before_filter? 
	
	def store_location 
		session[:previous_url] = request.fullpath unless request.fullpath =~ /\\users/
	end
	
	def after_sign_in_path_for(resource)
		session[:previous_url] || root_path
	end
  
  def user
    @user = current_user
  end
  
  def categories
    @categories = Category.all
  end
end
