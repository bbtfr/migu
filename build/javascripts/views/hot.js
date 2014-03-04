(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SongListView, template, tpl, urls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/hot.html');
    SongListView = require('views/songList');
    template = _.template(tpl);
    Loader = require('utils/loader');
    urls = {
      rmtj: "api/rmtj.json",
      cnxh: "api/cnxh.json"
    };
    return Backbone.View.extend({
      events: {
        "click #rmtj .refresh a": "refresh_rmtj",
        "click #cnxh .refresh a": "refresh_cnxh"
      },
      refresh_rmtj: function() {
        return this.refresh(urls["rmtj"], this.rmtj, "rmtj");
      },
      refresh_cnxh: function() {
        return this.refresh(urls["cnxh"], this.cnxh, "cnxh");
      },
      refresh: function(url, page, key) {
        var _this = this;
        this.loader = new Loader(url, function(data) {
          return page.render(data[key]);
        });
        return false;
      },
      render: function(rmtjData, cnxhData) {
        this.$el.html(template());
        this.rmtj = new SongListView({
          el: this.$el.find("#rmtj-list")
        });
        this.cnxh = new SongListView({
          el: this.$el.find("#cnxh-list")
        });
        this.refresh_rmtj();
        this.refresh_cnxh();
        return this.$el.tabs();
      }
    });
  });

}).call(this);
