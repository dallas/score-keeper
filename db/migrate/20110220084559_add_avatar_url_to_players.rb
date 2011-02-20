class AddAvatarUrlToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :avatar_url, :string
  end

  def self.down
    remove_column :players, :avatar_url
  end
end
