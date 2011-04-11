class GamesController < ApplicationController
  before_filter :find_game, :only => [:show, :update, :destroy]

  def index
    respond_with @games = Game.all
  end

  def show
    respond_with @game
  end

  def create
    @game = Game.create(game_params)
    respond_with @game
  end

  def update
    @game.update_attributes(game_params)
    respond_with @game
  end

  def destroy
    @game.destroy
    respond_with :head => :ok
  end

private

  def find_game
    @game = Game.find params[:id]
  end

  def game_params
    params.select {|k,v| Game.accessible_attributes.include?(k)}
  end
end
