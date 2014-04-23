define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/free.html')

  template     = _.template(tpl)

  Loader       = require('utils/loader')

  SongListView = require('views/songList')
  SongMoreView = require('views/songMore')

  url = "api/free.json"
  wqhgUrl = "api/wqhg.json"

  Backbone.View.extend

    render: () ->
      @$el.html(template())

      @loader = new Loader url, (data) =>
        @$el.find("#list1-title").text(data["list1Title"])
        @$el.find("#list2-title").text(data["list2Title"])
        
        @list1 = new SongListView(el: @$el.find("#list1-list")).render(data["list1"])
        @list2 = new SongListView(el: @$el.find("#list2-list")).render(data["list2"])

      @wqhg = new SongMoreView(
        el: @$el.find("#wqhg")
        url: wqhgUrl
        key: "wqhg"
        eachPage: 8
      ).render()

      return @