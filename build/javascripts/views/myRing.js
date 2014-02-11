(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, CurrRingView, HotView, Loader, SongMoreView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/myRing.html');
    HotView = require('views/hot');
    SongMoreView = require('views/songMore');
    CurrRingView = require('views/currRing');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.loader = new Loader("api/wdcl.json?token=" + window.login.token, function(data) {
          _this.$el.html(template());
          if (data["dqcl"]) {
            _this.currRing = new CurrRingView({
              el: _this.$el.find("#currRing")
            }).render(data["dqcl"][0]);
          }
          _this.myRing = new SongMoreView({
            el: _this.$el.find("#myRing"),
            type: "ring",
            eachPage: 3
          }).render(data["wdcl"]);
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
