class GamePlaysController < ApplicationController
  def index; @game_plays = GamePlay.all end

  def new
    @game_play = GamePlay.new
  end

  def show
    respond_with GamePlay.find params[:id]
  end

  def create
    respond_with GamePlay.create(params[:game_play])
  end

  def update
    respond_with GamePlay.find(params[:id]).update_attributes(params[:game_play])
  end
end
