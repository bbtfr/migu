(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, HotView, Loader, orderTpls, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/tariff.html');
    orderTpls = [require('text!tpl/order2.html'), require('text!tpl/order3.html'), require('text!tpl/order4.html'), require('text!tpl/order5.html')];
    HotView = require('views/hot');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      initialize: function(options) {
        return this.url = options["url"];
      },
      events: {
        "click [data-order]": "order",
        "click .send_gift": "send_gift",
        "click .submit": "submit",
        "click .cancel": "cancel"
      },
      render: function() {
        var _this = this;
        this.loader = new Loader(this.url, function(data) {
          _this.data = data["zf"];
          _this.$el.html(template(data));
          _this.hot = new HotView({
            el: _this.$el.find("#hot")
          }).render(data["rmtj"], data["cnxh"]);
          return window.indexView.triggerChangePage();
        });
        return this;
      },
      order: function(e) {
        var $a;
        $a = $(e.currentTarget);
        this.order = $a.data("order");
        this.type = $a.data("type");
        this.redirect = $a.attr("href");
        this.$el.find("#tariff").html(_.template(orderTpls[this.order - 2])({
          zf: this.data,
          order: this.order,
          type: this.type
        }));
        return false;
      },
      send_gift: function(e) {
        var _this = this;
        this.username = this.$el.find("#username").val();
        this.mobile = this.$el.find("#mobile").val();
        this.types = {};
        this.$el.find(".gift").each(function(index, el) {
          return _this.types[index] = $(el).val();
        });
        return window.router.ajax("path/to/send/gift", "赠送礼物");
      },
      submit: function(e) {
        window.router.navigate(this.redirect, true);
        return false;
      },
      cancel: function(e) {
        this.render();
        return false;
      }
    });
  });

}).call(this);
