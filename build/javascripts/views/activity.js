(function() {
  define(function(require) {
    "use strict";
    var $, ActivityListView, Backbone, Loader, SliderView, template, tpl, url, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/activity.html');
    SliderView = require('views/slider');
    ActivityListView = require('views/activityList');
    template = _.template(tpl);
    Loader = require('utils/loader');
    url = "api/hd.json";
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.loader = new Loader(url, function(data) {
          _this.$el.html(template());
          _this.jbrd = new ActivityListView({
            el: _this.$el.find("#jbrd")
          }).render(data["jbrd"]);
          _this.yyxc = new ActivityListView({
            el: _this.$el.find("#yyxc")
          }).render(data["yyxc"]);
          _this.djtj = new ActivityListView({
            el: _this.$el.find("#djtj")
          }).render(data["djtj"]);
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
