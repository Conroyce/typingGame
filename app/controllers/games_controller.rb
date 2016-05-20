class GamesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if @user
      render :json => {:status => "success", :data => @user.games}
    else
      render :json => {:status => "fail", :data => "user not found"}
    end  
  end

  def root
  	# filler method for root path
  end	

  def find
  end	

  def create
  	@user = User.find(params[:user_id])
  	@game = @user.games.create(game_params)
  	render :json => {:status => "success", :data => @game}
  end

  def game_params
  	params.require(:game).permit(:score, :accuracy)
  end 
end
