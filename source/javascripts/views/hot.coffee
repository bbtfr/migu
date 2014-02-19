define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/hot.html')

  SongListView = require('views/songList')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  Backbone.View.extend

    events:
      "click #rmtj .refresh a": "refresh_rmtj"
      "click #cnxh .refresh a": "refresh_cnxh"

    refresh_rmtj: ->
      @refresh("api/rmtj.json", @rmtj, "rmtj")

    refresh_cnxh: ->
      @refresh("api/cnxh.json", @cnxh, "cnxh")

    refresh: (url, page, key) ->
      @loader = new Loader url, null, (data) =>
        page.render(data[key])
      false

    render: (rmtjData, cnxhData) ->
      @$el.html(template())
      @rmtj = new SongListView(el: @$el.find("#rmtj-list")).render(rmtjData)
      @cnxh = new SongListView(el: @$el.find("#cnxh-list")).render(cnxhData)

      @$el.tabs()

