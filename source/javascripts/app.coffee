require.config
  baseUrl: "javascripts"
  paths:
    backbone: "lib/backbone"
    underscore: "lib/underscore"
    
    jquery: "lib/jquery"
    jquerymobile: "lib/jquery.mobile"
    jqueryflexslider: "lib/jquery.flexslider"
    jqueryjplayer: "lib/jquery.jplayer"
    jquerycookie: "lib/jquery.cookie"

    jqueryuieffect: "lib/jquery.ui.effect"

    text: "lib/text"
    tpl: "../templates"

  shim:
    backbone:
      deps: [
        "underscore"
        "jquery"
      ]
      exports: "Backbone"

    underscore:
      exports: "_"

    jquery:
      exports: "$"

    jquerymobile:
      deps: [
        "jquery"
        "jqueryuieffect"
      ]

    jqueryflexslider:
      deps: [
        "jquery"
      ]

    jqueryjplayer:
      deps: [
        "jquery"
      ]

require [
  "jquery"
  "backbone"
  "router"
  "views/index"
  "collections/song"
  "collections/news"
  "collections/activity"
], ($, Backbone, Router, IndexView, 
  SongCollection, NewsCollection, ActivityCollection) ->
  # Set up the "mobileinit" handler before requiring jQuery Mobile's module
  $(document).on "mobileinit", ->
    # Prevents all anchor click handling including the addition of active button state and alternate link bluring.
    $.mobile.linkBindingEnabled = false

    # Disabling this will prevent jQuery Mobile from handling hash changes
    $.mobile.hashListeningEnabled = false

    # $.mobile.ignoreContentEnabled = true;

    # loading config
    $.mobile.loader.prototype.options.text = "数据加载中..."
    $.mobile.loader.prototype.options.textonly = false
    $.mobile.loader.prototype.options.textVisible = true

  require ["jquerymobile"], ->
    $.mobile.loading "show"

    @indexView = new IndexView()
    
    @songs = new SongCollection()
    @news = new NewsCollection()
    @activities = new ActivityCollection()

    # Instantiates a new Backbone.js Mobile Router
    @router = new Router()
    Backbone.history.start()
    