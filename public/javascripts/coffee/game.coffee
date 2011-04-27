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

  strategyFieldTemplate: _.template '<div class="edit-scoring-strategy">
    <a>low</a><br />
    <a>high</a><br />
    <span class="cancel">cancel</span>
  </div>'

  events:
    'dblclick .name': 'editName'
    'keyup .edit-name': 'saveName'
    'blur .edit-name': 'closeEditName'
    'dblclick .scoring-strategy': 'editScoringStrategy'
    'click .edit-scoring-strategy a': 'saveScoringStrategy'
    'click .edit-scoring-strategy .cancel': 'closeEditScoringStrategy'

  initialize: ->
    _.bindAll this, 'render'
    this.model.bind 'change', this.render
    this.render()

  editName: ->
    this.$('.name').after(this.nameFieldTemplate this.model.toJSON()).hide()
    this.$('.edit-name').focus()

  saveName: (event) ->
    if event.which == 13
      this.model.save name: $(event.target).val()
      this.closeEditName()

  closeEditName: ->
    this.$('.edit-name').remove() if this.$('.edit-name')
    this.$('.name').show()

  editScoringStrategy: ->
    this.$('.scoring-strategy').after(this.strategyFieldTemplate this.model.toJSON()).hide()

  saveScoringStrategy: (event) ->
    this.model.save scoring_strategy: $(event.target).html()
    this.closeEditScoringStrategy()

  closeEditScoringStrategy: ->
    this.$('.edit-scoring-strategy').remove() if this.$('.edit-scoring-strategy')
    this.$('.scoring-strategy').show()

  render: ->
    $(this.el).html this.template this.model.toJSON()
    return this

App.Games = new Games()
App.trigger 'games:loaded'
