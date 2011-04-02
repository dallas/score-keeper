Player = Backbone.Model.extend
  avatarUrl: (size) ->
    return false unless size?
    @get('avatar_url') + "?s=#{size}"

  avatarImg: (size) ->
    return false unless size?
    $ "<img src=\"#{@avatarUrl size}\" width=#{size} height=#{size} />"

window.Players = new (Backbone.Collection.extend
  model:  Player
  url:    '/players'
)
