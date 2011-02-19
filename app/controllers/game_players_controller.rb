class GamePlayersController < ApplicationController
  def update
    @game_player = GamePlayer.find(params[:id])
    @success = @game_player.update_attributes(params[:game_player])
    respond_to do |format|
      format.js
    end
  end
end
