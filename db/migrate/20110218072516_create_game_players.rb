class CreateGamePlayers < ActiveRecord::Migration
  def self.up
    create_table :game_players do |t|
      t.belongs_to :game_play
      t.belongs_to :player
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :game_players
  end
end
