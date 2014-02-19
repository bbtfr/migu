(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SongMoreView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/type1.html');
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
        var _this = this;
        this.loader = new Loader(this.url, {}, function(data) {
          _this.$el.html(template(data));
          _this.type = new SongMoreView({
            el: _this.$el.find("#type")
          }).render(data["fl"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      },
      back: function() {
        return window.indexView.back();
      }
    });
  });

}).call(this);
