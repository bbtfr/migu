(function() {
  define(function(require) {
    "use strict";
    var $, ActivityListView, Backbone, Loader, SliderView, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/activity.html');
    SliderView = require('views/slider');
    ActivityListView = require('views/activityList');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      render: function() {
        var _this = this;
        this.loader = new Loader("api/hd.json", null, function(data) {
          _this.$el.html(template());
          _this.jbrd = [
            new ActivityListView({
              el: _this.$el.find("#jbrd1-list")
            }).render(data["jbrd"].slice(0, 2)), new ActivityListView({
              el: _this.$el.find("#jbrd2-list")
            }).render(data["jbrd"].slice(2, 4)), new ActivityListView({
              el: _this.$el.find("#jbrd3-list")
            }).render(data["jbrd"].slice(4, 6))
          ];
          _this.yyxc = [
            new ActivityListView({
              el: _this.$el.find("#yyxc1-list")
            }).render(data["yyxc"].slice(0, 2)), new ActivityListView({
              el: _this.$el.find("#yyxc2-list")
            }).render(data["yyxc"].slice(2, 4)), new ActivityListView({
              el: _this.$el.find("#yyxc3-list")
            }).render(data["yyxc"].slice(4, 6))
          ];
          _this.djtj = [
            new ActivityListView({
              el: _this.$el.find("#djtj1-list")
            }).render(data["djtj"].slice(0, 2)), new ActivityListView({
              el: _this.$el.find("#djtj2-list")
            }).render(data["djtj"].slice(2, 4)), new ActivityListView({
              el: _this.$el.find("#djtj3-list")
            }).render(data["djtj"].slice(4, 6))
          ];
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
