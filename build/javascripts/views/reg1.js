(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, template, tpl, urls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/reg1.html');
    template = _.template(tpl);
    Loader = require('utils/post_loader');
    urls = {
      token: "api/token.json",
      reg: "api/reg.json"
    };
    return Backbone.View.extend({
      events: {
        "click .get_token": "get_token",
        "click .send_token": "send_token"
      },
      render: function() {
        this.$el.html(template());
        window.indexView.triggerChangePage();
        return this;
      },
      get_token: function() {
        var $get_token, $wait, countdown, index,
          _this = this;
        countdown = 60;
        this.mobile = this.$el.find(".mobile").text();
        if (!this.mobile.match(/\d{11}/g)) {
          window.indexView.showInfo("您输入的手机号码有误");
          return;
        }
        $get_token = this.$el.find(".get_token").hide();
        this.loader = new Loader(urls["token"], {}, function(data) {});
        $wait = this.$el.find(".wait").show();
        $wait.val("还剩" + countdown + "秒");
        return index = setInterval(function() {
          if (countdown > 0) {
            countdown -= 1;
            return $wait.val("还剩" + countdown + "秒");
          } else {
            $get_token.show();
            $wait.hide();
            return clearInterval(index);
          }
        }, 1000);
      },
      send_token: function() {
        var _this = this;
        this.token = this.$el.find(".token").val();
        if (!this.token.match(/\d{6}/g)) {
          window.indexView.showInfo("您输入的短信验证码有误");
          return;
        }
        return this.loader = new Loader(urls["reg"], {}, function(data) {
          return window.router.navigate("/reg2", true);
        }, function(data) {
          return window.router.navigate("/reg3", true);
        });
      }
    });
  });

}).call(this);
