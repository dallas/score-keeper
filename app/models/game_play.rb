class GamePlay < ActiveRecord::Base
  belongs_to :game
  has_many :game_players

  validates :game_id, :presence => true

  def game_name=(name)
    self.game = Game.find_or_create_by_name(name)
    self.game_id = self.game.id
  end

  def game_name
    self.game.try(:name)
  end

  def player_ids=(player_ids)
    player_ids.each do |player_id|
      game_players.build(:player_id => player_id)
    end
  end

  def player_ids
    game_players.map(&:player_id)
  end
end
