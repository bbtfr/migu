define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/sf.html')

  SongMoreView = require('views/songMore')
  HotView      = require('views/hot')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  url = "api/sf.json"

  Backbone.View.extend

    render: ->
      @$el.html(template())
      
      @sf = new SongMoreView(el: @$el.find("#sf"), url: url, key: "sf").render()
      @hot = new HotView(el: @$el.find("#hot")).render()

      return @