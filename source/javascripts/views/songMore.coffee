define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')

  SongListView = require('views/songList')
  
  tpls         = {}
  tpls["song"] = require('text!tpl/songMore.html')
  tpls["ring"] = require('text!tpl/ringMore.html')
  tpls["info"] = require('text!tpl/songMore.html')

  Backbone.View.extend

    currPage: 0
    totalPage: 0

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
        @songMore.render(@data[@eachPage*(n-1)...@eachPage*n])
        @$pageBox.val(n)
        @currPage = n
      false

    render: (songs) ->
      @data = songs
      @totalPage = Math.ceil(@data.length/@eachPage)
      @currPage = 1

      @$el.html(@template(totalPage: @totalPage, currPage: @currPage))
      @$pageBox = @$el.find(".pageBox")
      
      @songMore = new SongListView(el: @$el.find("#song-list"), type: @type).render(@data[0...@eachPage])

      return @
