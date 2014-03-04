(function() {
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
      album: require('text!tpl/songMore.html'),
      artist: require('text!tpl/songMore.html')
    };
    Loader = require('utils/loader');
    return Backbone.View.extend({
      currPage: 0,
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
          this.songMore.render(this.data.slice((this.currPage - 1) * this.eachPage, +(this.currPage * this.eachPage) + 1 || 9e9));
          this.$pageBox.val(n);
          this.currPage = n;
        }
        return false;
      },
      render: function(data) {
        this.totalPage = Math.ceil(data.length / this.eachPage);
        this.currPage = 1;
        this.data = data;
        this.$el.html(this.template({
          totalPage: this.totalPage,
          currPage: this.currPage
        }));
        this.$pageBox = this.$el.find(".pageBox");
        this.songMore = new SongListView({
          el: this.$el.find("#song-list"),
          type: this.type
        });
        this.goto(1);
        window.indexView.triggerChangePage();
        return this;
      }
    });
  });

}).call(this);
