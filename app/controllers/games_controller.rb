class GamesController < ApplicationController
  def index
    respond_with @games = Game.all
  end

  def edit
    respond_with @game = Game.find(params[:id])
  end

  def show
    respond_with Game.find params[:id]
  end

  def create
    respond_with Game.create(params[:game])
  end

  def update
    respond_with Game.find(params[:id]).update_attributes(params[:game])
  end

  def destroy
    Game.find(params[:id]).destroy
    respond_with :head => :ok
  end
end
