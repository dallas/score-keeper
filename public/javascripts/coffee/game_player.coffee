GamePlayer = Backbone.Model.extend()

window.GamePlayers = new (Backbone.Collection.extend
  model:  GamePlayer
  url:    '/game_players'
)
