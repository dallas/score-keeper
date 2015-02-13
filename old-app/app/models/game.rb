class Game < ActiveRecord::Base
  has_many :game_plays, :dependent => :destroy

  def scoring_strategy_as_sql_order
    self.scoring_strategy == 'low' ? 'asc' : 'desc'
  end
end
