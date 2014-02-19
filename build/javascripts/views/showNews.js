(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, NewsMoreView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/showNews.html');
    NewsMoreView = require('views/newsMore');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      initialize: function(options) {
        return this.url = options["url"];
      },
      render: function() {
        var _this = this;
        this.loader = new Loader(this.url, {}, function(data) {
          _this.$el.html(template(data));
          _this.xgxw = new NewsMoreView({
            el: _this.$el.find("#xgxw"),
            eachPage: 4,
            type: "rNews"
          }).render(data["xgxw"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      }
    });
  });

}).call(this);
