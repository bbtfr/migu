(function() {
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

  require(["jquery", "backbone", "router", "views/index", "collections/song", "collections/news", "collections/activity"], function($, Backbone, Router, IndexView, SongCollection, NewsCollection, ActivityCollection) {
    $(document).on("mobileinit", function() {
      $.mobile.linkBindingEnabled = false;
      $.mobile.hashListeningEnabled = false;
      $.mobile.loader.prototype.options.text = "数据加载中...";
      $.mobile.loader.prototype.options.textonly = false;
      return $.mobile.loader.prototype.options.textVisible = true;
    });
    return require(["jquerymobile"], function() {
      $.mobile.loading("show");
      this.indexView = new IndexView();
      this.songs = new SongCollection();
      this.news = new NewsCollection();
      this.activities = new ActivityCollection();
      this.router = new Router();
      return Backbone.history.start();
    });
  });

}).call(this);
