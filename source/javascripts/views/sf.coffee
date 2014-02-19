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

  Backbone.View.extend

    render: ->
      @loader = new Loader "api/sf.json", null, (data) =>
        @$el.html(template(data))
        
        @sf = new SongMoreView(el: @$el.find("#sf")).render(data["sf"])
        @hot = new HotView(el: @$el.find("#hot")).render(data["rmtj"], data["cnxh"])
        
        window.indexView.triggerChangePage()

      return @