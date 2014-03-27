(function() {
  var orig_require;

  require.config({
    baseUrl: "javascripts",
    paths: {
      backbone: "lib/backbone",
      underscore: "lib/underscore",
      jquery: "lib/jquery",
      jquerymobile: "lib/jquery.mobile",
      jqueryflexslider: "lib/jquery.flexslider",
      jqueryjplayer: "lib/jquery.jplayer",
      jquerycookie: "lib/jquery.cookie",
      jqueryuieffect: "lib/jquery.ui.effect",
      text: "lib/text",
      tpl: "../templates"
    },
    shim: {
      backbone: {
        deps: ["underscore", "jquery"],
        exports: "Backbone"
      },
      underscore: {
        exports: "_"
      },
      jquery: {
        exports: "$"
      },
      jquerymobile: {
        deps: ["jquery", "jqueryuieffect"]
      },
      jqueryflexslider: {
        deps: ["jquery"]
      },
      jqueryjplayer: {
        deps: ["jquery"]
      }
    }
  });

  orig_require = window.require;

  this.total_required = 45;

  this.curr_required = 0;

  this.increase_curr_required = function(i) {
    this.curr_required += i;
    return document.getElementById("progress-text").innerText = "数据加载中（" + this.curr_required + " / " + this.total_required + "）...";
  };

  this.require = function(_list, _callback) {
    this.increase_curr_required(_list.length);
    return orig_require(_list, _callback);
  };

  require(["jquery", "backbone", "router", "views/index", "collections/song", "collections/news", "collections/activity"], function($, Backbone, Router, IndexView, SongCollection, NewsCollection, ActivityCollection) {
    $(document).on("mobileinit", function() {
      $.mobile.linkBindingEnabled = false;
      $.mobile.hashListeningEnabled = false;
      $.mobile.ignoreContentEnabled = true;
      $.mobile.loader.prototype.options.text = "数据加载中...";
      $.mobile.loader.prototype.options.textonly = false;
      return $.mobile.loader.prototype.options.textVisible = true;
    });
    return require(["jquerymobile"], function() {
      this.indexView = new IndexView();
      this.songs = new SongCollection();
      this.news = new NewsCollection();
      this.activities = new ActivityCollection();
      this.router = new Router();
      return Backbone.history.start();
    });
  });

}).call(this);
