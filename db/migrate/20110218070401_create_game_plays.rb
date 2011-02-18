class CreateGamePlays < ActiveRecord::Migration
  def self.up
    create_table :game_plays do |t|
      t.belongs_to :game
      t.timestamps
    end
  end

  def self.down
    drop_table :game_plays
  end
end
