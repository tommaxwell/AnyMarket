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
		respond_to do |format|
			format.html {redirect_to "/"}
			format.js { render("/home/onboarding_modal.js.erb") }
		end
  end
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :school, :provider, :uid)
  end
  
  def account_update_params 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar, :braintree_customer_id)
  end
  
end
