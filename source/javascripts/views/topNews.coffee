define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/topNews.html')

  template    = _.template(tpl)

  Backbone.View.extend
  
    render: (news) ->
      window.news.add(news)
      tpl = template(news: news)
      @$el.html(tpl)
        
      return @