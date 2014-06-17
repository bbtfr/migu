define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/hot.html')

  SongListView = require('views/songList')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  urls =
    rmtj: "api/rmtj.json"
    cnxh: "api/cnxh.json"

  Backbone.View.extend

    events:
      "click #rmtj .refresh a": "refresh_rmtj"
      "click #cnxh .refresh a": "refresh_cnxh"

    refresh_rmtj: ->
      @refresh(urls["rmtj"], @rmtj, "rmtj")

    refresh_cnxh: ->
      @refresh(urls["cnxh"], @cnxh, "cnxh")

    refresh: (url, page, key) ->
      @loader = new Loader url, (data) =>
        page.render(data[key])
      false

    render: (rmtjData, cnxhData) ->
      @$el.html(template())

      @rmtj = new SongListView(el: @$el.find("#rmtj-list"))
      @cnxh = new SongListView(el: @$el.find("#cnxh-list"))
      @refresh_rmtj()
      @refresh_cnxh()

      @$el.tabs()
