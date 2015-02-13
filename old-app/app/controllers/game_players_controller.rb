class GamePlayersController < ApplicationController
  def update
    game_player = GamePlayer.find(params[:id])
    game_player.update_attributes(params[:game_player])
    json_hash = { :id => dom_id(game_player), :score => game_player.score }
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render :json => json_hash }
    end
  end
end
