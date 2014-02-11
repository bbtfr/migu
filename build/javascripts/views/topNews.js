(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/topNews.html');
    template = _.template(tpl);
    return Backbone.View.extend({
      render: function(news) {
        window.news.add(news);
        tpl = template({
          news: news
        });
        this.$el.html(tpl);
        return this;
      }
    });
  });

}).call(this);
