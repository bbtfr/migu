define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/zx.html')

  TopNewsView  = require('views/topNews')
  NewsMoreView = require('views/newsMore')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  Backbone.View.extend

    render: ->
      @loader = new Loader "api/zx.json", {}, (data) =>
        @$el.html(template(data))

        @topNews = new TopNewsView(el: @$el.find("#topNews")).render(data["tt"][0]) if data["tt"]
        @zx = new NewsMoreView(el: @$el.find("#zx")).render(data["zx"])
        window.indexView.triggerChangePage()

      return @