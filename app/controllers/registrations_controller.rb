class RegistrationsController < Devise::RegistrationsController
	
  
  def after_inactive_sign_up_path_for(user)
		respond_to do |format|
			 format.html {render :action => "/"}
    end
  end
	
	private
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :school, :provider, :uid)
  end
  
  def account_update_params 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar, :braintree_customer_id)
  end
  
end
