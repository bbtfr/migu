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

    initialize: (options) ->
      @eachPage = options["eachPage"] || 8
      @type = options["type"] || "news"
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

    goto: (n) ->
      if n > 0 and n <= @totalPage
        @loader = new Loader "#{@url}?page=#{n}&eachPage=#{@eachPage}", (data) =>
          @newsMore.render(data[@key])
          @$pageBox.val(n)
          @currPage = n
      false

    render: (triggerChangePage=true) ->
      @loader = new Loader "#{@url}?page=1&eachPage=#{@eachPage}", (data) =>
        @currPage = 1
        @totalPage = data["totalPage"]

        @$el.html(template(totalPage: @totalPage, currPage: @currPage))
        @$pageBox = @$el.find(".pageBox")
        
        @newsMore = new NewsListView(el: @$el.find("#news-list"), type: @type).render(data[@key])

        window.indexView.triggerChangePage() if triggerChangePage

      return @
      