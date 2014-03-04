(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/reg2.html');
    template = _.template(tpl);
    return Backbone.View.extend({
      render: function() {
        this.$el.html(template());
        window.indexView.triggerChangePage();
        return this;
      },
      reg: function() {
        var _this = this;
        this.mobile = this.$el.find(".mobile").val();
        this.password = this.$el.find(".token").val();
        this.password_confirmation = this.$el.find(".password_confirmation").val();
        return this.loader = new Loader(url, {}, function(data) {
          $.cookie('login', $.param(data));
          window.login = data;
          return window.router.navigate('/reg2', true);
        });
      }
    });
  });

}).call(this);
