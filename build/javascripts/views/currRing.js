(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/currRing.html');
    template = _.template(tpl);
    return Backbone.View.extend({
      render: function(ring) {
        window.songs.add(ring);
        tpl = template({
          ring: ring
        });
        this.$el.html(tpl);
        return this;
      }
    });
  });

}).call(this);
