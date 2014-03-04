(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, template, tpl, url, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/reg.html');
    template = _.template(tpl);
    Loader = require('utils/post_loader');
    url = "api/reg.json";
    return Backbone.View.extend({
      events: {
        "click .next": "reg"
      },
      render: function() {
        this.$el.html(template());
        window.indexView.triggerChangePage();
        return this;
      },
      reg: function() {
        var _this = this;
        this.mobile = this.$el.find(".mobile").val();
        this.password = this.$el.find(".password").val();
        this.password_confirmation = this.$el.find(".password_confirmation").val();
        return this.loader = new Loader(url, {}, function(data) {
          return window.router.navigate("/reg2", true);
        }, function(data) {
          return window.router.navigate("/reg3", true);
        });
      }
    });
  });

}).call(this);
