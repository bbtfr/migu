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

  url = "api/zx.json"

  Backbone.View.extend

    render: ->
      @$el.html(template())

      @zx = new NewsMoreView(el: @$el.find("#zx"), url: url, key: "zx").render()

      @loader = new Loader "api/tt.json", (data) =>
        @topNews = new TopNewsView(el: @$el.find("#topNews")).render(data["tt"][0])

      return @