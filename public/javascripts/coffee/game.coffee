Game = Backbone.Model.extend
  initialize: ->
    this.view = new GameView model: this
    $('#games').append this.view.el

Games = Backbone.Collection.extend
  model:  Game
  url:    '/games'

GameView = Backbone.View.extend
  tagName: 'section'

  className: 'game'

  template: _.template '<article class="game tile grid_3"><div class="outer"><div class="inner">
    <p class="name">{{name}}</p>
    <p class="scoring-strategy">{{scoring_strategy}}</p>
  </div></div></article>'

  nameFieldTemplate: _.template '<input type="text" value="{{name}}" class="edit-name">'

  events:
    'dblclick .name': 'dblClickedName'
    'dblclick .scoring-strategy': 'dblClickedStrategy'
    'keyup .edit-name': 'saveName'

  initialize: ->
    _.bindAll this, 'render'
    this.model.bind 'change', this.render
    this.render()

  dblClickedName: ->
    this.$('.name').after(this.nameFieldTemplate this.model.toJSON()).hide()

  saveName: (event) ->
    if event.which == 13
      this.model.save name: $(event.target).val()
      this.$('.edit-name').remove()
      this.$('.name').show()

  dblClickedStrategy: (event) ->
    console.log 'double-clicked the scoring strategy!'

  render: ->
    $(this.el).html this.template this.model.toJSON()
    return this

App.Games = new Games()
App.trigger 'games:loaded'
