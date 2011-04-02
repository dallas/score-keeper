class Game < ActiveRecord::Base
  has_many :game_plays, :dependent => :destroy

  validates :name, :scoring_strategy, :presence => true

  def as_json(options = {})
    super options.merge(:only => [:id, :name, :scoring_strategy])
  end

  def scoring_strategy_as_sql_order
    self.scoring_strategy == 'low' ? 'asc' : 'desc'
  end
end
