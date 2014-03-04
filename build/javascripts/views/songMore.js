(function() {
  var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SongListView, tpls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    SongListView = require('views/songList');
    tpls = {
      song: require('text!tpl/songMore.html'),
      ring: require('text!tpl/ringMore.html'),
      info: require('text!tpl/songMore.html')
    };
    Loader = require('utils/loader');
    return Backbone.View.extend({
      currPage: 0,
      initialize: function(options) {
        this.eachPage = options["eachPage"] || 10;
        this.type = options["type"] || "song";
        this.template = _.template(tpls[this.type]);
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
      generate_url: function(n) {
        var url;
        if (__indexOf.call(this.url, '?') >= 0) {
          url = "" + this.url + "&";
        } else {
          url = "" + this.url + "?";
        }
        url += "page=" + n + "&eachPage=" + this.eachPage;
        return url;
      },
      goto: function(n) {
        var _this = this;
        if (n > 0 && n <= this.totalPage) {
          this.loader = new Loader(this.generate_url(n), function(data) {
            _this.songMore.render(data[_this.key]);
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
        this.loader = new Loader(this.generate_url(1), function(data) {
          _this.totalPage = data["totalPage"];
          _this.currPage = 1;
          _this.$el.html(_this.template({
            totalPage: _this.totalPage,
            currPage: _this.currPage
          }));
          _this.$pageBox = _this.$el.find(".pageBox");
          _this.songMore = new SongListView({
            el: _this.$el.find("#song-list"),
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
