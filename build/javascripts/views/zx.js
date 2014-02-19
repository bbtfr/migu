(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, NewsMoreView, TopNewsView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/zx.html');
    TopNewsView = require('views/topNews');
    NewsMoreView = require('views/newsMore');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.loader = new Loader("api/zx.json", {}, function(data) {
          _this.$el.html(template(data));
          if (data["tt"]) {
            _this.topNews = new TopNewsView({
              el: _this.$el.find("#topNews")
            }).render(data["tt"][0]);
          }
          _this.zx = new NewsMoreView({
            el: _this.$el.find("#zx")
          }).render(data["zx"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      }
    });
  });

}).call(this);
