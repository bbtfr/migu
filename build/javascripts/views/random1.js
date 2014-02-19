(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SongListView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/random1.html');
    SongListView = require('views/songList');
    template = _.template(tpl);
    Loader = require('utils/loader');
    window.randomTitle = "新歌推荐";
    return Backbone.View.extend({
      initialize: function(options) {
        window.randomTitle = this.title = options["title"];
        return this.url = options["url"];
      },
      events: {
        "click #pd .refresh a": "refresh"
      },
      refresh: function() {
        var _this = this;
        this.loader = new Loader(this.url, null, function(data) {
          return _this.pd.render(data["pd"]);
        });
        return false;
      },
      render: function() {
        var _this = this;
        this.loader = new Loader(this.url, null, function(data) {
          _this.$el.html(template({
            title: _this.title
          }));
          _this.pd = new SongListView({
            el: _this.$el.find("#pd-list")
          }).render(data["pd"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      }
    });
  });

}).call(this);
