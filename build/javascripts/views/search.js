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
      events: {
        "click a[href^='#artists']": 'render_artists',
        "click a[href^='#albums']": 'render_albums'
      },
      initialize: function(options) {
        return this.query = options["query"];
      },
      render: function() {
        this.$el.html(template({
          query: this.query
        }));
        this.musics = new SongMoreView({
          el: this.$el.find("#musics"),
          url: "api/search.json?query=" + this.query + "&type=music",
          key: "musics"
        }).render();
        return this;
      },
      render_artists: function() {
        this.artists = new SongMoreView({
          el: this.$el.find("#artists"),
          url: "api/search.json?query=" + this.query + "&type=artist",
          type: "artist",
          key: "artists"
        }).render(false);
        return this;
      },
      render_albums: function() {
        this.artists = new SongMoreView({
          el: this.$el.find("#albums"),
          url: "api/search.json?query=" + this.query + "&type=album",
          type: "album",
          key: "albums"
        }).render(false);
        return this;
      }
    });
  });

}).call(this);
