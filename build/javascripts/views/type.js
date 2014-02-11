(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/type.html');
    template = _.template(tpl);
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template());
        window.indexView.triggerChangePage();
        return this;
      }
    });
  });

}).call(this);
