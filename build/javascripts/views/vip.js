(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, SliderView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/vip.html');
    SliderView = require('views/slider');
    template = _.template(tpl);
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template());
        window.indexView.triggerChangePage();
        return this;
      },
      rerender: function() {
        return this.slider = new SliderView({
          el: this.$el.find("#slider"),
          type: "vip"
        }).render();
      }
    });
  });

}).call(this);
