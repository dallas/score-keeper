class Player < ActiveRecord::Base
  has_many :game_players, :dependent => :destroy

  validates :name, :presence => true
  validates :email, :presence => true, :unless => :avatar_url?
  validates :avatar_url, :presence => true, :unless => :email?

  def as_json(options = {})
    super options.merge(:only => [:id, :name], :methods => :avatar_url)
  end

  def avatar_url
    return self[:avatar_url] if avatar_url?
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
