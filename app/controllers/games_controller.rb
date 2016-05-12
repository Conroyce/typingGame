class GamesController < ApplicationController
  def index
    @games = Game.all
    render :json => {:status => "success", :data => @games}
  end

  def root
  	# filler method for root path
  end	

  def find
  end	

  def create
  	binding.pry
  	@user = User.find(params[:user_id])
  	@game = @user.games.create(game_params)
  	render :json => {:status => "success", :data => @game}
  end

  def game_params
  	params.require(:game).permit(:score, :accuracy)
  end 
end
