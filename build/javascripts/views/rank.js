(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SongListView, template, tpl, url, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/rank.html');
    SongListView = require('views/songList');
    Loader = require('utils/loader');
    template = _.template(tpl);
    url = "api/bd.json";
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.loader = new Loader(url, function(data) {
          _this.$el.html(template(data));
          _this.yyb = new SongListView({
            el: _this.$el.find("#yyb-list")
          }).render(data["yyb"]);
          _this.xrb = new SongListView({
            el: _this.$el.find("#xrb-list")
          }).render(data["xrb"]);
          _this.jqb = new SongListView({
            el: _this.$el.find("#jqb-list")
          }).render(data["jqb"]);
          _this.clb = new SongListView({
            el: _this.$el.find("#clb-list")
          }).render(data["clb"]);
          _this.ztb = new SongListView({
            el: _this.$el.find("#ztb-list")
          }).render(data["ztb"]);
          _this.yyrb = new SongListView({
            el: _this.$el.find("#yyrb-list")
          }).render(data["yyrb"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      }
    });
  });

}).call(this);
