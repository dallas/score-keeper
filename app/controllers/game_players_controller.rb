class GamePlayersController < ApplicationController
  def update
    respond_with GamePlayer.find(params[:id]).update_attributes params[:game_player]
  end
end
