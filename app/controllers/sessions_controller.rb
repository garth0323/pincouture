class SessionsController < ApplicationController
	def new
	end

	def create 
		user = User.find_by(email: params[:session][:email].downcase)
	  if user && user.authenticate(params[:session][:password])
	    if params[:remember_me]
	      cookies.permanent[:auth_token] = user.auth_token
	    else
	      cookies[:auth_token] = user.auth_token
	    end
	    flash[:notice] = "Welcome, you are logged in!"
	    redirect_to root_path
	  else
	    flash[:error] = "Something went wrong, try again"
	    redirect_to root_path
	  end
	end

	def destroy
		cookies.delete(:auth_token)
		flash[:notice] = "Youv'e logged out."
		redirect_to root_path
	end
end