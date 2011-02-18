class GamePlayer < ActiveRecord::Base
  belongs_to :game_play
  belongs_to :player
end
