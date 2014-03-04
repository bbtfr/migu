(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/add2.html');
    template = _.template(tpl);
    return Backbone.View.extend({
      events: {
        "click .retry": "retry",
        "click .back": "back"
      },
      render: function() {
        this.$el.html(template());
        window.indexView.triggerChangePage();
        return this;
      },
      retry: function() {
        return window.router.navigate("/add", true);
      },
      back: function() {
        return window.router.navigate("/home", true);
      }
    });
  });

}).call(this);
