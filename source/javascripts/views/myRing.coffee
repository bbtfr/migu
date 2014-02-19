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

  Backbone.View.extend

    render: ->
      @loader = new Loader "api/wdcl.json?token=#{window.login.token}", null, (data) =>
        @$el.html(template())

        @currRing = new CurrRingView(el: @$el.find("#currRing")).render(data["dqcl"][0]) if data["dqcl"]
        @myRing = new SongMoreView(el: @$el.find("#myRing"), type: "ring", eachPage: 3).render(data["wdcl"])
        @hot = new HotView(el: @$el.find("#hot")).render(data["rmtj"], data["cnxh"])
        
        window.indexView.triggerChangePage()

      return @