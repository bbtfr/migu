(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, HotView, Loader, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/tariff.html');
    HotView = require('views/hot');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      initialize: function(options) {
        return this.url = options["url"];
      },
      render: function() {
        var _this = this;
        this.loader = new Loader(this.url, function(data) {
          _this.data = data["zf"];
          _this.$el.html(template(data));
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
