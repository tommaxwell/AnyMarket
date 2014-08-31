class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, :except => [:after_inactive_sign_up_path_for]
  private
	
	def new 
		respond_to do |format|
			format.js
			format.html
		end
	end
  
  def after_inactive_sign_up_path_for(user)
		redirect_to root_path, onboard: 'welcome'
  end
	
	def after_active_sign_up_path_for(user)
		flash.now[:onboard] = "welcome"
		redirect_to root_path
	end
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :school, :provider, :uid)
  end
  
  def account_update_params 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar, :braintree_customer_id)
  end
  
end
