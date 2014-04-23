define (require) ->
  "use strict"

  $                 = require("jquery")
  Backbone          = require("backbone")
  PageSlider        = require("utils/page_slider")
  IndexView         = require("views/index")

  Loader            = require("utils/loader")

  # require views
  Views             = {}
  Views["home"]     = require("views/home")
  Views["rank"]     = require("views/rank")
  Views["type"]     = require("views/type")
  Views["activity"] = require("views/activity")
  Views["vip"]      = require("views/vip")

  Views["login"]    = require('views/login')
  Views["random"]   = require("views/random")
  Views["random1"]  = require("views/random1")
  # Views["findSong"] = require("views/findSong")
  Views["mySong"]   = require("views/mySong")
  Views["myRing"]   = require("views/myRing")
  # Views["book"]     = require("views/book")
  # Views["guest"]    = require("views/guest")
  # Views["moreApp"]  = require("views/moreApp")

  Views["sf"]       = require("views/sf")
  Views["zx"]       = require("views/zx")

  Views["showNews"] = require("views/showNews")
  Views["activityShow"] = require("views/activityShow")

  Views["rank1"]    = require("views/rank1")
  Views["type1"]    = require("views/type1")
  
  Views["regVip"]   = require("views/regVip")
  Views["regSucc"]  = require("views/regSucc")

  Views["search"]   = require('views/search')
  
  Views["tariff"]   = require('views/tariff')

  Views["reg"]   = require('views/reg')
  Views["reg1"]   = require('views/reg1')
  Views["reg2"]   = require('views/reg2')
  Views["reg3"]   = require('views/reg3')
  Views["add"]   = require('views/add')
  Views["add1"]   = require('views/add1')
  Views["add2"]   = require('views/add2')

  Views["singerShow"]   = require('views/singerShow')
  Views["albumShow"]   = require('views/albumShow')

  Views["free"]     = require('views/free')
  Views["musician"] = require('views/musician')

  views             = {}

  require('jquerycookie')

  QueryStringToHash = QueryStringToHash = (query) ->
    query_string = {}
    vars = query.split("&")
    i = 0

    while i < vars.length
      pair = vars[i].split("=")
      pair[0] = decodeURIComponent(pair[0])
      pair[1] = decodeURIComponent(pair[1])
      
      # If first entry with this name
      if typeof query_string[pair[0]] is "undefined"
        query_string[pair[0]] = pair[1]
      
      # If second entry with this name
      else if typeof query_string[pair[0]] is "string"
        arr = [
          query_string[pair[0]]
          pair[1]
        ]
        query_string[pair[0]] = arr
      
      # If third or later entry with this name
      else
        query_string[pair[0]].push pair[1]
      i++
    query_string
  
  try
    k = QueryStringToHash window.location.href
    login = $.cookie('login')
    window.login = QueryStringToHash login if login
  catch e
    console.log e

  # page container
  $container = $("section.container")

  Router = Backbone.Router.extend

    routes:
      "": "home"
      "rank/:id": "rank"
      "type/:id": "type"
      "random/:id": "random"
      "activity/:id": "activity"
      "news/:id": "news"
      "tariff/:id": "tariff"
      
      # "play/:id": "play"
      "playlist/:id": "playlist"
      "search/:query": "search"
      "logout": "logout"

      "album/:id": "album"
      "artist/:id": "artist"
      
      "ring/vip": "setRingVip"
      "ring/:id/set": "setRing"
      "ring/:id/delete": "deleteRing"
      "gift/:id": "sendGift"
      "download/:id/type/:type": "download"
      
      "regFail": "regFail"
      "my:page": "myPage"
      ":page": "page"

    home: ->
      @navigate('/home', true)

    rank: (title) ->
      view = new Views["rank1"](url: "api/bd/bd_id.json", title: title)
      window.indexView.changePage "rank", view

    type: (title) ->
      view = new Views["type1"](url: "api/fl/fl_id.json", title: title)
      window.indexView.changePage "type", view

    random: (title) ->
      view = new Views["random1"](url: "api/pd/pd_id.json", title: title)
      window.indexView.changePage "random", view

    album: (title) ->
      view = new Views["albumShow"](url: "api/album.json", title: title)
      window.indexView.changePage "album", view

    artist: (title) ->
      view = new Views["singerShow"](url: "api/artist.json", title: title)
      window.indexView.changePage "artist", view

    tariff: (id) ->
      window.indexView.login =>
        song = window.songs.get(id)
        if song
          view = new Views["tariff"](url: "api/zf/music_id.json")
          window.indexView.changePage "random", view
        else
          @home()

    activity: (id) ->
      view = new Views["activityShow"](url: "api/hd/hd_id.json")
      window.indexView.changePage "activity", view

    news: (id) ->
      view = new Views["showNews"](url: "api/zx/zx_id.json")
      window.indexView.changePage "news", view
        
    # play: (id, playNow=true) ->
    #   song = window.songs.get(id)
    #   if song
    #     window.player.add song.attributes, playNow
    #   else
    #     @home()

    playlist: (id) ->
      @play(id, false)

    search: (query) ->
      view = new Views["search"](query: query)
      window.indexView.changePage "search", view

    page: (key) ->
      if views[key]
        window.indexView.changePage key, views[key]
      else if Views[key]
        views[key] = new Views[key]
        window.indexView.changePage key, views[key]
      else
        @home()

    myPage: (key) ->
      window.indexView.login =>
        @page("my#{key}")
      
    logout: ->
      window.indexView.updateUsername()
      @home()

    success: (text) ->
      window.indexView.showInfo "#{text}成功"

    fail: (text) ->
      window.indexView.showInfo "#{text}失败"

    ajax: (url, text) ->
      new Loader url, =>
        @success(text)
      , =>
        @fail(text)
      false

    download: (id, type) ->
      @ajax "path/to/download", "下载歌曲"

    sendGift: (id) ->
      @ajax "path/to/send/gift", "赠送歌曲"

    setRing: (id) ->
      @ajax "path/to/set/ring", "设置手机彩铃"

    setRingVip: (id) ->
      @ajax "path/to/set/ring/vip", "开通手机彩铃包月"

    deleteRing: (id) ->
      @ajax "path/to/delete/ring", "删除手机彩铃"

    regFail: ->
      if views["regFail"]
        window.indexView.changePage "regFail", views["regFail"]
      else
        views["regFail"] = new Views["regSucc"](success: false)
        window.indexView.changePage "regFail", views["regFail"]

