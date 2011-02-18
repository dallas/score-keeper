module PlayersHelper
  def avatar_url(player, size = 100)
    gravatar_id = Digest::MD5::hexdigest(player.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
