class RegistrationsController < Devise::RegistrationsController
	
	
	private
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :school, :provider, :uid)
  end
  
  def account_update_params 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar, :braintree_customer_id)
  end
  
end
