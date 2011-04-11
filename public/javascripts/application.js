window.App = {};
_.templateSettings = { interpolate: /\{\{(.+?)\}\}/g };

(function() {
  var b='/javascripts/coffee/', c=CoffeeScript.load, e='.coffee', f=function(n,o){c(b+n+e,o)},
      iCanHaz=function(l,o){_.each(l.split(' '),function(n){f(n,o)})};
    // iCanHaz('game game_play game_player player application');
    iCanHaz('game');

    $('body').bind('games:loaded', function() { $('body').trigger('app:loaded'); });
    $('body').bind('app:loaded', function() { App.Games.refresh($('#games').data('games')); });
})();
