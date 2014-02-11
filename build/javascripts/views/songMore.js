(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, SongListView, tpls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    SongListView = require('views/songList');
    tpls = {};
    tpls["song"] = require('text!tpl/songMore.html');
    tpls["ring"] = require('text!tpl/ringMore.html');
    tpls["info"] = require('text!tpl/songMore.html');
    return Backbone.View.extend({
      currPage: 0,
      totalPage: 0,
      initialize: function(options) {
        this.eachPage = options["eachPage"] || 10;
        this.type = options["type"] || "song";
        return this.template = _.template(tpls[this.type]);
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
          this.songMore.render(this.data.slice(this.eachPage * (n - 1), this.eachPage * n));
          this.$pageBox.val(n);
          this.currPage = n;
        }
        return false;
      },
      render: function(songs) {
        this.data = songs;
        this.totalPage = Math.ceil(this.data.length / this.eachPage);
        this.currPage = 1;
        this.$el.html(this.template({
          totalPage: this.totalPage,
          currPage: this.currPage
        }));
        this.$pageBox = this.$el.find(".pageBox");
        this.songMore = new SongListView({
          el: this.$el.find("#song-list"),
          type: this.type
        }).render(this.data.slice(0, this.eachPage));
        return this;
      }
    });
  });

}).call(this);
