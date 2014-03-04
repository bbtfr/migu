(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, NewsListView, PrListView, SliderView, SongListView, template, tpl, url, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/home.html');
    SliderView = require('views/slider');
    SongListView = require('views/songList');
    NewsListView = require('views/newsList');
    PrListView = require('views/prList');
    template = _.template(tpl);
    Loader = require('utils/loader');
    url = "api/home.json";
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.loader = new Loader(url, function(data) {
          _this.$el.html(template());
          _this.sf = new SongListView({
            el: _this.$el.find("#sf-list")
          }).render(data["sf"]);
          _this.bd = new SongListView({
            el: _this.$el.find("#bd-list")
          }).render(data["bd"]);
          _this.zx = new NewsListView({
            el: _this.$el.find("#news-list")
          }).render(data["zx"]);
          _this.yygc = new PrListView({
            el: _this.$el.find("#yygc")
          }).render(data["yygc"]);
          _this.yyc = new PrListView({
            el: _this.$el.find("#yyc")
          }).render(data["yyc"]);
          _this.ymq = new PrListView({
            el: _this.$el.find("#ymq")
          }).render(data["ymq"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      },
      rerender: function() {
        return this.slider = new SliderView({
          el: this.$el.find("#slider")
        }).render();
      }
    });
  });

}).call(this);
