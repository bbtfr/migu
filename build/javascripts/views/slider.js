(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, slides, template, tpl, urls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/slider.html');
    template = _.template(tpl);
    require('jqueryflexslider');
    slides = {
      "default": null,
      vip: null
    };
    urls = {
      "default": "api/slides.json",
      vip: "api/vip_slides.json"
    };
    return Backbone.View.extend({
      initialize: function(options) {
        this.type = options["type"] || "default";
        return this.url = options["url"] || urls[this.type];
      },
      initSlider: function() {
        this.$el.html(template(slides[this.type]));
        return this.$el.find(".flexslider").flexslider({
          animation: "slide",
          startAt: 1,
          directionNav: false
        });
      },
      render: function() {
        var _this = this;
        if (slides[this.type]) {
          this.initSlider();
        } else {
          $.getJSON(this.url, function(data) {
            slides[_this.type] = data;
            return _this.initSlider();
          });
        }
        return this;
      }
    });
  });

}).call(this);
