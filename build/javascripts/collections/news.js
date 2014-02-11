(function() {
  define(function(require) {
    "use strict";
    var Backbone, News, _;
    _ = require('underscore');
    Backbone = require('backbone');
    News = require('models/news');
    return Backbone.Collection.extend({
      model: News
    });
  });

}).call(this);
