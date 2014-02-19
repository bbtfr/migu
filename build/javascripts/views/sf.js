(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, HotView, Loader, SongMoreView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/sf.html');
    SongMoreView = require('views/songMore');
    HotView = require('views/hot');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.loader = new Loader("api/sf.json", {}, function(data) {
          _this.$el.html(template(data));
          _this.sf = new SongMoreView({
            el: _this.$el.find("#sf")
          }).render(data["sf"]);
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
