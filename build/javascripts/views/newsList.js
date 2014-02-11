(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, tpls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpls = {};
    tpls["news"] = require('text!tpl/newsList.html');
    tpls["rNews"] = require('text!tpl/rNewsList.html');
    return Backbone.View.extend({
      initialize: function(options) {
        var type;
        type = options["type"] || "news";
        return this.template = _.template(tpls[type]);
      },
      render: function(news) {
        var tpl;
        window.news.add(news);
        tpl = this.template({
          news: news
        });
        this.$el.html(tpl);
        return this;
      }
    });
  });

}).call(this);
