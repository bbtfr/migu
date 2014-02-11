(function() {
  define(function(require) {
    "use strict";
    var Activity, Backbone, _;
    _ = require('underscore');
    Backbone = require('backbone');
    Activity = require('models/activity');
    return Backbone.Collection.extend({
      model: Activity
    });
  });

}).call(this);
