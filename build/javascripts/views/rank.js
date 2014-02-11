(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SongListView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/rank.html');
    SongListView = require('views/songList');
    Loader = require('utils/loader');
    template = _.template(tpl);
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.loader = new Loader("api/bd.json", function(data) {
          _this.$el.html(template(data));
          _this.yyb = new SongListView({
            el: _this.$el.find("#yyb-list")
          }).render(data["yyb"]);
          _this.jqb = new SongListView({
            el: _this.$el.find("#jqb-list")
          }).render(data["jqb"]);
          _this.clb = new SongListView({
            el: _this.$el.find("#clb-list")
          }).render(data["clb"]);
          _this.bd4 = new SongListView({
            el: _this.$el.find("#bd4-list")
          }).render(data["yyb"]);
          _this.bd5 = new SongListView({
            el: _this.$el.find("#bd5-list")
          }).render(data["jqb"]);
          _this.bd6 = new SongListView({
            el: _this.$el.find("#bd6-list")
          }).render(data["clb"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      }
    });
  });

}).call(this);
