define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/showNews.html')

  NewsMoreView = require('views/newsMore')

  template    = _.template(tpl)

  Loader       = require('utils/loader')

  Backbone.View.extend

    initialize: (options) ->
      @url = options["url"]

    render: ->
      @loader = new Loader @url, null, (data) =>
        @$el.html(template(data))

        @xgxw = new NewsMoreView(el: @$el.find("#xgxw"), eachPage: 4, type: "rNews").render(data["xgxw"])
        window.indexView.triggerChangePage()

      return @