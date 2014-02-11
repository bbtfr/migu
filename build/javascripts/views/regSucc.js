(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/regSucc.html');
    template = _.template(tpl);
    return Backbone.View.extend({
      events: {
        "click .back": "back"
      },
      initialize: function(options) {
        if (options == null) {
          options = {};
        }
        return this.success = options["success"] || true;
      },
      render: function() {
        this.$el.html(template({
          success: this.success
        }));
        window.indexView.triggerChangePage();
        return this;
      },
      back: function() {
        return window.indexView.back();
      }
    });
  });

}).call(this);
