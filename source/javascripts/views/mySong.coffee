define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/mySong.html')

  SongMoreView = require('views/songMore')
  HotView      = require('views/hot')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  url = "api/wdgd.json"

  Backbone.View.extend

    render: ->
      @$el.html(template())

      @mySong = new SongMoreView(
        el: @$el.find("#mySong")
        url: "#{url}?token=#{window.login.token}"
        key: "wdgd"
      ).render()

      @hot = new HotView(el: @$el.find("#hot")).render()
        
      return @