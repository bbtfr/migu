(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/activityList.html');
    template = _.template(tpl);
    return Backbone.View.extend({
      render: function(activities) {
        window.activities.add(activities);
        tpl = template({
          activities: activities
        });
        this.$el.html(tpl);
        return this;
      }
    });
  });

}).call(this);
