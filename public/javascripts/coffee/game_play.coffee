GamePlay = Backbone.Model.extend()

window.GamePlays = new (Backbone.Collection.extend
  model:  GamePlay
  url:    '/game_plays'
)
