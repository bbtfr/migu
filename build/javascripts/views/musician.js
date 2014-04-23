(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SongListView, SongMoreView, rqycphUrl, template, tjyyrUrl, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/musician.html');
    template = _.template(tpl);
    SongListView = require('views/songList');
    SongMoreView = require('views/songMore');
    Loader = require('utils/loader');
    rqycphUrl = "api/rqycph.json";
    tjyyrUrl = "api/tjyyr.json";
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template());
        this.rqycph = new SongMoreView({
          el: this.$el.find("#rqycph"),
          url: rqycphUrl,
          key: "rqycph",
          eachPage: 8
        }).render();
        this.tjyyr = new SongMoreView({
          el: this.$el.find("#tjyyr"),
          type: "musician",
          url: tjyyrUrl,
          key: "tjyyr",
          eachPage: 8
        }).render(false);
        return this;
      }
    });
  });

}).call(this);
