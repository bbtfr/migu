(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, NewsMoreView, template, tpl, urls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/showNews.html');
    NewsMoreView = require('views/newsMore');
    template = _.template(tpl);
    Loader = require('utils/loader');
    urls = {
      "xgxw": "/api/xgxw.json"
    };
    return Backbone.View.extend({
      initialize: function(options) {
        return this.url = options["url"];
      },
      render: function() {
        var _this = this;
        this.loader = new Loader(this.url, function(data) {
          _this.$el.html(template(data));
          _this.xgxw = new NewsMoreView({
            el: _this.$el.find("#xgxw"),
            url: urls["xgxw"],
            key: "xgxw",
            eachPage: 4,
            type: "rNews"
          }).render(false);
          return window.indexView.triggerChangePage();
        });
        return this;
      }
    });
  });

}).call(this);
