class GamePlay < ActiveRecord::Base
  belongs_to :game
  has_many :game_players

  def player_ids=(player_ids)
    player_ids.each do |player_id|
      game_players.build(:player_id => player_id)
    end
  end

  def player_ids
    game_players.map(&:player_id)
  end
end
