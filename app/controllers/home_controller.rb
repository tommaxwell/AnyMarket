class HomeController < ApplicationController	
	before_filter :categories, :check_confirmed, :only => [:index]
	
	def check_confirmed
		if signed_in?(:user)
			@user = current_user.id
			if @user.confirmed_at === nil? 
				flash.now[:onboard] = ""
			else
			end
		else
		end
	end
	
	def about
		respond_to do |format|
			format.html
		end
	end
	
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
	
	def onboarding_modal
		respond_to do |format|
			format.js
		end
	end
	
	def how_it_works
		respond_to do |format|
			format.html
		end
	end
	
	def addpaymentmethod
		respond_to do |format|
			format.js
		end
	end
	
	def salecomplete
		respond_to do |format|
			format.js
		end
	end
	
end
