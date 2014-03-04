(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/prList.html');
    template = _.template(tpl);
    return Backbone.View.extend({
      render: function(pr) {
        this.$el.html(template({
          pr: pr
        }));
        return this;
      }
    });
  });

}).call(this);
