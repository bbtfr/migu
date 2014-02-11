(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, NewsListView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/newsMore.html');
    NewsListView = require('views/newsList');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      currPage: 0,
      totalPage: 0,
      initialize: function(options) {
        this.eachPage = options["eachPage"] || 6;
        return this.type = options["type"] || "news";
      },
      events: {
        "click .prev": "prev",
        "click .next": "next",
        "click .pageBtn": "page"
      },
      prev: function() {
        return this.goto(this.currPage - 1);
      },
      next: function() {
        return this.goto(this.currPage + 1);
      },
      page: function() {
        return this.goto(parseInt(this.$pageBox.val()));
      },
      goto: function(n) {
        if (n > 0 && n <= this.totalPage) {
          this.newsMore.render(this.data.slice(this.eachPage * (n - 1), this.eachPage * n));
          this.$pageBox.val(n);
          this.currPage = n;
        }
        return false;
      },
      render: function(news) {
        this.data = news;
        this.totalPage = Math.ceil(this.data.length / this.eachPage);
        this.currPage = 1;
        this.$el.html(template({
          totalPage: this.totalPage,
          currPage: this.currPage
        }));
        this.$pageBox = this.$el.find(".pageBox");
        this.newsMore = new NewsListView({
          el: this.$el.find("#news-list"),
          type: this.type
        }).render(this.data.slice(0, this.eachPage));
        return this;
      }
    });
  });

}).call(this);
