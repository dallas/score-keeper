// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
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
    var compA, compB, sortValue;
    compA   = parseInt($(a).find('.score').text());
    compB   = parseInt($(b).find('.score').text());
    sortValue  = 0;
    if (compA < compB) { sortValue = sortOrder == 'asc' ? -1 : 1; }
    if (compA > compB) { sortValue = sortOrder == 'asc' ? 1 : -1; }
    return sortValue;
  });
  $.each(players, function(_, player) { playerList.append(player); });
  updatePlayers(playerList);
}

function updatePlayers(playerList) {
  players = getPlayers(playerList);
  playerList.find('.grid_4').removeClass('grid_4').addClass('grid_3');
  players.eq(0).removeClass('grid_3').addClass('grid_4');
}

function getPlayers(playerList) { return playerList.children('article'); }
