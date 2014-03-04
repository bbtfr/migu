define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/myRing.html')

  HotView      = require('views/hot')
  SongMoreView = require('views/songMore')
  CurrRingView = require('views/currRing')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  urls =
    "wdcl": "api/wdcl.json"
    "qtcl": "api/qtcl.json"

  Backbone.View.extend

    render: ->
      @$el.html(template())
      
      @loader = new Loader "#{urls["wdcl"]}?token=#{window.login.token}", (data) =>
        @currRing = new CurrRingView(el: @$el.find("#currRing")).render(data["dqcl"][0])
        
        window.indexView.triggerChangePage()

      @myRing = new SongMoreView(
        el: @$el.find("#myRing")
        url: "#{urls["qtcl"]}?token=#{window.login.token}"
        key: "qtcl"
        eachPage: 3
        type: "ring"
      ).render(false)

      @hot = new HotView(el: @$el.find("#hot")).render()
      
      return @