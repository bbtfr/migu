define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')

  SongListView = require('views/songList')
  
  tpls =
    song: require('text!tpl/songMore.html')
    ring: require('text!tpl/ringMore.html')
    album: require('text!tpl/songMore.html')
    artist: require('text!tpl/songMore.html')

  Loader       = require('utils/loader')

  Backbone.View.extend

    currPage: 0

    initialize: (options) ->
      @eachPage = options["eachPage"] || 10
      @type = options["type"] || "song"
      @template = _.template(tpls[@type])

    events:
      "click .prev": "prev"
      "click .next": "next"
      "click .pageBtn": "page"

    prev: ->
      @goto(@currPage-1)

    next: ->
      @goto(@currPage+1)

    page: ->
      @goto(parseInt(@$pageBox.val()))

    goto: (n) ->
      if n > 0 and n <= @totalPage
        @songMore.render(@data[(@currPage-1)*@eachPage..@currPage*@eachPage])
        @$pageBox.val(n)
        @currPage = n
      false

    render: (data) ->
      @totalPage = Math.ceil(data.length/@eachPage)
      @currPage = 1
      @data = data

      @$el.html(@template(totalPage: @totalPage, currPage: @currPage))
      @$pageBox = @$el.find(".pageBox")
      
      @songMore = new SongListView(el: @$el.find("#song-list"), type: @type)
      @goto(1)

      window.indexView.triggerChangePage()

      return @
