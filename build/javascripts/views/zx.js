(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, NewsMoreView, TopNewsView, template, tpl, url, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/zx.html');
    TopNewsView = require('views/topNews');
    NewsMoreView = require('views/newsMore');
    template = _.template(tpl);
    Loader = require('utils/loader');
    url = "api/zx.json";
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.$el.html(template());
        this.zx = new NewsMoreView({
          el: this.$el.find("#zx"),
          url: url,
          key: "zx"
        }).render();
        this.loader = new Loader("api/tt.json", function(data) {
          return _this.topNews = new TopNewsView({
            el: _this.$el.find("#topNews")
          }).render(data["tt"][0]);
        });
        return this;
      }
    });
  });

}).call(this);
