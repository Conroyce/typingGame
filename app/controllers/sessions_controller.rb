class SessionsController < ApplicationController
	def create
		#try to authenticate the user
		@user = User.authenticate(params[:email], params[:password])
		#if an instance is returned and @user is not nil
		if @user
		#let the user know they've been logged in with a flash message
			#most important part
			session[:user_id] = @user.id
			render :json => {:status => "success", :user => @user}
		else
			#user isnt in db or incorrect pw
			render :json => {:status => "fail"}
		end	
	end

	def destroy
		session[:user_id] = nil
		render :json => {:status => "success"}
	end	
end
