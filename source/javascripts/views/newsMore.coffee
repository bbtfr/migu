define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/newsMore.html')

  NewsListView = require('views/newsList')

  template     = _.template(tpl)

  Loader       = require('utils/loader')

  Backbone.View.extend

    currPage: 0
    totalPage: 0

    initialize: (options) ->
      @eachPage = options["eachPage"] || 6
      @type = options["type"] || "news"

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
        @newsMore.render(@data[@eachPage*(n-1)...@eachPage*n])
        @$pageBox.val(n)
        @currPage = n
      false

    render: (news) ->
      @data = news
      @totalPage = Math.ceil(@data.length/@eachPage)
      @currPage = 1

      @$el.html(template(totalPage: @totalPage, currPage: @currPage))
      @$pageBox = @$el.find(".pageBox")
      
      @newsMore = new NewsListView(el: @$el.find("#news-list"), type: @type).render(@data[0...@eachPage])

      return @
      