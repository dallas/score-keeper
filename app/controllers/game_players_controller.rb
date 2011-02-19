class GamePlayersController < ApplicationController
  def update
    @game_player = GamePlayer.find(params[:id], :include => {:game_play => :game})
    @game = @game_player.game_play.game
    @success = @game_player.update_attributes(params[:game_player])
    respond_to do |format|
      format.js
    end
  end
end
