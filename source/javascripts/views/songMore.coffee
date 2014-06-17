define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')

  SongListView = require('views/songList')
  
  tpls =
    song: require('text!tpl/songMore.html')
    ring: require('text!tpl/ringMore.html')
    info: require('text!tpl/songMore.html')
    musician: require('text!tpl/musicianMore.html')
    mv1: require('text!tpl/mvMore.html')

  Loader       = require('utils/loader')

  Backbone.View.extend

    currPage: 0

    initialize: (options) ->
      @eachPage = options["eachPage"] || 10
      @type = options["type"] || "song"
      @template = _.template(tpls[@type])
      @url = options["url"]
      @key = options["key"]

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

    generate_url: (n) ->
      if '?' in @url
        url = "#{@url}&"
      else
        url = "#{@url}?"
      url += "page=#{n}&eachPage=#{@eachPage}"
      url 

    goto: (n) ->
      if n > 0 and n <= @totalPage
        @loader = new Loader @generate_url(n), (data) =>
          @songMore.render(data[@key])
          @$pageBox.val(n)
          @currPage = n
      false

    render: (triggerChangePage=true) ->
      @loader = new Loader @generate_url(1), (data) =>
        @totalPage = data["totalPage"]
        @currPage = 1

        @$el.html(@template(totalPage: @totalPage, currPage: @currPage))
        @$pageBox = @$el.find(".pageBox")
        
        @songMore = new SongListView(el: @$el.find("#song-list"), type: @type).render(data[@key])

        window.indexView.triggerChangePage() if triggerChangePage

      return @
