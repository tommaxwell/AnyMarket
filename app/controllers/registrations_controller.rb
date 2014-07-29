class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, :except => [:after_inactive_sign_up_path_for]
  private
  
  def after_inactive_sign_up_path_for(user)
    new_customer_path
  end
  
  def after_sign_up_path_for(user)
    new_customer_path
  end
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :school, :website)
  end
  
  def account_update_params 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar, :braintree_customer_id)
  end
  
end
