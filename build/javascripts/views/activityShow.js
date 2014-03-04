(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, SliderView, SongListView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/activityShow.html');
    SliderView = require('views/slider');
    SongListView = require('views/songList');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      initialize: function(options) {
        return this.url = options["url"];
      },
      render: function() {
        var _this = this;
        this.loader = new Loader(this.url, function(data) {
          _this.$el.html(template(data));
          _this.jtqm = new SongListView({
            el: _this.$el.find("#tjqm-list")
          }).render(data["tjqm"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      },
      rerender: function() {
        return this.slider = new SliderView({
          el: this.$el.find("#slider")
        }).render();
      }
    });
  });

}).call(this);
