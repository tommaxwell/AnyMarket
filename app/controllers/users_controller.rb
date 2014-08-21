class UsersController < ApplicationController
  
  def profile
		@user = User.find(current_user.id)
    respond_to do |format|
      format.html
    end
  end
  
end
