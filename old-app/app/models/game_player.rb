class GamePlayer < ActiveRecord::Base
  belongs_to :game_play
  belongs_to :player

  attr_accessor :previous_score

  def add_to_score=(score)
    self.previous_score = self.score
    self.score = self.previous_score.to_i + score.to_i
  end

  def add_to_score
    nil
  end
end
