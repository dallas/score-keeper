function updatePlayerScore(selector, score) {
  $(selector + ' .score').html(score);
  $(selector + ' .update-score :text').val(0);
  resortPlayers();
}

function resortPlayers() {
  var playerList, players, sortOrder;
  playerList  = $('#players');
  players     = getPlayers(playerList);
  sortOrder   = playerList.attr('data-sort-order');
  players.sort(function(a, b) {
    var A, B;
    A = parseInt($(a).find('.score').text());
    B = parseInt($(b).find('.score').text());
    if (A < B) return sortOrder == 'asc' ? -1 : 1;
    if (A > B) return sortOrder == 'asc' ? 1 : -1;
    return 0;
  });
  $.each(players, function(_, player) { playerList.append(player); });
  updatePlayers(playerList);
  $('#graph, #graph + br.clear').insertAfter($('#players .player.grid_4'));
}

function updatePlayers(playerList) {
  players = getPlayers(playerList);
  playerList.find('.grid_4').removeClass('grid_4').addClass('grid_3');
  players.eq(0).removeClass('grid_3').addClass('grid_4');
}

function getPlayers(playerList) { return playerList.children('.player'); }
