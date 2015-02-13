module PlayersHelper
  def avatar_image_tag(player, size, options = {})
    if player.avatar_url.present?
      avatar_url = player.avatar_url
    else
      # default_url = "#{root_url}images/guest.png"
      gravatar_id = Digest::MD5::hexdigest(player.email).downcase
      avatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"#&d=#{CGI.escape(default_url)}
    end
    image_tag avatar_url, options.merge(:size => "#{size}x#{size}")
  end
end
