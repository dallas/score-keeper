Game = Backbone.Model.extend({
  speak: ->
    alert "oh, #{@get 'words'}"
})

window.game = new Game({words: 'yo face!'})
