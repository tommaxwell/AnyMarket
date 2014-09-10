class HomeController < ApplicationController	
	
	def about
		respond_to do |format|
			format.html
		end
	end
	
  def index
		respond_to do |format|
			format.html
		end
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
