class SessionsController < ApplicationController
	def create
		#try to authenticate the user
		@user = User.authenticate(params[:email], params[:password])
		#if an instance is returned and @user is not nil
		if @user
		#let the user know they've been logged in with a flash message
			flash[:notice] = "You've been logged in."
			#most important part
			session[:user_id] = @user.id
			redirect_to "/"
		else
			#user isnt in db or incorrect pw
			flash[:alert] = "There was a problem logging you in."

			redirect_to log_in_path
		end	
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've been logged out successfully."
		redirect_to "/"
	end	
end
