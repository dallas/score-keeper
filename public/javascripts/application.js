(function() {
  var _ = CoffeeScript.load;
  _('/javascripts/coffee/game.coffee');
  _('/javascripts/coffee/player.coffee');
})();

// var Game = {};
// 
// Game.playerList = function() {
//   Game._playerList = Game._playerList || $('#players');
//   return Game._playerList;
// }
// 
// Game.players = function() {
//   Game._players = Game._players || Game.playerList().find('.player');
//   return Game._players;
// }
// 
// Game.changeScore = function(player, score) {
//   Game.playerScore(player, score);
//   Game.sortPlayers();
// }
// 
// Game.playerScore = function(player, score) {
//   var playerScore = $(player).find('.score');
//   if (score === undefined) return parseInt(playerScore.text());
//   else {
//     playerScore.html(score);
//     $(player).find('.update-score :text').val('');
//   }
// }
// 
// Game.sortOrder = function() {
//   Game._sortOrder = Game._sortOrder || Game.playerList().attr('data-sort-order');
//   return Game._sortOrder;
// }
// 
// Game.sortFunction = function() { return Game[Game.sortOrder() + 'Sorter']; }
// 
// Game.ascSorter = function(a, b) {
//   var A = Game.playerScore(a),
//       B = Game.playerScore(b);
//   return A == B ? 0 : A < B ? -1 : 1;
// }
// 
// Game.descSorter = function(a, b) {
//   var A = Game.playerScore(a),
//       B = Game.playerScore(b);
//   return A == B ? 0 : A < B ? 1 : -1;
// }
// 
// Game.sortPlayers = function() {
//   var list = Game.playerList();
//   $.each(Game.players().sort(Game.sortFunction()), function(_,p) { list.append(p); });
//   Game.updatePlayers();
// }
// 
// Game.updatePlayers = function() {
//   var players = Game.players();
//   Game.playerList().find('.grid_4').removeClass('grid_4').addClass('grid_3');
//   players.eq(0).removeClass('grid_3').addClass('grid_4');
//   $('#graph, #graph + br.clear').insertAfter($('#players .player.grid_4'));
// }
// 
// Game.scoreUpdated = function(e, data) {
//   Game.changeScore($(e.target).closest('.player'), data.score);
// }
// 
// $(function() {
//   $('.player form').bind('ajax:success', Game.scoreUpdated);
//   $('.player :text').blur(function(e) { $(e.target).closest('form').submit(); });
// 
//   $('[data-game-names]').each(function(_,field) {
//     $(field).autocomplete($(field).attr('data-game-names').split(';:'));
//   });
// });
