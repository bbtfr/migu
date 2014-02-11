(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SongMoreView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/search.html');
    SongMoreView = require('views/songMore');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      initialize: function(options) {
        return this.query = options["query"];
      },
      render: function() {
        var _this = this;
        this.loader = new Loader("api/search.json?query=" + this.query, function(data) {
          _this.$el.html(template({
            query: _this.query,
            data: data
          }));
          _this.musics = new SongMoreView({
            el: _this.$el.find("#musics")
          }).render(data["musics"]);
          _this.artists = new SongMoreView({
            el: _this.$el.find("#artists"),
            type: "info"
          }).render(data["artists"]);
          _this.albums = new SongMoreView({
            el: _this.$el.find("#albums"),
            type: "info"
          }).render(data["albums"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      }
    });
  });

}).call(this);
