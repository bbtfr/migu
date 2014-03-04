(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SongMoreView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/rank1.html');
    SongMoreView = require('views/songMore');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      events: {
        "click .back": "back"
      },
      initialize: function(options) {
        this.title = options["title"];
        return this.url = options["url"];
      },
      render: function() {
        this.$el.html(template());
        this.rank = new SongMoreView({
          el: this.$el.find("#rank"),
          url: this.url,
          key: "bd"
        }).render();
        return this;
      },
      back: function() {
        return window.indexView.back();
      }
    });
  });

}).call(this);
