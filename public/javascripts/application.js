window.App = {};
_.templateSettings = { interpolate: /\{\{(.+?)\}\}/g };

(function() {
  var base = '/javascripts/coffee/', iCanHaz = CoffeeScript.load;
  iCanHaz(base + 'game.coffee');
  // iCanHaz(base + 'game_play.coffee');
  // iCanHaz(base + 'game_player.coffee');
  // iCanHaz(base + 'player.coffee');
  // iCanHaz(base + 'application.coffee');
})();
