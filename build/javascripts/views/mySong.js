(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, HotView, Loader, SongMoreView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/mySong.html');
    SongMoreView = require('views/songMore');
    HotView = require('views/hot');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.loader = new Loader("api/wdgd.json?token=" + window.login.token, null, function(data) {
          _this.$el.html(template());
          _this.mySong = new SongMoreView({
            el: _this.$el.find("#mySong")
          }).render(data["wdgd"]);
          _this.hot = new HotView({
            el: _this.$el.find("#hot")
          }).render(data["rmtj"], data["cnxh"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      }
    });
  });

}).call(this);
