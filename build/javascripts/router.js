(function() {
  define(function(require) {
    "use strict";
    var $, $container, Backbone, IndexView, Loader, PageSlider, QueryStringToHash, Router, Views, e, login, views;
    $ = require("jquery");
    Backbone = require("backbone");
    PageSlider = require("utils/page_slider");
    IndexView = require("views/index");
    Loader = require("utils/loader");
    Views = {};
    Views["home"] = require("views/home");
    Views["rank"] = require("views/rank");
    Views["type"] = require("views/type");
    Views["activity"] = require("views/activity");
    Views["vip"] = require("views/vip");
    Views["login"] = require('views/login');
    Views["random"] = require("views/random");
    Views["random1"] = require("views/random1");
    Views["mySong"] = require("views/mySong");
    Views["myRing"] = require("views/myRing");
    Views["sf"] = require("views/sf");
    Views["zx"] = require("views/zx");
    Views["showNews"] = require("views/showNews");
    Views["rank1"] = require("views/rank1");
    Views["type1"] = require("views/type1");
    Views["regVip"] = require("views/regVip");
    Views["regSucc"] = require("views/regSucc");
    Views["search"] = require('views/search');
    Views["tariff"] = require('views/tariff');
    views = {};
    require('jquerycookie');
    QueryStringToHash = QueryStringToHash = function(query) {
      var arr, i, pair, query_string, vars;
      query_string = {};
      vars = query.split("&");
      i = 0;
      while (i < vars.length) {
        pair = vars[i].split("=");
        pair[0] = decodeURIComponent(pair[0]);
        pair[1] = decodeURIComponent(pair[1]);
        if (typeof query_string[pair[0]] === "undefined") {
          query_string[pair[0]] = pair[1];
        } else if (typeof query_string[pair[0]] === "string") {
          arr = [query_string[pair[0]], pair[1]];
          query_string[pair[0]] = arr;
        } else {
          query_string[pair[0]].push(pair[1]);
        }
        i++;
      }
      return query_string;
    };
    try {
      login = $.cookie('login');
      if (login) {
        window.login = QueryStringToHash(login);
      }
    } catch (_error) {
      e = _error;
      console.log(e);
    }
    $container = $("section.container");
    return Router = Backbone.Router.extend({
      routes: {
        "": "home",
        "rank/:id": "rank",
        "type/:id": "type",
        "random/:id": "random",
        "activity/:id": "activity",
        "news/:id": "news",
        "tariff/:id": "tariff",
        "playlist/:id": "playlist",
        "search/:query": "search",
        "logout": "logout",
        "ring/:id/set": "setRing",
        "ring/:id/delete": "deleteRing",
        "gift/:id": "sendGift",
        "download/:id/type/:type": "download",
        "regFail": "regFail",
        "my:page": "myPage",
        ":page": "page"
      },
      home: function() {
        return this.navigate('/home', true);
      },
      rank: function(title) {
        var view;
        view = new Views["rank1"]({
          url: "api/bd/bd_id.json",
          title: title
        });
        return window.indexView.changePage("rank", view);
      },
      type: function(title) {
        var view;
        view = new Views["type1"]({
          url: "api/fl/fl_id.json",
          title: title
        });
        return window.indexView.changePage("type", view);
      },
      random: function(title) {
        var view;
        view = new Views["random1"]({
          url: "api/pd/pd_id.json",
          title: title
        });
        return window.indexView.changePage("random", view);
      },
      tariff: function(id) {
        var song, view;
        song = window.songs.get(id);
        if (song) {
          view = new Views["tariff"]({
            url: "api/zf/music_id.json"
          });
          return window.indexView.changePage("random", view);
        } else {
          return this.home();
        }
      },
      activity: function(id) {
        return window.indexView.showInfo("活动页面暂未开放");
      },
      news: function(id) {
        var view;
        view = new Views["showNews"]({
          url: "api/zx/zx_id.json"
        });
        return window.indexView.changePage("news", view);
      },
      playlist: function(id) {
        return this.play(id, false);
      },
      search: function(query) {
        var view;
        view = new Views["search"]({
          query: query
        });
        return window.indexView.changePage("search", view);
      },
      page: function(key) {
        if (views[key]) {
          return window.indexView.changePage(key, views[key]);
        } else if (Views[key]) {
          views[key] = new Views[key];
          return window.indexView.changePage(key, views[key]);
        } else {
          return this.home();
        }
      },
      myPage: function(key) {
        if (window.login) {
          return this.page("my" + key);
        } else {
          return this.navigate('/login', true);
        }
      },
      logout: function() {
        window.login = null;
        $.cookie('login', null);
        return this.home();
      },
      success: function(text) {
        return window.indexView.showInfo("" + text + "成功");
      },
      fail: function(text) {
        return window.indexView.showInfo("" + text + "失败");
      },
      ajax: function(url, text) {
        var _this = this;
        new Loader(url, {}, function() {
          return _this.success(text);
        }, function() {
          return _this.fail(text);
        });
        return false;
      },
      download: function(id, type) {
        return this.ajax("path/to/download", "下载歌曲");
      },
      sendGift: function(id) {
        return this.ajax("path/to/send/gift", "赠送歌曲");
      },
      setRing: function(id) {
        return this.ajax("path/to/set/ring", "设置手机彩铃");
      },
      deleteRing: function(id) {
        return this.ajax("path/to/delete/ring", "删除手机彩铃");
      },
      regFail: function() {
        if (views["regFail"]) {
          return window.indexView.changePage("regFail", views["regFail"]);
        } else {
          views["regFail"] = new Views["regSucc"]({
            success: false
          });
          return window.indexView.changePage("regFail", views["regFail"]);
        }
      }
    });
  });

}).call(this);
