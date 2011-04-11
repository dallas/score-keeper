Game = Backbone.Model.extend
  initialize: ->
    this.view = new GameView
      model: this
    $('#games').append this.view.el

Games = Backbone.Collection.extend
  model:  Game
  url:    '/games'

GameView = Backbone.View.extend
  tagName: 'section'

  className: 'game'

  template: _.template $('#game-template').html()

  events:
    'dblclick .name': 'dblClickedName'
    'dblclick .scoring-strategy': 'dblClickedStrategy'

  initialize: ->
    _.bindAll this, 'render'
    this.model.bind 'change', this.render
    # this.model.view = this
    this.render()

  dblClickedName: ->
    alert 'double-clicked the name!'

  dblClickedStrategy: ->
    alert 'double-clicked the scoring strategy!'

  render: ->
    $(this.el).html this.template this.model.toJSON()
    return this

window.App.Games = new Games()
