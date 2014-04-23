(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, PageSlider, RegView, ULoginView, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    ULoginView = require('views/uLogin');
    RegView = require('views/reg');
    PageSlider = require('utils/page_slider');
    return Backbone.View.extend({
      events: {
        "click .close": "close"
      },
      triggerChangePage: function() {
        return this.$el.trigger("page_slider.change");
      },
      render: function(callback) {
        if (callback == null) {
          callback = null;
        }
        this.$el.appendTo("#loginDialog");
        this.container = new PageSlider(this.$el);
        this.uLogin = new ULoginView({
          el: this.$el,
          callback: callback
        });
        this.container.slidePage(this.uLogin);
        return this;
      },
      close: function() {
        return this.$el.empty();
      }
    });
  });

}).call(this);
