(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SongListView, SongMoreView, template, tpl, url, wqhgUrl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/free.html');
    template = _.template(tpl);
    Loader = require('utils/loader');
    SongListView = require('views/songList');
    SongMoreView = require('views/songMore');
    url = "api/free.json";
    wqhgUrl = "api/wqhg.json";
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.$el.html(template());
        this.loader = new Loader(url, function(data) {
          _this.$el.find("#list1-title").text(data["list1Title"]);
          _this.$el.find("#list2-title").text(data["list2Title"]);
          _this.list1 = new SongListView({
            el: _this.$el.find("#list1-list")
          }).render(data["list1"]);
          return _this.list2 = new SongListView({
            el: _this.$el.find("#list2-list")
          }).render(data["list2"]);
        });
        this.wqhg = new SongMoreView({
          el: this.$el.find("#wqhg"),
          url: wqhgUrl,
          key: "wqhg",
          eachPage: 8
        }).render();
        return this;
      }
    });
  });

}).call(this);
