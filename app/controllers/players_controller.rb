class PlayersController < ApplicationController
  def index
    respond_with Player.all
  end

  def show
    respond_with Player.find params[:id]
  end

  def create
    respond_with Player.create(params[:player])
  end

  def update
    respond_with Player.find(params[:id]).update_attributes(params[:player])
  end

  def destroy
    Player.find(params[:id]).destroy
    respond_with :head => :ok
  end
end
