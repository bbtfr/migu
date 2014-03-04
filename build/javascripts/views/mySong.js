(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, HotView, Loader, SongMoreView, template, tpl, url, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/mySong.html');
    SongMoreView = require('views/songMore');
    HotView = require('views/hot');
    template = _.template(tpl);
    Loader = require('utils/loader');
    url = "api/wdgd.json";
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template());
        this.mySong = new SongMoreView({
          el: this.$el.find("#mySong"),
          url: "" + url + "?token=" + window.login.token,
          key: "wdgd"
        }).render();
        this.hot = new HotView({
          el: this.$el.find("#hot")
        }).render();
        return this;
      }
    });
  });

}).call(this);
