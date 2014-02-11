(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, NewsListView, SliderView, SongListView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/home.html');
    SliderView = require('views/slider');
    SongListView = require('views/songList');
    NewsListView = require('views/newsList');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.loader = new Loader("api/home.json", function(data) {
          _this.$el.html(template(data));
          _this.sf = new SongListView({
            el: _this.$el.find("#sf-list")
          }).render(data["sf"]);
          _this.bd = new SongListView({
            el: _this.$el.find("#bd-list")
          }).render(data["bd"]);
          _this.zx = new NewsListView({
            el: _this.$el.find("#news-list")
          }).render(data["zx"]);
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
