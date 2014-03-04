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
      initialize: function(options) {
        this.eachPage = options["eachPage"] || 8;
        this.type = options["type"] || "news";
        this.url = options["url"];
        return this.key = options["key"];
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
        var _this = this;
        if (n > 0 && n <= this.totalPage) {
          this.loader = new Loader("" + this.url + "?page=" + n + "&eachPage=" + this.eachPage, function(data) {
            _this.newsMore.render(data[_this.key]);
            _this.$pageBox.val(n);
            return _this.currPage = n;
          });
        }
        return false;
      },
      render: function(triggerChangePage) {
        var _this = this;
        if (triggerChangePage == null) {
          triggerChangePage = true;
        }
        this.loader = new Loader("" + this.url + "?page=1&eachPage=" + this.eachPage, function(data) {
          _this.currPage = 1;
          _this.totalPage = data["totalPage"];
          _this.$el.html(template({
            totalPage: _this.totalPage,
            currPage: _this.currPage
          }));
          _this.$pageBox = _this.$el.find(".pageBox");
          _this.newsMore = new NewsListView({
            el: _this.$el.find("#news-list"),
            type: _this.type
          }).render(data[_this.key]);
          if (triggerChangePage) {
            return window.indexView.triggerChangePage();
          }
        });
        return this;
      }
    });
  });

}).call(this);
