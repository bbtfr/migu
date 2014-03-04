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
        var activities2, activity, index, _i, _len;
        activities2 = [];
        for (index = _i = 0, _len = activities.length; _i < _len; index = _i += 2) {
          activity = activities[index];
          activities2.push([activities[index], activities[index + 1]]);
        }
        tpl = template({
          activities: activities2,
          title: this.$el.data('title')
        });
        this.$el.html(tpl);
        return this;
      }
    });
  });

}).call(this);
