(function() {
  define(function(require) {
    "use strict";
    var $, AutoCompleteView, Backbone, NavbarMap, PageSlider, PlayerView, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    PlayerView = require('views/player');
    AutoCompleteView = require('views/autoComplete');
    PageSlider = require('utils/page_slider');
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
        "click a[href^='#play']": "play"
      },
      initialize: function() {
        this.$el = $("body");
        this.pageSlider = new PageSlider(this.$container);
        this.autocomplete = new AutoCompleteView({
          el: this.$el.find("#autocomplete")
        });
        return window.player = this.player = new PlayerView();
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
        return false;
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
        return false;
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
      }
    });
  });

}).call(this);
