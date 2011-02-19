class GamePlaysController < ApplicationController
  def index
    @game_plays = GamePlay.all(:include => :game)
  end

  def show
    @game_play    = GamePlay.find(params[:id], :include => :game)
    @game         = @game_play.game
    @game_players = @game_play.game_players.all(
      :include  => :player,
      :order    => "score #{@game.scoring_strategy_as_sql_order}"
    )
  end

  def new
    @game_play = GamePlay.new
  end

  def edit
    @game_play = GamePlay.find(params[:id])
  end

  def create
    @game_play = GamePlay.new(params[:game_play])
    if @game_play.save
      redirect_to @game_play, :notice => 'Game play was successfully created.'
    else
      render :new
    end
  end

  def update
    @game_play = GamePlay.find(params[:id])
    if @game_play.update_attributes(params[:game_play])
      redirect_to @game_play, :notice => 'Game play was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @game_play = GamePlay.find(params[:id])
    @game_play.destroy
    redirect_to :game_plays
  end
end
