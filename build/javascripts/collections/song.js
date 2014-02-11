(function() {
  define(function(require) {
    "use strict";
    var Backbone, Song, _;
    _ = require('underscore');
    Backbone = require('backbone');
    Song = require('models/song');
    return Backbone.Collection.extend({
      model: Song
    });
  });

}).call(this);
