(function() {
  define(function(require) {
    "use strict";
    var $, AutoCompleteView, Backbone, LoginDialogView, NavbarMap, PageSlider, PlayerView, VMSMap, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    PlayerView = require('views/player');
    AutoCompleteView = require('views/autoComplete');
    LoginDialogView = require('views/loginDialog');
    PageSlider = require('utils/page_slider');
    VMSMap = require('vmsMap');
    NavbarMap = {
      "sf": "home",
      "zx": "home",
      "news": "home",
      "regVip": "vip",
      "regSucc": "vip",
      "regFail": "vip"
    };
    return Backbone.View.extend({
      $container: $("section.container"),
      $navbar: $("nav.navbar"),
      $navbarMore: $(".navbarMore"),
      pageStack: [],
      events: {
        "click #navbar .navbar-more-button": "toggleNavbarMore",
        "click #search .send_query": "send_query",
        "focus #search .query": "send_autocomplete",
        "blur #search": "remove_autocomplete",
        "click a[href^='#play']": "play",
        "click a[href^='#loginDialog']": "showLoginDialog",
        "click [rl-id]": "logRLId",
        "click [t-id]": "logTId",
        "click [s-id]": "logSId",
        "click a": "cleanVms"
      },
      initialize: function() {
        this.$el = $("body");
        this.pageSlider = new PageSlider(this.$container);
        this.autocomplete = new AutoCompleteView({
          el: this.$el.find("#autocomplete")
        });
        window.loginDialog = this.loginDialog = new LoginDialogView;
        window.player = this.player = new PlayerView();
        this.updateUsername(window.login);
        $("body").click(this.logVms);
        return Backbone.history.bind("route", function(route, router) {
          var hash;
          hash = window.location.hash;
          console.log(hash);
          console.log(VMSMap[hash]);
          return $.get("path/to/vms");
        });
      },
      triggerChangePage: function() {
        return this.$container.trigger("page_slider.change");
      },
      showInfo: function(info, options) {
        if (options == null) {
          options = {};
        }
        if (this.showInfoIndex != null) {
          clearTimeout(this.showInfoIndex);
        }
        $.mobile.loading("show", {
          text: info,
          textonly: true
        });
        return this.showInfoIndex = setTimeout(function() {
          return $.mobile.loading("hide");
        }, 2000);
      },
      showLoading: function() {
        return $.mobile.loading("show");
      },
      hideLoading: function() {
        return $.mobile.loading("hide");
      },
      play: function(e) {
        var id, song;
        id = $(e.target).closest('a').attr('href').match(/\d+/g)[0];
        song = window.songs.get(id);
        if (song) {
          window.player.add(song.attributes, true);
        }
        return e.preventDefault();
      },
      showLoginDialog: function(e) {
        this.login();
        return e.preventDefault();
      },
      login: function(callback) {
        if (callback == null) {
          callback = null;
        }
        if (!window.login) {
          return this.loginDialog.render(callback);
        } else {
          if (callback) {
            return callback();
          }
        }
      },
      toggleNavbarButton: function(key) {
        if (NavbarMap[key]) {
          key = NavbarMap[key];
        }
        this.$navbar.find(".current").removeClass('current');
        this.$navbar.find(".navbar-" + key + "-button").addClass('current');
        return false;
      },
      toggleNavbarMore: function(e) {
        this.$navbarMore.slideToggle();
        return e.preventDefault();
      },
      changePage: function(key, page) {
        this.toggleNavbarButton(key);
        this.pageSlider.slidePage(page);
        return this.pageStack.push(page);
      },
      back: function() {
        if (this.pageStack.length > 1) {
          window.history.reverse = true;
          window.history.back();
        } else {
          window.router.navigate("/home", true);
        }
        return false;
      },
      send_query: function() {
        var query;
        query = this.$el.find("#search .query").blur().val();
        if (query) {
          return this.search(query);
        } else {
          return this.showInfo("请输入搜索内容");
        }
      },
      search: function(query) {
        window.router.navigate("/search/" + query, true);
        return false;
      },
      send_autocomplete: function() {
        var _this = this;
        return this.autocomplateIndex = setInterval(function() {
          var query;
          query = _this.$el.find("#search .query").val();
          return _this.autocomplete.render(query);
        }, 200);
      },
      remove_autocomplete: function() {
        var _this = this;
        clearInterval(this.autocomplateIndex);
        return setTimeout(function() {
          return _this.autocomplete.empty();
        }, 200);
      },
      updateUsername: function(data) {
        var $loginSidebarLink;
        window.login = data;
        $loginSidebarLink = this.$el.find(".loginSidebarLink");
        if (data) {
          $.cookie('login', $.param(data));
          if (data.email) {
            return $loginSidebarLink.text(data.email);
          } else {
            return $loginSidebarLink.text(data.mobile);
          }
        } else {
          $.removeCookie('login');
          return $loginSidebarLink.text("登录");
        }
      },
      logVms: function(e) {
        var vms;
        if (window.clickVms) {
          window.vms = vms = window.sId + window.tId + window.rlId;
          console.log(window.vms);
          window.clickVms = false;
        }
        return true;
      },
      logRLId: function(e) {
        window.clickVms = true;
        return window.rlId = $(e.currentTarget).attr('rl-id');
      },
      logTId: function(e) {
        return window.tId = $(e.currentTarget).attr('t-id');
      },
      logSId: function(e) {
        return window.sId = $(e.currentTarget).attr('s-id');
      },
      cleanVms: function(e) {
        return window.vms = null;
      }
    });
  });

}).call(this);
