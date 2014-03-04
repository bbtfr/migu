(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, CurrRingView, HotView, Loader, SongMoreView, template, tpl, urls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/myRing.html');
    HotView = require('views/hot');
    SongMoreView = require('views/songMore');
    CurrRingView = require('views/currRing');
    template = _.template(tpl);
    Loader = require('utils/loader');
    urls = {
      "wdcl": "api/wdcl.json",
      "qtcl": "api/qtcl.json"
    };
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.$el.html(template());
        this.loader = new Loader("" + urls["wdcl"] + "?token=" + window.login.token, function(data) {
          _this.currRing = new CurrRingView({
            el: _this.$el.find("#currRing")
          }).render(data["dqcl"][0]);
          return window.indexView.triggerChangePage();
        });
        this.myRing = new SongMoreView({
          el: this.$el.find("#myRing"),
          url: "" + urls["qtcl"] + "?token=" + window.login.token,
          key: "qtcl",
          eachPage: 3,
          type: "ring"
        }).render(false);
        this.hot = new HotView({
          el: this.$el.find("#hot")
        }).render();
        return this;
      }
    });
  });

}).call(this);
