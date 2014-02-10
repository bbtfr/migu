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

  Backbone.View.extend

    render: ->
      @loader = new Loader "api/wdgd.json?token=#{window.login.token}", (data) =>
        @$el.html(template())

        @mySong = new SongMoreView(el: @$el.find("#mySong")).render(data["wdgd"])
        @hot = new HotView(el: @$el.find("#hot")).render(data["rmtj"], data["cnxh"])
        
        window.indexView.triggerChangePage()

      return @