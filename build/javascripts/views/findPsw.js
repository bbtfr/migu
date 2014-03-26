(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, template, tpl, urls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/findPsw.html');
    template = _.template(tpl);
    Loader = require('utils/loader');
    urls = {
      token: "api/token.json",
      findpassword: "api/findpassword.json"
    };
    return Backbone.View.extend({
      events: {
        "click .get_token": "get_token",
        "click .find_password": "find_password"
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
        this.mobile = this.$el.find(".mobile").val();
        if (!this.mobile.match(/\d{11}/g)) {
          window.indexView.showInfo("您输入的手机号码有误");
          return;
        }
        $get_token = this.$el.find(".get_token").hide();
        this.loader = new Loader(urls["token"], function(data) {});
        $wait = this.$el.find(".wait").show();
        $wait.val("还剩" + countdown + "秒");
        console.log($wait);
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
      find_password: function() {
        var _this = this;
        this.token = this.$el.find(".token").val();
        if (!this.token.match(/\d{6}/g)) {
          window.indexView.showInfo("您输入的短信验证码有误");
          return;
        }
        this.password = this.$el.find(".password").val();
        return this.loader = new Loader(urls["findpassword"], function(data) {
          window.indexView.updateUsername(data);
          return window.router.navigate('findPswSucc', true);
        });
      }
    });
  });

}).call(this);
