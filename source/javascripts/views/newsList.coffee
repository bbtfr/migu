define (require) ->
  "use strict"

  $             = require('jquery')
  _             = require('underscore')
  Backbone      = require('backbone')

  tpls          = {}
  tpls["news"]  = require('text!tpl/newsList.html')
  tpls["rNews"] = require('text!tpl/rNewsList.html')

  Backbone.View.extend
  
    initialize: (options) ->
      type = options["type"] || "news"
      @template = _.template(tpls[type])
  
    render: (news) ->
      window.news.add(news)
      tpl = @template(news: news)
      @$el.html(tpl)

      return @