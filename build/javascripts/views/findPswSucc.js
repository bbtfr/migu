(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/findPswSucc.html');
    template = _.template(tpl);
    return Backbone.View.extend({
      events: {
        "click .back": "back"
      },
      render: function() {
        this.$el.html(template());
        window.indexView.triggerChangePage();
        return this;
      },
      back: function() {
        return window.indexView.back();
      }
    });
  });

}).call(this);
