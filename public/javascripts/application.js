window.App = {};
_.templateSettings = { interpolate: /\{\{(.+?)\}\}/g };

(function() {
  var base    = '/javascripts/coffee/',
      iCanHaz = function(name, opts) { CoffeeScript.load(base + name + '.coffee', opts); };
  $.Deferred(function() {
      iCanHaz('game');
    // iCanHaz('game_play');
    // iCanHaz('game_player');
    // iCanHaz('player');
    // iCanHaz('application');
  }).then(function() {
    // trigger an event so we know the app is fully loaded
    $('body').trigger('app:loaded');
  });
})();
