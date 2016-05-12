class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def new
  end  

  def create
    if User.find_by(username: user_params[:username]) == nil
    	@user = User.new(user_params)
      # binding.pry
    	if @user.save
    		render :json => {:status => "success", :data => @user}
    	else
    		render :json => {:status => "fail"}, status: :bad_request
    	end	
    else
      render :json => {:status => "already exists", :data => @user}
    end    	
  end	

  def user_params
  	params.permit(:email, :password, :username)
  end	
end
