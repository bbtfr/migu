define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/showNews.html')

  NewsMoreView = require('views/newsMore')

  template    = _.template(tpl)

  Loader       = require('utils/loader')

  urls =
    "xgxw": "/api/xgxw.json"

  Backbone.View.extend

    initialize: (options) ->
      @url = options["url"]

    render: ->
      @loader = new Loader @url, (data) =>
        @$el.html(template(data))

        @xgxw = new NewsMoreView
          el: @$el.find("#xgxw")
          url: urls["xgxw"]
          key: "xgxw"
          eachPage: 4
          type: "rNews"
        .render(false)
        
        window.indexView.triggerChangePage()

      return @