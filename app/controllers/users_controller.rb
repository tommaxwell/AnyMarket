class UsersController < ApplicationController
  
  def show_user
    render json: User.find(params[:id])
  end
  
end
